# Налаштування запуску СКБД PostgreSQL через Docker-контейнер

## Крок 1. Завантажити Docker-образ для СКБД PostgreSQL
```bash
docker pull postgres
```

## Крок 2. Запустити Docker-образ postgres зі створенням Docker-контейнеру
```bash
docker run --name chornomor-postgres \
  -e POSTGRES_PASSWORD=password \
  -e POSTGRES_DB=lab6db \
  -p 5455:5432 \
  -v ./db_scripts.sql:/docker-entrypoint-initdb.d/init.sql \
  -d postgres:15
```

## Крок 3. У Docker-контейнері виконати команду bash
```bash
docker exec -it chornomor-postgres bash
```

## Крок 4. Створити базу даних
```bash
createdb chornomor -U postgres
```

## Крок 5. Завантажити скрипт ініціалізації
```bash
psql -U postgres -d chornomor < /scripts/db_scripts.sql
```

## Крок 6. Вийти з оболонки
```bash
exit
```

## Крок 7. Зупинити контейнер
```bash
docker stop chornomor-postgres
```
