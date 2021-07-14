#! /usr/bin/env python

from imutils import face_utils
import dlib
import cv2
from imutils.video import VideoStream
import imutils
import time
from cv_bridge import CvBridge, CvBridgeError
from sensor_msgs.msg import Image
from camera.msg import position
import rospy


class FaceDetector(object):
    def __init__(self, PiCamera=True, width=450, height=350):
        self.image_pub = rospy.Publisher("image_topic",Image)
        self.position_pub = rospy.Publisher("position", position)
        self.bridge = CvBridge()
        if PiCamera == True:
            self.capture = VideoStream(usePiCamera=True).start()
        else:
            self.capture = VideoStream(src=0).start()
            
        self.detector = dlib.get_frontal_face_detector()
        self.width = width
        self.x = width/2
        self.y = height/2
        
            
    def publish(self, frame, x, y):
        try:
            self.image_pub.publish(self.bridge.cv2_to_imgmsg(frame, "bgr8"))
            self.position_pub.publish(x, y)
        except CvBridgeError as e:
            print(e)
            

    def detect_face(self):
        frame = self.capture.read()
        frame = imutils.resize(frame, width=self.width)
        gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)

        rects = self.detector(gray, 0)
    
        for rect in rects:
            x1 = rect.left()
            y1 = rect.top()
            x2 = rect.right()
            y2 = rect.bottom()
            frame = cv2.rectangle(frame, (x1,y1), (x2,y2), (255, 0, 0), 2)
            self.x = int((x2-x1)/2+x1)
            self.y = int((y2-y1)/2+y1)
            frame = cv2.circle(frame, (self.x,self.y), 5, (0, 255, 0), 2)
        return frame, self.x, self.y
        
        
    def stop(self):
        cv2.destroyAllWindows()
        self.capture.stop()
    

def myHook():
    cv2.destroyAllWindows()
    detector.capture.stop()
    
    
def main():
    rospy.init_node("camera_node")
    rospy.on_shutdown(myHook)
    detector = FaceDetector()
    time.sleep(2.0)
    frame, x, y = detector.detect_face()
    detector.publish(frame, x, y)
    cv2.imshow('Frame',frame)
    print(x, y)
    rospy.spin()

    
 
if __name__ == "__main__":
    main()
