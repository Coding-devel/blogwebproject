/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package blog.servlets;

import blog.entities.User;
import blog.dao.UserDao;
import blog.entities.Message;
import blog.helper.ConnectionProvider;
import blog.helper.Helper;
import java.io.File;
//import java.imageio.ImageIO;
import jakarta.servlet.http.Part;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author AKASH
 */
@MultipartConfig
public class EditServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EditServlet</title>");
            out.println("</head>");
            out.println("<body>");
            // fetch all data 
            // editing data store in a databases

            String userName = request.getParameter("user_Name");
            String userEmail = request.getParameter("user_email");
            String userPassword = request.getParameter("user_password");
            String userAbout = request.getParameter("user_about");
//            String userProfilepic = request.getParameter("image");
            Part part = request.getPart("image");
            String imageName = part.getSubmittedFileName();
//            out.println(userName);
//            out.println(imageName);

            // get the user from the session ....
            HttpSession s = request.getSession();
            User user=(User)s.getAttribute("currentUser");
            user.setEmail(userEmail);
            user.setName(userName);
            user.setPassword(userPassword);
            user.setAbout(userAbout);
            String oldFile = user.getProfile();
            
            user.setProfile(imageName);
            

            // update in database
            UserDao userdao1 = new UserDao(ConnectionProvider.getConnection());
            boolean ans = userdao1.updateUser(user);
            
            
            System.out.println("EDIT:"+user.getPassword());
            if (ans)   
        {

                String path = request.getRealPath("/") + "Pics" + File.separator + user.getProfile();

//                if (Helper.deleteFile(path))
//                {
                //delete old profile
                String oldFile1 = request.getRealPath("/") + "Pics" + File.separator + oldFile;
                Helper.deleteFile(oldFile1);
                
          //folder decision
                
                // if 
         if(!oldFile1.equals("default.png"))   /// check kar rha kevl photo se
         {
            Helper.deleteFile(oldFile1);
                

                if(Helper.saveFile(part.getInputStream(), path) ) {

                    out.println("profile upadated successfully");

                    Message msg = new Message("profile  details updated successfully", "success", "alter-success");
 
                    s.setAttribute("msg", msg);
                    
                    

                } else {
                    ///////////////////
//                    out.println("no updated.");
                    Message msg = new Message("something went wrong.... ", "error", "alert-danger");
                    s.setAttribute("msg", msg);

                }
                
        
           
            
         }
         
            } else {

                out.println("not updated");
                Message msg = new Message("something went wrong.... ", "error", "alert-danger");
                s.setAttribute("msg", msg);
            }

            /// response login page par
            response.sendRedirect("profile.jsp");
            out.println("</body>");
            out.println("</html>");
        }
    }

// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
