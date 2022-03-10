package handle;

import save.*;
import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.naming.NamingException;

public class Exit extends HttpServlet {
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
    }
    public void service(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException {
        request.setCharacterEncoding("utf-8");
        try {

        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            response.sendRedirect("index.jsp");
        }
    }
}
