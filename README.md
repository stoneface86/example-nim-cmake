# example-nim-cmake

An example C project using CMake that can interface with Nim code.
You can use this as a template for a C/C++ project that will interface
with Nim code, or integrate it into an existing project.

This example uses the code from the [Nim Backend Integration](https://nim-lang.org/docs/backends.html)
manual page. The [fib proc](src/nim/fib.nim) is exported and compiled as a
static library which can then be called from our [C application](src/main.c).
The entire application is built using CMake.

## Requirements

 - [CMake](https://cmake.org) (3.8 or higher)
 - A C compiler (MSVC, GCC or Clang, others will require configuration)
 - [Nim](https://nim-lang.org) (1.6.0 or higher)

## Project layout

 - cmake/
   - FindNim.cmake - CMake Find module for locating `nim` and `nimble`
 - src/
   - nim/
     - Nim source code
     - CMakeLists.txt
   - C source code
   - CMakeLists.txt
 - CMakeLists.txt

## Contributing

Feel free to submit an issue/PR. Open to comments, suggestions, improvements.

## License

All code in this repo is available to the public domain. See [LICENSE](LICENSE)
for details.
