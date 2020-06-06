package com.couriersystem;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class ConnectionPool extends javax.servlet.http.HttpServlet implements javax.servlet.Servlet {

public ConnectionPool() {
super();
}
private static Connection con=null;
public static Connection getConnection()
{
try
{
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	con=DriverManager.getConnection("jdbc:odbc:speedagedsn","speedage","speedage");
/* The Below Two Statements are for MySQL DataBase
 * Class.forName("com.mysql.jdbc.Driver");
 * con = java.sql.DriverManager.getConnection("jdbc:mysql://localhost:3306/SpeedAge", "root", "root"); */
//Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
//con = java.sql.DriverManager.getConnection("jdbc:odbc:NetworkAsset","root","");

if (con != null) {
System.out.println("Connection Pool Database Connection Success");
}
}catch(final ClassNotFoundException cfe)
{
System.out.println("....."+cfe);
}catch(final SQLException se)
{
System.out.println("--------"+se);

}

return con;
}


}


