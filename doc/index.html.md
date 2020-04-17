---
title: API Reference

language_tabs: # must be one of https://git.io/vQNgJ
  - shell: cURL

toc_footers:
  - <a href='https://github.com/slatedocs/slate'>Documentation Powered by Slate</a>

includes:

search: true
---

# Introduction
***Last Update:*** April 17th, 2020

Welcome to the Rails Test Task API!

This example API documentation page was created with [Slate](https://github.com/slatedocs/slate).

## API Endpoints

Method | URL | Description
--------- | ------- | -----------
POST | /api/v1/tt/0413 | Create a new submission
POST | /api/v1/authenticate | Creates a new JWT
GET | /api/v1/tt/0413 | Get a list of submissions

## Getting Started
Requests should use domain which backend server has been installed. This document uses paths relative to this host.

A setup at a high level will go as follows:

1. Create a new submission.

2. Create a JWT with user.

3. View the list of submissions.

# Authentication

## Creating a new JWT

### Request

`GET /api/v1/authenticate`

> Use this code:

```shell
curl /api/v1/authenticate 
  -H "Content-Type: application/json" 
  -X POST -d '{"login":"guest","password":"qwerty"}'
```

### Successful Response

`{"auth_token":"eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1ODcyMDg4NDd9.mn-hTAd--TISOr-B_wZXvjVHP_D4SGKMAw-mTu6LJDk"}`

### Unsuccessful Response

`{"error":{"user_authentication":"invalid credentials"}}`

> 200 - OK:

```json
{
    "auth_token": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1ODcyMDg4NDd9.mn-hTAd--TISOr-B_wZXvjVHP_D4SGKMAw-mTu6LJDk"
}
```

> 401 - Unauthorized:

```json
{
    "error": {
        "user_authentication": "invalid credentials"
    }
}
```

# Submissions

## Creating a new submission

### Request

`POST /api/v1/tt/0413`

### Request Parameters

Parameter | Type | Description 
--------- | ------- | -----------
first_name | String | Required. First name.
last_name | String | Required. Last name.
email | String | Required. Email.
phone | String | Required. Phone.
company | String | Required. Company.
job | String | Required. Job.
country | String | Required. Country.

> Use this code:

```shell
curl /api/v1/tt/0413 
  -H "Content-Type: application/json" 
  -X POST -d '{"first_name":"Alvaro", "last_name":"Schaefer", "email":"alvaro_schaefer@douglas.co.uk", "phone":"530-619-2127", "company":"Gottlieb and Sons", "job":"Customer Branding Strategist", "country":"Croatia"}'
```

### Successful Response

Response body is empty.

> 201 - Created

### Unsuccessful Response

`{"errors":{"email":["can't be blank","is not an email"]}}`

> 400 - Bad request

```json
{
    "errors": {
        "email": [
            "can't be blank",
            "is not an email"
        ]
    }
}
```

## Get all submissions

### Request

`GET /api/v1/tt/0413`

This endpoint retrieves all submissions.

> Use this code:

```shell
curl /api/v1/tt/0413 -H "Authorization: jwt"
```

> Make sure to replace `jwt` with your user JWT.

<aside class="notice">
You must replace <code>jwt</code> with your personal JWT.
</aside>

### Response

> 200 - OK:

```json
{
    "data": [
        {
            "id": 1,
            "first_name": "Monnie",
            "last_name": "Kihn",
            "email": "mireille@bernhard.name",
            "phone": "383-712-4688",
            "company": "McClure, Lueilwitz and Lang",
            "job": "Customer Branding Strategist",
            "country": "Cape Verde",
            "created_at": "2020-04-17T09:48:53.390Z"
        },
        {
            "id": 2,
            "first_name": "Alvaro",
            "last_name": "Schaefer",
            "email": "alvaro_schaefer@douglas.co.uk",
            "phone": "530-619-2127",
            "company": "Gottlieb and Sons",
            "job": "Customer Branding Strategist",
            "country": "Croatia",
            "created_at": "2020-04-17T09:48:53.620Z"
        }
    ]
}
```

> 401 - Unauthorized:

```json
{
    "error": "Not Authorized"
}
```
