#! /usr/bin/env python

import rospy
from std_msgs.msg import Float64
from motor.srv import moveMotor


def distanceCallback(msg):
    rospy.wait_for_service('/move_motor')
    rospy.loginfo("the distance is:" + str(msg) + "\n")
    try:
        motor_command_client = rospy.ServiceProxy('/move_motor', moveMotor)
    except rospy.ServiceException as e:
        print("Service call failed: " + e)
        
    if msg.data < 30:
        pwm = 0
        direction = 'stop'
    else:
        pwm =  100
        direction = "forward"
    done = motor_command_client(pwm, direction)
    print("car direction: " + direction +" \npwm: " + str(pwm))


def main():
    global distance
    rospy.init_node("robot_car_main_node")
    rospy.Subscriber('distance', Float64, distanceCallback)

    rospy.spin()
    
if __name__ == "__main__":
    main()