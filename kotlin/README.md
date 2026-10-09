# Kotlin

Skeleton project for Kotlin.

## Prerequisites

The toolchain this project needs is declared in [`.tool-versions`](./.tool-versions):

```
java corretto-21
```

Install those however you prefer, as long as they end up on your `PATH`. The quickest route is
[mise](https://mise.jdx.dev/), which reads the file for you:

```sh
mise install
```

## Usage
- `./script/setup` to download the Gradle distribution
- `./script/test` to run the tests, or `./script/test --watch` to re-run them on every change
- `./script/start` to run the app

## Structure
- Code located in [`Main.kt`](./src/main/kotlin/com/gu/pairingtest/Main.kt)
- Tests located in [`MainTest.kt`](./src/test/kotlin/MainTest.kt)

However, you're free to organise your code as you like.
