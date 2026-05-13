// =============================================
// Laboratory Work #6
// ProgramClientCode.java
// Автор: Чорномор Олександр
// =============================================

import java.sql.*;

public class ProgramClientCode {
    public static void main(String[] args) {
        String url = "jdbc:postgresql://localhost:5455/lab6db";
        String user = "postgres";
        String password = "password";

        System.out.println("=== Програма-клієнт для Docker PostgreSQL ===");

        try (Connection conn = DriverManager.getConnection(url, user, password)) {
            System.out.println("Успішне підключення до бази даних!");

            // Тестування методу register_user
            CallableStatement stmt = conn.prepareCall("{call register_user(?, ?, ?)}");
            stmt.setString(1, "chorno_test");
            stmt.setString(2, "Pass123!");
            stmt.setString(3, "chorno@example.com");

            String result = stmt.getString(1);  // або використовуйте executeQuery залежно від реалізації
            System.out.println("Результат реєстрації: " + result);

        } catch (SQLException e) {
            System.err.println("Помилка підключення: " + e.getMessage());
        }
    }
}
