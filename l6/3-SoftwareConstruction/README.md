# Лабораторна робота #6  
**Конструювання програмного забезпечення**

Чорномор Олександр  [ЗАІ 231]

---

## 2.1 Налаштування GitHub-репозиторію

- Створено Issue з назвою **«Laboratory Work #6»** (Label: documentation).
- Issue переведено в статус **In Progress**.
- Створено окрему гілку.

---

## 2.2 Конструювання програмних класів

### 2.2.1 Реалізація класу та методу

У файлі `3.1-Program-Classes-Example/user_management.sql` реалізована таблиця `users_table` та функція `register_user()`.

**Опис методу `register_user()`:**

- **Вхідні параметри:** `p_username`, `p_password`, `p_email`
- **Повертає:** текстовий результат операції
- **Логіка:** перевіряє існування користувача, у разі відсутності — створює нового.

**Код функції** знаходиться у файлі `user_management.sql`.

---

## 2.3 Docker-контейнерна віртуалізація

### 2.3.2 Docker для СКБД PostgreSQL

**Назва контейнера:** `chornomor-postgres`

**Файл:** `3.2-Docker-containers/DBMSDocker.md`

Команда запуску:

```bash
docker run --name chornomor-postgres \
  -e POSTGRES_PASSWORD=password \
  -e POSTGRES_DB=lab6db \
  -p 5455:5432 \
  -v ./db_scripts.sql:/docker-entrypoint-initdb.d/init.sql \
  -d postgres:15
