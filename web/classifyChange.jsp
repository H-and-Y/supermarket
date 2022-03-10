<%@page pageEncoding="UTF-8" %>
<%@page contentType="text/html" %>
<%@ page import="handle.DBHandle" %>
<%@ page import="java.sql.ResultSet" %>
<title>商品类别修改页面</title>
<style>
    #home{
        font-family: 楷体;font-size: 33;color: blue;
    }
    #classify{
        font-family: 楷体;font-size: 30;color: black;
    }
</style>
<html><body background="image/salesmanBack6.jpg">
<form action="goodsClassify.jsp" method="post">
    <tr><td align="center" colspan="2"><input type="submit" id="home" value="返回"></td></tr>
</form>
<!--classNumber 类别号   name 类别名称-->
<div align="center">
    <table id="classify" align="center" border="1">
        <form id="classify" action="classifyChangeServlet" method="post">
            <%
                try {
                    DBHandle.Connection();
                    String getGoods = "SELECT * FROM goodsClassify WHERE classNumber='"
                            +request.getParameter("classNumber")+"'";
                    ResultSet rs = DBHandle.SQLQuery(getGoods);
                    rs.next();
                    int classNumber = rs.getInt(1);
                    String name = rs.getString(2);
                    application.setAttribute("classNumber",classNumber);
            %>
            <tr><td>类别号：</td><td><%=classNumber%></td></tr>
            <tr><td>类别名称：</td><td><%=name%></td></tr>
            <%
                }
                catch (Exception e){}
            %>
            <tr><td align="center" colspan="2">请选择修改项和修改内容：</td></tr>
            <tr>
                <td>
                    <select id="classify" name="classifyChange">
                        <option id="classify" value="classNumber">类别号</option>
                        <option id="classify" value="name">类别名称</option>
                    </select>
                </td>
                <td>
                    <input type="text" id="classify" name="changeText"/>
                </td>
            </tr>
            <tr>
                <td align="center" colspan="2">
                    <input type="submit" id="classify" value="确定">
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
