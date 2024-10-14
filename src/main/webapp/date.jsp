<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>数据库数据展示</title>
    <style>
        table {
            border-collapse: collapse;
            width: 100%;
        }
        th, td {
            border: 1px solid black;
            padding: 8px;
            text-align: left;
        }
    </style>
</head>
<body>

<h1>数据库数据展示</h1>

<%
    // 数据库连接信息
    String url = "jdbc:mysql://localhost:3306/world";
    String user = "root";
    String password = "Wyyddl520";

    try {
        // 加载数据库驱动
        Class.forName("com.mysql.jdbc.Driver");
        // 获取数据库连接
        Connection conn = DriverManager.getConnection(url, user, password);
        // 创建 Statement 对象
        Statement stmt = conn.createStatement();
        // 执行查询
        ResultSet rs = stmt.executeQuery("SELECT * FROM student");

        // 开始构建 HTML 表格来展示数据
%>
<table>
    <tr>
        <%
            // 获取结果集的元数据，以获取列信息
            ResultSetMetaData rsmd = rs.getMetaData();
            int columnCount = rsmd.getColumnCount();
            for (int i = 1; i <= columnCount; i++) {
        %>
        <th><%=rsmd.getColumnName(i)%></th>
        <%
            }
        %>
    </tr>
    <%
        while (rs.next()) {
    %>
    <tr>
        <%
            for (int i = 1; i <= columnCount; i++) {
        %>
        <td><%=rs.getString(i)%></td>
        <%
            }
        %>
    </tr>
    <%
        }
        // 关闭资源
        rs.close();
        stmt.close();
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    %>
    <p>发生错误：<%=e.getMessage()%></p>
    <%
        }
    %>
</table>

</body>
</html>