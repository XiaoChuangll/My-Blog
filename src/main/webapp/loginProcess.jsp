<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>

<%
    // 获取用户名和密码
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    // 假设这里是数据库连接信息，实际应用中应从配置文件中读取或使用连接池
    String url = "jdbc:mysql://localhost:3306/world";
    String dbUsername = "root";
    String dbPassword = "Wyyddl520";

    try {
        // 加载数据库驱动
        Class.forName("com.mysql.jdbc.Driver");

        // 建立数据库连接
        Connection connection = DriverManager.getConnection(url, dbUsername, dbPassword);

        // 查询用户信息
        String query = "SELECT * FROM users WHERE username =? AND password =?";
        PreparedStatement statement = connection.prepareStatement(query);
        statement.setString(1, username);
        statement.setString(2, password);
        ResultSet resultSet = statement.executeQuery();

        if (resultSet.next()) {
            // 登录成功，将用户名存入会话，并重定向到主页
            session.setAttribute("loggedInUser", username);
            //session.setAttribute("username", username);
            response.sendRedirect("index.jsp");
        } else {
            // 登录失败，重定向回登录页面并传递错误参数
            response.sendRedirect("login.jsp?error=1");
        }

        // 关闭相关资源
        resultSet.close();
        statement.close();
        connection.close();
    } catch (Exception e) {
        e.printStackTrace();
        // 出现错误，重定向回登录页面并传递错误参数
        response.sendRedirect("login.jsp?error=1");
    }
%>