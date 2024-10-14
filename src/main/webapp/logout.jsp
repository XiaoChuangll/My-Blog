<%@ page contentType="text/html; charset=UTF-8" %>
<%
  // 清除会话中的登录用户信息
  session.invalidate();
  // 重定向到主页
  response.sendRedirect("index.jsp");
%>