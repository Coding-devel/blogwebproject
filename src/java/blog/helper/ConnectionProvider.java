/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package blog.helper;

import java.sql.*;
public class ConnectionProvider 
{
    private static Connection con;
    public static Connection getConnection()
    {
        
        try{
           if(con==null)
           {
               // load the driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            // create a connections
            con=DriverManager.
                    getConnection("jdbc:mysql://localhost:3306/raj?useSSL=false", "root", "root");
                  System.out.println("hello nsfdkn");
           }
            
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        
        
        
        return con;
    }
}
