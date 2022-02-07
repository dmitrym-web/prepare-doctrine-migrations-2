### Команды для работы с сервисом

Запустить контейнеры:

`make docker-up`

Остановить контейнеры:

`make docker-down`

Зайти в контейнер с php:

`make php`

Зайти в контейнер с psql:

`make db`

Сгенерирывать пустую миграцию:

`make migrations-generate`

Имитация выполнения миграции:

`make migrations-dry-run`

Сгенерирповать sql-код на основе миграции

`make migrations-write-sql`

Выполнить миграцию

`make migrations-migrate`
