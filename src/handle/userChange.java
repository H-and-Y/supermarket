package handle;

import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "userChange")
public class userChange extends HttpServlet {
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
    }
    public void service(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException {
        request.setCharacterEncoding("utf-8");
        String user = request.getParameter("user"),
                admin = request.getParameter("admin");
        try {
            DBHandle.Connection();
            String userChange = request.getParameter("userChange").trim(),
                    changeText = request.getParameter("changeText").trim();
            String backNews = "";
            boolean boo = userChange.length()>0&&changeText.length()>0;
            if (boo){
                if (userChange.equals("password")){
                    changeText = Encrypt.encrypt(changeText,"javajsp");     //密码加密
                }
                String change = "UPDATE user SET "+userChange+"='"+changeText+"' WHERE account='"
                        + getServletContext().getAttribute("account")+"'";
                int numOfRows = DBHandle.SQLUpdate(change);
                if (numOfRows>0){
                    //修改成功
                    backNews = "修改成功";
                    getServletContext().setAttribute("backNews",backNews);
                }else {
                    backNews = "修改失败";
                    getServletContext().setAttribute("backNews",backNews);
                }
            }else {
                //信息不能为空，修改失败
                backNews = "信息不能为空，修改失败";
                getServletContext().setAttribute("backNews",backNews);
            }
            DBHandle.close();
        } catch (NamingException e) {
            e.printStackTrace();
            String backNews = ""+e;
            getServletContext().setAttribute("backNews",backNews);
        } catch (SQLException e) {
            e.printStackTrace();
            String backNews = ""+e;
            getServletContext().setAttribute("backNews",backNews);
        }
        finally {
            try {
                DBHandle.close();
                if (user!=null){
                    RequestDispatcher dispatcher = request.getRequestDispatcher("myself.jsp");
                    dispatcher.forward(request,response);
                }else if (admin!=null){
                    RequestDispatcher dispatcher = request.getRequestDispatcher("userChange.jsp");
                    dispatcher.forward(request,response);
                }
            } catch (SQLException e) {
                e.printStackTrace();
                String backNews = ""+e;
                getServletContext().setAttribute("backNews",backNews);
            }
        }
    }
}
