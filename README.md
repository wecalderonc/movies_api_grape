## MOVIES API WITH GRAPE

A basic API created with GRAPE/RACK/SEQUEL for Cinema Booking Systems.

Services built with DRY-TRANSACTION gem.

#### `Heroku Link to testing in production`

https://movies-grape-will.herokuapp.com

#### `Setup`

```
git clone https://github.com/wecalderonc/movies_api_grape.git
cd movies_api_grape
./script/setup
```

#### `Run`

```
./script/server *port (default: 9292)
```
and go to: [http://localhost:port/doc](http://localhost:9292/doc)
to access the OAPI documentation.

#### `ENDPOINTS`

url local: localhost:9292
url production: https://movies-grape-will.herokuapp.com

#### Movies already created in DB

[
    {
        "id": 1,
        "name": "killbill5",
        "description": "description kill bill",
        "url": "killbillcom",
        "first_date": "2020-01-01",
        "last_date": "2020-01-29"
    },
    {
        "id": 2,
        "name": "Matrix",
        "description": "description Matrix",
        "url": "matrixcom",
        "first_date": "2020-01-15",
        "last_date": "2020-01-18"
    }
]

##### Create Movie:

```
method: post
url: /v1/movies
params: name, description, url, first_date, last_date
```

Example: http://localhost:9292/v1/movies?name=killbill&description=description kill bill&url=killbillcom&first_date=1/1/2020&last_date=30/3/2020

##### List Movies in a specific day of the week

```
method: get
url: /v1/movies
params: week_day (the name of the day)
```

Example: https://movies-grape-will.herokuapp.com/v1/movies?week_day=tuesday

##### Create Reservation

```
method: post
url: /v1/reservations
params: movie_name, name_client, date
```

Example: localhost:9292/v1/reservations?movie_name=killbill&name_client=Carolina&date=3/2/2020

Note: After 10 reservations in the same movie and date, the api will response with FULL message for the event.

##### List Reservations

```
method: get
url: /v1/reservations
params: first_date, last_date
```

Example: localhost:9292/v1/reservations?first_date=1/3/2020&last_date=4/4/2020
