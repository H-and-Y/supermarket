<%@ page import="handle.DBHandle" %>
<%@ page import="java.sql.ResultSet" %>
<%@page pageEncoding="UTF-8" %>
<%@page contentType="text/html" %>
<jsp:useBean id="classifyBean" class="save.GoodsClassify"/>
<title>商品类别页面</title>
<style>
    #home{
        font-family: 楷体;font-size: 33;color: blue;
    }
    #classify{
        font-family: 楷体;font-size: 20;color: black;
    }
</style>
<html><body background="image/salesmanBack6.jpg">
<table cellspacing="1" width="150" align="right" border="1" >
    <tr valign="bottom">
        <td id="home"><a href="salesHome.jsp">返回</a></td>
    </tr>
</table>
<br><br><br><br>
<table cellpadding="0" cellspacing="1" width="90%" align="center" border="1" >
    <tr id="classify">
        <th>类别号</th>
        <th>类别名称</th>
        <th>修改</th>
        <th>删除</th>
    </tr>
    <%
        try {
            DBHandle.Connection();
            String getClassify = "SELECT * FROM goodsClassify";
            ResultSet rs = DBHandle.SQLQuery(getClassify);
            while (rs.next()){
                int classNumber = rs.getInt(1);
                String name = rs.getString(2);
    %>
    <tr id="classify">
        <th><%=classNumber%></th>
        <th><%=name%></th>
        <th><a href="classifyChange.jsp?classNumber=<%=classNumber%>">修改</a></th>
        <th><a href="delClassifyServlet?classNumber=<%=classNumber%>" name="classify">删除</a></th>
    </tr>
    <%
            }
        }
        catch (Exception e){}
    %>
</table>
</body></html>
