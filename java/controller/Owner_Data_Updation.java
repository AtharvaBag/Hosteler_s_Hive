package controller;

import dto.Owner_DTO;
import java.io.IOException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Owner_Data_Update_Authenticator;

public class Owner_Data_Updation extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException
    {
            response.sendRedirect("login.html");
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException
    {
        Owner_DTO obj = new Owner_DTO();
        HttpSession session = request.getSession(true);
        String ownername=request.getParameter("ownername");
        obj.setOwnerName(ownername);
        session.setAttribute("ownername",ownername);
        String ownercontact=request.getParameter("ownercontact");
        obj.setOwnerContact(ownercontact);
        String owneraddress=request.getParameter("owneraddress");
        obj.setOwnerAddress(owneraddress);
        String ownercity=request.getParameter("ownercity");
        obj.setOwnerCity(ownercity);
        String ownerdob=request.getParameter("ownerdob");
        obj.setOwnerDob(ownerdob);
        String owneremail=request.getParameter("owneremail");
        obj.setOwnerEmail(owneremail);
        String ownergender=request.getParameter("ownergender");
        obj.setOwnerGender(ownergender);
        String ownerstate=request.getParameter("ownerstate");
        obj.setOwnerState(ownerstate);
        String ownerid=(String)session.getAttribute("ownerid");
        obj.setOwnerId(ownerid);
        Owner_Data_Update_Authenticator confirm = new Owner_Data_Update_Authenticator();
        boolean result = confirm.isValid(obj);
       if(result)
       {
           response.sendRedirect("Owner_Home.jsp");
       }
       else
       {
           response.sendRedirect("Owner_Data_Update.jsp");
       }
        
    }
}
