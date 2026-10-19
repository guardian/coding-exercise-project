# Coding Exercise Project

[![CI](https://github.com/guardian/coding-exercise-project/actions/workflows/ci.yml/badge.svg)](https://github.com/guardian/coding-exercise-project/actions/workflows/ci.yml)

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

## Prerequisites

Every skeleton declares the toolchain it needs in a [`.tool-versions`](https://mise.jdx.dev/configuration.html#tool-versions)
file. For example, the Scala project asks for:

```
java corretto-21
sbt 1
```

You are free to install those tools however you like — a system package manager, a language-specific
version manager, or an existing installation. All that matters is that they end up on your `PATH`.
If they are not, `./script/setup` will fail with a "command not found" error.

### Recommended: mise

The quickest way to get the right versions is [mise](https://mise.jdx.dev/), which reads
`.tool-versions` and installs all listed tools.

Follow mise's [getting started guide](https://mise.jdx.dev/getting-started.html) to install it and
activate it in your shell. Then, from inside the language directory of your choice:

```sh
mise install
```

## How to use
This repository has a directory per language. Each skeleton follows the same structure with a README and a passing test.

To get started:

💻 Clone the repo `git clone git@github.com:guardian/coding-exercise-project.git`

🗂 Switch directories to the language of your choosing

🔧 Install the toolchain listed in `.tool-versions`, e.g. with `mise install`

🔌 Install dependencies and perform other setup tasks `./script/setup`

🧪 Run the tests and watch them pass `./script/test`

💻 Now it is up to you! Using your editor of choice, start writing code!

## Missing language?
Please raise a PR to add it with:
- A README
- A `.tool-versions` declaring the language toolchain, pinned to its major version
- A passing example test
- A `./script/setup` script to install dependencies and do any other initial setup
- A `./script/test` script to run the tests

Adding a `.tool-versions` file enrols a project in CI, so `./script/setup` and `./script/test`
must exist and be executable — the `Check project structure` job enforces this.

If the toolchain is built from source and needs system libraries that may not be present,
add an executable `./script/system-packages` that installs them. CI runs it before installing the
toolchain, and anyone building that toolchain locally can run it themselves. This script is run separately
to `./script/setup`, because `setup` runs after the toolchain is already on your `PATH`.
Only `php` needs this today.

The requirement for the `./script` commands is to keep consistency across languages and make it easy to switch between them. 
Read more [here](https://github.com/github/scripts-to-rule-them-all).

## Note for Guardian interviewers
Do not push solutions to the coding exercise as it is a public repository.
