<%-- 
    Document   : Admin_Owner_Details
    Created on : 2 Jul, 2024, 4:20:46 PM
    Author     : Atharva Bagdare
--%>

<%@page import="dto.Admin_DTO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="db.DBConnector"%>
<%@page import="java.sql.Statement"%>
<%@page import="dto.Owner_DTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

 <%
            Owner_DTO obj = new Owner_DTO();
            
            String adminid=(String)session.getAttribute("adminid");
            String adminpassword=(String)session.getAttribute("adminpassword");
            System.out.println(adminid+" "+adminpassword);
            if(adminid==null || adminpassword==null)
            {
                response.sendRedirect("login.html");
            }
            
            Owner_DTO obj2 = (Owner_DTO)session.getAttribute("owner_details_obj");
            
            String ownerid=(String)session.getAttribute("ownerid");
            String ownername=obj2.getOwnerName();
            String ownercontact=obj2.getOwnerContact();
            String owneremail=obj2.getOwnerEmail();
            String ownerdob=obj2.getOwnerDob();
            String ownergender=obj2.getOwnerGender();
            String owneraddress=obj2.getOwnerAddress();
            String ownercity=obj2.getOwnerCity();
            String ownerstate=obj2.getOwnerState();
            
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>
           /* Add a black background color to the top navigation */
    .topnav {
        
      /*border-collapse: collapse;*/
     overflow: hidden;
      font-family: sans-serif;
      display: flex;
      align-items: center;
      padding: 0;
    }

    /* Style the links inside the navigation bar */
    .topnav a {
      color: #333;
      background-color: transparent;
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
      align-items: center;
      margin-left: auto;
    }

    .footer {
      position: fixed;
      bottom: 0;
      width: 100%;
      background-color: transparent;
      color: black;
      text-align: left;
      padding: 10px;
      box-sizing: border-box;
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

.pagehead{
  font-size: 30px;
  font-family: sans-serif;
  text-transform: uppercase;
  text-align:center;
  color: red;
}

.subhead{
  font-size: 25px;
  font-family: sans-serif;
  text-align:center;
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
}
.table1 {
    margin-left: auto;
    margin-right: auto;
    background-color: black;
    opacity: 0.8;
    width: 35%;
    border-radius: 25px;
    border-collapse: collapse;
}
.table1 input{
  padding: 5px;
  border-radius: 20px;
  border: 1px solid white;
  background-color: transparent;
  text-align: center;
  color: white;
}


.table1 input[type=submit]  {
  background-color: transparent;
  border: 2px solid white;
  color: white;
  padding: 6px 16px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  cursor: pointer;
  border-radius: 20px;
  font-family: sans-serif;
  float: left;
}

.head{
    text-align: center;
    font-size: 40px;
    color: #333;
    text-transform: uppercase;
}


.table1 input[type=date]
{
  padding: 5px 30px;
  border-radius: 20px;
  border: 1px solid white;
  background-color: transparent;
}

.table1 label{
    font-size: 5px;
}

.okbutton{
    background-color: transparent;
  border: 2px solid white;
  color: white;
  padding: 6px 16px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  cursor: pointer;
  border-radius: 20px;
  font-family: sans-serif;
  float: right;
}

.okbutton:hover,
.table1 input[type=submit]:hover{
    color: red;
    border: 2px solid red;
}



        </style>    
        <title>Hostel Finder | Owner Details</title>
        <link rel="icon" type="image/png" href="images/Hosteler's Hive Logo.png">
    </head>
    <body>
        <div class="topnav">
                <a class="active" href="admin_page.jsp">Home</a>
                <div class="topnav-right">
                        <a href="admin_page.jsp">Cancel</a>
                </div>
        </div>
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
        <p class='pagehead'>Owner Details!</p></BR>
        <p class='subhead'>Owner Id: <%=ownerid%></p>
        </BR>
         <form action="Delete_Owner_Profile.jsp" method="post">
            <table class="table1">
                <tr>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td>User Name: </td>
                    <td><input type="text" name="ownername" value="<%=ownername%>" readonly></td>
                </tr>
                 <tr>
                    <td>Contact Number: </td>
                    <td><input type="tel" name="ownercontact" value="<%=ownercontact%>" pattern="[0-9]{10}" readonly></td>
                </tr>
                 <tr>
                    <td>Email id: </td>
                    <td><input type="text" name="owneremail" value="<%=owneremail%>" readonly></td>
                </tr>
                 <tr>
                    <td>Date of Birth: </td>
                    <td><input type="date" name="ownerdob" value="<%=ownerdob%>" readonly></td>
                </tr>
                 <tr>
                     <td>Gender: </td>
                     <td><input type='text' name='ownergender' <% if("Male".equals(ownergender)){%>value='Male'<%} else if("Female".equals(ownergender)){ %>value='Female'<%}%> readonly ></td>
                  </tr>
                 <tr>
                    <td>Address: </td>
                    <td><input type="text" name="owneraddress" value="<%=owneraddress%>" readonly></td>
                </tr>
                 <tr>
                    <td>City: </td>
                    <td><input type="text" name="ownercity" value="<%=ownercity%>" readonly></td>
                </tr>
                 <tr>
                    <td>State: </td>
                    <td><input type="text" name="ownerstate" value="<%=ownerstate%>" readonly></td>
                </tr>
                 <TR>
                       <TD> <INPUT TYPE="submit" VALUE="Delete"></TD>
                       <TD><button class='okbutton' type="button" onclick="location.href='Admin_Hostel_Verify.jsp'">OK</button></TD>
                 </TR>
                 <tr>
                     <td></td>
                     <td></td>
                 </tr>
                 </table>
        </form>
                <div class="footer">
           <p>@Author: Atharva Bagdare</p>
        </div>
    </body>
</html>
