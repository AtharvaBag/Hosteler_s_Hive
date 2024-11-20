package controller;

import db.DBConnector;
import dto.Owner_DTO;
import java.io.IOException;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Owner_Data_Update_Authenticator;

public class Owner_Data_Update_Checker extends HttpServlet {
    
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException
    {
        response.sendRedirect("login.html");
    }
    
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException
    {
           HttpSession session = request.getSession(true);
           String ownername=(String)session.getAttribute("ownername");
           String ownerid=(String)session.getAttribute("ownerid");
           System.out.println("OwnerDataUpdateChecker.java: "+ownername+" "+ownerid);
           if(ownerid == null || ownername == null)
           {
               response.sendRedirect("login.html");
           }
           Owner_Data_Update_Authenticator check = new Owner_Data_Update_Authenticator();
           Owner_DTO obj = check.getOwnerData(ownername, ownerid);
           session.setAttribute("ownerdata_obj", obj);
           response.sendRedirect("Owner_Data_Update.jsp");
    }
}