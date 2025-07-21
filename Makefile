.PHONY: build up down restart logs shell composer test certs

build:
    docker compose build --pull --no-cache

up:
    docker compose up --wait

down:
    docker compose down --remove-orphans

restart:
    docker compose down --remove-orphans
    docker compose up --wait

logs:
    docker compose logs -f

shell:
    docker compose exec app sh

composer:
    docker compose exec app composer $(cmd)

test:
    docker compose exec app bin/phpunit

certs:
    docker compose exec app symfony server:ca:install