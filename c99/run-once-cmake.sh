#!/bin/bash

if [[ ! -d build ]]; then
    mkdir -p build
fi

# Ensure there's a place to store (lcov) coverage reports
[ ! -d "coverage" ] && mkdir coverage

# Clean up old (gcov) coverage measurements (avoid confusing reports)
find . -name *.gcda -exec rm {} \;


cd build
cmake .. -DCMAKE_BUILD_TYPE=DEBUG && cmake --build . && ctest --output-on-failure

# Create the coverage report
lcov --directory ./ --capture --output-file ../coverage/lcov.info -rc lcov_branch_coverage=1 --quiet 2> /dev/null
