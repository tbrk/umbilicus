cmake_minimum_required(VERSION 4.2)

project(Jerry)

if(CMAKE_SHARED_LIBRARY_SUFFIX STREQUAL ".dylib")
    set(CMAKE_SHARED_LIBRARY_SUFFIX  ".so")
endif()

add_library(jerry SHARED jerry.c)

file(GENERATE OUTPUT "${CMAKE_BINARY_DIR}/libjerry.sexp" CONTENT "libjerry.so")
