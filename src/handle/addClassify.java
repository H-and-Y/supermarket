package handle;

import save.*;
import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.naming.NamingException;

public class addClassify extends HttpServlet {
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
    }
    public void service(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException {
        request.setCharacterEncoding("utf-8");
        GoodsClassify classifyBean = new GoodsClassify();
        request.setAttribute("classifyBean",classifyBean);
        /*类别号 classNumber     类别名称 name*/
        String name = request.getParameter("name").trim();

        boolean boo = name.length()>0;

        String backNews = "";
        try {
            DBHandle.Connection();
            if (boo){
                String added = "SELECT * FROM goodsClassify WHERE name='"+name+"'";
                ResultSet rsAdded = DBHandle.SQLQuery(added);
                if (!rsAdded.next()){
                    String insertClassify = "INSERT INTO goodsClassify(name) VALUES(?)";
                    PreparedStatement sql = DBHandle.preSQL(insertClassify);
                    sql.setString(1,name);
                    if (sql.executeUpdate()!=0){
                        String getNumber = "SELECT classNumber FROM goodsClassify WHERE name='"+name+"'";
                        ResultSet rsGet = DBHandle.SQLQuery(getNumber);
                        rsGet.next();
                        backNews = "添加成功";
                        classifyBean.setBackNews(backNews);
                        classifyBean.setClassNumber(rsGet.getInt("classNumber"));
                        classifyBean.setName(name);
                    }
                }
                else {
                    backNews = "该类别已经添加";
                    classifyBean.setBackNews(backNews);
                }
            }
            else {
                backNews = "信息不能为空，添加失败";
                classifyBean.setBackNews(backNews);
            }
            DBHandle.close();
        } catch (NamingException e) {
            backNews = "没有设置连接池<br>"+e;
            classifyBean.setBackNews(backNews);
        } catch (SQLException e) {
            backNews = ""+e;
            e.printStackTrace();
            classifyBean.setBackNews(backNews);
        }
        finally {
            try {
                DBHandle.close();
                RequestDispatcher dispatcher = request.getRequestDispatcher("addClassify.jsp");
                dispatcher.forward(request,response);
            } catch (SQLException e) {
            }
        }
    }
}