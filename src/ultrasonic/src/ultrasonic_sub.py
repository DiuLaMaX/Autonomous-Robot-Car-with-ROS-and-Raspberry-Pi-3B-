#! /usr/bin/env python

from std_msgs.msg import Float64
import rospy


def distanceCallback(msg):
    if msg.data < 8:
        rospy.loginfo("the distance is:" + str(msg) + "\n")
    

def distanceSub():
    rospy.init_node('distance_sub_node', anonymous=True)
    print("start listening to distance")
    rospy.Subscriber('distance', Float64, distanceCallback)
    rospy.spin()
    
    
if __name__ == '__main__':
    distanceSub()