<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>日志发布</title>
    <style>
        form {
            width: 400px;
            margin: 0 auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }
        textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            resize: vertical;
        }
        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
        .back-button {
            display: inline-block;
            background-color: #3498db;
            color: white;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 5px;
            margin-top: 10px;
        }
        .back-button:hover {
            background-color: #2980b9;
        }
    </style>
</head>
<body>
<%
    // 假设已经有登录验证并且获取了当前登录用户的信息存储在 session 中
    String loggedInUser = (String) session.getAttribute("loggedInUser");
    if (loggedInUser == null) {
        // 如果未登录，重定向到登录页面
        response.sendRedirect("login.jsp");
        return;
    }

    // 获取日志内容
    String logContent = request.getParameter("logContent");

    // 数据库连接信息
    String url = "jdbc:mysql://localhost:3306/world";
    String dbUsername = "root";
    String dbPassword = "Wyyddl520";

    try {
        // 加载数据库驱动
        Class.forName("com.mysql.jdbc.Driver");

        // 建立数据库连接
        Connection connection = DriverManager.getConnection(url, dbUsername, dbPassword);

        // 插入日志内容到数据库
        String query = "INSERT INTO log (content, user_id) VALUES (?,?)";
        PreparedStatement statement = connection.prepareStatement(query);
        statement.setString(1, logContent);
        statement.setString(2, loggedInUser);
        int rowsAffected = statement.executeUpdate();

        if (rowsAffected > 0) {
            out.println("日志发布成功！");
        } else {
            out.println("日志发布失败！");
        }

        // 关闭相关资源
        statement.close();
        connection.close();

    } catch (Exception e) {
        e.printStackTrace();
        //out.println("出现错误：" + e.getMessage());
    }
%>
<form method="post">
    <label for="logContent">日志内容：</label>
    <textarea name="logContent" rows="5" cols="40"></textarea>
    <br>
    <input type="submit" value="发布日志">
</form>
<a href="admin.jsp" class="back-button">返回后台</a>
</body>
</html>