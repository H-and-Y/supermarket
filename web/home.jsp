<%@page pageEncoding="UTF-8" %>
<%@page contentType="text/html" %>
<%@ page import="handle.DBHandle" %>
<%@ page import="java.sql.ResultSet" %>
<jsp:useBean id="userBean" class="save.LoginBean" scope="session"/>
<jsp:useBean id="goodsBean" class="save.Goods" scope="session"/>
<title>home</title>
<style>
    #home{
        font-family: 楷体;font-size: 20;color: lightpink;
    }
    #bao{
        font-family: Tahoma;font-size: 33;color: cyan;
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
    <!--商品标识号 goods_id      商品名称 goods_name     价格 goods_price
        制造商 goods_made         图片 goods_pic     商品介绍 goods_mess
        所属类别 classNumber       库存 inventory-->
    <table cellspacing="1" cellpadding="15" align="center" border="1" >
    <%
        request.setCharacterEncoding("utf-8");
        try {
            DBHandle.Connection();
            String searchKey = request.getParameter("searchSub");
            if (searchKey!=null){
                String codition = request.getParameter("condition");
                String queryKey = request.getParameter("queryKey").trim();
                String searchGoods = "SELECT * FROM goods WHERE "+codition+" LIKE '%"+queryKey+"%'";
                ResultSet rsSear = DBHandle.SQLQuery(searchGoods);
                int i =0;
                while (rsSear.next()){
                    i++;
                    String goods_id = rsSear.getString(1),
                            goods_name = rsSear.getString(2);
                    float goods_price = rsSear.getFloat(3);
                    String goods_made = rsSear.getString(4),
                            goods_pic = rsSear.getString(5),
                            goods_mess = rsSear.getString(6);
                    int classNumber = rsSear.getInt(7),
                            inventory = rsSear.getInt(8);
                    if (i%5==0){
                        out.print("<tr>");
                    }
    %>
        <td>
            <a href="goodsDetails.jsp?goods_id=<%=goods_id%>">
                <img src="image/<%=goods_pic%>" height="170" style="display: inline-block;">
            </a>
            <p><a href="goodsDetails.jsp?goods_id=<%=goods_id%>" style="color: deeppink" name="go"><%=goods_name%></a></p>
            <p><span style="color: red; ">价格：￥<%=goods_price%></span></p>
        </td>
        <%
                if (i%5==0){
                    out.print("</tr>");
                }
                }
            }else {
                String getGoods = "SELECT * FROM goods";
                ResultSet rs = DBHandle.SQLQuery(getGoods);
                int i =0;
                while (rs.next()){
                    i++;
                    String goods_id = rs.getString(1),
                            goods_name = rs.getString(2);
                    float goods_price = rs.getFloat(3);
                    String goods_made = rs.getString(4),
                            goods_pic = rs.getString(5),
                            goods_mess = rs.getString(6);
                    int classNumber = rs.getInt(7),
                            inventory = rs.getInt(8);
                    if (i%5==0){
                        out.print("<tr>");
                    }
    %>
        <td width="170">
            <a href="goodsDetails.jsp?goods_id=<%=goods_id%>">
                <img src="image/<%=goods_pic%>" height="170" style="display: inline-block;">
            </a>
            <p><a href="goodsDetails.jsp?goods_id=<%=goods_id%>"
                  style="color: deeppink"><%=goods_name%></a></p>
            <p><span style="color: red; ">价格：￥<%=goods_price%></span></p>
        </td>
    <%
                    if (i%5==0){
                        out.print("</tr>");
                    }
                }
            }
        }
        catch (Exception e){}
    %>
    </table>
</div>
</body></html>
