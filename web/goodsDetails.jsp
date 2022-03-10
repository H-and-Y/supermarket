<%@page pageEncoding="UTF-8" %>
<%@page contentType="text/html" %>
<%@ page import="handle.DBHandle" %>
<%@ page import="java.sql.ResultSet" %>
<jsp:useBean id="userBean" class="save.LoginBean" scope="session"/>
<title>商品详情页面</title>
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
            <form id="home" action="home.jsp" method="post">
                <td><select id="home" name="condition">
                    <option id="home" value="goods_name">商品名</option>
                    <option id="home" value="goods_made">制造商</option>
                    <option id="home" value="classNumber">类别</option>
                </select></td>
                <td><input id="home" type="text" name="querykey"></td>
                <td><button id="home" type="submit">检索</button></td>
            </form>
        </tr>
    </table><br><br><br><br>
    <%
        try {
            String goods_id = request.getParameter("goods_id");
            DBHandle.Connection();
            String getGoods = "SELECT * FROM goods WHERE goods_id='"+goods_id+"'";
            ResultSet rs = DBHandle.SQLQuery(getGoods);
            rs.next();
            String goods_name = rs.getString(2);
            float goods_price = rs.getFloat(3);
            String goods_made = rs.getString(4),
                    goods_pic = rs.getString(5),
                    goods_mess = rs.getString(6);
            int classNumber = rs.getInt(7),
                    inventory = rs.getInt(8);
    %>
    <div class="col-md-2" style="height: 500px" align="center">
        <img src="image/<%=goods_pic%>" height="170" style="display: inline-block;"/>
        <p style="color: deeppink"><%=goods_name%></p>
        <p><span style="color: red; ">价格：￥<%=goods_price%></span></p>
        <table cellspacing="1" cellpadding="5" align="center" border="1" >
            <tr id="det"><th>商品名：</th><th><%=goods_name%></th></tr>
            <tr id="det"><th>商品价格：</th><th><%=goods_price%></th></tr>
            <tr id="det"><th>制造商：</th><th><%=goods_made%></th></tr>
            <tr id="det"><th>商品介绍：</th><th><%=goods_mess%></th></tr>
            <tr><td colspan="2" align="center">
                <form action="toCartServlet">
                    <input type="hidden" name="goods_id" value="<%=goods_id%>">
                    <input type="hidden" name="account" value="<%=userBean.getAccount()%>">
                    <input type="submit" id="home" value="加入购物车">
                </form>
            </td></tr>
        </table>
    </div>
    <%
        }
        catch (Exception e){}
    %>
</div>
</body></html>