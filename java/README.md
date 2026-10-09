# Java

Skeleton project for Java using Maven.

## Toolchain

The toolchain is declared in [`.tool-versions`](.tool-versions):

```
java corretto-21
maven 3
```

Install it however you prefer — [mise](https://mise.jdx.dev) is the easiest route:

```bash
mise install
```

`./script/setup` does not install the toolchain; it expects the tools above to be on your `PATH`.

## Usage

Feel free to run the main class and test suites directly through your IDE of choice. If you want to run from the terminal, you can use these commands:

- `./script/setup` to download dependencies
- `./script/run` to run the main class
- `./script/test` to run the test suite

The example test passes out of the box. A good way to get your bearings is to break it
deliberately, watch it fail, then put it back.
