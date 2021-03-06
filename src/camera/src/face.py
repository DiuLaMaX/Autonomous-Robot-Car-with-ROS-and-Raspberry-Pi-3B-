#! /usr/bin/env python

import rospy
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError
from geometry_msgs.msg import Point
import cv2
import numpy as np

class LoadFace(object):
    def __init__(self):
        self.image_sub = rospy.Subscriber("/camera/rgb/image_raw", Image, self.camera_callback)
        self.face_pose_pub = rospy.Publisher("/face/position", Point, queue_size=10)
        self.bridge_object = CvBridge()
        
    def camera_callback(self, data):
        try:
            cv2_image = self.bridge_object.imgmsg_to_cv2(data, desired_encoding="bgr8")
        except CvBridgeError as e:
            print(e)
            
        face_cascade = cv2.CascadeClassifier("/home/pi/opencv/data/haarcascades/haarcascade_frontalface_default.xml")
        eyes_cascade = cv2.CascadeClassifier("/home/pi/opencv/data/haarcascades/haarcascade_eye.xml")
        
        img_original = cv2.resize(cv2_image, (500,300))
        img = cv2.resize(cv2_image, (500,300))
        
        gray = cv2.cvtColor(img,cv2.COLOR_BGR2GRAY)
        
        scaleFactor = 1.2
        minNeighbors = 3
        
        face = face_cascade.detectMultiScale(gray, scaleFactor, minNeighbors)
        
        for (x, y, w, h) in face:
            face_pose = Point()
            img = cv2.rectangle(img, (x,y), (x+w, y+h), (255, 0, 0), 2)
            face_pose.x = (2 * x + w) / 2
            face_pose.y = (x * y + h) / 2
            self.face_pose_pub.publish(face_pose) 
            roi = img[y:y+h, x:x+w]
            
            eyes = eyes_cascade.detectMultiScale(roi)
            for (ex, ey, ew, eh) in eyes:
                cv2.rectangle(roi, (ex, ey), (ex+ew, ey+eh), (0, 255, 0), 2)
        
        cv2.imshow("Face",img)
        
        cv2.waitKey(1)
        
def main():
    load_face_object = LoadFace()
    rospy.init_node('load_face_node', anonymous=True)
    try:
        rospy.spin()
    except KeyboardInterrupt:
        print("shutting down")
    cv2.destroyAllWindows()
    

if __name__ == '__main__':
    main()
                
        
        