# PHP

Skeleton project for PHP with PHPUnit for testing.

## Usage (on MacOS or Linux)
- `./script/setup` to install dependencies using brew
    - If this doesn't work install PHP CLI and [Composer](https://getcomposer.org/) manually
- `./script/test` to run the tests
- `./script/start` to run the code

*Note: You need [brew](https://brew.sh/) installed for the setup script to work. If you haven't installed brew before it will require at least 5gb of space. Downloading these packages will take a long time, so please ensure you do so well in advance of the interview.*

## Usage (on Windows)
- `PowerShell.exe -ExecutionPolicy UnRestricted -File .\script\setup.ps1` to download temp install of php and composer dependencies
    - If this doesn't work install [PHP](https://www.php.net/manual/en/install.windows.php) and [Composer](https://getcomposer.org/) manually
- `php composer.phar test` to run the tests
- `php composer.phar start` to run the code

## Structure
- Code located in [`code.php`](./code.php)
- Tests located in [`tests.php`](./tests.php)

However, you're free to organise your code as you like. 
