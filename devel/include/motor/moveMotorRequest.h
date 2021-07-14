// Generated by gencpp from file motor/moveMotorRequest.msg
// DO NOT EDIT!


#ifndef MOTOR_MESSAGE_MOVEMOTORREQUEST_H
#define MOTOR_MESSAGE_MOVEMOTORREQUEST_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace motor
{
template <class ContainerAllocator>
struct moveMotorRequest_
{
  typedef moveMotorRequest_<ContainerAllocator> Type;

  moveMotorRequest_()
    : pwm(0)
    , direction()  {
    }
  moveMotorRequest_(const ContainerAllocator& _alloc)
    : pwm(0)
    , direction(_alloc)  {
  (void)_alloc;
    }



   typedef int8_t _pwm_type;
  _pwm_type pwm;

   typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _direction_type;
  _direction_type direction;





  typedef boost::shared_ptr< ::motor::moveMotorRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::motor::moveMotorRequest_<ContainerAllocator> const> ConstPtr;

}; // struct moveMotorRequest_

typedef ::motor::moveMotorRequest_<std::allocator<void> > moveMotorRequest;

typedef boost::shared_ptr< ::motor::moveMotorRequest > moveMotorRequestPtr;
typedef boost::shared_ptr< ::motor::moveMotorRequest const> moveMotorRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::motor::moveMotorRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::motor::moveMotorRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::motor::moveMotorRequest_<ContainerAllocator1> & lhs, const ::motor::moveMotorRequest_<ContainerAllocator2> & rhs)
{
  return lhs.pwm == rhs.pwm &&
    lhs.direction == rhs.direction;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::motor::moveMotorRequest_<ContainerAllocator1> & lhs, const ::motor::moveMotorRequest_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace motor

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsFixedSize< ::motor::moveMotorRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::motor::moveMotorRequest_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::motor::moveMotorRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::motor::moveMotorRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::motor::moveMotorRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::motor::moveMotorRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::motor::moveMotorRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "c946b539dea19a8f696fa84fcd88bf58";
  }

  static const char* value(const ::motor::moveMotorRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xc946b539dea19a8fULL;
  static const uint64_t static_value2 = 0x696fa84fcd88bf58ULL;
};

template<class ContainerAllocator>
struct DataType< ::motor::moveMotorRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "motor/moveMotorRequest";
  }

  static const char* value(const ::motor::moveMotorRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::motor::moveMotorRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "int8 pwm\n"
"string direction\n"
;
  }

  static const char* value(const ::motor::moveMotorRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::motor::moveMotorRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.pwm);
      stream.next(m.direction);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct moveMotorRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::motor::moveMotorRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::motor::moveMotorRequest_<ContainerAllocator>& v)
  {
    s << indent << "pwm: ";
    Printer<int8_t>::stream(s, indent + "  ", v.pwm);
    s << indent << "direction: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.direction);
  }
};

} // namespace message_operations
} // namespace ros

#endif // MOTOR_MESSAGE_MOVEMOTORREQUEST_H
