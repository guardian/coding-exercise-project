# Kotlin Pairing Test Project

This is a skeleton project for the Guardian Kotlin pair programming test.

# Running in Android studio
You should be able to import this project into Android studio and click the play button next to each unit test to run the unit tests. If this is too slow or doesn't work try running on the command line.

# Running on the command line / any other IDE

To setup make sure you have the JDK installed and the JAVA_HOME environment variable set. You can run `./script/setup` in a terminal to do this for you if you have Android Studio installed.

Then run in a terminal:
- `./script/test` to run the unit tests. 
- `./script/start` to run the main function

*Please note:* unit tests will not output results if run twice without any test or code changes. See: https://blog.gradle.org/stop-rerunning-tests

If these scripts fail you may have to install JDK and/or Gradle manually and then try running `gradle test` and `gradle run`.

[Intructions for installing Adoptium OpenJDK here](https://adoptium.net/)

[Intructions for installing Gradle manually here](https://gradle.org/install/)