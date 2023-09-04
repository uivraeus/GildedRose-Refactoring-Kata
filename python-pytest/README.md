# Test with [pytest](https://docs.pytest.org)

Start test with:

```shell
pytest
```

Or, if you have [pytest-watch](https://pypi.org/project/pytest-watch) installed:

```shell
ptw
```

A convenience script for measuring code coverage is also provided:

```shell
./run-with-cov-details.sh
```

An alternative for code coverage measurement is to run the following command:

```shell
pytest --cov --cov-report=xml
```

Then VsCode (Coverage Gutter) should be able to pick up the measurement, e.g. by clicking the "Watch" option at the bottom of the window.