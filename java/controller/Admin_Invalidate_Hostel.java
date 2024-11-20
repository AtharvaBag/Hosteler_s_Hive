/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dto.Hostel_DTO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Admin_Hostel_Valid;

public class Admin_Invalidate_Hostel extends HttpServlet {

       public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException
       {
           response.sendRedirect("admin_login.html");
       }
       public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException
       {
           HttpSession session = request.getSession(true);
           Hostel_DTO obj = (Hostel_DTO)session.getAttribute("obj3");
           Admin_Hostel_Valid obj1 = new Admin_Hostel_Valid();
           if(obj1.invalidHostel(obj))
           {
               System.out.println("Hostel Invalidated");
               response.sendRedirect("admin_page.jsp");
           }
           else
           {
               System.out.println("Hostel not Invalidated");
               response.sendRedirect("Admin_Hostel_Verify.jsp");
           }
       }
}
