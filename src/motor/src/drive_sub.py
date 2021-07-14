#! /usr/bin/env python

import rospy
import RPi.GPIO as GPIO 
from motor_object import Motor
from motor.msg import moveMotorCommand

GPIO.setmode(GPIO.BOARD)

# define pins 
enA_left = 7
in1_left = 11
in2_left = 13
enB_left = 21
in3_left = 15
in4_left = 19

enA_right = 12
in1_right = 16
in2_right = 18
enB_right = 26
in3_right = 22
in4_right = 24

leftMotor = Motor(enA_left, in1_left, in2_left, enB_left, in3_left, in4_left)
rightMotor = Motor(enA_right, in1_right, in2_right, enB_right, in3_right, in4_right)


def myHook():
    GPIO.cleanup()
    print("Cleaning pins")
    
    
def moveMotorCallback(msg):
    rospy.loginfo('pwm:' + str(msg.pwm) + '\n' )
    rospy.loginfo('direction:' + str(msg.direction) + '\n' )
    
    if msg.pwm > 100:
        msg.pwm = 100
    
    if msg.pwm < 30:
        msg.pwm = 30
        
    if msg.direction.lower() == 'forward':
        leftMotor.forward(msg.pwm)
        rightMotor.forward(msg.pwm)
    elif msg.direction.lower() == 'reverse':
        leftMotor.reverse(msg.pwm)
        rightMotor.reverse(msg.pwm)
    elif msg.direction.lower() == 'left':
        leftMotor.forward(msg.pwm)
        rightMotor.reverse(msg.pwm)
    elif msg.direction.lower() == 'right':
        leftMotor.reverse(msg.pwm)
        rightMotor.reverse(msg.pwm)
    elif msg.direction.lower() == 'stop':
        leftMotor.stop()
        rightMotor.stop()
    else:
        rospy.loginfo("Unrecgonized direction. Please enter: forward, reverse, left, right, or stop.") 
        leftMotor.stop()
        rightMotor.stop()



def moveMotorServer():
    rospy.init_node('motor_command_sub_node')
    rospy.on_shutdown(myHook)
    rospy.sleep(0.01)
    rospy.Subscriber('/move_motor', moveMotorCommand, moveMotorCallback)
    rospy.spin()

    
if __name__ == "__main__":
    moveMotorServer()
    
