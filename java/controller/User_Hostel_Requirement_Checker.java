package controller;

import dto.HostelDetails_DTO;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.User_Hostel_Provider;

public class User_Hostel_Requirement_Checker extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException
    {
        response.sendRedirect("home.html");
    }
    
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException
    {
        String inputstate = request.getParameter("inputstate");
        String inputcity = request.getParameter("inputcity");
        if(inputstate.equals("") || inputcity.trim().equals(""))
        {
            response.sendRedirect("home.html");
        }
        else
        {
        String inputpincode = request.getParameter("inputpincode");
        String inputhosteltype = request.getParameter("inputhosteltype");
        String inputannualrent = request.getParameter("inputannualrent");
        String inputextraamenity = request.getParameter("inputextraamenity").trim();
        String inputairconditioner = request.getParameter("inputairconditioner");
        String inputmess = request.getParameter("inputmess");
        String inputwifi = request.getParameter("inputwifi");
        String inputkitchen = request.getParameter("inputkitchen");
        String inputlaundry = request.getParameter("inputlaundry");
        String inputlocker = request.getParameter("inputlocker");
        
        
        HostelDetails_DTO setData = new HostelDetails_DTO();
        
        setData.setResulthostelstate(inputstate);
        setData.setResulthostelcity(inputcity);
        setData.setResulthostelpin(inputpincode);
        setData.setResultextraamenity(inputextraamenity);
        setData.setResulthosteltype(inputhosteltype);
        setData.setResultannualrent(inputannualrent);
        setData.setResultkitchens(inputkitchen);
        setData.setResultwifi(inputwifi);
        setData.setResultmess(inputmess);
        setData.setResultairconditioner(inputairconditioner);
        setData.setResultlaundry(inputlaundry);
        setData.setResultlockers(inputlocker);
        
        User_Hostel_Provider obj = new User_Hostel_Provider();
        
        HttpSession session = request.getSession(true);
        session.removeAttribute("searchbarinputhostelpin");
        session.removeAttribute("inputpincode");
        
        session.setAttribute("inputcity",inputcity);       
        
        System.out.println("User_Hostel_Requirement: "+inputpincode);
        
        if(!inputpincode.isEmpty())
            session.setAttribute("inputpincode",inputpincode);

        boolean result = obj.checkHostel(setData);
        if(result)
        {
            System.out.println("Hostel Available");
        }
        else
        {
            System.out.println("No Hostel Available");
        }
        
        if(!inputpincode.isEmpty())
        {
            result=obj.nearbyHostelsToPincode(inputcity, inputpincode);
            if(result)
            {
                System.out.println("Hostel available neary to the given pincode: "+inputpincode);
                session.setAttribute("availableHostelsNearbyToPincode", true);
            }
            else
            {
                System.out.println("No Hostel available neary to the given pincode: "+inputpincode);
                session.setAttribute("availableHostelsNearbyToPincode", false);
                result=obj.getAllHostelsOfCity(inputcity);
                if(result)
                {
                    System.out.println("Hostels available at city: "+inputcity);
                    session.setAttribute("availableHostelsInCity",true);
                }
                else
                {
                    System.out.println("No hostel avialable at city: "+inputcity);
                    session.setAttribute("availableHostelsInCity",false);
                }
            }
        }
        
         response.sendRedirect("Home_JSP2.jsp");
    }
    }
}
