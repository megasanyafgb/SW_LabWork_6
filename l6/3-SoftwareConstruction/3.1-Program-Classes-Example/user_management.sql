-- Пакет для управління користувачами
-- Реалізація на основі UML-діаграми програмних класів з попередньої лабораторної роботи
-- Приклад конструювання програмного модуля для лабораторної роботи №6

CREATE OR REPLACE PACKAGE user_management AS
    -- Функція додавання нового користувача
    FUNCTION add_user(
        p_user_name IN VARCHAR2,   -- ім'я користувача
        p_password IN VARCHAR2     -- пароль користувача
    ) RETURN NUMBER;
END user_management;
/

CREATE OR REPLACE PACKAGE BODY user_management AS

    FUNCTION add_user(
        p_user_name IN VARCHAR2,
        p_password IN VARCHAR2
    ) RETURN NUMBER IS
        
        v_count NUMBER;
        
        -- Власні винятки
        v_user_exists       EXCEPTION;
        v_invalid_name      EXCEPTION;
        v_invalid_password  EXCEPTION;

    BEGIN
        -- Перевірка, чи користувач вже існує
        SELECT COUNT(*) INTO v_count
        FROM users_table
        WHERE user_name = p_user_name;

        IF v_count > 0 THEN
            RAISE v_user_exists;
        END IF;

        -- Валідація імені користувача
        IF NOT REGEXP_LIKE(p_user_name, '^[a-zA-Z][a-zA-Z0-9]*$') 
           OR LENGTH(p_user_name) > 15 THEN
            RAISE v_invalid_name;
        END IF;

        -- Валідація пароля
        IF NOT REGEXP_LIKE(p_password, '^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&*]).{8,}$') THEN
            RAISE v_invalid_password;
        END IF;

        -- Додавання нового користувача
        INSERT INTO users_table (user_name, password)
        VALUES (p_user_name, p_password);

        RETURN 1; -- Успішне виконання

    EXCEPTION
        WHEN v_user_exists THEN
            DBMS_OUTPUT.PUT_LINE('NOTICE: Користувач з таким іменем вже існує');
            RETURN -1;
            
        WHEN v_invalid_name THEN
            DBMS_OUTPUT.PUT_LINE('NOTICE: Некоректний вміст імені користувача');
            DBMS_OUTPUT.PUT_LINE('HINT: Ім\'я має починатися з літери і містити не більше 15 символів');
            RETURN -2;
            
        WHEN v_invalid_password THEN
            DBMS_OUTPUT.PUT_LINE('NOTICE: Некоректний вміст пароля');
            DBMS_OUTPUT.PUT_LINE('HINT: Пароль має містити мінімум 8 символів, цифру, велику та малу літеру та спецсимвол');
            RETURN -3;
            
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('ERROR: Невідома помилка при додаванні користувача');
            RETURN -4;
    END add_user;

END user_management;
/
