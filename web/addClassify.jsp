<%@page pageEncoding="UTF-8" %>
<%@page contentType="text/html" %>
<jsp:useBean id="classifyBean" class="save.GoodsClassify" scope="request"/>
<title>添加商品类别</title>
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
    <tr><td align="center"><input type="submit" id="home" value="返回"></td></tr>
</form>
<!--类别号 classNumber     类别名称 name-->
<div align="center">
    <table id="goods" align="center" border="1">
        <form action="addClassifyServlet" method="post">
            <tr><td>类别名称：</td><td><input type="text" id="goods" name="name"/></td></tr>
            <tr><td align="center" colspan="2"><input type="submit" id="goods" value="添加"></td></tr>
        </form>
        <tr><td rowspan="2" colspan="2">
            添加反馈：
            <jsp:getProperty name="classifyBean" property="classNumber"/>
            <jsp:getProperty name="classifyBean" property="name"/><br>
            <jsp:getProperty name="classifyBean" property="backNews"/>
        </td></tr>
    </table>
</div>
</body></html>
