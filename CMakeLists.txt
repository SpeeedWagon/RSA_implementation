cmake_minimum_required(VERSION 3.10)
project(AKS_Performance VERSION 1.0)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED True)

# 1. Find the package
find_package(GMP)

# 2. Define the executable
add_executable(MyApp src/main.cpp src/utils.cpp)

target_include_directories(MyApp PRIVATE include)
# 3. Link using the variables found by find_package
# Note: On Linux, this usually resolves to 'gmp' and 'gmpxx'
target_link_libraries(MyApp PUBLIC gmp gmpxx)