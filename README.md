# README

# Pre
Ruby ( Rbenv I used)
PostgreSQL
`brew install libsodium`
`brew install postgis`

# Setup
1. Clone repo
2. `bundle install`
3. `bundle exec rake db:create`
4. `bundle exec rake db:migrate`
5. `bundle exec rake db:seed`
6. `rails s`


# Endpoints
- [x]  User Authentication:
○ Enable user registration and login using email credentials.
`POST /auth/login`
```
{
    "email": "w@g.com",
    "password": "123456"
}
```

`POST /users`
```
{
    "user_name" : "william",
    "email": "w@g.com",
    "password": "123456"
}
```
○ Preload default accounts through a seed mechanism.
Run `bundle exec rake db:seed`

> For every endpoints bellow . All needs include token get from login

- [x]  Brand Management
Facilitate the addition of brands with the ability to define up to 5 customizable
data fields for each brand.
`POST /brands`
```
{
    "brand_id": 1,
    "name": "product 1",
    "price": 1.2,
    "currency": 1.2,
    "weight": 67,
    "sku": "SKU-1231",
    "description": "Hello",
    "manufacturing_date": "12/12/2001",
    "status": "active"
}
```
`GET /brands`

`POST /brands`
```
{
    "brand_id": 1,
    "name": "product 1",
    "price": 1.2,
    "currency": 1.2,
    "weight": 67,
    "sku": "SKU-1231",
    "description": "Hello",
    "manufacturing_date": "12/12/2001",
    "status": "active"
}
```
`PUT /brands/2`
```
{
    "name": "product 2"
}
```

`DELETE /brands/2`

- [x]  Product Management:
Provide the capability to add, update, and delete products associated with
brands.
Support up to 5 customizable data fields for each product.
Mandate inclusion of a price value for products, accommodating various
currencies.
`GET /products`

`POST /products`
```
{
    "brand_id": 1,
    "name": "product 1",
    "price": 1.2,
    "currency": 1.2,
    "weight": 67,
    "sku": "SKU-1231",
    "description": "Hello",
    "manufacturing_date": "12/12/2001",
    "status": "active"
}
```
`PUT /products/2`
```
{
    "name": "product 2"
}
```

`DELETE /products/2`



- [x]  State Management:
Allow the manipulation of brand and product states, encompassing "active" and
"inactive" options.
`PUT /brands/1/status`

`PUT /products/1/status`


- [x]  Client Management:
Enable the addition of clients with the option to define authentication credentials
and payout rates.
`PUT /users/:id`
```
{
    "auth_credentials": "oaut22h2",
    "password": "123456"
}
```


- [x]  Product Access Control:
Empower clients to specify accessible products for their accounts.
`GET /products/:product_id`


- [x]  Card Issuance and Management:
Provide clients with the ability to request new cards for products.
Upon issuance, furnish clients with a unique activation number and an optional
purchase details pin.
`POST /cards`
```
{
    "name": "Card 1",
    "balance": 1.2,
    "product_id": 1
}
```

`PUT /cards/3/activate`
```
{
    "activation_code": "$2a$12$VDBRmkKRlblabGLPo90iQOVwqcpNJpsTWBFF1zYUKQK6x2hFck4gu"
}
```

- [x]  Card Cancellation:
Allow clients to cancel previously issued cards as needed.
`PUT /cards/:card_id/cancel`


- [x]  Reporting:
Support the generation of comprehensive reports encompassing spending and
card cancellation activities.
`GET /card_attempts`

# Further improve

Use `dry-rb` to validate parameters

Write models and controller test for others files

Better handling error

## Postman
[Postman Collection](NineProject.postman_collection.json)

