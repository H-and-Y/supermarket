package handle;

import save.*;
import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.naming.NamingException;

public class Login extends HttpServlet {
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
    }
    public void service(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException {
        request.setCharacterEncoding("utf-8");
        String account = request.getParameter("account").trim(),
                password = request.getParameter("password").trim();
        password = Encrypt.encrypt(password,"javajsp");     //加密
        LoginBean userBean = new LoginBean();
        HttpSession session = request.getSession(true);
        session.setAttribute("userBean",userBean);
        try {
            boolean boo = (account.length() > 0) && (password.length() > 0);
            DBHandle.Connection();
            if (boo) {
                if (request.getParameter("user") != null){
                    String condition = "SELECT * FROM user WHERE account ='" + account +
                            "'AND password = '" + password + "'";
                    ResultSet rs = DBHandle.SQLQuery(condition);
                    if (rs.next()){
                        String nickName = rs.getString("nickName"),
                                phone = rs.getString("phone"),
                                address = rs.getString("address"),
                                realName = rs.getString("realName");
                        //登录成功
                        userBean.setAccount(account);
                        userBean.setNickName(nickName);
                        userBean.setAddress(address);
                        userBean.setPhone(phone);
                        userBean.setRealName(realName);
                        response.sendRedirect("home.jsp");
                    }
                    else {
                        String backNews = "账号或密码错误";
                        userBean.setBackNews(backNews);
                        response.sendRedirect("index.jsp");
                    }
                }
                else if (request.getParameter("salesman")!=null){
                    if (account.equals("salesman")&& password.equals("\u009B\u0093©\u0095")){
                        response.sendRedirect("salesHome.jsp");
                    }
                    else {
                        String backNews = "账号或密码错误";
                        userBean.setBackNews(backNews);
                        response.sendRedirect("index.jsp");
                    }
                }
                else if (request.getParameter("admin")!=null){
                    if (account.equals("admin")&& password.equals("ËÃÙÅ")){
                        response.sendRedirect("adminHome.jsp");
                    }
                    else {
                        String backNews = "账号或密码错误";
                        userBean.setBackNews(backNews);
                        response.sendRedirect("index.jsp");
                    }
                }
            }
            else {
                String backNews = "请输入用户名和密码";
                userBean.setBackNews(backNews);
                response.sendRedirect("index.jsp");
            }
        } catch (NamingException e) {
            e.printStackTrace();
            String backNews = "没有设置连接池"+e;
            userBean.setBackNews(backNews);
        } catch (SQLException e) {
            e.printStackTrace();
            userBean.setBackNews(""+e);
        } catch (IOException e) {
            e.printStackTrace();
            userBean.setBackNews(""+e);
        } finally {
            try {
                DBHandle.close();
            } catch (SQLException e) {
                e.printStackTrace();
                userBean.setBackNews(""+e);
            }
        }
    }
}
