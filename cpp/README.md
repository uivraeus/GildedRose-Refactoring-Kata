# C++ version of Gilded Rose refactoring kata

## Introduction
The C++ version of the Gilded Rose refactoring kata is available in four variants using different test frameworks:

* Catch2 test framework
  1. Traditional unit test with the [Catch2](https://github.com/catchorg/Catch2) test framework in the `test/cpp_catch2_unittest` folder.
  2. [Approval tests](https://github.com/approvals/ApprovalTests.cpp) with the [Catch2](https://github.com/catchorg/Catch2) test framework in the `test/cpp_catch2_approvaltest` folder.
* Google Test framework
  1. Traditional unit test with the [Googletest](https://github.com/google/googletest) test framework in the `test/cpp_googletest_unittest` folder.
  2. [Approval tests](https://github.com/approvals/ApprovalTests.cpp) with the [Googletest](https://github.com/google/googletest) test framework in the `test/cpp_googletest_approvaltest` folder.

The `GildedRose.cc` file, i.e. the code under test, is identical in all four variants.

## Prerequisites

* CMake version >= 3.13
* C++ compiler that support C++11

## How to build and run tests in a terminal

## Prepare (if directories don't exists)

    $ cd ${GIT_FOLDER}/GildedRose-Refactoring-Kata/cpp
    $ mkdir -p build coverage
    $ cd build
    $ cmake ..

### Build tests

(Assuming current directory is "build")

    $ cmake --build .

### Show available tests

(Assuming current directory is "build")

    $ ctest -N

### Run all tests

(Assuming current directory is "build")

    $ ctest

### Run all tests with verbose output

(Assuming current directory is "build")

    $ ctest -VV


## How to derive code coverage

(Assuming current directory is "build")

    $ lcov --directory ./ --capture --output-file ../coverage/lcov.info -rc lcov_branch_coverage=1

In VS Code, open the source code (cpp) file and run "Coverage Gutters: Display Coverage" or click "Watch" in the bottom menu bar.

Coverage will now be visible in VSCode (left border in the editor when viewing source code).

## How to run during a typical test cycle

(Assuming current directory is "build")

    $ cmake --build .
    $ ctest -VV --tests-regex GildedRoseGoogletestUnitTests
    $ lcov --directory ./ --capture --output-file ../coverage/lcov.info -rc lcov_branch_coverage=1

This procedure can be run via the `run-googletest-unit-cov.sh` script from the cpp project root (${GIT_FOLDER}/GildedRose-Refactoring-Kata/cpp)
