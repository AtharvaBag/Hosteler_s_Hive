
package controller;

import dto.Hostel_DTO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Admin_Hostel_Deletion;

/**
 *
 * @author Atharva Bagdare
 */
public class Admin_Hostel_Delete_Confirm extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException
    {
        response.sendRedirect("admin_login.html");
    }
    
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException
    {
        HttpSession session = request.getSession(true);
        Hostel_DTO obj = (Hostel_DTO)session.getAttribute("obj3");
        String hostelid = obj.getHostelid();
        Admin_Hostel_Deletion obj2 = new Admin_Hostel_Deletion();
        if(obj2.deleteHostel(hostelid))
        {
            System.out.println("Hostel Deleted");
            response.sendRedirect("admin_page.jsp");
        }
        else
        {
            System.out.println("Hostel not deleted!");
            response.sendRedirect("Admin_Hostel_Verify.jsp");
        }
    }
}
