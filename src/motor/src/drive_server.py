#! /usr/bin/env python

import rospy
import RPi.GPIO as GPIO 
from motor_object import Motor
from motor.srv import moveMotor, moveMotorRequest, moveMotorResponse

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
    
    
def handleMotorCommand(req):
    response = moveMotorResponse()
    
    if req.pwm > 100:
        req.pwm = 100
    
    if req.pwm < 30:
        req.pwm = 30
        
    if req.direction.lower() == 'forward':
        leftMotor.forward(req.pwm)
        rightMotor.forward(req.pwm)
    elif req.direction.lower() == 'reverse':
        leftMotor.reverse(req.pwm)
        rightMotor.reverse(req.pwm)
    elif req.direction.lower() == 'left':
        leftMotor.forward(req.pwm)
        rightMotor.reverse(req.pwm)
    elif req.direction.lower() == 'right':
        leftMotor.reverse(req.pwm)
        rightMotor.reverse(req.pwm)
    elif req.direction.lower() == 'stop':
        leftMotor.stop()
        rightMotor.stop()
    else:
        rospy.loginfo("Unrecgonized direction. Please enter: forward, reverse, left, right, or stop.") 
        leftMotor.stop()
        rightMotor.stop()
        response.done = False
        return response
    
    response.done = True
    return  response

def moveMotorServer():
    rospy.init_node('motor_command_server')
    rospy.on_shutdown(myHook)
    rospy.sleep(0.01)
    motor_command_service = rospy.Service('/move_motor', moveMotor, handleMotorCommand)
    rospy.spin()

    
if __name__ == "__main__":
    moveMotorServer()
    