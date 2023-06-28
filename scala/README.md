# Scala

Skeleton project for Scala.

## Usage
- `./script/setup` to install dependencies
- `./script/test` to run the tests

## Usage (on Windows)
- Make sure JDK version 8 or above is installed and JAVA_HOME environment variable is set
- Use Powershell to execute the below commands
- `PowerShell.exe -ExecutionPolicy UnRestricted -File .\script\setup.ps1` to download and extract portable sbt
    - (If this script fails you can do this manually by visiting https://github.com/sbt/sbt/releases ,downloading the latest sbt zip and extracting it to ./coding-exercise-project/scala/sbt)
- `.\sbt\sbt\bin\sbt test` to run tests

## Structure
- Code located in [`Main.scala`](./src/main/scala/gu/com/Main.scala)
- Tests located in [`MainTest.scala`](./src/test/scala/gu/com/MainTest.scala)

However, you're free to organise your code as you like. 
