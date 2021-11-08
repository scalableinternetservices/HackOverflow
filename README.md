# README

### First Time Installation Steps

Build the docker container after cloning/downloading the repo

```sh
docker-compose build web
```

Also we might be constantly adding new gems. So, it will be good if you
ran the above command each time you pull.

To ensure dependencies are up-to-date periodically run the following two
commands:

```sh
docker-compose run web bundle install
docker-compose run web yarn install
```

The above two sections will ensure that the container is up-to-date.

To create the development and test databases first start up the database container:

```sh
docker-compose up --detach db
```

Then verify that the container is running:

```sh
docker-compose ps
```

The output should look something like this:

```txt
      Name                    Command              State    Ports
-------------------------------------------------------------------
hackoverflow_db_1   docker-entrypoint.sh postgres   Up      5432/tcp
```

Run the following to create the database:

```sh
docker-compose run web rails db:create
```

Start up the containers:

```sh
docker-compose up
```

Then verify that the containers are running:

```sh
docker-compose ps
```

The app should be running at `http://localhost:3000`

Now, the schemas for Databases are constantly changing. So, run this command
to get the latest ones.

```sh
docker-compose run web rails db:migrate
```

### Commands to run after new pull

Run these commands to ensure you are up-to-date with our dev environments

```sh
docker-compose build web
docker-compose run web bundle install
docker-compose run web yarn install
docker-compose run web rails db:migrate
```

Then start the container and check the website at `http://localhost:3000`
