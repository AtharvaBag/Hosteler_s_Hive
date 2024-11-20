package controller;

import java.io.IOException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dto.Owner_DTO;
import javax.servlet.http.HttpSession;
import model.Owner_Registration_Authenticator;

public class Owner_Registration_Checker extends HttpServlet 
{
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException
    {
        response.sendRedirect("home.html");
    }
    
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException
    {
        
        String ownername=request.getParameter("owner_name");
        String ownercontact=request.getParameter("owner_contact");
        String owneremail=request.getParameter("owner_email");
        String ownerdob=request.getParameter("owner_dob");
        String ownergender=request.getParameter("owner_gender");
        String owneraddress=request.getParameter("owner_address");
        String ownercity=request.getParameter("owner_city");
        String ownerstate=request.getParameter("owner_state");
        String ownerpassword=request.getParameter("owner_password");
        String ownerconfirmpassword=request.getParameter("owner_confirm_password");
        String ownerid=null;
        Owner_DTO obj = new Owner_DTO();
        
        obj.setOwnerAddress(owneraddress);
        obj.setOwnerCity(ownercity);
        obj.setOwnerContact(ownercontact);
        obj.setOwnerDob(ownerdob);
        obj.setOwnerState(ownerstate);
        obj.setOwnerGender(ownergender);
        obj.setOwnerEmail(owneremail);
        obj.setOwnerName(ownername);
        obj.setOwnerPassword(ownerpassword);
        obj.setOwnerConfirmPassword(ownerconfirmpassword);
        
        if(!ownerpassword.equals(ownerconfirmpassword))
        {
            response.sendRedirect("owner_register.html");
        }
        
        Owner_Registration_Authenticator check =new Owner_Registration_Authenticator();
        
        if(check.registrationAuthenticator(obj))
        {
                  HttpSession session=request.getSession(true);
                  ownerid=obj.getOwnerId();
                  session.setAttribute("ownerid",ownerid);
                  session.setAttribute("ownername",ownername);
                  session.setAttribute("obj",obj);
                  response.sendRedirect("Owner_Home.jsp");
        }
        
       else
        {
            response.sendRedirect("owner_register.html");
        }
    }
}