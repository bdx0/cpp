# set(CMAKE_C_COMPILER "gcc-4.2")
# set(CMAKE_CXX_COMPILER "/usr/bin/g++-4.2")
# Specify the version being used as well as the language 
cmake_minimum_required(VERSION 2.6)
project("Cmake Example")

set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)

# There are lots of scripts with cmake
# for finding external libraries. 
# http://www.cs.swarthmore.edu/~adanner/tips/cmake.php
#see /usr/local/share/cmake-2.6/Modules/Find*.cmake for more examples
find_package(GLUT)
find_package(OpenGL)

# Add include
include_directories(include)

# Sends the -std=c99 flag to the gcc compiler
add_definitions(-std=c++11)

# This tells CMake to fib.c and name it fibonacc:i
add_executable(fibonacci src/main.cpp src/fib.cpp)
add_executable(hello src/hello.cpp)
add_custom_target(test_hello
  COMMAND ${CMAKE_BINARY_DIR}/bin/hello
  # WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
  # COMMENT "run generated test2 in ${CMAKE_CURRENT_SOURCE_DIR}"
  # SOURCES "" 
)

add_dependencies(hello test_hello)
