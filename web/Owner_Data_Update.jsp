<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="db.DBConnector"%>
<%@page import="dto.Owner_DTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" type="image/png" href="images/Hosteler's Hive Logo.png">
        <style>
           /* Add a black background color to the top navigation */
    .topnav {
        
      /*border-collapse: collapse;*/
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

            .greet{
                font-size: 30px;
                font-family: sans-serif;
                text-align: center;
                text-transform: uppercase;
                color: red;
            }
            .message {
                font-size: 25px;
                font-family: sans-serif;
                text-align: center;
            }

            .table1 td {
                padding: 10px;
                font-size: 20px;
                font-family: sans-serif;
            }

            .table1 {
                display: flex;
                justify-content: center;
                align-items: center;
                margin-left: auto;
                margin-right: auto;
                background-color: black;
                opacity: 0.8;
                width: 35%;
                border-radius: 25px;
                border-collapse: collapse;
                color: white;
            }

            .table1 input {
                padding: 5px;
                border-radius: 20px;
                border: 1px solid white;
                background-color: transparent;
                text-align: center;
                color: white;
            }

            .table2 {
                display: flex;
                justify-content: center;
                align-items: center;
            }

            input[type=submit] {
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
            }

            input[type=reset] {
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
            }

            .table1 input[type=date] {
                padding: 5px 30px;
                border-radius: 20px;
                border: 1px solid white;
            }

            .table1 input[type=submit]:hover,
            .table1 input[type=reset]:hover{
                color: red;
                border: 2px solid red;
            }
            
            .table1 label {
                font-size: 5px;
            }

            /* Hide the default radio button */
            input[type="radio"] {
                display: none;
            }

            /* Create a custom radio button */
            .custom-radio {
                display: inline-block;
                width: 10px;
                height: 10px;
                background-color: #FCF6F5; /* Unchecked background color */
                border-radius: 50%;
                border: 2px solid #333;
                position: relative;
                cursor: pointer;
            }

            /* Style the checked state */
            input[type="radio"]:checked + .custom-radio {
                background-color: orangered; /* Checked background color */
            }

            /* Create the dot for the checked state */
            .custom-radio::after {
                content: "";
                display: block;
                width: 5px;
                height: 5px;
                background-color: #FCF6F5;
                border-radius: 50%;
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%) scale(0);
                transition: transform 0.2s ease;
            }

            /* Show the dot when checked */
            input[type="radio"]:checked + .custom-radio::after {
                transform: translate(-50%, -50%) scale(1);
                background-color: #333; /* Color of the dot */
            }

            .radio-label {
                cursor: pointer;
                font-size: 18px;
            }
            
            H1{
                color: #333;
                text-align: center;
                text-transform: uppercase;
                font-size: 40px;
            }
        </style>
        <title>Hostel Finder | Owner Data Updation Page</title>
    </head>
    <body>
        <%
            String ownername = (String) session.getAttribute("ownername");
            String ownerid = (String) session.getAttribute("ownerid");
            if (ownername == null || ownerid == null) {
                response.sendRedirect("login.html");
            }

            Owner_DTO obj = (Owner_DTO) session.getAttribute("ownerdata_obj");
        %>
        <div class="topnav">
            <a class="active" href="Owner_Home.jsp">Home</a>
            <a href="Owner_Home.jsp">Back</a>
            <div class="topnav-right">
                <a href="Delete_Owner_Profile.jsp">Delete Profile</a>
                
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
  

        </br>
        <p class='greet'>Hello <%= obj.getOwnerName() %>!</p>
        </br>
        <p class="message">Check and Update Your Details: </p>
        </br>
        <form action="Owner_Data_Updation" method="post">
            <table class="table1">
                <tr>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td>User Name: </td>
                    <td><input type="text" name="ownername" value="<%= obj.getOwnerName() %>"></td>
                </tr>
                <tr>
                    <td>Contact Number: </td>
                    <td><input type="tel" name="ownercontact" value="<%= obj.getOwnerContact() %>" pattern="[0-9]{10}"></td>
                </tr>
                <tr>
                    <td>Email id: </td>
                    <td><input type="text" name="owneremail" value="<%= obj.getOwnerEmail() %>"></td>
                </tr>
                <tr>
                    <td>Date of Birth: </td>
                    <td><input type="date" name="ownerdob" value="<%= obj.getOwnerDob() %>"></td>
                </tr>
                <tr>
                    <td>Gender: </td>
                    <td>
                        <label style="font-size: 18px;" class="radio-label">
                            <input  type="radio" name="ownergender" value="Male" <% if ("Male".equals(obj.getOwnerGender())) { %> checked="true" <% } %>>
                            <span  class="custom-radio"></span> Male
                        </label>
                        </br>
                        <label style="font-size: 18px;" class="radio-label">
                            <input type="radio" name="ownergender" value="Female" <% if ("Female".equals(obj.getOwnerGender())) { %> checked="true" <% } %>>
                            <span class="custom-radio"></span> Female
                        </label>
                    </td>
                </tr>
                <tr>
                    <td>Address: </td>
                    <td><input type="text" name="owneraddress" value="<%= obj.getOwnerAddress() %>"></td>
                </tr>
                <tr>
                    <td>City: </td>
                    <td><input type="text" name="ownercity" value="<%= obj.getOwnerCity() %>"></td>
                </tr>
                <tr>
                    <td>State: </td>
                    <td><input type="text" name="ownerstate" value="<%= obj.getOwnerState() %>"></td>
                </tr>
                <tr>
                    <td>
                        <input style="float: left;" type="reset" value="Reset">
                    </td>
                    <td>
                        <input style="float: right;" type="submit" value="Update">
                    </td>
                </tr>
            </table>
        </form>
        <div class="footer">
            <p>@Author: Atharva Bagdare</p>
        </div>
    </body>
</html>
