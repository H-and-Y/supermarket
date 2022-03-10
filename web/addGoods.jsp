<%@page pageEncoding="UTF-8" %>
<%@page contentType="text/html" %>
<jsp:useBean id="goodsBean" class="save.Goods" scope="request"/>
<title>添加商品</title>
<style>
    #home{
        font-family: Tahoma;font-size: 48;color: black;
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
        <form action="addGoodsServlet" method="post">
            <tr><td>商品标识号：</td><td><input type="text" id="goods" name="goods_id"/></td></tr>
            <tr><td>商品名称：</td><td><input type="text" id="goods" name="goods_name"/></td></tr>
            <tr><td>价格：</td><td><input type="text" id="goods" name="goods_price"/></td></tr>
            <tr><td>制造商：</td><td><input type="text" id="goods" name="goods_made"/></td></tr>
            <tr><td>图片：</td><td><input type="text" id="goods" name="goods_pic"/></td></tr>
            <tr><td>商品介绍：</td><td><input type="text" id="goods" name="goods_mess"/></td></tr>
            <tr><td>所属类别：</td><td><input type="text" id="goods" name="classNumber"/></td></tr>
            <tr><td>库存：</td><td><input type="text" id="goods" name="inventory"/></td></tr>
            <tr><td align="center" colspan="2"><input type="submit" id="goods" value="添加"></td></tr>
        </form>
        <tr><td rowspan="2" colspan="2">
            添加反馈：
            <jsp:getProperty name="goodsBean" property="backNews"/><br>
            <jsp:getProperty name="goodsBean" property="goods_id"/><br>
            <jsp:getProperty name="goodsBean" property="goods_name"/><br>
            <jsp:getProperty name="goodsBean" property="goods_price"/><br>
            <jsp:getProperty name="goodsBean" property="goods_made"/><br>
            <jsp:getProperty name="goodsBean" property="goods_pic"/><br>
            <jsp:getProperty name="goodsBean" property="goods_mess"/><br>
            <jsp:getProperty name="goodsBean" property="classNumber"/><br>
            <jsp:getProperty name="goodsBean" property="inventory"/>
        </td></tr>
    </table>
</div>
</body></html>
