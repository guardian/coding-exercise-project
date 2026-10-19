# Clojure

Skeleton project for Clojure.

## Prerequisites

The toolchain this project needs is declared in [`.tool-versions`](./.tool-versions):

```
java corretto-21
leiningen 2.12
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
- Code located in [`core.clj`](./src/pairing/core.clj)
- Tests located in [`core_test.clj`](./test/pairing/core_test.clj)

However, you're free to organise your code as you like.
