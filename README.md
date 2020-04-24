<!-- TOC depthFrom:1 depthTo:6 withLinks:1 updateOnSave:0 orderedList:0 -->

- [adept it to your needs](#adept-it-to-your-needs)
  - [Your awesome API](#your-awesome-api)
  - [Usage](#usage)
  - [Rake Tasks](#rake-tasks)
  - [Docker](#docker)
  - [Contributing](#contributing)
  - [License](#license)

<!-- /TOC -->

# adept it to your needs

## MOVIES API WITH GRAPE

A [Grape](http://github.com/ruby-grape/grape) API mounted on [Rack](https://github.com/rack/rack), starting point for API development with Grape. It also includes [grape-swagger](http://github.com/ruby-grape/grape-swagger) for documentation generating.


## Usage

All following commands can and should be adapted/replaced to your needs.

- [Setup](#setup)
- [Run](#run)

#### `Setup`

```
$ ./script/setup
```

#### `Run`

```
$ ./script/server *port (default: 9292)
```
and go to: [http://localhost:port/doc](http://localhost:9292/doc)
to access the OAPI documentation.


## Rake Tasks

- [List Routes](#list-routes)
- [OpenApi Documentation and Validation](#openapi-documentation-and-validation)

#### List Routes

```
rake routes
```


