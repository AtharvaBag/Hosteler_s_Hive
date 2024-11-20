package controller;

import dto.Admin_DTO;
import dto.Hostel_DTO;
import java.io.IOException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Admin_Hostel_Name_Authenticator;

/**
 *
 * @author Atharva Bagdare
 */
public class Admin_Hostel_Name_Getter extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException
    {
        response.sendRedirect("admin_login.html");
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException
    {
        String hostelid=request.getParameter("hostelid");
        String ownerid=request.getParameter("ownerid");
        System.out.println("Admin_Hostel_Name_Getter "+hostelid+" "+ownerid);
        Admin_DTO obj = new Admin_DTO();
        obj.setOwnerid(ownerid);
        obj.setHostelid(hostelid);
        
        System.out.println("From Admin_DTO: ownerid="+obj.getOwnerid()+" hostelid="+obj.getHostelid());
        
        Admin_Hostel_Name_Authenticator obj2 = new Admin_Hostel_Name_Authenticator();
        Hostel_DTO obj3=(obj2.getInfo(obj));
        HttpSession session = request.getSession(true);
        String valid=obj2.getValid(obj3);
        session.setAttribute("hostelid",hostelid);
        session.setAttribute("ownerid",ownerid);
        session.setAttribute("obj3",obj3);
        session.setAttribute("valid",valid);
        response.sendRedirect("Admin_Hostel_Verify.jsp");  
        
    }
}
