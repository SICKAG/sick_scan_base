// Generated by gencpp from file diagnostic_msgs/AddDiagnostics.msg
// DO NOT EDIT!


#ifndef DIAGNOSTIC_MSGS_MESSAGE_ADDDIAGNOSTICS_H
#define DIAGNOSTIC_MSGS_MESSAGE_ADDDIAGNOSTICS_H

#include <ros/service_traits.h>


#include <diagnostic_msgs/AddDiagnosticsRequest.h>
#include <diagnostic_msgs/AddDiagnosticsResponse.h>


namespace diagnostic_msgs
{

struct AddDiagnostics
{

typedef AddDiagnosticsRequest Request;
typedef AddDiagnosticsResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct AddDiagnostics
} // namespace diagnostic_msgs


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::diagnostic_msgs::AddDiagnostics > {
  static const char* value()
  {
    return "e6ac9bbde83d0d3186523c3687aecaee";
  }

  static const char* value(const ::diagnostic_msgs::AddDiagnostics&) { return value(); }
};

template<>
struct DataType< ::diagnostic_msgs::AddDiagnostics > {
  static const char* value()
  {
    return "diagnostic_msgs/AddDiagnostics";
  }

  static const char* value(const ::diagnostic_msgs::AddDiagnostics&) { return value(); }
};


// service_traits::MD5Sum< ::diagnostic_msgs::AddDiagnosticsRequest> should match 
// service_traits::MD5Sum< ::diagnostic_msgs::AddDiagnostics > 
template<>
struct MD5Sum< ::diagnostic_msgs::AddDiagnosticsRequest>
{
  static const char* value()
  {
    return MD5Sum< ::diagnostic_msgs::AddDiagnostics >::value();
  }
  static const char* value(const ::diagnostic_msgs::AddDiagnosticsRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::diagnostic_msgs::AddDiagnosticsRequest> should match 
// service_traits::DataType< ::diagnostic_msgs::AddDiagnostics > 
template<>
struct DataType< ::diagnostic_msgs::AddDiagnosticsRequest>
{
  static const char* value()
  {
    return DataType< ::diagnostic_msgs::AddDiagnostics >::value();
  }
  static const char* value(const ::diagnostic_msgs::AddDiagnosticsRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::diagnostic_msgs::AddDiagnosticsResponse> should match 
// service_traits::MD5Sum< ::diagnostic_msgs::AddDiagnostics > 
template<>
struct MD5Sum< ::diagnostic_msgs::AddDiagnosticsResponse>
{
  static const char* value()
  {
    return MD5Sum< ::diagnostic_msgs::AddDiagnostics >::value();
  }
  static const char* value(const ::diagnostic_msgs::AddDiagnosticsResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::diagnostic_msgs::AddDiagnosticsResponse> should match 
// service_traits::DataType< ::diagnostic_msgs::AddDiagnostics > 
template<>
struct DataType< ::diagnostic_msgs::AddDiagnosticsResponse>
{
  static const char* value()
  {
    return DataType< ::diagnostic_msgs::AddDiagnostics >::value();
  }
  static const char* value(const ::diagnostic_msgs::AddDiagnosticsResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // DIAGNOSTIC_MSGS_MESSAGE_ADDDIAGNOSTICS_H
