// Generated by gencpp from file motor/moveMotorResponse.msg
// DO NOT EDIT!


#ifndef MOTOR_MESSAGE_MOVEMOTORRESPONSE_H
#define MOTOR_MESSAGE_MOVEMOTORRESPONSE_H


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
struct moveMotorResponse_
{
  typedef moveMotorResponse_<ContainerAllocator> Type;

  moveMotorResponse_()
    : done(false)  {
    }
  moveMotorResponse_(const ContainerAllocator& _alloc)
    : done(false)  {
  (void)_alloc;
    }



   typedef uint8_t _done_type;
  _done_type done;





  typedef boost::shared_ptr< ::motor::moveMotorResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::motor::moveMotorResponse_<ContainerAllocator> const> ConstPtr;

}; // struct moveMotorResponse_

typedef ::motor::moveMotorResponse_<std::allocator<void> > moveMotorResponse;

typedef boost::shared_ptr< ::motor::moveMotorResponse > moveMotorResponsePtr;
typedef boost::shared_ptr< ::motor::moveMotorResponse const> moveMotorResponseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::motor::moveMotorResponse_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::motor::moveMotorResponse_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::motor::moveMotorResponse_<ContainerAllocator1> & lhs, const ::motor::moveMotorResponse_<ContainerAllocator2> & rhs)
{
  return lhs.done == rhs.done;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::motor::moveMotorResponse_<ContainerAllocator1> & lhs, const ::motor::moveMotorResponse_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace motor

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsFixedSize< ::motor::moveMotorResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::motor::moveMotorResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::motor::moveMotorResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::motor::moveMotorResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::motor::moveMotorResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::motor::moveMotorResponse_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::motor::moveMotorResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "89bb254424e4cffedbf494e7b0ddbfea";
  }

  static const char* value(const ::motor::moveMotorResponse_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x89bb254424e4cffeULL;
  static const uint64_t static_value2 = 0xdbf494e7b0ddbfeaULL;
};

template<class ContainerAllocator>
struct DataType< ::motor::moveMotorResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "motor/moveMotorResponse";
  }

  static const char* value(const ::motor::moveMotorResponse_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::motor::moveMotorResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "bool done\n"
"\n"
;
  }

  static const char* value(const ::motor::moveMotorResponse_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::motor::moveMotorResponse_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.done);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct moveMotorResponse_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::motor::moveMotorResponse_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::motor::moveMotorResponse_<ContainerAllocator>& v)
  {
    s << indent << "done: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.done);
  }
};

} // namespace message_operations
} // namespace ros

#endif // MOTOR_MESSAGE_MOVEMOTORRESPONSE_H