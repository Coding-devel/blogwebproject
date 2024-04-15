/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package blog.dao;
import blog.entities.User;
import java.sql.*;
public class UserDao 
{
    
    private Connection con;
    
    public UserDao(Connection con)
    {
        this.con=con;
    }
    
    // methods to insert user to databases;
    
    public boolean saveUser(User user)
    {
        
        boolean f=false;
        try{
            // insert into databases
            // create a query
            // insert into table ()
            String query="insert into akash(name,email,password,gender,about) values(?,?,?,?,?)";
            PreparedStatement psmt = this.con.prepareStatement(query);
            psmt.setString(1,user.getName());
            psmt.setString(2,user.getEmail());
            psmt.setString(3,user.getPassword());
            psmt.setString(4,user.getGender());
            psmt.setString(5,user.getAbout());
            
         //   System.out.println(1,user.getName());
            
            psmt.executeUpdate();
            f=true;
           
   
            
        }catch(SQLException e)
        {
            e.printStackTrace();
        }
        return f;
    }
        
    
    // user get by usergetemailandpassword
    public User getEmailandPassword(String email , String password)
    {
        User user=null;
        
        try {
            
            String query = "select * from akash  where email=? and password=?";
            PreparedStatement psmt = con.prepareStatement(query);
                    psmt.setString(1,email);
                    psmt.setString(2,password);
                    System.out.println(psmt.toString());
                    ResultSet set = psmt.executeQuery();
                   
                   
                    if(set.next())
                    {
                        user = new User();
                        // data from db

                        String name = set.getString("name");
                         //  set to the  user object
                        user.setName(name);
                        user.setId(set.getInt("id"));
                        user.setEmail(set.getString("email"));
                        user.setPassword(set.getString("password"));
                        user.setGender(set.getString("gender"));
                        user.setAbout(set.getString("about"));
                        user.setDatetime(set.getTimestamp("Tdate"));     
                        user.setProfile(set.getString("profile"));
                        
                    }
                            
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        
        return user;
    }
    
    public boolean updateUser(User user)
    {
        
      //  System.err.println("MRCOOCK:"+user.getProfile());
        
        try 
        {
            String query="update akash set name=? , email=? , password=? , gender=? , about=? , profile=? where  id=?";
            PreparedStatement p = con.prepareStatement(query);
            p.setString(1,user.getName());
            p.setString(2,user.getEmail());
            p.setString(3,user.getPassword());
            p.setString(4,user.getGender());
            p.setString(5,user.getAbout());
            p.setString(6,user.getProfile());
            p.setInt(7,user.getId());
            
            
            p.executeUpdate();
            return true;
        }
        catch(Exception e)
        {
            e.printStackTrace();
            return false;
        }
        
        
        
        
        // for deleting user all delete
        
        
        
    }
    
}
