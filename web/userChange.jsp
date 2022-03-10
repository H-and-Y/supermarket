<%@page pageEncoding="UTF-8" %>
<%@page contentType="text/html" %>
<%@ page import="handle.DBHandle" %>
<%@ page import="java.sql.ResultSet" %>
<jsp:useBean id="userBean" class="save.LoginBean" scope="session"/>
<title>更改用户信息页面</title>
<style>
    #home{
        font-family: 楷体;font-size: 33;color: blue;
    }
    #user{
        font-family: 黑体;font-size: 35;color: black;
    }
    #re{
        font-family: 黑体;font-size: 30;color: red;
    }
</style>
<html><body background="image/adminBack5.jpg">
<form action="adminHome.jsp" method="post">
    <tr><td align="center"><input type="submit" id="home" value="返回"></td></tr>
</form>
<div align="center">
    <table id="user" align="center" border="1">
        <form id="user" action="userChangeServlet" method="post">
            <%
                /*账号account 昵称nickName  号码phone 地址addess    真实姓名realName*/
                try {
                    DBHandle.Connection();
                    String getUser = "SELECT * FROM user WHERE account='"+request.getParameter("account")+"'";
                    ResultSet rs = DBHandle.SQLQuery(getUser);
                    rs.next();
                    String account = rs.getString("account"),
                            password = rs.getString("password"),
                            nickName = rs.getString("nickName"),
                            phone = rs.getString("phone"),
                            address = rs.getString("address"),
                            realName = rs.getString("realName");
                    application.setAttribute("account",account);
            %>
            <tr><td>账号：</td><td><%=account%></td></tr>
            <tr><td>密码：</td><td><%=password%></td></tr>
            <tr><td>昵称：</td><td><%=nickName%></td></tr>
            <tr><td>电话：</td><td><%=phone%></td></tr>
            <tr><td>地址：</td><td><%=address%></td></tr>
            <tr><td>真实姓名：</td><td><%=realName%></td></tr>
            <%
                }
                catch (Exception e){}
            %>
            <tr><td align="center" colspan="2">请选择修改项和修改内容：</td></tr>
            <tr>
                <td>
                    <select id="user" name="userChange">
                        <option id="user" value="account">账号</option>
                        <option id="user" value="password">密码</option>
                        <option id="user" value="nickName">昵称</option>
                        <option id="user" value="phone">电话</option>
                        <option id="user" value="address">地址</option>
                        <option id="user" value="realName">真实姓名</option>
                    </select>
                </td>
                <td>
                    <input type="text" id="user" name="changeText"/>
                </td>
            </tr>
            <tr>
                <td align="center" colspan="2">
                    <input type="submit" id="user" value="确定" name="admin">
                </td>
            </tr>
            <tr>
                <td align="center" colspan="2" rowspan="2" id="re">
                    修改反馈：<%=application.getAttribute("backNews")%>
                </td>
            </tr>
        </form>
    </table>
</div>
</body></html>
