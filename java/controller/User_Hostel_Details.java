package controller;

import dto.Hostel_DTO;
import java.io.IOException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.User_Hostel_Details_Finder;

public class User_Hostel_Details extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException
    {
        response.sendRedirect("home.html");
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException
    {
        String hostelname=request.getParameter("hostelname");
        String hosteladdress=request.getParameter("hosteladdress");
        String hostelcontact=request.getParameter("hostelcontact");
        
        System.out.println("From U_H_D Servlet: "+hostelname+" "+hosteladdress+" "+hostelcontact);
        User_Hostel_Details_Finder details = new User_Hostel_Details_Finder();
        Hostel_DTO hostel_details_obj = details.setDetails(hostelname, hosteladdress, hostelcontact);
        HttpSession session = request.getSession(true);
        session.setAttribute("hostel_details_obj", hostel_details_obj); 
        response.sendRedirect("User_Hostel_Details.jsp");
    }
}
