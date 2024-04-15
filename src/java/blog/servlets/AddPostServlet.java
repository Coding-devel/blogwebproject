/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package blog.servlets;


import java.io.IOException;
import java.io.PrintWriter;


import blog.entities.User;
import blog.entities.Post;
import blog.dao.PostDao;
import blog.helper.Helper;
import blog.helper.ConnectionProvider;
import jakarta.servlet.http.Part;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpSession;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.File;
import java.util.Iterator;

/**
 *
 * @author AKASH
 */
@MultipartConfig
public class AddPostServlet extends HttpServlet 
{

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
            throws ServletException, IOException ,java.lang.NumberFormatException
    {
        response.setContentType("text/html;charset=UTF-8");
        
        Iterator<String> asIterator = request.getParameterNames().asIterator();
        while(asIterator.hasNext()){
            System.out.println("KUTTA:"+asIterator.next());
        }
        
        try (PrintWriter out = response.getWriter())
        {
            /* TODO output your page here. You may use following sample code. */
            
            
            //

             
            int Cid;  // error occured in line 
            Cid = Integer.parseInt(request.getParameter("cid"));
            
            
            
            String pTitle = request.getParameter("pTitle");
            String pcontent = request.getParameter("pContent");
            String pcode = request.getParameter("pCode");
            
                  
            Part part = request.getPart("Pic");
            out.println("your post title is " + pTitle);
            out.println(part.getSubmittedFileName());
            //getting currentuser id
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("currentUser");
            
  
            
            Post p = new Post(pTitle , pcontent , pcode , part.getSubmittedFileName() , null , Cid , user.getId());
            
            PostDao dao = new PostDao(ConnectionProvider.getConnection());
            
            if(dao.savePost(p))
            {
                
                String path = request.getRealPath("/") + "blog_Pics" + File.separator + part.getSubmittedFileName();
                Helper.saveFile(part.getInputStream(),path);
                out.println("done");
            }
            else
            {
                out.println("error");
            }
            
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
