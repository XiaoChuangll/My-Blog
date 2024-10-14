<%@ page contentType="text/html; charset=UTF-8" %>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>关于我们</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" />
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        .about-section {
            padding: 50px;
        }

        .about-title {
            font-size: 2.5rem;
            text-align: center;
            margin-bottom: 30px;
        }

        .about-content {
            font-size: 1.1rem;
            line-height: 1.6;
        }

        .team-members-section {
            margin-top: 50px;
        }

        .member-card {
            border: 1px solid #ddd;
            border-radius: 10px;
            padding: 20px;
            text-align: center;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .member-photo {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            object-fit: cover;
            margin: 0 auto 10px;
            cursor: pointer;
        }

        .member-name {
            font-size: 1.3rem;
            margin-bottom: 5px;
        }

        .member-role {
            font-size: 1rem;
            color: #666;
        }
    </style>
</head>

<body>
<nav class="navbar navbar-expand-sm navbar-light bg-white border-bottom box-shadow mb-3">
    <div class="container">
        <a class="navbar-brand" href="#">1My Blog</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target=".navbar-collapse" aria-controls="navbarSupportedContent"
                aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="navbar-collapse collapse d-sm-inline-flex justify-content-between">
            <ul class="navbar-nav flex-grow-1">
                <li class="nav-item">
                    <a class="nav-link" href="index.jsp">主页</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">关于</a>
                </li>
            </ul>
            <%
                String loggedInUser = (String) session.getAttribute("loggedInUser");
                if (loggedInUser!= null) {
            %>
            <ul class="navbar-nav">
                <li class="nav-item">
                    <span class="nav-link">欢迎，<%=loggedInUser%></span>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="logout.jsp">退出登录</a>
                </li>
            </ul>
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

<div class="about-section">
    <h1 class="about-title">关于我们的应用</h1>
    <p class="about-content">
        本应用旨在为用户提供便捷、高效的服务。我们致力于解决[具体问题领域]的难题，通过不断创新和优化，为用户打造一个卓越的体验平台。无论是日常的[相关使用场景]，还是专业的[特定业务场景]，我们都力求做到最好。
    </p>
    <div class="team-members-section">
        <h2>团队成员</h2>
        <div class="member-card">
            <a href="tencent://message/?uin=2983995678">
                <img class="member-photo" src="${pageContext.request.contextPath}/Image/member1.jpg" alt="成员 1 照片">
            </a>
            <h3 class="member-name">ChuEng</h3>
            <p class="member-role">创始人兼首席执行官</p>
        </div>
        <div class="member-card">
            <a href="tencent://message/?uin=2983995678">
                <img class="member-photo" src="${pageContext.request.contextPath}/Image/member1.jpg" alt="成员 2 照片">
            </a>
            <h3 class="member-name">ChuEng</h3>
            <p class="member-role">首席技术官</p>
        </div>
        <!-- 可以继续添加更多成员信息 -->
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>