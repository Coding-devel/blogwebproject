/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package blog.servlets;

import blog.helper.ConnectionProvider;
import blog.dao.UserDao;
import blog.entities.User;
import blog.entities.Message;


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
public class LoginServlet extends HttpServlet {

  
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LoginServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            
            // fetch data from login page jsp
            
            String Username = request.getParameter("email");
            String Userpassword = request.getParameter("password");
            
            System.err.println(Username+","+Userpassword);
            
            UserDao dao = new UserDao(ConnectionProvider.getConnection());
            
            User u = dao.getEmailandPassword(Username, Userpassword);
            
      
            
            if(u==null)
            {
            
                // login...
                // show the error page
               // out.println("invalid details Try again!...");
               Message msg = new Message("Invalid Default ! try again ", "error", "alert-danger");
               HttpSession s = request.getSession();
               s.setAttribute("msg" , msg);
              
                
               response.sendRedirect("loginpage.jsp");
            }
            else
            {
               // System.out.println(Username);
                // login success
                // show // aap yah par cookies set kar sakte h
                HttpSession s = request.getSession();
                s.setAttribute("currentUser" , u);
                out.println("Ok");
                response.sendRedirect("profile.jsp");
            }
            
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
