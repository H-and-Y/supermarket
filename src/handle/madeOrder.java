package handle;

import javax.naming.NamingException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class madeOrder extends HttpServlet {
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
    }
    public void service(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException {
        request.setCharacterEncoding("utf-8");
        String account = request.getParameter("account");
        try {
            DBHandle.Connection();
            String findGoods = "SELECT * FROM shoppingCart WHERE account='"+account+"'";    //找到用户购物车商品
            ResultSet rs = DBHandle.SQLQuery(findGoods);
            float sum = 0;
            StringBuffer buffer = new StringBuffer();
            while (rs.next()){
                String goods_id = rs.getString("goods_id"),
                        goods_name = rs.getString("goods_name");
                float goods_price = rs.getFloat("goods_price");
                int goods_number = rs.getInt("goods_number");
                sum += goods_price*goods_number;
                buffer.append("<br>商品标识号："+goods_id+"<br>名称："+goods_name+
                        "<br>单价："+goods_price+"<br>数量："+goods_number);
                String goodsUpdate = "UPDATE goods SET inventory=inventory-'"
                        +goods_number+"' WHERE goods_id='"+goods_id+"'";
                DBHandle.SQLUpdate(goodsUpdate);
            }
            buffer.append("<br>总价："+sum);
            String insertOreder = "INSERT INTO goodsOrder VALUES(?,?,?)";       //数据插入订单表
            PreparedStatement pre = DBHandle.preSQL(insertOreder);
            pre.setInt(1,0);
            pre.setString(2,account);
            pre.setString(3,new String(buffer));
            pre.executeUpdate();
            String delCart = "DELETE FROM shoppingCart WHERE account='"+account+"'";    //删除用户购物车
            DBHandle.SQLUpdate(delCart);
        } catch (NamingException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            try {
                DBHandle.close();
                response.sendRedirect("payOrder.jsp");
            } catch (SQLException e) {
                e.printStackTrace();
                response.getWriter().print(""+e);
            }
        }
    }
}
