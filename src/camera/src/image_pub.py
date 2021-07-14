#! /usr/bin/env python

import cv2
import time
from cv_bridge import CvBridge, CvBridgeError
from picamera import PiCamera
import io
import imutils
from imutils.video import VideoStream
from sensor_msgs.msg import Image
import rospy
import numpy as np


class ImagePub(object):
    def __init__(self):
        self.image_pub = rospy.Publisher("/camera/rgb/image_raw",Image, queue_size=10)
        self.bridge = CvBridge()
        self.camera = PiCamera()
        self.camera.resolution = (1280, 720)
        self.camera.framerate = 60
#         self.camera.start_preview()
        
            
    def publish(self):
        stream = io.BytesIO()
        self.camera.capture(stream, format='jpeg', resize=(720, 480))
        data = np.fromstring(stream.getvalue(), dtype=np.uint8)
        frame = cv2.imdecode(data,1)
#         cv2.imshow('Frame', frame)
#         key = cv2.waitKey(1) & 0xFF
#         if key == ord("q"):
#             self.stop()
            
        try:
            self.image_pub.publish(self.bridge.cv2_to_imgmsg(frame, "bgr8"))
        except CvBridgeError as e:
            print(e)
        stream.close()
            
        
    def stop(self):
        cv2.destroyAllWindows()
        self.camera.stop_preview()
        self.camera.close()
    

def myHook():
    global image_pub
    cv2.destroyAllWindows()
    image_pub.stop()
    
    
def main():
    global image_pub
    rospy.init_node("camera_image_raw_node")
    image_pub = ImagePub()
    rate = rospy.Rate(10)
    rospy.on_shutdown(myHook)
    while not rospy.is_shutdown():
        image_pub.publish()
        rate.sleep()

        
 
if __name__ == "__main__":
    main()

