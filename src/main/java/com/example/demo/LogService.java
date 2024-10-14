package com.example.demo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class LogService {
    public static String getLatestLog() {
        String url = "jdbc:mysql://localhost:3306/world";
        String dbUsername = "root";
        String dbPassword = "Wyyddl520";
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection(url, dbUsername, dbPassword);
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("SELECT * FROM log ORDER BY id DESC LIMIT 1");
            if (resultSet.next()) {
                return resultSet.getString("content");
            }
            resultSet.close();
            statement.close();
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "无日志信息";
    }
}