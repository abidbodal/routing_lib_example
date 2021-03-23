cmake_minimum_required(VERSION 3.17)
project(routing_lib_example)

set(CMAKE_CXX_STANDARD 14)

add_executable(routing_lib_example main.cpp)

find_package(Boost 1.51 REQUIRED COMPONENTS program_options)
add_definitions(-DBOOST_NO_CXX11_SCOPED_ENUMS -DRAPIDJSON_HAS_STDSTRING)
set(CMAKE_VERBOSE_MAKEFILE ON)

include(ExternalProject)

include("${CMAKE_SOURCE_DIR}/vendor/rapidjson.cmake")
include("${CMAKE_SOURCE_DIR}/vendor/date.cmake")
include_directories(${Boost_INCLUDE_DIR}
        ${RAPIDJSON_INCLUDE_DIR}
        ${DATE_INCLUDE_DIR}
        ${CMAKE_SOURCE_DIR}/includes/valhalla
        )
add_dependencies(routing_lib_example rapidjson date)

include(FindProtobuf)
find_package(Protobuf REQUIRED)
find_package(ZLIB)
include_directories(${PROTOBUF_INCLUDE_DIR})
target_link_libraries(routing_lib_example
        ${CMAKE_SOURCE_DIR}/lib/libvalhalla.a
        ${PROTOBUF_LIBRARY}
        ZLIB::ZLIB)