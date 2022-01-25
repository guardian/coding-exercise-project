# Kotlin Pairing Test Project

This is a skeleton project for the Guardian Kotlin [pair programming exercise](https://github.com/guardian/coding-exercises).

## Structure
- Code located in [`Main.kt`](./src/main/kotlin/com/gu/pairingtest/Main.kt)
- Tests located in [`MainTest.kt`](./src/test/kotlin/MainTest.kt)

However, you're free to organise your code as you like. 

## Running in Android studio or IntelliJ IDEA
You should be able to import this project into Android studio or IntelliJ and click the play button next to each unit test to run the unit tests. If this is too slow or doesn't work try following the next section for setting up on the command line / any other IDE.

## Using another IDE nad running on the command line
If you'd like to use another IDE (e.g VSCode, Atom, Vim) you'll need to be able to run the unit tests via the command line.

To do this make sure you have the JDK installed and the JAVA_HOME environment variable set. 
If on MacOS you can run `./script/setup` in a terminal to try to automate this process.
If this fails or you're on Windows you can [install the JDK manually](https://adoptium.net/)

Once the JDK is installed

If on MacOS / Linux open a terminal and run:
- `./script/setup` to make sure your JAVA_HOME is set
- `./script/test` to run the unit tests.
- `./script/start` to run the main function

If on Windows open Powershell and run:
- `$env:JAVA_HOME = Join-Path (Get-Command javac).path "../../" -Resolve` to make sure your JAVA_HOME is set
- `./gradlew.bat test` to run the unit tests
- `./gradlew.bat run` to run the main function

*Please note:* Unit tests will not output results if run twice without any test or code changes. See: https://blog.gradle.org/stop-rerunning-tests

## Manual setup

If these scripts fail and you can't open the project in Android Studio, you may have to [install the JDK manually](https://adoptium.net/). JDK versions 8 and above should work.

Once you've installed the JDK and set the JAVA_HOME environment variable to the location of your JDK install, then try running `./gradlew test` which will use the Gradle wrapper script to download Gradle and run the tests. If this fails [download gradle manually](https://gradle.org/install/) and run `gradle test`.

