# TypeScript

Skeleton project for TypeScript (via NodeJS).

## Prerequisites

The toolchain this project needs is declared in [`.tool-versions`](./.tool-versions):

```
node 22
yarn 3
```

Install those however you prefer, as long as they end up on your `PATH`. The quickest route is
[mise](https://mise.jdx.dev/), which reads the file for you:

```sh
mise install
```

## Usage
- `./script/setup` to fetch dependencies
- `./script/test` to run the tests, or `./script/test --watch` to re-run them on every change
- `./script/start` to run the app (watches for changes and recompiles automatically)

## Structure
- Code located in [`index.ts`](./src/index.ts)
- Tests located in [`index.test.ts`](./src/index.test.ts)

However, you're free to organise your code as you like.
