/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package blog.entities;

/**
 *
 * @author AKASH
 */
public class Category 
{
    private int cid;
    private String name;
    private String description;
    
    public Category(int cid,String name,String description)
    {
        this.cid=cid;
        this.name=name;
        this.description=description;
        
        
    }
    /// 
    public Category()
    {
        
    }
    public Category(String name , String description)
    {
        this.name=name;
        this.description=description;
    }
    
    // create and gettter and setter
    
    public void setCid(int cid)
    {
        this.cid=cid;
    }
    public int getCid()
    {
        return cid;
    }
    public void setName(String name)
    {
        this.name=name;
    }
    public String getName()
    {
        return name;
    }
    public void setDescription(String description)
    {
        this.description=description;
    }
    public String getDescription()
    {
        return description;
    }
    
    
}
