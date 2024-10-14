<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.logging.Level" %>
<%@ page import="java.util.logging.Logger" %>

<%
  Logger logger = Logger.getLogger("UpdateUserPasswordLogger");
  // 获取表单提交的新用户名和新密码以及当前用户名
  String newUsername = request.getParameter("new_username");
  String newPassword = request.getParameter("new_password");
  String currentUsername = request.getParameter("current_username");

  // 假设这里是数据库连接信息，实际应用中应从配置文件中读取或使用连接池
  String url = "jdbc:mysql://localhost:3306/world";
  String dbUsername = "root";
  String dbPassword = "Wyyddl520";

  try {
    // 加载数据库驱动
    Class.forName("com.mysql.jdbc.Driver");

    // 建立数据库连接
    Connection connection = DriverManager.getConnection(url, dbUsername, dbPassword);

    // 更新用户信息
    String updateQuery = "UPDATE users SET username =?, password =? WHERE username =?";
    PreparedStatement updateStatement = connection.prepareStatement(updateQuery);
    updateStatement.setString(1, newUsername);
    updateStatement.setString(2, newPassword);
    updateStatement.setString(3, currentUsername);

    logger.log(Level.INFO, "准备执行更新语句，新用户名：" + newUsername + "，新密码：" + newPassword + "，当前用户名：" + currentUsername);

    int rowsUpdated = updateStatement.executeUpdate();

    if (rowsUpdated > 0) {
      // 更新成功，重定向到登录页面或其他页面
      response.sendRedirect("login.jsp");
    } else {
      // 更新失败，显示错误消息
      out.println("<p style='color: red;'>更新失败，请重试。</p>");
      logger.log(Level.WARNING, "更新失败，新用户名：" + newUsername + "，新密码：" + newPassword + "，当前用户名：" + currentUsername);
    }

    // 关闭数据库连接
    updateStatement.close();
    connection.close();
  } catch (ClassNotFoundException e) {
    e.printStackTrace();
    // 出现错误，显示错误消息
    out.println("<p style='color: red;'>加载数据库驱动失败，请重试。</p>");
    logger.log(Level.SEVERE, "加载数据库驱动失败", e);
  } catch (SQLException e) {
    e.printStackTrace();
    // 出现错误，显示错误消息
    out.println("<p style='color: red;'>更新过程中出现数据库错误，请重试。</p>");
    logger.log(Level.SEVERE, "数据库更新错误", e);
  } catch (Exception e) {
    e.printStackTrace();
    // 出现错误，显示错误消息
    out.println("<p style='color: red;'>更新过程中出现错误，请重试。</p>");
    logger.log(Level.SEVERE, "未知错误", e);
  }
%>