# go-simple-bank
A simple banking service built in Golang --- part of a "Backend Master Class" style project.

*Re-written and updated to incorporate new features*

## Table of contents

- [About](#about)
- [Features](#features)
- [Getting Started](#getting-started)
    - [Prerequisites](#prerequisites)
    - [Installation](#installation)
    - [Running the service](#running-the-service)
- [API Enpoints](#api-endpoints)


## About

go-simple-bank is a sample banking backend service: account creation, transfers, transaction history, etc. This version is a retake of the Backend Master Class course, updated with latest Go versions, testing, and native build support.

## Features

- Create and manage bank accounts
- Transfer funds between accounts with currency safety
- View transaction history
- RESTful API endpoints
- PostgreSQL backing store (SQL schema)
- Makefile automation
- Automated tests

## Getting started

### Prerequisites

- Go 1.21.1
- PostgreSQL
- make
- Git

### Installation

``` bash
git clone https://github.com/jczmr/go-simple-bank.git
cd go-simple-bank
```

### Running the service

``` bash
make run
# or
go run main.go
```

## API Endpoints

  Method   |  Path                        |  Description
  -------- | ---------------------------- | ---------------------
  POST     | /accounts                    | Create account
  GET      | /accounts/:id                | Get account details
  GET      | /accounts                    | Get list of accounts
