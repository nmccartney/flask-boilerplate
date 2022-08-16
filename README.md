# Flask Boilerplate

## Dependencies

- [Task](https://taskfile.dev/installation/)
- [Docker](https://www.docker.com/)

## Quick Start

> Start the app in dev mode

```bash
$ task build-dev
$ task run-dev
```

> OR - Start the app in dev mode while watching files

```bash
$ task build-watch
$ task watch-dev
```

The API server will start using the PORT `5000`.

## Table of Contents

1. [Getting Started](#getting-started)
2. [Project Structure](#project-structure)
3. [Modules](#modules)
4. [Testing](#testing)

<br />

## How to use the code (Work in progress)

**Step #1** - Install dependencies in virtualenv

```bash
$ pip install -r requirements.txt
```

<br />

**Step #2** - setup `flask` command for our app

```bash
$ export FLASK_APP=run.py
$ export FLASK_ENV=development
```

> Or for Windows-based systems

```powershell
$ (Windows CMD) set FLASK_APP=run.py
$ (Windows CMD) set FLASK_ENV=development
$
$ (Powershell) $env:FLASK_APP = ".\run.py"
$ (Powershell) $env:FLASK_ENV = "development"
```

<br />

**Step #3** - start test APIs server at `localhost:5000`

```bash
$ flask run
```

<br />

## API

> **Register** - `api/users/register` (**POST** request)

```
POST api/users/register
Content-Type: application/json

{
    "username":"test",
    "password":"p@$$w0rd",
    "email":"test@domain.io"
}
```

<br />

> **Login** - `api/users/login` (**POST** request)

```
POST /api/users/login
Content-Type: application/json

{
    "password":"p@$$w0rd",
    "email":"test@domain.io"
}
```

<br />

> **Logout** - `api/users/logout` (**POST** request)

```
POST api/users/logout
Content-Type: application/json
authorization: JWT_TOKEN (returned by Login request)

{
    "token":"JWT_TOKEN"
}
```

<br />

## Testing

Run tests using `pytest tests.py`

<br />
