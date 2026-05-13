# Налаштування запуску СКБД PostgreSQL через Docker-контейнер

## Крок 1. Завантажити Docker-образ для СКБД PostgreSQL
```bash
docker pull postgres
```

## Крок 2. Запустити Docker-образ postgres зі створенням Docker-контейнеру
```bash
docker run \
--name chornomor-postgres \
-p 5455:5432 \
-e POSTGRES_PASSWORD=1234 \
-w /scripts \
-v ${PWD}:/scripts \
-d \
--rm \
postgres
```

## Крок 3. У Docker-контейнері виконати команду bash
```bash
docker exec -it chornomor-postgres bash
```

## Крок 4. Створити базу даних
```bash
createdb chornomordb -U postgres
```

## Крок 5. Завантажити скрипт ініціалізації
```bash
psql -U postgres -d chornomordb < /scripts/db_scripts.sql
```

## Крок 6. Вийти з оболонки
```bash
exit
```

## Крок 7. Зупинити контейнер
```bash
docker stop chornomor-postgres
```
