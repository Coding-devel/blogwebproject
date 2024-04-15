/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package blog.dao;
import java.sql.*;
import blog.entities.Post;
import java.sql.Statement;

import java.util.ArrayList;
import blog.entities.Category;
/**
 *
 * @author AKASH
 */
public class PostDao {
    public Connection con;
    
    public PostDao(Connection con)
    {
        this.con = con;
    }
    
    public ArrayList<Category> getAllCategories()         
    {
        ArrayList<Category> list = new ArrayList<>();
        
        try{
            
            String q = "select * from categories";
            Statement st = this.con.createStatement();
            
            ResultSet set = st.executeQuery(q);
            while(set.next())
            {
                int cid=set.getInt("cid");
                String name=set.getString("name");
                String description=set.getString("description");
                
                Category c = new Category(cid, name , description);
                list.add(c);
            }
            
    
        
        }catch(java.lang.NullPointerException r)  
        {
            r.printStackTrace();
        }catch(Exception e)
        {
            e.printStackTrace();
        }
      
       
        return list;
    }
    
    
    
    public boolean savePost(Post p)
    {
        boolean f = false;
        
        
        try{
            
            String q = "insert into posts (pTitle , pContent , pCode , pPic , catId , userId ) values (?,?,?,?,?,?)";
            PreparedStatement psmt = con.prepareStatement(q);
            psmt.setString(1 , p.getpTitle());
            psmt.setString(2, p.getpContent());
            psmt.setString(3, p.getpCode());
            psmt.setString(4,p.getpPic());
            psmt.setInt(5,p.getCatId());
            psmt.setInt(6, p.getUserId());
            
            psmt.executeUpdate();
            
            f=true;
            
            
        }catch(Exception e )
        {
            e.printStackTrace();
        }
        
        
        return f;
    }
    
}
