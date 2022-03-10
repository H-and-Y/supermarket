<%@page pageEncoding="UTF-8" %>
<%@page contentType="text/html" %>
<%@ page import="handle.DBHandle" %>
<%@ page import="java.sql.ResultSet" %>
<jsp:useBean id="userBean" class="save.LoginBean" scope="session"/>
<title>管理员管理订单页面</title>
<style>
    #home{
        font-family: 楷体;font-size: 33;color: blue;
    }
    #home{
        font-family: 楷体;font-size: 33;color: blue;
    }
    #order{
        font-family: 楷体;font-size: 20;color: black;
    }
</style>
<html><body background="image/adminBack5.jpg">
<table width="90%">
    <tr>
        <form action="index.jsp" method="post">
            <td align="left"><input type="submit" id="home" value="返回主页"></td>
        </form>
        <form action="adminHome.jsp" method="post">
            <td align="right"><input type="submit" id="home" value="返回"></td>
        </form>
    </tr>
</table><br><br>
<table cellpadding="0" cellspacing="1" width="90%" align="center" border="1" >
    <tr id="goods">
        <th>序号</th>
        <th>账号</th>
        <th>订单信息</th>
        <th>删除</th>
    </tr>
    <%
        try {
            DBHandle.Connection();
            String getOrder = "SELECT * FROM goodsOrder";
            ResultSet rs = DBHandle.SQLQuery(getOrder);
            while (rs.next()){
                String orderNumber = rs.getString("orderNumber"),
                        orderAccount = rs.getString("account"),
                        mess = rs.getString("mess");
    %>
    <tr>
        <td><%=orderNumber%></td>
        <td><%=orderAccount%></td>
        <td><%=mess%></td>
        <td><a href="delOrderServlet?orderNumber=<%=orderNumber%>" name="order">删除</a> </td>
    </tr>
    <%
            }
        }
        catch (Exception e){}
    %>
</table>
</body></html>
