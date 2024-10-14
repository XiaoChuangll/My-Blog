<%@ page import="com.example.demo.LogService" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>主页 - 服务状态展示</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" />
    <!-- 引入 Font Awesome CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        .service-status-section {
            padding: 50px 0;
            text-align: center;
        }

        .status-circle {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            margin: 0 auto 20px;
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 24px;
            font-weight: bold;
        }

        .status-green {
            background-color: #4CAF50;
            color: white;
        }

        .status-yellow {
            background-color: #FFC107;
            color: black;
        }

        .status-red {
            background-color: #F44336;
            color: white;
        }

        .service-description {
            max-width: 800px;
            margin: 0 auto;
            font-size: 18px;
            line-height: 1.6;
        }

        .user-info {
            position: relative;
        }

        .user-dropdown {
            opacity: 0;
            visibility: hidden;
            position: absolute;
            top: 100%;
            left: 0;
            background-color: #fff;
            border: 1px solid #ddd;
            padding: 10px;
            box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
            border-radius: 5px;
            transition: opacity 0.3s ease, visibility 0.3s ease;
        }

        .user-dropdown.show {
            opacity: 1;
            visibility: visible;
        }

        .user-dropdown a {
            display: block;
            color: #333;
            text-decoration: none;
            padding: 5px 0;
        }

        .user-link {
            cursor: pointer;
            padding: 5px 10px;
            border: 1px solid #ddd;
            background-color: #f9f9f9;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .user-link:hover {
            background-color: #e9e9e9;
            color: #333;
        }

        /* 新添加的样式用于框体 */
        .browser-info-box {
            background-color: #fff;
            padding: 20px;
            border: 1px solid #ddd;
            box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
            margin-top: 30px;
            max-width: 600px;
            margin-left: auto;
            margin-right: auto;
        }

        .browser-info-label {
            font-weight: bold;
            color: #555;
        }

        .browser-info-value {
            color: #333;
            margin-top: 5px;
        }

        /* 新添加的日志信息框体样式 */
        .log-info-box {
            background-color: #f9f9f9;
            padding: 20px;
            border: 1px solid #ddd;
            box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
            margin-top: 30px;
            max-width: 800px;
            margin-left: auto;
            margin-right: auto;
        }
    </style>
</head>

<body>
<nav class="navbar navbar-expand-sm navbar-light bg-white border-bottom box-shadow mb-3">
    <div class="container">
        <a class="navbar-brand" href="#">My Blog</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target=".navbar-collapse" aria-controls="navbarSupportedContent"
                aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="navbar-collapse collapse d-sm-inline-flex justify-content-between">
            <ul class="navbar-nav flex-grow-1">
                <li class="nav-item">
                    <a class="nav-link" href="about.jsp">关于</a>
                </li>
            </ul>
            <%
                String loggedInUser = (String) session.getAttribute("loggedInUser");
                if (loggedInUser!= null) {
            %>
            <div class="user-info">
                <div class="user-link" id="userLink">
                    <i class="fas fa-user"></i> 欢迎，<%=loggedInUser%>
                </div>
                <div id="user-dropdown" class="user-dropdown">
                    <a href="admin.jsp">进入后台</a>
                    <a href="logout.jsp">退出登录</a>
                </div>
            </div>
            <%
            } else {
            %>
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="login.jsp">登录</a>
                </li>
            </ul>
            <%
                }
            %>
        </div>
    </div>
</nav>

<div class="service-status-section">
    <%
        // 假设这里根据某种逻辑确定服务状态
        String serviceStatus = "green";
    %>
    <div class="status-circle status-<%=serviceStatus %>">
        <%
            if ("green".equals(serviceStatus)) {
                out.println("正常运行");
            } else if ("yellow".equals(serviceStatus)) {
                out.println("部分服务受限");
            } else {
                out.println("服务中断");
            }
        %>
    </div>
    <p class="service-description">我们的服务致力于为您提供优质的体验。目前，服务状态为<%=serviceStatus.equals("green")? "正常运行" : serviceStatus.equals("yellow")? "部分服务受限" : "服务中断" %>。 如果您遇到任何问题，请随时联系我们的客服团队。</p>
    <!-- 有阴影的框体用于显示浏览器版本和系统内核 -->
    <div class="browser-info-box">
        <p class="browser-info-label">-浏览器版本-</p>
        <p class="browser-info-value"><%=request.getHeader("User-Agent") %>（可根据 User-Agent 进一步解析出具体版本信息）</p>
        <p class="browser-info-label">-系统内核-</p>
        <%
            String userAgent = request.getHeader("User-Agent");
            if (userAgent!= null && userAgent.contains("Windows")) {
                out.println("<p class=\"browser-info-value\">Windows 系统内核（可能是 NT 内核等）</p>");
            } else if (userAgent!= null && userAgent.contains("Mac")) {
                out.println("<p class=\"browser-info-value\">Mac 系统内核（可能是 Darwin 内核等）</p>");
            } else if (userAgent!= null && userAgent.contains("Linux")) {
                out.println("<p class=\"browser-info-value\">Linux 系统内核（通常是多种内核变体）</p>");
            } else {
                out.println("<p class=\"browser-info-value\">未知系统内核</p>");
            }
        %>
    </div>
    <!-- 日志信息框体 -->
    <div class="log-info-box">
        <p class="browser-info-label">-日志信息-</p>
        <%
            // 调用 Java 方法获取日志内容并显示
            String logContent = LogService.getLatestLog();
        %>
        <p class="browser-info-value"><%=logContent%></p>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    // 使用事件委托来绑定点击事件
    document.addEventListener('click', function(event) {
        let dropdown = document.getElementById('user-dropdown');
        let userLink = document.getElementById('userLink');
        if (event.target === userLink) {
            dropdown.classList.toggle('show');
        } else if (!userLink.contains(event.target) && dropdown.classList.contains('show')) {
            dropdown.classList.remove('show');
        }
    });
</script>
</body>

</html>