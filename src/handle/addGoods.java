package handle;

import save.*;
import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.naming.NamingException;

public class addGoods extends HttpServlet {
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
    }
    public void service(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException {
        request.setCharacterEncoding("utf-8");
        Goods goodsBean = new Goods();
        request.setAttribute("goodsBean",goodsBean);
        /*商品标识号 goods_id      商品名称 goods_name     价格 goods_price
        制造商 goods_made         图片 goods_pic     商品介绍 goods_mess
        所属类别 classNumber       库存 inventory*/
        String goods_id = request.getParameter("goods_id").trim(),
                goods_name = request.getParameter("goods_name").trim();
        float goods_price = Float.parseFloat(request.getParameter("goods_price").trim());
        String goods_made = request.getParameter("goods_made").trim(),
                goods_pic = request.getParameter("goods_pic").trim(),
                goods_mess = request.getParameter("goods_mess").trim();
        int classNumber = Integer.parseInt(request.getParameter("classNumber").trim()),
                inventory = Integer.parseInt(request.getParameter("inventory").trim());

        boolean boo = goods_id.length()>0&& goods_name.length()>0&&
                goods_price>=0&&goods_made.length()>0&&
                goods_pic.length()>0&&goods_mess.length()>0&&
                classNumber>=0&&inventory>=0;

        String backNews = "";
        try {
            DBHandle.Connection();
            if (boo){
                String added = "SELECT * FROM goods WHERE goods_id='"+goods_id+"'";
                ResultSet rsAdded = DBHandle.SQLQuery(added);
                if (!rsAdded.next()){
                    String ifClassify = "SELECT * FROM goodsClassify WHERE classNumber='"+classNumber+"'";
                    ResultSet rs = DBHandle.SQLQuery(ifClassify);
                    if (rs.next()){
                        String insertGoods = "INSERT INTO goods VALUES(?,?,?,?,?,?,?,?)";
                        PreparedStatement sql = DBHandle.preSQL(insertGoods);
                        sql.setString(1,goods_id);
                        sql.setString(2,goods_name);
                        sql.setFloat(3,goods_price);
                        sql.setString(4,goods_made);
                        sql.setString(5,goods_pic);
                        sql.setString(6,goods_mess);
                        sql.setInt(7,classNumber);
                        sql.setInt(8,inventory);
                        if (sql.executeUpdate()!=0){
                            backNews = "添加成功";
                            goodsBean.setBackNews(backNews);
                            goodsBean.setGoods_id(goods_id);
                            goodsBean.setGoods_name(goods_name);
                            goodsBean.setGoods_price(goods_price);
                            goodsBean.setGoods_made(goods_made);
                            goodsBean.setGoods_pic(goods_pic);
                            goodsBean.setGoods_mess(goods_mess);
                            goodsBean.setClassNumber(classNumber);
                            goodsBean.setInventory(inventory);
                        }
                    }
                    else {
                        backNews = "没有找到该类别，添加失败";
                        goodsBean.setBackNews(backNews);
                    }
                }
                else {
                    backNews = "该商品已经添加";
                    goodsBean.setBackNews(backNews);
                }
            }
            else {
                backNews = "信息不能为空，添加失败";
                goodsBean.setBackNews(backNews);
            }
            DBHandle.close();
        } catch (NamingException e) {
            backNews = "没有设置连接池"+e;
            goodsBean.setBackNews(backNews);
        } catch (SQLException e) {
            backNews = ""+e;
            goodsBean.setBackNews(backNews);
        }
        finally {
            try {
                DBHandle.close();
                RequestDispatcher dispatcher = request.getRequestDispatcher("addGoods.jsp");
                dispatcher.forward(request,response);
            } catch (SQLException e) {
            }
        }
    }
}