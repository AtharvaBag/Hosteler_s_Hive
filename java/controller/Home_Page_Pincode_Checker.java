package controller;

import java.io.IOException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Hostel_Page_Nearby_Pincode;
import model.Hostel_Page_Pincode_Authenticator;

public class Home_Page_Pincode_Checker extends HttpServlet {

       public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException
       {
           response.sendRedirect("home.html");
       }
       public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException
       {
           String searchbarinputhostelpin=request.getParameter("searchbarinputhostelpin");
           System.out.println("Hostel input pin: "+searchbarinputhostelpin);
           if(searchbarinputhostelpin.equals(""))
           {
               response.sendRedirect("home.html");
           }
           else
           {   
            HttpSession session = request.getSession(true);
           session.setAttribute("searchbarinputhostelpin",searchbarinputhostelpin);
           System.out.println("Pincode: "+searchbarinputhostelpin);
           Hostel_Page_Pincode_Authenticator check = new Hostel_Page_Pincode_Authenticator();
           boolean result = check.getOutput(searchbarinputhostelpin);
           if(result)
           {
               System.out.println("Hostel Available at given Pincode");             
           }
           else
           {
               System.out.println("Hostel Not Found at given Pincode");
           }
           
           Hostel_Page_Nearby_Pincode find = new Hostel_Page_Nearby_Pincode();
           boolean result2=find.isAvailable(searchbarinputhostelpin);
           if(result2)
           {
               System.out.println("Nearby Hostel Available at given Pincode");             
           }
           else
           {
               System.out.println("Nearby Hostel Not Found at given Pincode");
           }
           response.sendRedirect("Home_JSP.jsp");
            }
       }
           
}
