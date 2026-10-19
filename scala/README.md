# Scala

Skeleton project for Scala.

## Prerequisites

The toolchain this project needs is declared in [`.tool-versions`](./.tool-versions):

```
java corretto-21
sbt 1
```

Install those however you prefer, as long as they end up on your `PATH`. The quickest route is
[mise](https://mise.jdx.dev/), which reads the file for you:

```sh
mise install
```

## Usage
- `./script/setup` to fetch dependencies
- `./script/test` to run the tests, or `./script/test --watch` to re-run them on every change
- `./script/start` to run the app

## Structure
- Code located in [`Main.scala`](./src/main/scala/gu/com/Main.scala)
- Tests located in [`MainTest.scala`](./src/test/scala/gu/com/MainTest.scala)

However, you're free to organise your code as you like. 
