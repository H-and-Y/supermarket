<%@ page import="handle.DBHandle" %>
<%@ page import="java.sql.ResultSet" %>
<%@page pageEncoding="UTF-8" %>
<%@page contentType="text/html" %>
<title>管理员页面</title>
<style>
    #home{
        font-family: 楷体;font-size: 33;color: blue;
    }
    #home{
        font-family: 楷体;font-size: 33;color: blue;
    }
    #user{
        font-family: 楷体;font-size: 20;color: black;
    }
</style>
<html><body background="image/adminBack5.jpg">
<table width="90%">
    <tr>
        <form action="index.jsp" method="post">
            <td align="left"><input type="submit" id="home" value="返回主页"></td>
        </form>
        <form action="adminOrder.jsp" method="post">
            <td align="right"><input type="submit" id="home" value="订单管理"></td>
        </form>
    </tr>
</table><br><br>
<table cellpadding="0" cellspacing="1" width="90%" align="center" border="1" >
    <tr id="goods">
        <th>账号</th>
        <th>密码</th>
        <th>昵称</th>
        <th>电话</th>
        <th>地址</th>
        <th>真实姓名</th>
        <th>修改</th>
        <th>删除</th>
    </tr>
    <%
        try {
            DBHandle.Connection();
            String getUser = "SELECT * FROM user";
            ResultSet rs = DBHandle.SQLQuery(getUser);
            while (rs.next()){
                String account = rs.getString("account"),
                        password = rs.getString("password"),
                        nickName = rs.getString("nickName"),
                        phone = rs.getString("phone"),
                        address = rs.getString("address"),
                        realName = rs.getString("realName");
    %>
    <tr>
        <td><%=account%></td>
        <td><%=password%></td>
        <td><%=nickName%></td>
        <td><%=phone%></td>
        <td><%=address%></td>
        <td><%=realName%></td>
        <td><a href="userChange.jsp?account=<%=account%>" name="user">修改</a> </td>
        <td><a href="delUserServlet?account=<%=account%>" name="user">删除</a> </td>
    </tr>
    <%
            }
        }
        catch (Exception e){}
    %>
</table>
</body></html>
