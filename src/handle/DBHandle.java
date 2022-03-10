package handle;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.*;

public class DBHandle {
    static public Connection con = null;
    static public Statement sql;
    static public PreparedStatement preSQL;
    static public void Connection() throws NamingException, SQLException {
        Context context = new InitialContext();
        Context contextNeeded = (Context)context.lookup("java:comp/env");
        DataSource ds = (DataSource)contextNeeded.lookup("smConn");     //获得连接池
        con = ds.getConnection();       //使用连接池中的连接
    }
    static public ResultSet SQLQuery(String condition) throws SQLException {    //进行查询操作，返回结果集
        sql = con.createStatement();
        ResultSet rs = sql.executeQuery(condition);
        return rs;
    }
    static public int SQLUpdate(String condition) throws SQLException {     //进行更改操作，返回更改行数
        sql = con.createStatement();
        int result = sql.executeUpdate(condition);
        return result;
    }
    static public PreparedStatement preSQL(String condition) throws SQLException {
        preSQL = con.prepareStatement(condition);
        return preSQL;
    }
    static public void close() throws SQLException {
        con.close();
    }
}
