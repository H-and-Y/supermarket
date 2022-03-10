<%@ page import="handle.DBHandle" %>
<%@ page import="javax.naming.NamingException" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.ResultSet" %>
<%@page pageEncoding="UTF-8" %>
<%@page contentType="text/html" %>
<jsp:useBean id="userBean" class="save.LoginBean" scope="session"/>
<title>用户结算页面</title>
<style>
    #home{
        font-family: 楷体;font-size: 20;color: lightpink;
    }
    #bao{
        font-family: Tahoma;font-size: 33;color: cyan;
    }
    #det{
        font-family: 宋体; font-size: 30;color: lightskyblue;
    }
</style>
<html><body background="image/userBacn5.jpg">
<div class="row" style="width: 1210px;margin: 0 auto;">
    <p id="bao" align="right">宝，我们去逛超市叭！</p>
    <table cellspacing="1" cellpadding="5" align="left" border="1" >
        <tr>
            <td id="home">欢迎您!<%=userBean.getNickName()%></td>
            <td><a href="home.jsp" id="home">首页</a> </td>
            <td><a href="myself.jsp" id="home">我的主页</a></td>
            <td><a href="shoppingCart.jsp" id="home">我的购物车</a></td>
            <td><a href="order.jsp" id="home">我的订单</a> </td>
            <td><a href="exitServlet" id="home">退出登录</a> </td>
            <form id="home" action="" method="post">
                <td><select id="home" name="condition">
                    <option id="home" value="goods_name">商品名</option>
                    <option id="home" value="goods_made">制造商</option>
                    <option id="home" value="classNumber">类别</option>
                </select></td>
                <td><input id="home" type="text" name="queryKey"></td>
                <td><input id="home" type="submit" name="searchSub" value="检索"></td>
            </form>
        </tr>
    </table><br><br><br><br>
    <%
        try {
            DBHandle.Connection();
            String findOder = "SELECT * FROM goodsOrder WHERE account='"+userBean.getAccount()+"'";
            ResultSet rs = DBHandle.SQLQuery(findOder);
            if (rs.last()){
                String mess = rs.getString("mess");
    %>
    <table cellspacing="1" cellpadding="5" align="center" border="1" >
        <tr>
            <th id="det"><%=mess%></th>
        </tr>
        <tr><td align="center">
            <form action="pay.jsp"><input type="submit" id="goods" value="支付"></form>
        </tr></td>
    </table>
    <%
            }
        } catch (NamingException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            DBHandle.close();
        }
    %>
</div>
</body></html>
