.NET Core
=========

Pairing test skeleton using .NET core and `nunit` for testing.

First up:

- Install .NET Core SDK (https://dotnet.microsoft.com/download)

There's a console app in the `Code` folder. To run it:

```
dotnet run --project Code
```

There's tests in the `Test` folder. To run them:

```
dotnet test
```

To start with it contains a single failing test referencing a static function from the `Code` project.

IDE-wise you can use VS Code with the standard Microsoft C# extension.

Skeleton created following these instructions: https://docs.microsoft.com/en-us/dotnet/core/testing/unit-testing-with-nunit