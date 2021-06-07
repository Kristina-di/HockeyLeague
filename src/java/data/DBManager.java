/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package data;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author diask
 */
public class DBManager {
    String conn = "jdbc:mysql://localhost:3306/hockeyleaguedb";
    String user = "root";
    String pass = "dbpass";
    
    public Connection getConnection()
    {
        Connection con = null;
        try{
    Class.forName("com.mysql.jdbc.Driver");
    con=DriverManager.getConnection(conn, user, pass);
}catch(Exception e){
    System.out.println("error getting connection"+e);
}
return con;
    }
    
    public ResultSet executeQuery(String sql){
        ResultSet rs = null;
    try{
    Connection con = getConnection();
    if(con !=null){
        Statement st = con.createStatement();
        rs = st.executeQuery(sql);
    }
}catch(Exception e){
    System.out.println("error executing query");
}
    return rs;
    }
    
    public int executeUpdate(String sql){
        int update = -1;
        try{
            Connection con = getConnection();
            if(con != null){
                Statement st = con.createStatement();
                update = st.executeUpdate(sql);
            }            
        }catch(Exception e){
            System.out.println("Error execute update "+e);
        }
        return update;
        
    }

}
