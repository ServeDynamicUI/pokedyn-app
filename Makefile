serverpod_run: serverpod_generate
	cd pokedyn_server && dart bin/main.dart --apply-migrations

serverpod_docker:
	cd pokedyn_server && docker-compose up --build --detach

serverpod_generate:
	cd pokedyn_server && serverpod generate

serverpod_migrate:
	cd pokedyn_server && serverpod create-migration

serverpod_docker_down:
	cd pokedyn_server && docker-compose down -v
