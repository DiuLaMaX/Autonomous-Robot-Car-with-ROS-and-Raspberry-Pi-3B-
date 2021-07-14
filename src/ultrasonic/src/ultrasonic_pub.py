#! /usr/bin/env python

import rospy
from std_msgs.msg import Float64
from ultrasonic import Ultrasonic
import RPi.GPIO as GPIO 


TRIG = 31
ECHO = 33


def myHook():
    GPIO.cleanup()
    print("Cleaning pins") 


def distancePub():
    ultrasonic_pub = rospy.Publisher('distance', Float64, queue_size=10)
    rospy.init_node("distance_pub_node", anonymous=True)

    rate = rospy.Rate(10) # 1Hz
    distance = Float64()
    ultrasonic = Ultrasonic(TRIG, ECHO)
    rospy.on_shutdown(myHook)
    
    while not rospy.is_shutdown():
        distance = ultrasonic.get_distance()
        rospy.loginfo(distance)
        ultrasonic_pub.publish(distance)
        rate.sleep()
    
    
if __name__ == "__main__":
    try:
        distancePub()
    except rospy.ROSInterruptException:
        pass
        
    