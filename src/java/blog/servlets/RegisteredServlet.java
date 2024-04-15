/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package blog.servlets;

import blog.helper.ConnectionProvider;
import blog.dao.UserDao;
import blog.entities.User;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author AKASH
 */
@MultipartConfig
public class RegisteredServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
        
            
            // fetch all the data from form 
            
            String check = request.getParameter("reddis");
            
            if(check==null)
            { 
                out.println("box not checked please checked the box");
            }
            else
            {
//                  s
                   String name = request.getParameter("User_name");
                   String email = request.getParameter("User_email");
                   String password = request.getParameter("User_password");
                   
                   System.out.println("KTT:"+password);
                   
                   String gender = request.getParameter("Gender");
                   String about = request.getParameter("About");

//            // data access in the form and put in a User object
            User user = new  User(name , email , password , gender , about);



//     // create userdao object and create connections and call the save functions put the object in Save functions
              UserDao  daow = new UserDao(ConnectionProvider.getConnection());
              if(daow.saveUser(user))
              {
                  
                  out.println("done ");  
              }
              else{
                  out.println("you already registred..");
                          
              }
              
            }

                 
                    
            
            

        }
    }

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
