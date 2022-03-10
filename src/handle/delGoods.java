package handle;

import javax.naming.NamingException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

public class delGoods extends HttpServlet {
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
    }
    public void service(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException {
        request.setCharacterEncoding("utf-8");
        String goods_id = request.getParameter("goods_id");
        try {
            DBHandle.Connection();
            String delGoods = "DELETE FROM goods WHERE goods_id='"+goods_id+"'";
            DBHandle.SQLUpdate(delGoods);
        } catch (NamingException e) {
            e.printStackTrace();
            response.getWriter().print(""+e);
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().print(""+e);
        }finally {
            try {
                DBHandle.close();
                response.sendRedirect("salesHome.jsp");
            } catch (SQLException e) {
                e.printStackTrace();
                response.getWriter().print(""+e);
            }
        }
    }
}
