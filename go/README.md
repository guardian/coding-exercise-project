# Simple GO skeleton

You can either run this as a `main` application via `main.go` or you can run the test suite.

## Test suite

To run the test suite, cd into `pairing` and run `go test`:

```
$ go test
PASS
ok      _/Users/proberts/src/gu/pairing-interviews/gu-skeleton/go/pairing       0.007s
```

Add new tests to the `pairing_test.go` file.

## Running as main

To run as a main application, type `go run main.go` in the root directory of this project (where this README is). This will compile and execute a package `main` from the specified go file.

The `main.go` file will import the `pairing` module via the relative path `./pairing` and then run one of its exported functions, printing the result.

```
$ go run main.go
hello
```
