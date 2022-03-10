package handle;

import save.RegisterBean;

import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.naming.NamingException;

public class Register extends HttpServlet {
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
    }
    public void service(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException {
            request.setCharacterEncoding("utf-8");
            RegisterBean registerBean = new RegisterBean();
            request.setAttribute("registerBean",registerBean);
            String account = request.getParameter("account").trim(),
                    password = request.getParameter("password").trim(),
                    againPassword = request.getParameter("againPassword").trim(),
                    nickName = request.getParameter("nickName").trim(),
                    phone = request.getParameter("phone").trim(),
                    address = request.getParameter("address").trim(),
                    realName = request.getParameter("realName").trim();
        if (!password.equals(againPassword)){
            registerBean.setBackNews("两次密码不同，注册失败");
            RequestDispatcher dispatcher = request.getRequestDispatcher("register.jsp");
            dispatcher.forward(request,response);
            return;
        }
        boolean boo = account.length()>0&&password.length()>0&&againPassword.length()>0&&nickName.length()>0;
        String backNews = "";
        try {
            DBHandle.Connection();
            String condition = "INSERT INTO user VALUES(?,?,?,?,?,?)";
            PreparedStatement sql = DBHandle.preSQL(condition);
            if (boo){
                sql.setString(1,account);
                password = Encrypt.encrypt(password,"javajsp");
                sql.setString(2,password);
                sql.setString(3,nickName);
                sql.setString(4,phone);
                sql.setString(5,address);
                sql.setString(6,realName);
                if (sql.executeUpdate()!=0){
                    backNews = "注册成功";
                    registerBean.setBackNews(backNews);
                }
            }
            else {
                backNews = "带*的信息不能为空，注册失败";
                registerBean.setBackNews(backNews);
            }
            DBHandle.close();
        } catch (NamingException e) {
            backNews = "没有设置连接池<br>"+e;
            registerBean.setBackNews(backNews);
        } catch (SQLException e) {
            backNews = "账号已经被使用<br>"+e;
            registerBean.setBackNews(backNews);
        }
        finally {
            try {
                DBHandle.close();
            } catch (SQLException e) {

            }
            RequestDispatcher dispatcher = request.getRequestDispatcher("register.jsp");
            dispatcher.forward(request,response);
        }
    }
}