-- Program class for user management
-- Based on UML diagram from previous lab
-- This is an example implementation

CREATE OR REPLACE PACKAGE user_management AS
    FUNCTION add_user(
        p_user_name IN VARCHAR2,
        p_password IN VARCHAR2
    ) RETURN NUMBER;
END user_management;
/

CREATE OR REPLACE PACKAGE BODY user_management AS
    FUNCTION add_user(
        p_user_name IN VARCHAR2,
        p_password IN VARCHAR2
    ) RETURN NUMBER IS
        v_count NUMBER;
        v_user_exists EXCEPTION;
        v_invalid_name EXCEPTION;
        v_invalid_password EXCEPTION;
    BEGIN
        -- Check if user already exists
        SELECT COUNT(*) INTO v_count
        FROM users_table
        WHERE user_name = p_user_name;

        IF v_count > 0 THEN
            RAISE v_user_exists;
        END IF;

        -- Validate user_name
        IF NOT REGEXP_LIKE(p_user_name, '^[a-zA-Z][a-zA-Z0-9]*$') OR LENGTH(p_user_name) > 15 THEN
            RAISE v_invalid_name;
        END IF;

        -- Validate password
        IF NOT REGEXP_LIKE(p_password, '^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&*]).{8,}$') THEN
            RAISE v_invalid_password;
        END IF;

        -- Insert new user
        INSERT INTO users_table (user_name, password)
        VALUES (p_user_name, p_password);

        RETURN 1; -- Success

    EXCEPTION
        WHEN v_user_exists THEN
            DBMS_OUTPUT.PUT_LINE('NOTICE: User already exists');
            RETURN -1;
        WHEN v_invalid_name THEN
            DBMS_OUTPUT.PUT_LINE('NOTICE: Incorrect content of user name');
            DBMS_OUTPUT.PUT_LINE('HINT: Read the instructions for creating of user name');
            RETURN -2;
        WHEN v_invalid_password THEN
            DBMS_OUTPUT.PUT_LINE('NOTICE: Incorrect content of password');
            DBMS_OUTPUT.PUT_LINE('HINT: Read the instructions for creating of password');
            RETURN -3;
        WHEN OTHERS THEN
            RETURN -4; -- Other errors
    END add_user;
END user_management;
/