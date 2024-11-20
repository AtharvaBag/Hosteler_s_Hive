package controller;

import dto.Hostel_DTO;
import java.io.IOException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Hostel_Details_Provider;


public class Hostel_Name_Getter extends HttpServlet {
    
        public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException
        {
            response.sendRedirect("login.html");
        }
        
        public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException
        {
            String hostelname=request.getParameter("hostelname");
            String hostelid=request.getParameter("hostelid");
            HttpSession session = request.getSession(true);
            session.setAttribute("hostelname",hostelname);
            session.setAttribute("hostelid",hostelid);
            
            Hostel_Details_Provider obj = new Hostel_Details_Provider();
            Hostel_DTO hostel_obj = obj.getHostelDetails(hostelid);
            session.setAttribute("hostel_obj",hostel_obj);
            
            String valid = obj.getValidInfo(hostelid);
            session.setAttribute("valid",valid);
            response.sendRedirect("Hostel_Data_Update.jsp");
        }
}