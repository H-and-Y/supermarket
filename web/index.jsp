<%@page pageEncoding="UTF-8" %>
<%@page contentType="text/html" %>
<jsp:useBean id="userBean" class="save.LoginBean" scope="session"/>
<title>宝，我想去逛超市</title>
<style>
  #title{
    font-family: 楷体;font-size: 50;color: lightskyblue;
  }
  #login{
    font-family: 黑体;font-size: 30;color: black;
  }
  #re{
    font-family: 黑体;font-size: 30;color: red;
  }
</style>
<html><body background="image/indexBack1.jpg">
<div id="title" style="text-align: center;">
  欢迎来到“宝，我想去逛”超市
</div>
<div align="center">
  <br><br><br><br>
  <table id="login" border="1">
    <form action="loginServlet" method="post">
      <tr><td>输入账号：
        <input type="text" name="account" id="login">
      </td></tr>
      <tr><td>输入密码：
        <input type="password" name="password" id="login">
      </td></tr>
      <tr><td align="center">
      <input type="submit" name="user" id="login" value="用户登录">
      </td></tr>
      <tr><td align="center">
      <input type="submit" name="salesman" id="login" value="销售员登录">
      <input type="submit" name="admin" id="login" value="管理员登录">
      </td></tr>
    </form>
    <form action="register.jsp" method="post">
      <tr><td align="center">
        <input type="submit" id="login" value="注册">
      </td></tr>
    </form>
      <tr><td id="re">登录反馈：<jsp:getProperty name="userBean" property="backNews"/></td></tr>
  </table>
</div>
</body> </html>



