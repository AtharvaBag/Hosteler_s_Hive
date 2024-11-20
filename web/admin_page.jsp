<%@page import="model.Admin_Login_Authenticator"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="db.DBConnector"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<style>
  /* Add a black background color to the top navigation */
    .topnav {
      background-color: transparent;  
      overflow: hidden;
      font-family: sans-serif;
      display: flex;
      align-items: center;
      padding: 0;
    }

    /* Style the links inside the navigation bar */
    .topnav a {
      color: #333;
      text-align: center;
      padding: 14px 16px;
      text-decoration: none;
      font-size: 17px;
    }

    /* Change the color of links on hover */
    .topnav a:hover {
      background-color: orangered;
      color: white;
    }

    /* Add a color to the active/current link */
    .topnav a.active {
      background-color: #333;
      color: white;
    }

    .topnav a.active:hover {
      background-color: red;
      color: #333;
    }

    .topnav-right {
      display: flex;
      color: #333;
      align-items: center;
      margin-left: auto;
    }

    .footer {
      position: fixed;
      bottom: 0;
      width: 100%;
      background-color: transparent;
      color: #333;
      text-align: left;
      padding: 10px;
      
    }

*{
  padding: 0;
  margin: 0;
  font-family: sans-serif;
}

body{
       background-image: url('https://static.vecteezy.com/system/resources/previews/022/737/904/original/modern-city-scape-silhouette-simple-minimalist-blue-city-skyline-background-urban-cityscape-silhouettes-illustration-vector.jpg');
        background-size: 100%;
        background-repeat: no-repeat;
         background-attachment: fixed;
        background-color: #506c9c; /* Fallback color if the image doesn't cover the whole area */
}

.greet{
  text-align: center;
  text-transform: uppercase;
  font-size: 30px;
  font-family: sans-serif;
  color: red;
}
    
.table1 td{
  padding:10px;
  font-size: 20px;
  font-family: sans-serif;
  color: white;
}
.table1{
  display: flex;
  justify-content: center;
  align-items: center;
  color: white;
}
.table1 {
    margin-left: auto;
    margin-right: auto;
    background-color: black;
    opacity: 0.8;
    width: 40%;
    border-radius: 25px;
    border-collapse: collapse;
}
.table1 input{
  padding: 5px;
  border-radius: 20px;
  border: 1px solid white;
  background: transparent;
  text-align: center;
  color: white;
}

.table1 input[type=submit]
{
      padding: 4px 16px;
      font-size: 15px;
      border: 2px solid  white;
      border-radius: 20px;
      background-color: transparent;
      color: white;
      cursor: pointer;
      float: right;
}

.table1 input[type=submit]:hover{
    color: red;
    border: 2px solid red; 
}

h1{
    font-size: 40px;
    color: #333;
    text-transform: uppercase;
    text-align: center;
}

 .footer {
      position: fixed;
      bottom: 0;
      width: 100%;
      background-color: transparent;
      color: black;
      text-align: left;
      padding: 10px;
      border-collapse: collapse;
      box-sizing: border-box;
      font-size: 16px;
    }
 </style>
<%
    String adminid=(String)session.getAttribute("adminid");
    String adminpassword=(String)session.getAttribute("adminpassword");
    if(adminid==null || adminpassword==null)
    {
        response.sendRedirect("admin_login.html");
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Hostel Finder | Admin Page</title>
        <link rel="icon" type="image/png" href="images/Hosteler's Hive Logo.png">
    </head>
    <body>
     <div class="topnav">
  <a class="active" href="admin_page.jsp">Home</a>
  <div class="topnav-right">
    <a href="logout.jsp">Logout</a>
  </div>
</div>
        
<%
    
            Admin_Login_Authenticator obj = new Admin_Login_Authenticator();
            HashMap <String, String> hostelidowneridvalid0hashmap=obj.Valid_0Info();
            HashMap <String, String> hostelidowneridvalid1hashmap=obj.Valid_1Info();
            HashMap <String, String> hostelidowneridvalid2hashmap=obj.Valid_2Info();
            
            System.out.println(hostelidowneridvalid0hashmap);
            System.out.println(hostelidowneridvalid1hashmap);
            System.out.println(hostelidowneridvalid2hashmap);
%>
        
        </BR>
        
<div style="display: flex; align-items: center; justify-content: center;">
  <img src="images/Hosteler's Hive Logo.png" alt="Description of the image" style="width: 80px; height: auto; margin: 0;">
  <div style="margin-left: 10px; line-height: 1;">
    <div style="text-align: left; font-size: 30px;color: #333; text-transform: uppercase">
      <span style="color: red;">H</span>osteler's
    </div>
    <div style="text-align: left; font-size: 30px;color: #333; text-transform: uppercase">
      <span style="color: orangered;">H</span>ive<sup style="font-size: 15px;"> &copy;</sup>
    </div>
  </div>
</div>
  

        </BR>
        </BR>
        <p class="greet">Welcome Admin!</p>
        </BR>
            
        <p style="text-align: center; font-size: 20px;">Click on view, to see details of hostel:</p>
        </BR>

        </BR>
        <p style="text-align: center; color: green; text-transform: uppercase; font-size: 25px;">Registered and Verified Hostels</p>
        </BR>
        
        <table  class='table1'>
            
            <tr>
                <td></td>
                <td></td>
                <td></td>
            </tr>
             <tr>
                <td style="text-align: center; font-size: 20px"><Strong>Hostel Id: </Strong></td>
                <td style="text-align: center; font-size: 20px"><Strong>Owner Id: </Strong></td>
                <td></td>
            </tr>
            <%
                    for(String i: hostelidowneridvalid1hashmap.keySet())
                    { 
            %>
            <form action="Admin_Hostel_Name_Getter" method="post">
            <tr>
                 <td><input type="text" value="<%=i%>" name="hostelid" id="hostelid"readonly></td>
                 <td><input type="text" value="<%=hostelidowneridvalid1hashmap.get(i)%> " name="ownerid" id="ownerid" readonly></td>
                <td><input type="Submit" value="View" ></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
            </tr>
             </form>
            <%
                            
                    }
            %>
        
       
             </table>
        </BR>
        </BR>
        </BR>
        <p style="text-align: center; color:  #333; text-transform: uppercase; font-size: 25px;">Registered Hostels (Not verified)</p>
       </BR>
        <table class='table1'>
            
            <tr>
                <td></td>
                <td></td>
                <td></td>
            </tr>
           <tr>
                <td style="text-align: center; font-size: 20px"><Strong>Hostel Id: </Strong></td>
                <td style="text-align: center; font-size: 20px"><Strong>Owner Id: </Strong></td>
                <td></td>
            </tr>
            <%
                     for(String i: hostelidowneridvalid0hashmap.keySet())
                    { 
            %>
            <form action="Admin_Hostel_Name_Getter" method="post"> 
            <tr>
                 <td><input type="text" value="<%=i%> " name="hostelid" id="hostelid" readonly></td>
                 <td><input type="text" value="<%=hostelidowneridvalid0hashmap.get(i)%> " name="ownerid" id="ownerid" readonly></td>
                <td><input type="Submit" value="View" ></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            </form>
            <%
                            
                    }
            %>
         
       
            </table>  
        </BR>
        </BR>
        
        </BR>
          <p style="text-align: center; color: #333; text-transform: uppercase; font-size: 25px;">Hostels for Re-verification</p>
          </BR>
          <table  class='table1'> 
              
            <tr>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td style="text-align: center; font-size: 20px"><Strong>Hostel Id: </Strong></td>
                <td style="text-align: center; font-size: 20px"><Strong>Owner Id: </strong></td>
                <td></td>
            </tr>
           <%
                    for(String i: hostelidowneridvalid2hashmap.keySet())
                    { 
            %>
             <form action="Admin_Hostel_Name_Getter" method="post"> 
            <tr>
                 <td><input type="text" value="<%=i%> " name="hostelid" id="hostelid" readonly></td>
                 <td><input type="text" value="<%=hostelidowneridvalid2hashmap.get(i)%> " name="ownerid" id="ownerid" readonly></td>
                <td><input type="Submit" value="View" ></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            </form>
            <%
                    }
            %>
          </table>
        </BR>
        </BR>
        
        <div class="footer">
           <p>@Author: Atharva Bagdare</p>
        </div>
    </body>
</html>
