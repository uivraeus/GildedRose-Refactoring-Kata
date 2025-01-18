cmake_minimum_required(VERSION 3.5.0)
project(GildedRose_c99)

include(CTest)
enable_testing()

include(ExternalProject)
ExternalProject_Add(unity
  GIT_REPOSITORY    https://github.com/ThrowTheSwitch/Unity.git
  GIT_TAG           master
  SOURCE_DIR        "${CMAKE_CURRENT_BINARY_DIR}/unity-src"
  BINARY_DIR        "${CMAKE_CURRENT_BINARY_DIR}/unity-build"
  CONFIGURE_COMMAND ""
  BUILD_COMMAND     ""
  INSTALL_COMMAND   ""
  TEST_COMMAND      ""
)
add_custom_command(OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/unity-src/src/unity.c
                   DEPENDS unity
                   COMMAND "")


add_executable( GildedRose_Unity
   GildedRose.c
   ${CMAKE_CURRENT_BINARY_DIR}/unity-src/src/unity.c
   test_unity_gildedrose.c
)
target_include_directories(GildedRose_Unity PRIVATE ${CMAKE_CURRENT_BINARY_DIR}/unity-src/src/)
set_property(TARGET GildedRose_Unity PROPERTY C_STANDARD 99)
add_dependencies(GildedRose_Unity unity)

# Settings for enabling coverage reporting
set(CMAKE_BUILD_TYPE "Debug")
target_compile_options(GildedRose_Unity PRIVATE -coverage)
target_link_options(GildedRose_Unity PRIVATE -coverage)

add_test(NAME GildedRose_Unity COMMAND GildedRose_Unity)