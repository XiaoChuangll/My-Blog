<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>修改账户信息页面</title>
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
    // 获取当前用户名，这里假设通过参数传递过来，实际应用中可以根据你的登录机制获取
    String currentUsername = request.getParameter("username");
%>
<form action="updateAccount.jsp" method="post">
    <label for="new_username">新用户名：</label>
    <input type="text" id="new_username" name="new_username">
    <label for="new_password">新密码：</label>
    <input type="password" id="new_password" name="new_password">
    <input type="hidden" name="current_username" value="<%=currentUsername%>">
    <input type="submit" value="修改账户信息">
</form>
</body>
</html>