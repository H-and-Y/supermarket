<%@page pageEncoding="UTF-8" %>
<%@page contentType="text/html" %>
<%@ page import="handle.DBHandle" %>
<%@ page import="java.sql.ResultSet" %>
<jsp:useBean id="userBean" class="save.LoginBean" scope="session"/>
<title>购物车</title>
<style>
    #home{
        font-family: 楷体;font-size: 20;color: lightpink;
    }
    #bao{
        font-family: Tahoma;font-size: 33;color: cyan;
    }
    #det{
        font-family: 宋体; font-size: 20;color: gold;
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
    <table cellpadding="0" cellspacing="1" width="95%" align="center" border="1" >
        <tr id="home">
            <th>商品图片</th>
            <th>商品名称</th>
            <th>商品价格</th>
            <th>购买数量</th>
            <th>修改数量</th>
            <th>删除商品</th>
        </tr>
    <%
        try {
            DBHandle.Connection();
            String account = userBean.getAccount();
            String lookCart = "SELECT * FROM shoppingCart WHERE account='"+account+"'";
            ResultSet rs = DBHandle.SQLQuery(lookCart);
            while (rs.next()){
                String goods_id = rs.getString("goods_id"),
                        goods_name = rs.getString("goods_name");
                float goods_price = rs.getFloat("goods_price");
                int goods_number = rs.getInt("goods_number");
                String findPic = "SELECT goods_pic FROM goods WHERE goods_id='"+goods_id+"'";
                ResultSet rs2 = DBHandle.SQLQuery(findPic);
                rs2.next();
                String goods_pic = rs2.getString("goods_pic");
    %>
        <tr id="det">
            <td><img src="image/<%=goods_pic%>" width="60" height="50"></td>
            <td><%=goods_name%></td>
            <td><%=goods_price%></td>
            <td><%=goods_number%></td>
            <td><form action="buyNumServlet" method="post">
                <input type="hidden" name="account" value="<%=account%>">
                <input type="hidden" name="goods_id" value="<%=goods_id%>">
                <input type="text" id="goods" name="goods_number">
                <input type="submit" id="goods" value="修改">
            </form></td>
            <td><form action="delCartServlet" method="post">
                <input type="hidden" name="account" value="<%=account%>">
                <input type="hidden" name="goods_id" value="<%=goods_id%>">
                <input type="submit" id="goods" value="删除">
            </form></td>
        </tr>
    <%
            }
    %>
    </table>
    <div align="center">
        <form action="madeOrderServlet?account=<%=account%>" method="post">
            <input type="submit" id="home" value="生成订单">
        </form>
    </div>
    <%
        }
        catch (Exception e){}
    %>
</div>
</body></html>
