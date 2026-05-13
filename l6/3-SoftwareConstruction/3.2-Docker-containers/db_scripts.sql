CREATE TABLE users_table (
    user_name VARCHAR(15) PRIMARY KEY,
    password VARCHAR(255) NOT NULL
);


INSERT INTO users_table (user_name, password) VALUES ('Чорномор Олександр', 'TestPass123!');

-- Ініціалізація бази даних

CREATE TABLE IF NOT EXISTS users_table (
    user_id SERIAL PRIMARY KEY,
    user_name VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Тестові дані
INSERT INTO users_table (user_name, password) 
VALUES ('Чорномор Олександр', 'TestPass123!');

COMMENT ON TABLE users_table IS 'Таблиця користувачів для демонстрації конструювання класів';
