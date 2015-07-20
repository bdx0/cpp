# Specify the version being used as well as the language 
cmake_minimum_required(VERSION 2.6)
project("Cmake Example")


# Add include
include_directories(include)

# Sends the -std=c99 flag to the gcc compiler
add_definitions(-std=c++11)

# This tells CMake to fib.c and name it fibonacc:i
add_executable(fibonacci src/main.cpp src/fib.cpp)


