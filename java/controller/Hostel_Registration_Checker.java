package controller;

import java.io.IOException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dto.Hostel_DTO;
import javax.servlet.http.HttpSession;
import model.Hostel_Registration_Authenticator;

public class Hostel_Registration_Checker extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException
    {
        response.sendRedirect("login.html");
    }
    
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException
    {
        String hostelname = request.getParameter("hostelname");
        String hosteladdress = request.getParameter("hosteladdress");
        String hostellandmark = request.getParameter("hostellandmark");
        String hostelpin=request.getParameter("hostelpin");
        String hostelcity = request.getParameter("hostelcity");
        String hostelstate = request.getParameter("hostelstate");
        String hosteltype = request.getParameter("hosteltype");
        String hostelboysroom = request.getParameter("hostelboysroom");
        String hostelgirlsroom = request.getParameter("hostelgirlsroom");
        String hostelextraamenities = request.getParameter("hostelextraamenities");
        String hostelrent = request.getParameter("hostelrent");
        String hostelcontact = request.getParameter("hostelcontact");
        String hostelemailid = request.getParameter("hostelemailid");
        String airconditioner = request.getParameter("airconditioner");
        String mess = request.getParameter("mess");
        String wifi = request.getParameter("wifi");
        String kitchen = request.getParameter("kitchen");
        String lockers = request.getParameter("lockers");
        String laundry = request.getParameter("laundry");
        String hostelid=null;
        String ownerid=null;
        
        Hostel_DTO obj = new Hostel_DTO();
        
        obj.setHostelid(hostelid);
        obj.setHostelname(hostelname);
        obj.setHosteladdress(hosteladdress);
        obj.setHostellandmark(hostellandmark);
        obj.setHostelpin(hostelpin);
        obj.setHostelcity(hostelcity);
        obj.setHostelstate(hostelstate);
        obj.setHosteltype(hosteltype);
        obj.setHostelboysroom(hostelboysroom);
        obj.setHostelgirlsroom(hostelgirlsroom);
        obj.setAirconditioner(airconditioner);
        obj.setMess(mess);
        obj.setWifi(wifi);
        obj.setKitchen(kitchen);
        obj.setLockers(lockers);
        obj.setLaundry(laundry);
        obj.setHostelextraamenities(hostelextraamenities);
        obj.setHostelrent(hostelrent);
        obj.setHostelcontact(hostelcontact);
        obj.setHostelemailid(hostelemailid);
    
        Hostel_Registration_Authenticator reg = new Hostel_Registration_Authenticator();
        
        if(reg.isValid(obj))
        {
                     
                     HttpSession session =request.getSession(true);
                     ownerid = (String)session.getAttribute("ownerid");
                     hostelid=obj.getHostelid();
                    reg.adminTableRegistration(obj, ownerid);
                    response.sendRedirect("Owner_Home.jsp");
        }
        else
        {
                response.sendRedirect("hostel_register.html");
        }
    }
}