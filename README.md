### Задача

Необходимо было сделать миграции в проекте, но! Должен генерироваться `sql` файл, чтобы его можно было запускать без привязки к `php`, 
а главное не использовать `ORM`. Для препарирования была взята [Doctrine Migrations](https://www.doctrine-project.org/projects/migrations.html). 
Прочитав документацию, я понял, что задача выполнима. Поставив свежий пакет(версия `3.4.1`), я начал вскрытие.

В документации написанно, что при выполнении миграции нужно использовать ключ `--write-sql`, который позволяет сгенерировать вожделенный `sql` файл и положить его в укромное место. 
Но что-то пошло не так. Помимо того, что была выполнена сама миграция, так еще сам `sql` файл, сгенерировался, не так, как описано в документации.

По идее должно быть так:

```sql
-- Doctrine Migration File Generated on 2022-02-07 10:00:39

-- Version 20220207094911
CREATE TABLE projects(id SERIAL PRIMARY KEY, name VARCHAR(50) NOT NULL, description TEXT);
INSERT INTO doctrine_migration_versions (version, executed_at) VALUES ('20220207094911', CURRENT_TIMESTAMP);
```

А получилось так:

```sql
-- Doctrine Migration File Generated on 2022-02-07 10:00:39

-- Version 20220207094911
CREATE TABLE projects(id SERIAL PRIMARY KEY, name VARCHAR(50) NOT NULL, description TEXT);
```

В поисках ответа, почему так? Я полез на `GitHub` и в `Issues` и нашел описание этого бага(?), который висит уже больше года: [тыц](https://github.com/doctrine/migrations/issues/1082). 
Разработчики не сильно заморачивались и не поправили документацию, хотя в [Upgrade](https://github.com/doctrine/migrations/blob/3.4.x/UPGRADE.md) они написали, что было изменено. 
Хорошо, что есть неплохой `--help` у компонента.

```shell
  help                    Display help for a command
  list                    List commands
 migrations
  migrations:dump-schema  [dump-schema] Dump the schema for your database to a migration.
  migrations:execute      [execute] Execute a single migration version up or down manually.
  migrations:generate     [generate] Generate a blank migration class.
  migrations:latest       [latest] Outputs the latest version number
  migrations:migrate      [migrate] Execute a migration to a specified version or the latest available version.
  migrations:rollup       [rollup] Rollup migrations by deleting all tracked versions and insert the one version that exists.
  migrations:status       [status] View the status of a set of migrations.
  migrations:up-to-date   [up-to-date] Tells you if your schema is up-to-date.
  migrations:version      [version] Manually add and delete migration versions from the version table.
```

Может такая работа ключа `--write-sql` это новая фича?

Пришлось поставить уже неподдерживаемую версию `2.3.5`, она оказалсь еще ого-го. Все взлетело!

### Вишенка на торте
Приятный момент, можно сгенерировать `sql` файл, как для миграции, так и для ее отката. 
Но это возможно с командой `execute` и соответствующими ключами `--up` и `--down`.  

В пакете много ништяков, которые не попадают под поставленные задачи.

Чтобы пощупать, просто клонируйте репозиторий и запустите докер.

### Установка

`git clone git@github.com:nvrsk-yii2/prepare-doctrine-migrations-2.git`

`cd prepare-doctrine-migrations-2`

`make docker-up`

Остальные команды я описал [здесь](/docs/COMMANDS.md).

Я оставил пару миграций в репозитории для примера.

### Продолжение следует...

[Continued](https://github.com/nvrsk-yii2/prepare-doctrine-migrations-3)