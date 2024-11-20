package controller;

import db.DBConnector;
import java.io.IOException;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Hostel_Deletion_Confirm extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException
    {
        response.sendRedirect("login.html");
    }
 
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException
    {
        HttpSession session = request.getSession(true);
        String hostelid=(String)session.getAttribute("hostelid");
        
        String query1="DELETE FROM hostel_table WHERE hostel_id='"+hostelid+"'";
        String query2="DELETE FROM admin_table WHERE hostel_id='"+hostelid+"'";
        
        System.out.println(query1+" "+query2);
       
        try
        {
             Statement st = DBConnector.getStatement();
             st.execute(query1);
             st.execute(query2);
        } 
        catch(SQLException e)
        {
            System.out.println(e);
        }
        
        response.sendRedirect("Owner_Home.jsp");
        
    }
}