-- Sample database initialization script
-- Create users_table

CREATE TABLE users_table (
    user_name VARCHAR(15) PRIMARY KEY,
    password VARCHAR(255) NOT NULL
);

-- Insert sample data
INSERT INTO users_table (user_name, password) VALUES ('testuser', 'TestPass123!');