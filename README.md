# Coding Exercise Project

This repository contains small skeleton projects in a number of programming languages. 

It is designed to aid in the coding exercise stage of the Guardian's recruitment process for Software Engineers. 

To learn more, please see the [repository of exercises](https://github.com/guardian/coding-exercises).

Inspired to work for us? [**Apply now**](http://developers.theguardian.com/join-the-team.html)

## Setting up your environment

For the coding exercise you will need to be able to do two things:

- Write code in the language of your choice, sharing your screen to pair with the remote interviewer
- Run that code
- Optionally: write tests for the code you have written

These skeleton projects can be used to set up such an environment quickly should you wish but are not required.
You can set up your own environment but please do so **before** you join the Hangout and check that you can run and test your code.

If you have any issues with your environment please let your interviewer know as soon as you join the Hangout so that
they can adjust the exercise accordingly.

## How to use
This repository has a directory per language. Each skeleton follows the same structure with a README and a failing test.

To get started:

💻 Clone the repo `git clone git@github.com:guardian/coding-exercise-project.git`

🗂 Switch directories to the language of your choosing

🔌 Install dependencies and perform other setup tasks `./script/setup` (usually uses [homebrew](https://brew.sh/))

🧪 Run the tests and witness them fail `./script/test`

💻 Now it is up to you! Using your editor of choice, start writing code!

## Missing language?
Please raise a PR to add it with:
- A README
- A failing test
- A `./script/setup` script to install dependencies and perform other setup tasks
- A `./script/test` script to run the tests

The requirement for the `./script` commands is to keep consistency across languages and make it easy to switch between them. 
Read more [here](https://github.com/github/scripts-to-rule-them-all).

## Note for Guardian interviewers
Do not push solutions to the coding exercise as it is a public repository.
