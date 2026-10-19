# Swift

Skeleton project for Swift.

## Prerequisites

The toolchain this project needs is declared in [`.tool-versions`](./.tool-versions):

```
swift 6
```

Install those however you prefer, as long as they end up on your `PATH`. The quickest route is
[mise](https://mise.jdx.dev/), which reads the file for you:

```sh
mise install
```

## Usage
- `./script/setup` to resolve dependencies
- `./script/test` to run the tests
- `./script/start` to run the app

## Structure
- Tests located in [`CodingExerciseTests.swift`](./Tests/CodingExerciseTests/CodingExerciseTests.swift)
- Code located in [`CodingExercise.swift`](./Sources/CodingExercise/CodingExercise.swift)

However, you're free to organise your code as you like.