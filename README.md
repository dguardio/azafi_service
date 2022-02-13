# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version: 3.0.1
* Rails Version: 6.1.4
* Ensure you have RabbitMQ running in the background
* This codebase uses Bunny for RabbitMQ integration
* POST /transactions: Creates a new transaction
* GET /transactions: List all transactions in the system
* GET /transactions/<id>: Get a specific transaction by ID

TODO
=====

* Rate limit the list of all transactions endpoint
* Add Unit and Integrations tests to cover the service functionality and the Controllers

Example Payload
===============
    {
    "customer_id": "235435maryland",
    "input_amount": "500.00",
    "input_currency": "USD",
    "output_amount": "100000.00",
    "output_currency": "NGN"
    }

* ...
