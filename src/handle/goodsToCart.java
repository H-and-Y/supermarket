package handle;

import javax.naming.NamingException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class goodsToCart extends HttpServlet {
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
    }
    public void service(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException {
        request.setCharacterEncoding("utf-8");
        String goods_id = request.getParameter("goods_id");
        String account = request.getParameter("account");
        try {
            DBHandle.Connection();
            //该商品是否已在该用户的购物车中
            String queryCart = "SELECT * FROM shoppingCart WHERE account='"
                    +account+"' AND goods_id='"+goods_id+"'";
            ResultSet rs = DBHandle.SQLQuery(queryCart);
            int goods_number = 1;
            if (rs.next()){     //在，商品购买数量+1
                goods_number = rs.getInt("goods_number");
                goods_number++;
                String updateNumber = "UPDATE shoppingCart SET goods_number = '"+goods_number+
                        "' WHERE account='"+account+"' AND goods_id='"+goods_id+"'";
                DBHandle.SQLUpdate(updateNumber);
            }else {     //不在，商品数据加入购物车
                String findGoods = "SELECT * FROM goods WHERE goods_id='"+goods_id+"'";
                ResultSet rs2 = DBHandle.SQLQuery(findGoods);
                if (rs2.next()){       //商品列表里面有该商品
                    String goods_name = rs2.getString("goods_name");
                    float goods_price = rs2.getFloat("goods_price");
                    String toCart = "INSERT INTO shoppingCart VALUES(?,?,?,?,?)";
                    PreparedStatement pre = DBHandle.preSQL(toCart);
                    pre.setString(1,account);
                    pre.setString(2,goods_id);
                    pre.setString(3,goods_name);
                    pre.setFloat(4,goods_price);
                    pre.setInt(5,goods_number);
                    pre.executeUpdate();
                }else{
                    response.sendRedirect("goodsDetails.jsp");
                }
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
