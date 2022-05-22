
cmake_minimum_required(VERSION 3.8)

project(
    ExampleNimCMake
    VERSION 1.0
    LANGUAGES C
)

# so we can find nim via find_package
set(CMAKE_MODULE_PATH ${CMAKE_CURRENT_LIST_DIR}/cmake ${CMAKE_MODULE_PATH})

add_subdirectory(src)


