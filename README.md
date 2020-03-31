## Introduction
This is a public Api, built to serve as a backend for the real estate project. A project that student have to do as the last project in the main Microverse curriculum, based on the concept of software as a service.

![Home view](./app1.png)

## App description
The app allows authenticated users to access information about properties they seek to sell online and also allow users to make contact with estate agent to purchase a property.
This is the backend component which is expected to run on a react front end api.
The backend has different routes needed by the front end to accepts specific resources. The authentication is managed with Jwt.

## Base url

#### https://myestateapi.herokuapp.com/

## Features
api calls are currently accessed via the following ressources:
  ```resources :sellers, only: %i[index show]```
  ```resources :houses```
  ```resources :users, only: %i[create]```
  ```resources :sessions, only: %i[create]```
  ```get '/login_user', to: 'currents#login_user'```
  ```get '/is_user_login', to: 'currents#user_login?'```
  ```get '/user_id', to: 'currents#user_id'```
  ```get 'category/:category', to: 'currents#categorize'```
  ```get '/user_homes', to: 'currents#user_homes'```
  ```get '/uploader_homes/:id', to: 'currents#user_homes'```
  ```resources :alerts, only: %i[create]```

each return a JSON response
More resources can be added as the front evolves
## Usage

> Clone the repository to your local machine

```sh
$ git clone https://github.com/forison/Real-estate-api.git
```
> cd into the directory

```sh
$ cd Real-estae-api
```

```sh
$ rails s
```
## Testing

> Clone the repository to your local machine

```sh
$ git clone https://github.com/forison/Real-estate-api.git
```
> cd into the directory

```sh
$ cd Real-estate-api
```

```sh
$ rspec
```
## Technologies

- Ruby on rails
- RSpec

## Author

👤 **Addo Forison**

## Contact

[LinkedIn](https://www.linkedin.com/in/forison/) | [Twitter](https://twitter.com/addo_forison)
