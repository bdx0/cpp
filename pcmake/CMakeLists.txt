# set(CMAKE_C_COMPILER "gcc-4.2")
# set(CMAKE_CXX_COMPILER "/usr/bin/g++-4.2")
# Specify the version being used as well as the language 
cmake_minimum_required(VERSION 2.6)
project("Cmake Example")


# http://mirkokiefer.com/blog/2013/03/cmake-by-example/
# set(CMAKE_INSTALL_PREFIX ../installed)
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

# However, the file(GLOB...) allows for wildcard additions:
# file(GLOB SOURCES "src/*.cpp")

set(SOURCES src/main.cpp src/fib.cpp)

add_executable(fibonacci ${SOURCES})

add_custom_target(test_fibonacci ALL fibonacci 
  WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
)


set(SOURCES src/hello.cpp)
add_executable(hello ${SOURCES})

add_custom_target(test_hello ALL hello
  WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
)

#Generate the shared library from the sources
# add_library(testStudent SHARED ${SOURCES})
 
#Set the location for library installation -- i.e., /usr/lib in this case
# not really necessary in this example. Use "sudo make install" to apply
# install(TARGETS testStudent DESTINATION /usr/lib)

#Generate the static library from the sources
# add_library(testStudent STATIC ${SOURCES})
 
#Set the location for library installation -- i.e., /usr/lib in this case
# not really necessary in this example. Use "sudo make install" to apply
# install(TARGETS testStudent DESTINATION /usr/lib)
#
