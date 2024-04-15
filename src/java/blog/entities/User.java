/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package blog.entities;

/**
 *
 * @author AKASH
 */

import java.sql.*; 
public class User 
{
    private int id;
    private String name;
    private String email;
    private String password;
    private String gender;
    private String about;
    private Timestamp datetime;
    private String profile;
    
    
    
   public User()  // this is default constructor
    {
        
    }
    
   public User(int id , String name , String email , String password, String gender , String about , Timestamp datetime)  // this is all object 
    {
        this.id=id;
        this.name=name;
        this.email=email;
        this.password=password;
        this.gender=gender;
        this.about=about;
        this.datetime=datetime;
        
        
        
    }
    
  public  User(String name , String email , String password , String gender , String about  )// this is without constructor
    {
        this.name=name;
        this.email=email;
        this.password=password;
        this.gender=gender;
        this.about=about;
        
              
    }
    
    // getter and setter
    
    public void setId(int id)
    {
        this.id=id;
    }
    public int getId()
    {
        return id;
    }
    public void setName(String name)
    {
        this.name=name;
    }
    public String getName()
    { 
        return name;
    }
    public void setEmail(String email)
    {
        this.email=email;
    }
    public String getEmail()
    {
        return email;
    }
    public void setPassword(String password)
    { 
        this.password=password;
    }
    public String getPassword()
    {
        return password;
    }
    public void setGender(String gender)
    {
        this.gender=gender;
    }
    public String getGender()
    {
        return gender;
    }
    public void setAbout(String about)
    {
        this.about=about;
    }
    public String getAbout()
    {
        return about;
    }
    public void setDatetime(Timestamp datetime)
    {
        this.datetime=datetime;
    }
    public Timestamp getDatetime()
    {
        return datetime;
    }

    public String getProfile() {
        return profile;
    }

    public void setProfile(String profile) {
        this.profile = profile;
    }
    
    
 
}


