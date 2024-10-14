package com.example.demo;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class DBService {
    private String dbDriver = "com.mysql.jdbc.Driver"; // Fixed typo in driver class name
    private String uri = "jdbc:mysql://localhost:3306/world"; // Include database name
    private String userName = "root";
    private String password = "Wyyddl520";

    // Load the driver and establish a connection
    private Connection getConn() throws ClassNotFoundException, SQLException {
        Class.forName(dbDriver);
        return DriverManager.getConnection(uri, userName, password);
    }

    // Execute an update (INSERT, UPDATE, DELETE)
    public Integer executeUpdate(String sqlStr) throws SQLException, ClassNotFoundException {
        Integer result = -100;
        try (Connection conn = this.getConn();
             Statement statement = conn.createStatement()) {
            result = statement.executeUpdate(sqlStr); // Use executeUpdate on the statement
        }
        return result;
    }

    // Execute a SELECT statement
    public List<Map<String, String>> executeSelect(String sqlStr) throws SQLException, ClassNotFoundException {
        List<Map<String, String>> resultList = new ArrayList<>();

        try (Connection conn = this.getConn();
             Statement statement = conn.createStatement();
             ResultSet resultSet = statement.executeQuery(sqlStr)) {

            ResultSetMetaData rmd = resultSet.getMetaData();
            int columnCount = rmd.getColumnCount();

            while (resultSet.next()) { // Iterate through ResultSet, not resultList
                Map<String, String> map = new HashMap<>();
                for (int i = 1; i <= columnCount; i++) { // Fixed index to <=
                    map.put(rmd.getColumnName(i), resultSet.getString(i)); // Use getString on resultSet
                }
                resultList.add(map);
            }
        }
        return resultList;
    }

    public Integer executeListSql(List<String> list) {
        Integer result = 0;
        Connection connection = null;
        Statement statement = null;

        try {
            // 假设你已经获取到数据库连接
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/world", "root", "Wyyddl520");
            statement = connection.createStatement();

            for (String sql : list) {
                result += statement.executeUpdate(sql); // 执行并累加影响的行数
            }
        } catch (SQLException e) {
            e.printStackTrace(); // 处理异常
        } finally {
            try {
                if (statement != null) statement.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return result;
    }


}
