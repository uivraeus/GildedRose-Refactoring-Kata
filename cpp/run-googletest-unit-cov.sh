#!/bin/bash

set -e

# Prepare build structure
if [ ! -d "build" ]
then
    # create build files
    mkdir build
    cd build
    cmake ..
    cd ..
fi

# Ensure there's a place to store coverage reports
[ ! -d "coverage" ] && mkdir coverage

cd build

# Clean up old coverage measurements (avoid confusing reports)
find . -name *.gcda -exec rm {} \;

# The actual build
cmake --build .

# Run tests and collect coverage
./test/cpp_googletest_unittest/GildedRoseGoogletestUnitTests --gtest_brief=1

# Create the coverage report
lcov --directory ./ --capture --output-file ../coverage/lcov.info -rc lcov_branch_coverage=1 --quiet 2> /dev/null
