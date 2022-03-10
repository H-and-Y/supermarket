<%@page pageEncoding="UTF-8" %>
<%@page contentType="text/html" %>
<jsp:useBean id="registerBean" class="save.RegisterBean" scope="request"/>
<title>注册</title>
<style>
    #reg{
        font-family: 宋体;font-size: 26;color: black;
    }
    #info{
        font-family: 黑体;font-size: 40;color: black;
    }
    #re{
        font-family: 黑体;font-size: 30;color: red;
    }
</style>
<html><body id="reg" background="image/adminBack5.jpg">
<div align="left">
    <form action="index.jsp">
        <input type="submit" id="reg" value="返回主页">
    </form>
</div>
<br><br>
<div align="center">
    <form action="registerServlet" method="post">
        <table id="info">
            <tr><td>
                *用户账号：<input type="text" id="info" name="account">
            </td></tr>
            <tr><td>
                *用户密码：<input type="password" id="info" name="password">
            </td></tr>
            <tr><td>
                *重复密码：<input type="password" id="info" name="againPassword">
            </td></tr>
            <tr><td>
                *用户昵称：<input type="text" id="info" name="nickName">
            </td></tr>
            <tr><td>
                联系电话 ：<input type="text" id="info" name="phone">
            </td></tr>
            <tr><td>
                邮寄地址 ：<input type="text" id="info" name="address">
            </td></tr>
            <tr><td>
                真实姓名 ：<input type="text" id="info" name="realName">
            </td></tr>
            <tr><td align="center">
                <input type="submit" id="info" value="确定">
            </td></tr>
        </table>
    </form>
</div>
<div align="center" id="re">
    注册反馈：
    <jsp:getProperty name="registerBean" property="backNews"/>
</div>
</body></html>
