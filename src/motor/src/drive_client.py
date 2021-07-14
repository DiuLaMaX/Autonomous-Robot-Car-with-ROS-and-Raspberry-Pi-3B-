#! /usr/bin/env python

import rospy
from motor.srv import moveMotor, moveMotorRequest, moveMotorResponse
import sys

def moveMotorClient(pwm, direction):
    rospy.wait_for_service('/move_motor')
    rospy.init_node('motor_command_client')
    try:
        motor_command_client = rospy.ServiceProxy('/move_motor', moveMotor)
        done = motor_command_client(pwm, direction)
        print("car direction: " + direction +" \npwm: " + str(pwm))
    except rospy.ServiceException as e:
        print("Service call failed: " + e)
    rospy.spin()
        

if __name__ == "__main__":

    pwm = int(sys.argv[1])
    direction = sys.argv[2]
    
    moveMotorClient(pwm, direction)
