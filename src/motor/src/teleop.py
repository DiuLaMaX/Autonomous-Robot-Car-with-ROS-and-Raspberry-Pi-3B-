#! /usr/bin/env python

from __future__ import print_function

import threading

import roslib

# roslib.load_manifest('teleop')
import rospy
from motor.msg import moveMotorCommand


import sys, select, termios, tty

msg = """
Reading from the keyboard  and Publishing to Twist!
---------------------------
Moving around:
   w:   forward
   s:   reverse
   a:   left
   d:   right
   r:   stop
   
---------------------------
Speed control:
   q: increase pwm by 10
   e: decrease pwm by 10

CTRL-C to quit
"""

moveBindings = {
    'w': 'forward',
    'r': 'stop',
    'a': 'left',
    'd': 'right',
    's': 'reverse',
}

speedBindings = {
    'q': 10,
    'e': -10,
}


class PublishThread(threading.Thread):
    def __init__(self, rate):
        super(PublishThread, self).__init__()
        self.publisher = rospy.Publisher('/move_motor', moveMotorCommand, queue_size=1)
        self.direction = 'stop'
        self.pwm = 0
        self.condition = threading.Condition()
        self.done = False

        # Set timeout to None if rate is 0 (causes new_message to wait forever
        # for new data to publish)
        if rate != 0.0:
            self.timeout = 1.0 / rate
        else:
            self.timeout = None

        self.start()

    def wait_for_subscribers(self):
        i = 0
        while not rospy.is_shutdown() and self.publisher.get_num_connections() == 0:
            if i == 4:
                print("Waiting for subscriber to connect to {}".format(self.publisher.name))
            rospy.sleep(0.5)
            i += 1
            i = i % 5
        if rospy.is_shutdown():
            raise Exception("Got shutdown request before subscribers connected")

    def update(self, direction, pwm):
        self.condition.acquire()
        self.direction = direction
        self.pwm = pwm
        # Notify publish thread that we have a new message.
        self.condition.notify()
        self.condition.release()

    def stop(self):
        self.done = True
        self.update('stop', 0)
        self.join()

    def run(self):
        moveCommand = moveMotorCommand()
        while not self.done:
            self.condition.acquire()
            # Wait for a new message or timeout.
            self.condition.wait(self.timeout)

            # Copy state into twist message.
            moveCommand.direction = self.direction
            moveCommand.pwm = self.pwm

            self.condition.release()

            # Publish.
            self.publisher.publish(moveCommand)

        # Publish stop message when thread exits.
        moveCommand.direction = 'stop'
        moveCommand.pwm = 0
        self.publisher.publish(moveCommand)


def getKey(key_timeout):
    tty.setraw(sys.stdin.fileno())
    rlist, _, _ = select.select([sys.stdin], [], [], key_timeout)
    if rlist:
        key = sys.stdin.read(1)
    else:
        key = ''
    termios.tcsetattr(sys.stdin, termios.TCSADRAIN, settings)
    return key


def info(pwm, direction):
    return 'pwm:' + str(pwm) + '\t direction:' + str(direction)


if __name__ == "__main__":
    settings = termios.tcgetattr(sys.stdin)

    rospy.init_node('teleop_keyboard')

    speed = rospy.get_param("~speed", 0.5)
    turn = rospy.get_param("~turn", 1.0)
    repeat = rospy.get_param("~repeat_rate", 0.0)
    key_timeout = rospy.get_param("~key_timeout", 0.5)
    if key_timeout == 0.0:
        key_timeout = None

    pub_thread = PublishThread(repeat)

    direction = 'stop'
    pwm = 50
    status = 0

    try:
        pub_thread.wait_for_subscribers()
        print(msg)
        rospy.loginfo(info(pwm, direction))
        pub_thread.update(direction, pwm)

        while (1):
            key = getKey(key_timeout)
            if key in moveBindings.keys():
                direction = moveBindings[key]
            elif key in speedBindings.keys():
                pwm = pwm + speedBindings[key]
                if pwm > 100:
                    pwm = 100
                if pwm < 0:
                    pwm =0
                if (status == 14):
                    print(msg)
                status = (status + 1) % 15
            else:
                # Skip updating cmd_vel if key timeout and robot already
                # stopped.
                direction = 'stop'
                if (key == '\x03'):
                    pwm = 0
                    break
            rospy.loginfo(info(pwm, direction))
            pub_thread.update(direction, pwm)

    except Exception as e:
        print(e)

    finally:
        pub_thread.stop()

        termios.tcsetattr(sys.stdin, termios.TCSADRAIN, settings)