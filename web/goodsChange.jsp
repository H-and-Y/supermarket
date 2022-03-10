<%@page pageEncoding="UTF-8" %>
<%@page contentType="text/html" %>
<%@ page import="handle.DBHandle" %>
<%@ page import="java.sql.ResultSet" %>
<title>商品修改页面</title>
<style>
    #home{
        font-family: 楷体;font-size: 33;color: blue;
    }
    #goods{
        font-family: 楷体;font-size: 30;color: black;
    }
</style>
<html><body background="image/salesmanBack6.jpg">
<form action="salesHome.jsp" method="post">
    <tr><td align="center" colspan="2"><input type="submit" id="home" value="返回"></td></tr>
</form>
<!--商品标识号 goods_id      商品名称 goods_name     价格 goods_price
制造商 goods_made         图片 goods_pic     商品介绍 goods_mess
所属类别 classNumber       库存 inventory-->
<div align="center">
    <table id="goods" align="center" border="1">
        <form id="goods" action="goodsChangeServlet" method="post">
            <%
                try {
                    DBHandle.Connection();
                    String getGoods = "SELECT * FROM goods WHERE goods_id='"+request.getParameter("goods_id")+"'";
                    ResultSet rs = DBHandle.SQLQuery(getGoods);
                    rs.next();
                    String goods_id = rs.getString(1),
                            goods_name = rs.getString(2);
                    float goods_price = rs.getFloat(3);
                    String goods_made = rs.getString(4),
                            goods_pic = rs.getString(5),
                            goods_mess = rs.getString(6);
                    int classNumber = rs.getInt(7),
                            inventory = rs.getInt(8);
                    application.setAttribute("goods_id",goods_id);
            %>
            <tr><td>商品标识号：</td><td><%=goods_id%></td></tr>
            <tr><td>商品名称：</td><td><%=goods_name%></td></tr>
            <tr><td>价格：</td><td><%=goods_price%></td></tr>
            <tr><td>制造商：</td><td><%=goods_made%></td></tr>
            <tr><td>图片：</td><td><%=goods_pic%></td></tr>
            <tr><td>商品介绍：</td><td><%=goods_mess%></td></tr>
            <tr><td>所属类别：</td><td><%=classNumber%></td></tr>
            <tr><td>库存：</td><td><%=inventory%></td></tr>
            <%
                }
                catch (Exception e){}
            %>
            <tr><td align="center" colspan="2">请选择修改项和修改内容：</td></tr>
            <tr>
                <td>
                    <select id="goods" name="goodsChange">
                        <option id="goods" value="goods_id">商品标识号</option>
                        <option id="goods" value="goods_name">商品名称</option>
                        <option id="goods" value="goods_price">价格</option>
                        <option id="goods" value="goods_made">制造商</option>
                        <option id="goods" value="goods_pic">图片</option>
                        <option id="goods" value="goods_mess">商品介绍</option>
                        <option id="goods" value="classNumber">所属类别</option>
                        <option id="goods" value="inventory">库存</option>
                    </select>
                </td>
                <td>
                    <input type="text" id="goods" name="changeText"/>
                </td>
            </tr>
            <tr>
                <td align="center" colspan="2">
                    <input type="submit" id="goods" value="确定">
                </td>
            </tr>
            <tr>
                <td align="center" colspan="2" rowspan="2">
                    修改反馈：<%=application.getAttribute("backNews")%>
                </td>
            </tr>
        </form>
    </table>
</div>
</body></html>
