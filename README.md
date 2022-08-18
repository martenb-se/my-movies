# MyMovies Project
This is a simple project created for fun, it allows you to keep track of your favourite movies or tv-series.
It was created using [PostgresSQL](https://www.postgresql.org/), [Spring Boot](https://spring.io/projects/spring-boot) and [VueJS](https://vuejs.org/).

This project is a combination of 3 other repositories:
- [Database for MyMovies Project](https://github.com/martenb-se/my-movies-database)
- [API for MyMovies Project](https://github.com/martenb-se/my-movies-api)
- [Client for MyMovies Project](https://github.com/martenb-se/my-movies-client)

## Demo
### Search View
![Search view](https://github.com/martenb-se/my-movies/blob/main/docs/search.png)

### Home View
![Home view](https://github.com/martenb-se/my-movies/blob/main/docs/home.png)

## Requirements
In order to simply try this project you only need the following:
### Software
* **Docker Compose**, [Installation instructions](https://docs.docker.com/compose/install/).

### Other
* **OMDB API Key**, [Request an API key here (the free alternative is good enough)](http://www.omdbapi.com/apikey.aspx)

## Install
### Clone
Clone the repository, enter it and update the necessary submodules
```shell
git clone git@github.com:martenb-se/my-movies.git
cd my-movies
git submodule init
git submodule update
```

### Preparation
In order to run or test the **MyMovies Project**, the following must be performed.

#### Environment Settings
Run the **Start** command listed in the next section and a *.env* (dotenv) file will be created for you. 
Otherwise, create a *.env* (dotenv) file in the root directory and fill out the following variables:
```dotenv
# OMDB API Key
VITE_APP_API_KEY_OMDB=EDIT_ME
```

Environment variable info
* `VITE_APP_API_KEY_OMDB` is the API key you received from the [OMDB API](http://www.omdbapi.com/).
* **(Optional)** `POSTGRES_USER` is the username for the database admin.

  ^ If not defined and **Start** command is executed, then a value will be *generated*.
* **(Optional)** `POSTGRES_PASSWORD` is the password for the database admin.

  ^ If not defined and **Start** command is executed, then a value will be *generated*.
* **(Optional)** `APP_DB_USER` is the username for the user in charge of the MyMovies application.

  ^ If not defined and **Start** command is executed, then a value will be *generated*.
* **(Optional)** `APP_DB_PASS` is the password for the user in charge of the MyMovies application.

  ^ If not defined and **Start** command is executed, then a value will be *generated*.
* **(Optional)** `APP_DB_NAME` is the database that will be used by the MyMovies application.

  ^ If not defined and **Start** command is executed, then a value will be *generated*.
* **(Optional)** `APP_PORT` is the port the MyMovies application will be accessible at. 

    ^ Standard is `3000`.
* **(Optional)** `LOGGING_LEVEL` is the current logging level for debugging the API server (alternatives: `TRACE`, `DEBUG`, `INFO`, `WARN`, `ERROR`, `FATAL` or `OFF`)

  ^ Standard is `OFF`.

## Start
In order to verify and load the (above) environment, run the application, and to verify that health checks are good, run the Docker Compose Script
```shell
./run.sh
```

Once you are presented with:
```text
Docker container my-movies-db is now ready!
Docker container my-movies-api is now ready!
Docker container my-movies-client is now ready!
```
the MyMovies application will be accessible at:

http://localhost:3000

Note: *If you previously set the `APP_PORT` environment variable, it will be available at http://localhost:`APP_PORT`*

## Stop and Uninstall
In order to stop the MyMovies application and clean everything up, run:
```shell
./clean.sh
```
