Skeleton project for TypeScript (via NodeJS).

Running `yarn watch` will constantly compile `index.ts` then execute the compiled version on every file change (for quick development feedback loop) using [tsc-watch](https://www.npmjs.com/package/tsc-watch) under the hood.

Running `yarn jest --watch` will constantly run the tests as you save, requires the candidate to first create a test file (e.g. `index.test.ts`)