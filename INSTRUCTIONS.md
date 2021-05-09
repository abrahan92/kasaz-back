# Instructions for KASAZ Code Challenge

## Abrahan Mendoza

The purpose of this document is to describe how to run the Ruby script approach based in the requirements located in the README.md file.

### Instructions 📄

#### Requirements ⚙️

1. ```Unix based OS```

2. ```ruby >= 2.6.1```

3. ```Bundler version 2.2.16```

#### Steps 🌀

1. Run ```git clone https://github.com/abrahan92/kasaz-back.git``` to get the project locally.

2. Run ```cd kasaz-back``` to go on the project root.

3. Run ```git fetch origin develop-sqlite && git checkout develop-sqlite``` to go on the branch requested.

4. Add the postman collection file located in app/collections/KASAZ.postman_collection.json to your postman app and get all endpoints.

5. In the `app/images` folder you have sample images to import using [POST] endpoint from POSTMAN

6. Check your ip on your terminal with `ifconfig` and add http url to the `.env` file on HOST_URL.

For my case the example is `HOST_URL=http://192.168.1.143:3030`

#### Run with DOCKER 🐳

1. Run ```docker build -t kasaz-back .``` to create the image to run the project on container.

2. Run ```docker run -p 3030:3030 kasaz-back``` to go on the project root.

#### Run Rspec Tests manually 🔥

  * Run ```bin/rails db:migrate RAILS_ENV=test``` -> To create database for testing purporses

  * Run ```bundle exec rspec``` -> For this test we have 7 example scenarios

### Description 📋

This project tries to simulate a kasaz real state app with rooms.
I tried to keep in mind all these things to do a real case for this simple example, but more things can be improved.

The project structure has the follow topics:

* Used classes `[Property]` are in folder `app/models`.
* `spec/models/property` with some unit tests for all classes.
* `README.md` has the test rules.
* `INSTRUCTIONS.md` has the steps to run the project.

### Notes 🔖

I created the branch `develop-sqlite` to run the project with sqlite3, in this way this way you will not have a problem with the mysql socket, since at the beginning of my development in the develop branch I used mysql2. But doing some tests on other computers had to make some configurations for the mysql socket and for time I preferred to take an alternative.

### Improvements ✈️

* Add hooks to infinite scroll.
* Add filters on desktop version.
* Add authentication with devise jwt.
* Create a room section.

### Gems used 💎

* `bundler` To install the exact gems and versions that are needed.
* `fast_jsonapi` To serialize json data objects.
* `rspec` To build the unit tests.
* `rubocop` To analyze and format code with best practices.
* `rubocop-rspec` To analyze and format specs files.
* `kaminari` To paginate the object.
* `dotenv-rails` To allow rails access to env variables.
