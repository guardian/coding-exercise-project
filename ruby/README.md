# Ruby

Pairing test starter project for Ruby with rspec for testing.

## Usage
- `./script/setup` to install dependencies
- `./script/test` to run the tests
- `./script/start` to run the code
- `./script/console` for an interactive prompt

## Structure
- Code located in [pairing_test.rb](./lib/pairing_test.rb)
- Tests located in [pairing_test_spec.rb](./spec/pairing_test_spec.rb)

`lib` has been added to the `require` path so all imports inside the `lib` directory must be relative to this, e.g. `require "pairing_test/version"`.

However, you're free to organise your code as you like. 
