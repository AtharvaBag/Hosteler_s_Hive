package controller;

import dto.Owner_DTO;
import java.io.IOException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Admin_Get_Owner_Details_Class;

/**
 *
 * @author Atharva Bagdare
 */
public class Admin_Get_Owner_Details extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException
    {
        response.sendRedirect("admin_login.html");
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException
    {
        HttpSession session = request.getSession(true);
        String hostelid = (String)session.getAttribute("hostelid");
        String ownerid = (String)session.getAttribute("ownerid");
        
        Admin_Get_Owner_Details_Class get = new Admin_Get_Owner_Details_Class();
        Owner_DTO owner_details_obj = get.ownerDetails(ownerid);
        session.setAttribute("owner_details_obj",owner_details_obj);
        response.sendRedirect("Admin_Owner_Details.jsp");
    
    }
}
