# Ruby

Skeleton project for Ruby.

## Prerequisites

The toolchain this project needs is declared in [`.tool-versions`](./.tool-versions):

```
ruby 3.4
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
- `./script/console` for an interactive prompt

## Structure
- Code located in [`pairing_test.rb`](./lib/pairing_test.rb)
- Tests located in [`pairing_test_spec.rb`](./spec/pairing_test_spec.rb)

`lib` has been added to the `require` path so all imports inside the `lib` directory must be relative to this, e.g. `require "pairing_test/version"`.

However, you're free to organise your code as you like.
