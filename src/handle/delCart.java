package handle;

import javax.naming.NamingException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

public class delCart extends HttpServlet {
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
    }
    public void service(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException {
        request.setCharacterEncoding("utf-8");
        String account = request.getParameter("account"),
                goods_id = request.getParameter("goods_id");
        try {
            DBHandle.Connection();
            String delCart = "DELETE FROM shoppingCart WHERE account='"+account+"' AND goods_id='"+goods_id+"'";
            DBHandle.SQLUpdate(delCart);
        } catch (NamingException e) {
            e.printStackTrace();
            response.getWriter().print(""+e);
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().print(""+e);
        }finally {
            try {
                DBHandle.close();
                response.sendRedirect("shoppingCart.jsp");
            } catch (SQLException e) {
                e.printStackTrace();
                response.getWriter().print(""+e);
            }
        }
    }
}
