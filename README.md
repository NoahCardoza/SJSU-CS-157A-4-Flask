# Hidden Gems

## Setup

### Pre-requisites

1. Install [Python 3.9+](https://www.python.org/downloads/)
2. Install [Poetry](https://python-poetry.org/docs/#installation)

## Dependencies

1. Install dependencies: `poetry install`

## Running

Setup the environment variables by copying the `.env.example` file to `.env` and filling in the values.

### Development

```bash
poetry run flask --app=hiddengems run --reload --debug
```

If you need to enter the virtual environment, run `poetry shell`.

### Production

TODO
