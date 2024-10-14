package com.example.demo;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.ArrayList;
public class MainApp {
    public static void main(String[] args) {
        DBService dbService = new DBService();

        /*try {
            // 插入数据到 student 表的 c1 和 c2 字段
            int insertResult = dbService.executeUpdate("INSERT INTO student (c1, c2) VALUES (42, 82)");
            if (insertResult > 0) {
                System.out.println("插入成功，影响了 " + insertResult + " 行。");
            } else {
                System.out.println("插入失败。");
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }*/
        try {
            // 查询 student 表中的所有数据
            List<Map<String, String>> resultList = dbService.executeSelect("SELECT * FROM users");
            for (Map<String, String> row : resultList) {
                System.out.println("查询结果：" + row);
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}