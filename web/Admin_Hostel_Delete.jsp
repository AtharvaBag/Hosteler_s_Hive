<%-- 
    Document   : Admin_Hostel_Delete
    Created on : 1 Jul, 2024, 1:04:50 PM
    Author     : Atharva Bagdare
--%>

<%@page import="dto.Hostel_DTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
        Hostel_DTO obj = (Hostel_DTO)session.getAttribute("obj3");
        String hostelname=obj.getHostelname();
        String hostelid=obj.getHostelid();
        if(hostelname==null || hostelid==null)
        {
                response.sendRedirect("admin_login.html");
        }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>
          /* Add a black background color to the top navigation */
    .topnav {
      border-collapse: collapse;
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
      border-collapse: collapse;
      box-sizing: border-box;
      font-size: 16px;
    }

    * {
      padding: 0;
      margin: 0;
      font-family: sans-serif;
    }

    body {
       /*background-image: url('https://assets.hongkiat.com/uploads/minimalist-dekstop-wallpapers/4k/original/12.jpg?3');*/
        background-image: url('https://static.vecteezy.com/system/resources/previews/022/737/904/original/modern-city-scape-silhouette-simple-minimalist-blue-city-skyline-background-urban-cityscape-silhouettes-illustration-vector.jpg');
        background-repeat: no-repeat;
        background-size: 100%;
       margin: 0;
      padding: 0;
      min-height: 100%;
      display: flex;
      flex-direction: column;
    }

h3{
  font-size: 20px;
  font-family: sans-serif;
  text-align: center;
}

h1{
  font-size: 30px;
  font-family: sans-serif;
  text-transform: uppercase;
  color: red;
  text-align: center;
}

.table1 {
    display: table; /* Change to table to use table properties */
    margin: 0 auto; /* Center align */
    background-color: transparent;
    width: 35%;
    border-radius: 25px;
    border-collapse: collapse;
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
}

input[type=submit]{
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

.table1 input[type=submit]:hover,
.button_no:hover{
    border: 2px solid red;
    color: red;
}

.message{
    text-align: center;
    font-size: 20px;
}

.pagehead{
    text-align: center;
    font-size: 35px;
    color: red;
}

H1{
    text-align: center;
    font-size: 40px;
    color: #333;
}
        </style>
        <title>Hostel Finder | Hostel Delete</title>
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
        <p class="pagehead">Hello Admin!</p>
        </BR>
        <p class="message">Are you sure? This will delete all the records of hostel <%=hostelname%> (Hostel id: <%=hostelid%>) from database.</p>
        </BR>
        </BR>
           <form action="Admin_Hostel_Delete_Confirm" method="post">
        <table class="table1">
                <tr>
                    <td><button class="button_no" type="button" onclick="location.href='Admin_Hostel_Verify.jsp'">No</button></td>
                    <td></td>
                    <td><input type="submit" value="Yes"></td> <!-- Correct closing tag -->
        </table>
                 </form>
        <div class="footer">
           <p>@Author: Atharva Bagdare</p>
        </div>
    </body>
</html>
