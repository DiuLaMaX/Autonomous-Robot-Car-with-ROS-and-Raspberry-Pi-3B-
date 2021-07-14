#! /usr/bin/env python

import RPi.GPIO as GPIO
import time

GPIO.setmode(GPIO.BOARD)

class Motor(object):
    
    def __init__(self, enA, in1, in2, enB, in3, in4):
        self.enA = enA
        self.in1 = in1
        self.in2 = in2
        self.enB = enB
        self.in3 = in3
        self.in4 = in4
        
        GPIO.setup(self.enA, GPIO.OUT)
        GPIO.setup(self.in1, GPIO.OUT)
        GPIO.setup(self.in2, GPIO.OUT)
        GPIO.setup(self.enB, GPIO.OUT)
        GPIO.setup(self.in3, GPIO.OUT)
        GPIO.setup(self.in4, GPIO.OUT)
        
        
        self.pwm_enA = GPIO.PWM(self.enA, 20) # GPIO.PWM(pin, Frequency)
        self.pwm_enB = GPIO.PWM(self.enB, 20)
        self.pwm_enA.start(0) # PWM.start([Initial Value])
        self.pwm_enB.start(0)
        GPIO.output(self.enA, 1)
        GPIO.output(self.in1, 0)
        GPIO.output(self.in2, 0)
        GPIO.output(self.enB, 1)
        GPIO.output(self.in3, 0)
        GPIO.output(self.in4, 0)
    
            
    def forward(self, pwm):
        GPIO.output(self.in1, 1)
        GPIO.output(self.in2, 0)
        GPIO.output(self.in3, 1)
        GPIO.output(self.in4, 0)
        self.pwm_enA.ChangeDutyCycle(pwm)
        self.pwm_enB.ChangeDutyCycle(pwm)
    
    def reverse(self, pwm):
        GPIO.output(self.in1, 0)
        GPIO.output(self.in2, 1)
        GPIO.output(self.in3, 0)
        GPIO.output(self.in4, 1)       
        self.pwm_enA.ChangeDutyCycle(pwm)
        self.pwm_enB.ChangeDutyCycle(pwm)
        
    def stop(self):
        GPIO.output(self.in1, 0)
        GPIO.output(self.in2, 0)
        GPIO.output(self.in3, 0)
        GPIO.output(self.in4, 0)
        self.pwm_enA.ChangeDutyCycle(0)
        self.pwm_enB.ChangeDutyCycle(0)


if __name__ == "__main__":
    # define pins
    enA_left = 7
    in1_left = 11
    in2_left = 13
    enB_left = 21
    in3_left = 15
    in4_left = 19
    left_motor = Motor(enA_left, in1_left, in2_left, enB_left, in3_left, in4_left)
    
    enA_right = 12
    in1_right = 16
    in2_right = 18
    enB_right = 26
    in3_right = 22
    in4_right = 24
    right_motor = Motor(enA_right, in1_right, in2_right, enB_right, in3_right, in4_right)
    time.sleep(0.1)
    
    for i in range(40, 110, 10):
        "Note start moving at pwm = 30"
        print("current pwm: " + str(i))
        print("forward")
        left_motor.forward(i)
        right_motor.forward(i)
        time.sleep(10)
        
        print("reverse")
        left_motor.reverse(i)
        right_motor.reverse(i)
        time.sleep(10)

    time.sleep(5)
    left_motor.stop()
    right_motor.stop()
        
    print("done") 
    GPIO.cleanup()