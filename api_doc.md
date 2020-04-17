# API Specification

**Last Update:** April 17th, 2020

## Authentication

### Creating a new JWT

`POST` `api/v1/authenticate`

**Request body:**

```json
{
    "login": "guest",
    "password": "qwerty"
}
```

**Successful Response:**

HTTP Status - `200`

Body:
```json
{
    "auth_token": "jwt token here"
}
```

**Unsuccessful Response:**

HTTP Status - `401`

Body:
```json
{
    "error": {
        "user_authentication": "invalid credentials"
    }
}
```  
  

## Form Submissions

### Create

`POST` `api/v1/tt/0413`

**Request body:**
```json
{
    "first_name": "Alvaro",
    "last_name": "Schaefer",
    "email": "alvaro_schaefer@douglas.co.uk",
    "phone": "530-619-2127",
    "company": "Gottlieb and Sons",
    "job": "Customer Branding Strategist",
    "country": "Croatia"
}
```

**Response status codes:**
  - `201` - Success. Created. Response body is empty
  - `400` - Failure. Bad request. Response body is object with errors

### List

`GET` `api/v1/tt/0413`

**Request Headers**:
  - `Authorization` - `JWT 'token here'`

**Successful Response:**

HTTP Status - `200`

Body:
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

**Unsuccessful Response:**

HTTP Status - `401`

Body:
```json
{
    "error": "Not Authorized"
}
``` 
