# Python Pairing Test

## Getting started

It is recommended to use Python 3 over Python 2.

### 1. Install Python

Mac users can use homebrew to install Python 3:

```bash
brew install python3
```

### 2. Install and activate virtualenv

It is a good idea to use virtualenv with Python, this can be done with Pip:

```bash
pip3 install virtualenv
```

You will need to create a virtualenv.

From the root directory of the project run:

```bash
virtualenv venv
```

Once that is done, this command will activate virtualenv:

```bash
source venv/bin/activate
```

### 3. Open PyCharm

PyCharm is the preferred IDE of most developers when using Python. If virtualenv is active, it should automatically set the correct Python version.

If you do not currently have PyCharm installed, you can download and install the community edition from the [official website](https://www.jetbrains.com/pycharm/download/).

## Usage

on the CLI, run `python -m unittest discover` to run the test suite (there is initially one failing test).

It is also possible to run the tests within PyCharm.
