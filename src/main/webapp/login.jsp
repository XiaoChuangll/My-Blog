<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
    <title>登录页面</title>
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
            height: 190px;
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
        /* 登录按钮样式 */
        input[type="submit"][value="登录"] {
            background-color: #4CAF50;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 3px;
            float: left;
            margin-right: 10px;
        }
        /* 注册按钮样式 */
        input[type="button"][value="注册"] {
            background-color: #4CAF50;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 3px;
            float: right;
        }
    </style>
</head>
<body>

<%
    String errorMessage = request.getParameter("error");
    if ("1".equals(errorMessage)) {
%>
<p style="color: red;">登录失败，请检查用户名和密码。</p>
<%
    }
%>

<form action="loginProcess.jsp" method="post">
    <label for="username">用户名：</label>
    <input type="text" id="username" name="username" placeholder="请输入用户名">
    <label for="password">密码：</label>
    <input type="password" id="password" name="password" placeholder="请输入密码">
    <input type="submit" value="登录">
    <input type="button" value="注册" onclick="window.location.href='register.jsp'">
</form>

</body>
</html>