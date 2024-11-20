package controller;

import java.io.IOException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dto.Owner_DTO;
import java.util.HashMap;
import javax.servlet.http.HttpSession;
import model.Owner_Login_Authenticator;

public class Owner_Login_Checker extends HttpServlet 
{
        public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException
        {
            response.sendRedirect("login.html");
        }
        
        public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException
        {
            String ownername=request.getParameter("ownername");
            String ownerid=request.getParameter("ownerid");
            String ownerpassword=request.getParameter("ownerpassword");
            
            //System.out.println(ownername+" "+ownerid+" "+ownerpassword);
            if(ownername.equals("")||ownerid.equals("")||ownerpassword.equals(""))
                   response.sendRedirect("login.html");
            
            Owner_DTO obj = new Owner_DTO();
            
            obj.setOwnerName(ownername);
            obj.setOwnerPassword(ownerpassword);
            obj.setOwnerId(ownerid);
            HttpSession session=request.getSession(true);
            session.setAttribute("obj",obj);
            Owner_Login_Authenticator check=new Owner_Login_Authenticator();
            
            
            if(check.isLogin(obj))
            {
                        session.setAttribute("ownerid",ownerid);
                        session.setAttribute("ownername",ownername);
                        response.sendRedirect("Owner_Home.jsp");
            }
            else
            {
                        response.sendRedirect("login.html");
            }
        }
}