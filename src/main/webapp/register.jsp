<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>

<html>
<head>
    <title>注册页面</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            line-height: 1.6;
        }
        form {
            width: 300px;
            margin: 0 auto;
            border: 1px solid #ccc;
            padding: 20px;
            border-radius: 5px;
        }
        label {
            display: block;
            margin-bottom: 5px;
        }
        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 8px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }
        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }
    </style>
</head>
<body>

<%
    // 处理注册表单提交
    if ("POST".equals(request.getMethod())) {
        String newUsername = request.getParameter("new_username");
        String newPassword = request.getParameter("new_password");

        // 假设这里是数据库连接信息，实际应用中应从配置文件中读取或使用连接池
        String url = "jdbc:mysql://localhost:3306/world";
        String dbUsername = "root";
        String dbPassword = "Wyyddl520";

        try {
            // 加载数据库驱动
            Class.forName("com.mysql.jdbc.Driver");

            // 建立数据库连接
            Connection connection = DriverManager.getConnection(url, dbUsername, dbPassword);

            // 检查用户名是否已存在
            String checkQuery = "SELECT * FROM users WHERE username =?";
            PreparedStatement checkStatement = connection.prepareStatement(checkQuery);
            checkStatement.setString(1, newUsername);
            ResultSet checkResultSet = checkStatement.executeQuery();
            if (checkResultSet.next()) {
                // 用户名已存在，显示错误消息
%>
<p style='color: red;'>该用户名已存在，请选择其他用户名。</p>
<%
} else {
    // 插入新用户数据到数据库
    String insertQuery = "INSERT INTO users (username, password) VALUES (?,?)";
    PreparedStatement insertStatement = connection.prepareStatement(insertQuery);
    insertStatement.setString(1, newUsername);
    insertStatement.setString(2, newPassword);
    int rowsInserted = insertStatement.executeUpdate();

    if (rowsInserted > 0) {
        // 注册成功，重定向到登录页面或其他页面
%>
<p>注册成功，即将跳转到登录页面...</p>
<% response.sendRedirect("login.jsp"); %>
<%
} else {
    // 注册失败，显示错误消息
%>
<p style='color: red;'>注册失败，请重试。</p>
<%
        }

        // 关闭插入语句和连接
        insertStatement.close();
    }

    // 关闭检查结果集和语句
    checkResultSet.close();
    checkStatement.close();
    connection.close();
} catch (Exception e) {
    e.printStackTrace();
    // 出现错误，显示错误消息
%>
<p style='color: red;'>注册过程中出现错误，请重试。</p>
<%
        }
    }
%>

<form action="" method="post">
    <label for="new_username">用户名：</label>
    <input type="text" id="new_username" name="new_username">
    <label for="new_password">密码：</label>
    <input type="password" id="new_password" name="new_password">
    <input type="submit" value="注册">
</form>

</body>
</html>