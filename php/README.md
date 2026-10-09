# PHP

Skeleton project for PHP.

## Prerequisites

The toolchain this project needs is declared in [`.tool-versions`](./.tool-versions):

```
php 8
```

Install those however you prefer, as long as they end up on your `PATH`. The quickest route is
[mise](https://mise.jdx.dev/), which reads the file for you:

```sh
mise install
```

Note that mise compiles PHP from source, so it needs some system libraries to build against.
If `mise install` fails, run [`./script/system-packages`](./script/system-packages) to install
them and try again. You can skip this if you install PHP from a package manager instead
(`apt install php`, `brew install php`), as that comes pre-built.

## Usage
- `./script/setup` to fetch dependencies
- `./script/test` to run the tests
- `./script/start` to run the app

## Structure
- Code located in [`code.php`](./code.php)
- Tests located in [`Tests.php`](./Tests.php)

However, you're free to organise your code as you like.
