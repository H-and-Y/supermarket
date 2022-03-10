package handle;

import javax.naming.NamingException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

public class delClassify extends HttpServlet {
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
    }
    public void service(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException {
        request.setCharacterEncoding("utf-8");
        String classNumber = request.getParameter("classNumber");
        try {
            DBHandle.Connection();
            String delClassify = "DELETE FROM goodsClassify WHERE classNumber='"+classNumber+"'";
            DBHandle.SQLUpdate(delClassify);
        } catch (NamingException e) {
            e.printStackTrace();
            response.getWriter().print(""+e);
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().print(""+e);
        }finally {
            try {
                DBHandle.close();
                response.sendRedirect("goodsClassify.jsp");
            } catch (SQLException e) {
                e.printStackTrace();
                response.getWriter().print(""+e);
            }
        }
    }
}
