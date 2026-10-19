# .NET Core

Skeleton project for .NET Core (C#).

## Prerequisites

The toolchain this project needs is declared in [`.tool-versions`](./.tool-versions):

```
dotnet 10
```

Install those however you prefer, as long as they end up on your `PATH`. The quickest route is
[mise](https://mise.jdx.dev/), which reads the file for you:

```sh
mise install
```

## Usage
- `./script/setup` to restore dependencies
- `./script/test` to run the tests, or `./script/test --watch` to re-run them on every change
- `./script/start` to run the app

## Structure
- Code located in [`PairingTest.cs`](./Code/PairingTest.cs)
- Tests located in [`Tests.cs`](./Test/Tests.cs)

However, you're free to organise your code as you like.

## Notes
IDE-wise you can use VS Code with the standard Microsoft C# extension.
