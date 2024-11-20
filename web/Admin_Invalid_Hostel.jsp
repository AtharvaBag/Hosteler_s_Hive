
<%@page import="dto.Hostel_DTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
        Hostel_DTO obj = (Hostel_DTO)session.getAttribute("obj3");
        if(obj.getHostelid()==null)
            response.sendRedirect("admin_login.html");
%>
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


.message{
  font-size: 20px;
  font-family: sans-serif;
  text-align: center;
}

.pagehead{
  font-size: 30px;
  font-family: sans-serif;
  text-transform: uppercase;
  color: red;
  text-align: center;
}

.head{
    text-align: center;
    color: #333;
    font-size: 40px;
    text-transform: uppercase;
}
.button_no{
    
      background-color: transparent;
            border: 2px solid #333;
            color: #333;
            padding: 5px 16px;
            text-align: center;
            font-size: 16px;
            font-family: sans-serif;
            display: inline-block;
            cursor: pointer;
            border-radius: 20px;
            float: left;
}

.table1{
    padding: 6px 16px;
    width: 50%;
}
.tabel1 input[type=submit]{
    background-color: transparent;
            border: 2px solid #333;
            color: #333;
            padding: 5px 16px;
            text-align: center;
            font-size: 16px;
            font-family: sans-serif;
            display: inline-block;
            cursor: pointer;
            border-radius: 20px;
            float: right;
}

.tabel1 input[type=submit]:hover, 
.button_no:hover{
    color: red;
    border: 2px solid red;
}
        </style>
        <title>Hostel Finder | Invalidate Hostel</title>
        <link rel="icon" type="image/png" href="images/Hosteler's Hive Logo.png">
    </head>
    <body>
        <div class="topnav">
            <a class="active" href="admin_page.jsp">Home</a>
                        <div class="topnav-right">
                <a href="Admin_Hostel_Verify.jsp">Cancel</a>
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
        </BR>
        <p class="pagehead">Hello Admin!</p>
        </BR>
        <p class="message">Are you sure? This will invalidate hostel, <%=obj.getHostelname()%> (hostel id: <%=obj.getHostelid()%>) and re-verification process will start.</p>
        </BR>
          <table class="tabel1" style="display: flex; justify-content: center; align-items: center; margin: 10px 0;">
            <form action="Admin_Invalidate_Hostel" method="post">
                <tr>
                    <td><button class="button_no" type="button" onclick="location.href='Admin_Hostel_Verify.jsp'">No</button></td>
                    <td></td>
                    <td><input type="submit" value="Yes" ></input></td>
             </form>
        </table>
        <div class="footer">
           <p>@Author: Atharva Bagdare</p>
        </div>
    </body>
</html>
