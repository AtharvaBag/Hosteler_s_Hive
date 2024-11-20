package controller;

import dto.Hostel_DTO;
import java.io.IOException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Admin_Validate_Hostel;

/**
 *
 * @author Atharva Bagdare
 */
public class Admin_Hostel_Status extends HttpServlet 
{
        public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException
        {
            response.sendRedirect("admin_login.html");
        }
        public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException
        {
            String valid="1";
            HttpSession session = request.getSession(true);
            session.setAttribute("valid", valid);
            Hostel_DTO obj = (Hostel_DTO)session.getAttribute("obj3");
            Admin_Validate_Hostel obj1 = new Admin_Validate_Hostel();
            obj1.validHostel(obj);
            response.sendRedirect("admin_page.jsp");
        }
}
