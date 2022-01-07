# .NET Core

Pairing test skeleton using .NET core and `nunit` for testing.

## Usage (on MacOS / Linux / Unix)
- `./script/setup` to install dependencies (uses [homebrew](https://brew.sh/))
- `./script/test` to run the tests
- `./script/start` to run the code

## Usage (on Windows)
- Ensure you allow the running of Powershell scripts by running as an admin `Set-ExecutionPolicy -ExecutionPolicy Unrestricted`
- `./script/setup.ps1` to install dependencies (Downloads .NET Core 6 to dotnet folder within this folder)
- `./script/test.ps1` to run the tests
- `./script/start.ps1` to run the code

## Structure
- Code located in [`PairingTest.cs`](./Code/PairingTest.cs)
- Tests located in [`Tests.cs`](./Test/Tests.cs)

However, you're free to organise your code as you like. 

## Notes
IDE-wise you can use VS Code with the standard Microsoft C# extension.

Skeleton created following these instructions: https://docs.microsoft.com/en-us/dotnet/core/testing/unit-testing-with-nunit
