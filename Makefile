docker-up:
	docker-compose up -d --build --remove-orphans && \
	docker-compose exec php-fpm composer install

docker-down:
	docker-compose down

php:
	docker-compose exec php-fpm /bin/bash

db:
	docker-compose exec db-pgsql /bin/bash

migrations-list:
	docker-compose exec php-fpm php ./vendor/bin/doctrine-migrations list

migrations-status:
	docker-compose exec php-fpm php ./vendor/bin/doctrine-migrations status --show-versions --configuration="./config/migrations.php" --db-configuration="./config/migrations-db.php"

migrations-generate:
	docker-compose exec php-fpm php ./vendor/bin/doctrine-migrations generate --configuration="./config/migrations.php" --db-configuration="./config/migrations-db.php"

migrations-dry-run:
	docker-compose exec php-fpm php ./vendor/bin/doctrine-migrations migrate --dry-run --configuration="./config/migrations.php" --db-configuration="./config/migrations-db.php"

migrations-write-sql:
	docker-compose exec php-fpm php ./vendor/bin/doctrine-migrations migrate --write-sql="./migrations/sql" --configuration="./config/migrations.php" --db-configuration="./config/migrations-db.php"

migrations-migrate:
	docker-compose exec php-fpm php ./vendor/bin/doctrine-migrations migrate --configuration="./config/migrations.php" --db-configuration="./config/migrations-db.php"
