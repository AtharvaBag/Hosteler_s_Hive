<%@page import="db.DBConnector"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String ownername = (String)session.getAttribute("ownername");
    String ownerid = (String)session.getAttribute("ownerid");
    String adminid = (String)session.getAttribute("adminid");
    String adminpassword = (String)session.getAttribute("adminpassword");
    
    if ((ownername == null || ownerid == null) && (adminid==null || adminpassword==null)) {
        response.sendRedirect("home.html");
    }
%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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

* {
  padding: 0;
  margin: 0;
  font-family: sans-serif;
}

body {
    background-image: url('https://static.vecteezy.com/system/resources/previews/022/737/904/original/modern-city-scape-silhouette-simple-minimalist-blue-city-skyline-background-urban-cityscape-silhouettes-illustration-vector.jpg');
        background-size: 100%;
        background-repeat: no-repeat;
         background-attachment: fixed;
        background-color: #506c9c; /* Fallback color if the image doesn't cover the whole area */
}

.greet {
  font-size: 30px;
  font-family: sans-serif;
  text-transform: uppercase;
  text-align: center;
  color: red;
}

h1{
    text-align: center;
    color: #333;
    font-size: 40px;
    text-transform: uppercase;
}
.message{
  font-size: 20px;
  font-family: sans-serif;
  text-align: center;
}

.table1 {
  display: flex;
  justify-content: center;
  align-items: center;
  margin: 10px 0;
}

input[type=submit] {
  background-color: transparent;
  border: 2px solid #333;
  color: #333;
  padding: 6px 16px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  cursor: pointer;
  border-radius: 20px;
  float: right;
}

 .button_no{
            background-color: transparent;
            border: 2px solid #333;
            color: #333;
            padding: 6px 16px;
            text-align: center;
            font-size: 16px;
            display: inline-block;
            cursor: pointer;
            border-radius: 20px;
            float: left;
           }
           
 .button_no:hover,
 .table1 input[type='submit']:hover{
     color: red;
     border: 2px solid red;
 }
            </style>
            <title>User Profile Deletion</title>
        <link rel="icon" type="image/png" href="images/Hosteler's Hive Logo.png">
    </head>
    <body>
        <div class="topnav">
            <a class="active" <%if(ownername==null){%>href='admin_page.jsp'<% } else { %> href="Owner_Home.jsp" <% } %>>Home</a>
            <div class="topnav-right">
                <a <%if(ownername==null){%>href='Admin_Owner_Details.jsp'<% } else { %> href="Owner_Data_Update.jsp" <% } %>>Cancel</a>
            </div>
        </div>
            </Br>
           
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
  

        <br/>
        <p class='greet'>Hello <%if(ownername==null){ %>Admin!<%}else{%><%=ownername%>!<%}%></p>
        </br>
        
        <p class='message' style="text-align: center">Are you sure you want to delete <%if(adminid==null){%>your <%}%>profile? </BR>This will also delete all the records of <%if(adminid==null){%>your <%}%>registered hostels.</p>
        </br>
        
            <form action="Owner_Profile_Deletion_Checker" method="post">
                <table class="table1">
                    <tr>
                        <%if(adminid==null && adminpassword==null) { %>
                        <td><button class="button_no" type="button" onclick="location.href='Owner_Data_Update.jsp'">No</button></td>
                        <%} else {%>
                        <td><button class="button_no" type="button" onclick="location.href='Admin_Owner_Details.jsp'">No</button></td>
                        <%}%>
                        <td><input type="submit" value="Yes"></td>
                    </tr>
                </table>
            </form>
          
        <div class="footer">
           <p>@Author: Atharva Bagdare</p>
        </div>
    </body>
</html>
