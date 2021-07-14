// Generated by gencpp from file motor/moveMotor.msg
// DO NOT EDIT!


#ifndef MOTOR_MESSAGE_MOVEMOTOR_H
#define MOTOR_MESSAGE_MOVEMOTOR_H

#include <ros/service_traits.h>


#include <motor/moveMotorRequest.h>
#include <motor/moveMotorResponse.h>


namespace motor
{

struct moveMotor
{

typedef moveMotorRequest Request;
typedef moveMotorResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct moveMotor
} // namespace motor


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::motor::moveMotor > {
  static const char* value()
  {
    return "d427495b34f5d0c5b55ab8f7f1ac8c30";
  }

  static const char* value(const ::motor::moveMotor&) { return value(); }
};

template<>
struct DataType< ::motor::moveMotor > {
  static const char* value()
  {
    return "motor/moveMotor";
  }

  static const char* value(const ::motor::moveMotor&) { return value(); }
};


// service_traits::MD5Sum< ::motor::moveMotorRequest> should match
// service_traits::MD5Sum< ::motor::moveMotor >
template<>
struct MD5Sum< ::motor::moveMotorRequest>
{
  static const char* value()
  {
    return MD5Sum< ::motor::moveMotor >::value();
  }
  static const char* value(const ::motor::moveMotorRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::motor::moveMotorRequest> should match
// service_traits::DataType< ::motor::moveMotor >
template<>
struct DataType< ::motor::moveMotorRequest>
{
  static const char* value()
  {
    return DataType< ::motor::moveMotor >::value();
  }
  static const char* value(const ::motor::moveMotorRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::motor::moveMotorResponse> should match
// service_traits::MD5Sum< ::motor::moveMotor >
template<>
struct MD5Sum< ::motor::moveMotorResponse>
{
  static const char* value()
  {
    return MD5Sum< ::motor::moveMotor >::value();
  }
  static const char* value(const ::motor::moveMotorResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::motor::moveMotorResponse> should match
// service_traits::DataType< ::motor::moveMotor >
template<>
struct DataType< ::motor::moveMotorResponse>
{
  static const char* value()
  {
    return DataType< ::motor::moveMotor >::value();
  }
  static const char* value(const ::motor::moveMotorResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // MOTOR_MESSAGE_MOVEMOTOR_H
