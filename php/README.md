# PHP

Skeleton project for PHP with PHPUnit for testing.

## Usage (on MacOS or Linux)
- `./script/setup` to install dependencies
- `./script/test` to run the tests
- `./script/start` to run the code

## Usage (on Windows)
- `PowerShell.exe -ExecutionPolicy UnRestricted -File .\script\setup.ps1` to download temp install of php and composer dependencies
    - If this doesn't work install [PHP](https://www.php.net/manual/en/install.windows.php) and [Composer](https://getcomposer.org/) manually
- `php composer.phar test` to run the tests
- `php composer.phar start` to run the code

## Structure
- Code located in [`code.php`](./code.php)
- Tests located in [`tests.php`](./tests.php)

However, you're free to organise your code as you like. 
