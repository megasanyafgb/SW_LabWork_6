-- Unit Testing for add_user function
-- Assuming the package is created

-- Test cases as per lab

DECLARE
    result NUMBER;
BEGIN
    -- TC1: Valid user
    result := user_management.add_user('user1', 'a12A345678#');
    DBMS_OUTPUT.PUT_LINE('TC1 Result: ' || result);

    -- TC2: User already exists
    result := user_management.add_user('user1', 'a12A345678#');
    DBMS_OUTPUT.PUT_LINE('TC2 Result: ' || result);

    -- TC3: Invalid user name (starts with number)
    result := user_management.add_user('1user1', '');
    DBMS_OUTPUT.PUT_LINE('TC3 Result: ' || result);

    -- TC4: Invalid user name (too long)
    result := user_management.add_user('user111111111111', '');
    DBMS_OUTPUT.PUT_LINE('TC4 Result: ' || result);

    -- TC5: Invalid password (too short)
    result := user_management.add_user('user2', '1234567');
    DBMS_OUTPUT.PUT_LINE('TC5 Result: ' || result);

    -- TC6: Invalid password (no digit)
    result := user_management.add_user('user3', 'abcdefgh');
    DBMS_OUTPUT.PUT_LINE('TC6 Result: ' || result);

    -- TC7: Invalid password (no upper/lower)
    result := user_management.add_user('user4', '12345678');
    DBMS_OUTPUT.PUT_LINE('TC7 Result: ' || result);

    -- TC8: Invalid password (no special char)
    result := user_management.add_user('user5', 'Abcdefg1');
    DBMS_OUTPUT.PUT_LINE('TC8 Result: ' || result);
END;
/