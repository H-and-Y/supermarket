<%@page pageEncoding="UTF-8" %>
<%@page contentType="text/html" %>
<%@ page import="handle.DBHandle" %>
<%@ page import="java.sql.ResultSet" %>
<title>销售员页面</title>
<style>
    #home{
        font-family: 楷体;font-size: 33;color: blue;
    }
    #goods{
        font-family: 楷体;font-size: 20;color: black;
    }
</style>
<html><body background="image/salesmanBack6.jpg">
<table cellspacing="1" width="700" align="right" border="1" >
    <tr valign="bottom">
        <td id="home"><a href="goodsClassify.jsp">商品类别</a> </td>
        <td id="home"><a href="addGoods.jsp">添加商品</a></td>
        <td id="home"><a href="addClassify.jsp">添加类别</a></td>
        <td id="home"><a href="index.jsp">返回主页</a></td>
    </tr>
</table>
<br><br><br><br>
<table cellpadding="0" cellspacing="1" width="90%" align="center" border="1" >
    <tr id="goods">
        <th>商品标识号</th>
        <th>商品名称</th>
        <th>价格</th>
        <th>制造商</th>
        <th>图片</th>
        <th>商品介绍</th>
        <th>所属类别</th>
        <th>库存</th>
        <th>修改</th>
        <th>删除</th>
    </tr>
    <%
        try {
            DBHandle.Connection();
            String getGoods = "SELECT * FROM goods";
            ResultSet rs = DBHandle.SQLQuery(getGoods);
            while (rs.next()){
                String goods_id = rs.getString(1),
                        goods_name = rs.getString(2);
                float goods_price = rs.getFloat(3);
                String goods_made = rs.getString(4),
                        goods_pic = rs.getString(5),
                        goods_mess = rs.getString(6);
                int classNumber = rs.getInt(7),
                        inventory = rs.getInt(8);
    %>
    <tr>
        <td><%=goods_id%></td>
        <td><%=goods_name%></td>
        <td><%=goods_price%></td>
        <td><%=goods_made%></td>
        <td><img src="image/<%=goods_pic%>" width="60" height="50"></td>
        <td><%=goods_mess%></td>
        <td><%=classNumber%></td>
        <td><%=inventory%></td>
        <td><a href="goodsChange.jsp?goods_id=<%=goods_id%>" name="goods">修改</a> </td>
        <td><a href="delGoodsServlet?goods_id=<%=goods_id%>" name="goods">删除</a> </td>
    </tr>
    <%
            }
        }
        catch (Exception e){}
    %>
</table>
</body></html>
