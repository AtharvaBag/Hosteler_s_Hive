package controller;

import dto.Admin_DTO;
import java.io.IOException;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Admin_Login_Authenticator;

/**
 *
 * @author Atharva Bagdare
 */
public class Admin_Login_Check extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException
    {
        response.sendRedirect("home.html");
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        String adminid=request.getParameter("adminid");
        String adminpassword=request.getParameter("adminpassword");
        
        Admin_DTO obj=new Admin_DTO();
        
       obj.setAdminid(adminid);
        obj.setAdminpassword(adminpassword);
        
        Admin_Login_Authenticator check = new Admin_Login_Authenticator();
        if(check.isValid(obj))
        {
            HttpSession session = request.getSession(true);
            session.setAttribute("adminid",adminid );
            session.setAttribute("adminpassword",adminpassword);
            response.sendRedirect("admin_page.jsp"); 
        }
        else
        {
            response.sendRedirect("admin_login.html");
        }
    }
}
