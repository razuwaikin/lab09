[![Build Status](https://www.travis-ci.com/razuwaikin/lab08.svg?branch=master)](https://www.travis-ci.com/razuwaikin/lab08)
# Лабораторная работа №7

  1) Для настройки Hunter-пакета из solver нужно сосздать папку cmake и из нее прописать команду ```
$wget https://raw.githubusercontent.com/cpp-pm/gate/master/cmake/HunterGate.cmake -O cmake/HunterGate.cmake```
  2) Так в cmake загружается файл HunterGate.cmake.
  далее пересобираю CMakeLists.txt 
```
cmake_minimum_required(VERSION 3.4)

add_definitions(-std=c++0x)


include("cmake/HunterGate.cmake")

HunterGate(
    URL "https://github.com/cpp-pm/hunter/archive/v0.23.251.tar.gz"
    SHA1 "5659b15dc0884d4b03dbd95710e6a1fa0fc3258d"
)

project(S)

hunter_add_package(Boost)

find_package(Boost CONFIG REQUIRED)

include_directories(solver_lib)
include_directories(formatter_ex_lib)

add_subdirectory(solver_lib)
add_subdirectory(formatter_ex_lib)
add_executable(solver equation.cpp)

target_link_libraries(solver PUBLIC Boost::boost solver_lib formatter_ex)

```
  6) Далее собираю .travis.yml:
```
language: cpp
compiler:
- gcc
jobs:
  include:
  - name: "all projects"
script:
    - cmake -H. -B_build
    - cmake --build _build
addons:
  apt:
    sources:
      - george-edison55-precise-backports
    packages:
      - cmake
      - cmake-data
```
