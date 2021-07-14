#! /usr/bin/python

import rospy
from motor.msg import moveMotorCommand


def myHook():
    GPIO.cleanup()
    print("Cleaning pins")
    
def moveMotorPub():
    moveMotor_pub = rospy.Publisher('/move_motor', moveMotorCommand, queue_size=10)
    rospy.init_node("move_motor_pub_node", anonymous=True)

    rate = rospy.Rate(10) # 1Hz
    motor_command = moveMotorCommand()
    rospy.on_shutdown(myHook)
    
    while not rospy.is_shutdown():
        motor_command.pwm = 100
        motor_command.direction = 'forward'
        moveMotor_pub.publish(motor_command)
        rate.sleep()
    

if __name__ == '__main__':
    try:
        moveMotorPub()
    except rospy.ROSInterruptException:
        pass