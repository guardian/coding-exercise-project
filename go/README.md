# Go

Skeleton project for Go.

## Prerequisites

The toolchain this project needs is declared in [`.tool-versions`](./.tool-versions):

```
go 1
```

Install those however you prefer, as long as they end up on your `PATH`. The quickest route is
[mise](https://mise.jdx.dev/), which reads the file for you:

```sh
mise install
```

## Usage
- `./script/setup` to fetch dependencies
- `./script/test` to run the tests
- `./script/start` to run the app

## Structure
- Code located in [`main.go`](./main.go) and [`src/pairing.go`](./src/pairing.go)
- Tests located in [`src/pairing_test.go`](./src/pairing_test.go)

However, you're free to organise your code as you like.
