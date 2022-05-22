
project(src C)

add_subdirectory(nim)

add_executable(example "main.c")
# the nim subdirectory provides a static library target called nim
target_link_libraries(example nim)

add_custom_target(
    run
    COMMAND example
    DEPENDS example
)