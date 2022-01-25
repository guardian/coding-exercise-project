# Kotlin Pairing Test Project

This is a skeleton project for the Guardian Kotlin [pair programming exercise](https://github.com/guardian/coding-exercises).

## Structure
- Code located in [`Main.kt`](./src/main/kotlin/com/gu/pairingtest/Main.kt)
- Tests located in [`MainTest.kt`](./src/test/kotlin/MainTest.kt)

However, you're free to organise your code as you like. 

## Running in Android studio or IntelliJ IDEA
You should be able to import this project into Android studio or IntelliJ and click the play button next to each unit test to run the unit tests. If this is too slow or doesn't work try following the next section for setting up on the command line / any other IDE.

## Running on the command line (on MacOS / Linux)

To setup make sure you have the JDK installed and the JAVA_HOME environment variable set. You can run `./script/setup` in a terminal to try to automate this process. If this fails [install the JDK manually](https://adoptium.net/)

Then run in a terminal:
- `./script/test` to run the unit tests. 
- `./script/start` to run the main function

## Running on the command line (on Windows)
Make sure you have the [JDK installed](https://adoptium.net/) and the JAVA_HOME environment variable set. 

If you already have the JDK installed but no JAVA_HOME set you can run the following in Powershell: 

```$env:JAVA_HOME = Join-Path (Get-Command javac).path "../../" -Resolve```

Then run in a terminal:
- `./gradlew.bat test` to run the unit tests
- `./gradlew.bat run` to run the main function
Unit tests will not output results if run twice without any test or code changes. See: https://blog.gradle.org/stop-rerunning-tests

## Manual setup

If these scripts fail and you can't open the project in Android Studio, you may have to [install the JDK manually](https://adoptium.net/). JDK versions 8 and above should work.

Once you've installed the JDK and set the JAVA_HOME environment variable to the location of your JDK install, then try running `./gradlew test` which will use the Gradle wrapper script to download Gradle and run the tests. If this fails [download gradle manually](https://gradle.org/install/) and run `gradle test`.

