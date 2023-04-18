# Transaction store

> This is a simple Rails API that acts like a part of microservice for storing transactions

## Introduction

HOST: [http://tranzact.fly.dev/tranzact/api/v1](http://tranzact.fly.dev/tranzact/api/v1).

## Models created

- User
- Transaction

## Built With

- Ruby 2.7.1
- Rails 6.0.3.2

### Setup

1. clone repo

```
git@github.com:hillarioh/store_transactions.git
```

2. Install gems

```
bundle install
```

3. Setup database and run seed

```
   bin/rails db:setup
   bin/rails db:migrate
   bin/rails db:seed
```

### Steps

1. Authenticate

```
curl --location --request POST 'http://tranzact.fly.dev/tranzact/api/v1/authenticate' \
--header 'Content-Type: application/json' \
--data-raw '{
    "username": "Erika",
    "password": "1234567"
}'
```

2. Get list of Transaction

```
curl --location --request GET 'http://tranzact.fly.dev/tranzact/api/v1/transactions' \
--header 'Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo0LCJleHAiOjE2NDgzODE1MTJ9.PvPjxqyyvYYD69uwsC43eYpiTXLZT4q3FBTnKs6tz7Y'
```

3. Get a Transaction

```
curl --location --request GET 'http://tranzact.fly.dev/tranzact/api/v1/transactions/1' \
--header 'Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo0LCJleHAiOjE2NDgzODE1MTJ9.PvPjxqyyvYYD69uwsC43eYpiTXLZT4q3FBTnKs6tz7Y'
```

4. Post a transaction

```
curl --location --request POST 'http://tranzact.fly.dev/tranzact/api/v1/transactions' \
--header 'Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo0LCJleHAiOjE2NDgzODE1MTJ9.PvPjxqyyvYYD69uwsC43eYpiTXLZT4q3FBTnKs6tz7Y' \
--header 'Content-Type: application/json' \
--data-raw '{
    "customer_id": 1,
    "input_amount": 1000.12,
    "output_amount": 250.23,
    "input_currency": "EUR",
    "output_currency": "USD",
    "date_of_transaction": "2022-03-26 11:36:47.947218000 +0000"
}'
```

### Run tests

```
    rpsec --format documentation
```

## Author

- Github: [@hillarioh](https://github.com/hillarioh)
- Twitter: [@hillaokri](https://twitter.com/hillaokri)
- Linkedin: [@HillaryOkerio](https://www.linkedin.com/in/hillaryokerio/)
