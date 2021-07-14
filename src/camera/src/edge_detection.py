#! /usr/bin/env python

import rospy
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError
import cv2
import numpy as np

class Sobela(object):
    
    def __init__(self):
        self.image_sub = rospy.Subscriber("/camera/rgb/image_raw",Image,self.camera_callback)
        self.bridge_object = CvBridge()
        
    def camera_callback(self,data):
        try:
            cv_image = self.bridge_object.imgmsg_to_cv2(data, desired_encoding="bgr8")
            
        except CvBridgeError as e:
            print(e)
            
        img = cv2.cvtColor(cv_image, cv2.COLOR_BGR2GRAY)
        img = cv2.resize(img, (350,350))
        
        sobelx = cv2.Sobel(img, cv2.CV_64F, 1, 0, ksize = 3)
        
        sobely = cv2.Sobel(img, cv2.CV_64F, 0, 1, ksize = 3)
        
        cv2.imshow("origin",img)
        cv2.imshow("x", sobelx)
        cv2.imshow("y", sobely)
        
        cv2.waitKey(1)
        
def main():
    sobela_object = Sobela()
    rospy.init_node("sobela_node", anonymous=True)
    try:
        rospy.spin()
    except KeyboardInterrupt:
        print("shutting down")
    cv2.destroyAllWindows()
    

if __name__ =="__main__":
    main()
    
