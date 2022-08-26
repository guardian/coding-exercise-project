# TypeScript

Skeleton project for TypeScript with testing via [Deno](https://deno.land/).

Make sure you have Deno installed by running `deno --version`.

If using VSCode, you might want to enable the extension in the settings:

```jsonc
// .vscode/settings.json
{
  "deno.enable": true
}
```

## Usage

- `deno run src/mod.ts` to run your code
- `deno test src` to run the tests

### Other commands

- `deno run src/exerciste.ts --watch` will re-run [`mod.ts`](./src/mod.ts) on every
  file change, for quick development feedback.
- `deno test src --watch` will re-run [`mod.test.ts`](./src/mod.test.ts) on every file
  change, for quick development feedback.

## Structure

- Code located in [`mod.ts`](./src/mod.ts)
- Tests located in [`mod.test.ts`](./src/mod.test.ts)

However, you are free to organise your code as you like.
