<%@ page contentType="text/html; charset=UTF-8" %>
<html lang="en">
<head>
  <meta charset="utf-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>后台管理页面</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"/>
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 0;
    }

    #sidebar {
      width: 200px;
      background-color: #333;
      color: white;
      height: 100vh;
      position: fixed;
      top: 0;
      left: -200px;
      transition: left 0.3s ease;
      padding: 20px;
    }

    #content {
      margin-left: 0;
      padding: 20px;
      transition: margin-left 0.3s ease;
    }

    a {
      color: white;
      text-decoration: none;
      display: block;
      margin-bottom: 10px;
    }

    h1 {
      margin-top: 0;
    }
  </style>
</head>
<body>
<div id="sidebar">
  <a href="log.jsp">日志</a>
  <a href="modifyAccount.jsp">修改账户信息</a>
  <a href="logout.jsp">退出账户</a>
</div>
<div id="content">
  <%
    // 获取登录成功后传递过来的用户名
    //String username = request.getParameter("username");
    String loggedInUser = (String) session.getAttribute("loggedInUser");
    // 获取 IP 地址
    String ipAddress = request.getHeader("x-forwarded-for");
    if (ipAddress == null || ipAddress.length() == 0 || "unknown".equalsIgnoreCase(ipAddress)) {
      ipAddress = request.getHeader("Proxy-Client-IP");
    }
    if (ipAddress == null || ipAddress.length() == 0 || "unknown".equalsIgnoreCase(ipAddress)) {
      ipAddress = request.getHeader("WL-Proxy-Client-IP");
    }
    if (ipAddress == null || ipAddress.length() == 0 || "unknown".equalsIgnoreCase(ipAddress)) {
      ipAddress = request.getRemoteAddr();
    }
  %>
  <nav class="navbar navbar-expand-sm navbar-light bg-white border-bottom box-shadow mb-3">
    <div class="container">
      <a class="navbar-brand" href="#">后台管理</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target=".navbar-collapse"
              aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="navbar-collapse collapse d-sm-inline-flex justify-content-between">
        <ul class="navbar-nav flex-grow-1">
          <li class="nav-item">
            <a class="nav-link text-dark" href="index.jsp">主页</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>
  <div class="text-center">
    <h1 class="display-4">欢迎，<%=loggedInUser%>！</h1>
    <p>这里是后台管理页面。</p>
    <!-- 显示当前日期和时间、IP 地址以及当前地址 -->
    <p id="dateTime"></p>
    <p>当前 IP 地址：<%=ipAddress%></p>
    <p id="currentAddress"></p>
    <script>
      function updateTime() {
        var now = new Date();
        document.getElementById('dateTime').innerHTML = '当前时间：' + now.toLocaleString();
      }

      // 获取当前地址（使用主机名作为一部分）
      function getCurrentAddress() {
        var host = window.location.hostname;
        document.getElementById('currentAddress').innerHTML = '当前地址：' + host;
      }

      // 每秒调用一次 updateTime 函数
      setInterval(updateTime, 1000);

      // 页面加载时立即调用一次 updateTime 函数以确保初始时间正确显示
      updateTime();

      // 页面加载时获取当前地址
      getCurrentAddress();
    </script>
  </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
  let isSidebarOpen = false;
  document.addEventListener('mousemove', function (event) {
    if (event.clientX <= 20 &&!isSidebarOpen) {
      document.getElementById('sidebar').style.left = '0';
      document.getElementById('content').style.marginLeft = '200px';
      isSidebarOpen = true;
    }
  });
  document.getElementById('sidebar').addEventListener('mouseleave', function () {
    if (isSidebarOpen) {
      document.getElementById('sidebar').style.left = '-200px';
      document.getElementById('content').style.marginLeft = '0';
      isSidebarOpen = false;
    }
  });
</script>
</body>
</html>