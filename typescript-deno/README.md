# TypeScript

Skeleton project for TypeScript with testing via [Deno](https://deno.land/).

## Prerequisites

The toolchain this project needs is declared in [`.tool-versions`](./.tool-versions):

```
deno 2
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

- Code located in [`mod.ts`](./src/mod.ts)
- Tests located in [`mod.test.ts`](./src/mod.test.ts)

However, you are free to organise your code as you like.

## VSCode

If using VSCode, you might want to enable the Deno extension in the settings:

```jsonc
// .vscode/settings.json
{
  "deno.enable": true,
  // or specifically
  "deno.enablePaths": ["./typescript-deno"]
}
```
