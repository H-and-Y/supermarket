package handle;

import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

public class goodsChange extends HttpServlet {
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
    }
    public void service(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException {
        request.setCharacterEncoding("utf-8");
        try {
            DBHandle.Connection();
            String goodsChange = request.getParameter("goodsChange").trim(),
                    changeText = request.getParameter("changeText").trim();
            if (goodsChange=="classNumber"||goodsChange=="inventory")
                Integer.parseInt(changeText);
            else if (goodsChange=="goods_price")
                Float.parseFloat(changeText);
            String backNews = "";
            boolean boo = goodsChange.length()>0&&changeText.length()>0;
            if (boo){
                String change = "UPDATE goods SET "+goodsChange+"='"+changeText+"' WHERE goods_id='"
                        + getServletContext().getAttribute("goods_id")+"'";
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
                response.sendRedirect("goodsChange.jsp");
            } catch (SQLException e) {
                e.printStackTrace();
                String backNews = ""+e;
                getServletContext().setAttribute("backNews",backNews);
            }
        }
    }
}
