# TypeScript

Skeleton project for TypeScript with testing via [Deno](https://deno.land/).

Make sure you have Deno installed by running `deno --version`.

If using VSCode, you might want to enable the extension in the settings:

```jsonc
// .vscode/settings.json
{
  "deno.enable": true,
  // or specifically
  "deno.enablePaths": ["./typescript-deno"]
}
```

## Usage

- `./script/start` to run the source code
- `./script/test` to run the tests in watch mode

## Structure

- Code located in [`mod.ts`](./src/mod.ts)
- Tests located in [`mod.test.ts`](./src/mod.test.ts)

However, you are free to organise your code as you like.
