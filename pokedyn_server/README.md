# pokedyn_server

This is the pokedyn server developed using serverpod.

To run your server, you first need to start Postgres and Redis. It's easiest to do with Docker.

    docker compose up --build --detach

Then you can start the Serverpod server.

    dart bin/main.dart --apply-migrations

When you are finished, you can shut down Serverpod with `Ctrl-C`, then stop Postgres and Redis.

    docker compose stop
