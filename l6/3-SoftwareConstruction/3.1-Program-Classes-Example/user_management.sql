cat > 3.1-Program-Classes-Example/user_management.sql << 'EOF'
-- =============================================
-- Laboratory Work #6
-- Конструювання програмних класів
-- Автор: Чорномор Олександр
-- Дата: 13.05.2026
-- =============================================

CREATE TABLE IF NOT EXISTS users_table (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    email VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE OR REPLACE FUNCTION register_user(
    p_username VARCHAR,
    p_password VARCHAR,
    p_email VARCHAR DEFAULT NULL
) RETURNS TEXT AS $$
BEGIN
    IF EXISTS (SELECT 1 FROM users_table WHERE username = p_username) THEN
        RETURN 'Користувач вже існує';
    END IF;

    INSERT INTO users_table (username, password_hash, email)
    VALUES (p_username, p_password, p_email);
    
    RETURN 'Користувач успішно зареєстрований';
END;
$$ LANGUAGE plpgsql;

COMMENT ON FUNCTION register_user(VARCHAR, VARCHAR, VARCHAR) 
IS 'Метод реєстрації нового користувача. Використовується у тестових сценаріях.';
EOF
