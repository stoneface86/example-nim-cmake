
# for this example we use the C backend, using the C++ backend will have a similar configuration
project(nim C)

find_package(Nim REQUIRED)

# Nim should use the same compiler as cmake
if (CMAKE_C_COMPILER_ID STREQUAL "MSVC")
    set(NIM_CC "--cc:vcc")
elseif (CMAKE_C_COMPILER_ID STREQUAL "GNU")
    set(NIM_CC "--cc:gcc")
elseif (CMAKE_C_COMPILER_ID MATCHES "Clang")
    # Clang or AppleClang
    set(NIM_CC "--cc:clang")
else ()
    # unknown compiler family, might want to abort here
    # or provide your own compiler config (see nim.cfg)
    message(FATAL_ERROR "unknown compiler, manual configuration required")
endif ()

# name of the project file to build, in this case it is our fib module
set(NIM_PROJECT "fib.nim")
# if you have more modules other than NIM_PROJECT, include them here so
# that the library will be rebuilt when you make changes to them.
set(NIM_DEPS "")

# set the nimcache in our build folder
set(NIMCACHE "${CMAKE_CURRENT_BINARY_DIR}/nimcache")

set(NIM_LIB "${CMAKE_STATIC_LIBRARY_PREFIX}nim${CMAKE_STATIC_LIBRARY_SUFFIX}")
set(NIM_LIB_PATH "${CMAKE_CURRENT_BINARY_DIR}/${NIM_LIB}")

# build the library via nimble
add_custom_command( 
    OUTPUT "${NIM_LIB_PATH}"
    COMMAND "${NIMBLE}" c --app:staticlib --nomain ${NIM_CC}
    --out:"${NIM_LIB_PATH}" --outdir:"${CMAKE_CURRENT_BINARY_DIR}" --nimcache:"${NIMCACHE}"
    -d:cmakeBuildType:${CMAKE_BUILD_TYPE} "${NIM_PROJECT}"
    DEPENDS "${NIM_PROJECT}" "${NIM_DEPS}" config.nims cmake.nim interop.nimble
    WORKING_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}"
)
add_custom_target(
    nimbuild 
    DEPENDS "${NIM_LIB_PATH}"
    COMMENT "Building Nim static library"
)

add_library(nim STATIC IMPORTED GLOBAL)
set_target_properties(nim PROPERTIES IMPORTED_LOCATION "${NIM_LIB_PATH}")

add_dependencies(nim nimbuild)
