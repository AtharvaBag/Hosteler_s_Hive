package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Owner_Profile_Delete;

public class Owner_Profile_Deletion_Checker extends HttpServlet {

public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException
{
    response.sendRedirect("login.html");
}
public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException
{
    HttpSession session = request.getSession(true);
    String ownerid= (String)session.getAttribute("ownerid");
    Owner_Profile_Delete confirm = new Owner_Profile_Delete();
    if(confirm.deleteProfile(ownerid))
    {
        System.out.println("Deleted");
    }
    else
    {
        System.out.println("Not Deleted");
    }
    response.sendRedirect("login.html");
}
}
