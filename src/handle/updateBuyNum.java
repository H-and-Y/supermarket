package handle;

import javax.naming.NamingException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

public class updateBuyNum extends HttpServlet {
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
    }
    public void service(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException {
        request.setCharacterEncoding("utf-8");
        String account = request.getParameter("account"),
                goods_id = request.getParameter("goods_id");
        int goods_number = Integer.parseInt(request.getParameter("goods_number"));
        try {
            DBHandle.Connection();
            String getInventory = "SELECT inventory FROM goods WHERE goods_id='"+goods_id+"'";
            ResultSet rs = DBHandle.SQLQuery(getInventory);
            if (rs.next()){
                int inventory = rs.getInt("inventory");
                if (goods_number<=inventory){
                    String updeteNum = "UPDATE shoppingCart SET goods_number = '"+goods_number+
                            "' WHERE account='"+account+"' AND goods_id='"+goods_id+"'";
                    DBHandle.SQLUpdate(updeteNum);
                }else{
                    //库存不足
                    response.getWriter().print("商品库存不足");
                }
            }else {
                //商品不存在
                response.getWriter().print("商品不存在");
            }
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
