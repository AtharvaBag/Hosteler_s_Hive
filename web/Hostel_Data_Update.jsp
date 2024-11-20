<%-- 
    Document   : Hostel_Data_Update
    Created on : 19 Jun, 2024, 2:01:21 PM
    Author     : Atharva Bagdare
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="db.DBConnector"%>
<%@page import="java.sql.Statement"%>
<%@page import="dto.Hostel_DTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" type="image/png" href="images/Hosteler's Hive Logo.png">
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


.pagetitle{
  font-size: 30px;
  color: red;
  font-family: sans-serif;
  text-transform: uppercase;
  text-align: center;
}


H1{
  font-size: 40px;
  color: #333;
  font-family: sans-serif;
  text-transform: uppercase;
  text-align: center;
}

.message{
  font-size: 20px;
  font-family: sans-serif;
  text-transform: uppercase;
  text-align: center;
}

.status{
    font-size: 25px;
    text-align: center;
}
.details{
  font-size: 20px;
  font-family: sans-serif;
  text-align: center;
}

h6{
  font-size: 15px;
  font-family: sans-serif;
  text-align: center;
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
    width: 40%;
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
  padding: 5px 16px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  cursor: pointer;
  border-radius: 20px;
  font-family: sans-serif;
  float: right;
}

.table1 input[type=reset] {
  background-color: transparent;
  border: 2px solid white;
  color: white;
  padding: 5px 16px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  cursor: pointer;
  border-radius: 20px;
}

.table1 input[type=submit]:hover,
.table1 input[type=reset]:hover{
    color: red;
    border: 2px solid red;
}

 /* Hide the default radio button */
    input[type="radio"] {
      display: none;
    }
    input[type="checkbox"]
    {
        display: none;
    }

    /* Create a custom radio button */
    .custom-radio {
      display: inline-block;
      width: 10px;
      height: 10px;
      background-color: #FCF6F5;
      /* Unchecked background color */
      border-radius: 50%;
      border: 2px solid black;
      position: relative;
      cursor: pointer;
    }

    /* Style the checked state */
    input[type="radio"]:checked+.custom-radio {
      background-color: orangered;
      /* Checked background color */
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
    input[type="radio"]:checked+.custom-radio::after {
      transform: translate(-50%, -50%) scale(1);
      background-color: white;
      /* Color of the dot */
    }

    .radio-label {
      cursor: pointer;
      font-size: 18px;
    }
    
    /* Create a custom checkbox */
    .custom-checkbox {
      display: inline-block;
      width: 10px;
      height: 10px;
      background-color: #FCF6F5;
      /* Unchecked background color */
      border-radius: 3px;
      border: 2px solid black;
      position: relative;
      cursor: pointer;
    }

    /* Style the checked state */
    input[type="checkbox"]:checked+.custom-checkbox {
      background-color: orangered;
      /* Checked background color */
    }

    /* Create the checkmark for the checked state */
    .custom-checkbox::after {
      content: "";
      display: block;
      width: 5px;
      height: 10px;
      border: solid white;
      border-width: 0 2px 2px 0;
      position: absolute;
      top: 20%;
      left: 50%;
      transform: translate(-50%, -50%) rotate(45deg) scale(0);
      transition: transform 0.5s ease;
    }

    /* Show the checkmark when checked */
    input[type="checkbox"]:checked+.custom-checkbox::after {
      transform: translate(-50%, -50%) rotate(45deg) scale(1);
    }

    .radio-label,
    .checkbox-label {
      cursor: pointer;
      font-size: 18px;
    }
          </style>
    
    <%
        String hostelname = (String)session.getAttribute("hostelname");
        String hostelid = (String)session.getAttribute("hostelid");
        if(hostelname==null || hostelid==null)
           response.sendRedirect("login.html");

        System.out.println(hostelname+" "+hostelid);
       
        String ownername=(String)session.getAttribute("ownername");
        String ownerid=(String)session.getAttribute("ownerid");
        String isValid=(String)session.getAttribute("valid");
        Hostel_DTO obj = (Hostel_DTO)session.getAttribute("hostel_obj");
    %>
  <title>Hostel Finder | Hostel Information</title>
  
</head>
    <body>
        <div class="topnav">
            <a class="active" href="Owner_Home.jsp">Home</a>
            <a href="Owner_Home.jsp">Back</a>
            <div class="topnav-right">
                <a href="Hostel_Delete.jsp">Delete Hostel</a>
                
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
        <p class="pagetitle" style="color: orangered; font-size: 25px" >Owner Name:  <%=ownername%> (Owner ID: <%=ownerid%>)</p></BR>
        <p class='message'>Your Hostel's Information</p></BR>
        <p class='details'>Hostel ID: <%=hostelid%></p>
        </BR>
        <%if(isValid.equals("1")){%><p class="status" style="font-size: 25px; text-align: center; color: green;">Registered and Verified!</p><% }else if(isValid.equals("0")){%><p style="font-size: 25px; text-align: center; color: red">Registered!</p><% }else if(isValid.equals("2")){ %><p style="font-size: 25px; text-align: center; color: blue">Registered and Under Re-verification Process!<%}%></p>
        </BR>
       </BR>
         
         <form action="Hostel_Update_Checker" method="post">
             <p class="details">Basic Details of your hostel: </p></BR>
        <table class="table1">
            <tr>
                <td></td>
                <td></td>
              </tr>
    <tr>
      <td>Hostel Name*: </td>
      <td><input type="text" name="hostelname" value="<%=obj.getHostelname()%>" required></td>
    </tr>
    <tr>
      <td>Address*: </td>
      <td><input type="text" name="hosteladdress" value="<%=obj.getHosteladdress()%>" required></td>
    </tr>
    <tr>
      <td>Landmark*: </td>
      <td><input type="text" name="hostellandmark" value="<%=obj.getHostellandmark()%>" required></td>
    </tr>
    <tr>
      <td>Area Pin Code*: </td>
      <td><input type="tel" name="hostelpin" value="<%=obj.getHostelpin()%>" pattern="[0-9]{6}" required></td>
    </tr>
    <tr>
      <td>City*: </td>
      <td><input type="text" name="hostelcity" value="<%=obj.getHostelcity()%>" required></td>
    </tr>
    <tr>
      <td>State*: </td>
      <td><input type="text" name="hostelstate" value="<%=obj.getHostelstate()%>" required></td>
    </tr>
    <tr>
                <td></td>
                <td></td>
              </tr>
  </table>

  
  </BR>
  </BR>

  </BR><p class='details'>Accommodation details of your hostel: </p></BR>
  <table class="table1">
      <tr>
                <td></td>
                <td></td>
              </tr>
    <tr>
      <td>Hostel type*: </td>
       <td class="top-align">
          <label style="font-size: 18px;" class="radio-label">
            <input type="radio" name="hosteltype" value="Boys" <% if("Boys".equalsIgnoreCase(obj.getHosteltype())){%> checked="true"<%}%>>
            <span class="custom-radio"></span> Boys
          </label><br>
          <label style="font-size: 18px;" class="radio-label">
            <input type="radio" name="hosteltype" value="Girls" <% if("Girls".equalsIgnoreCase(obj.getHosteltype())){%> checked="true"<%}%>>
            <span class="custom-radio"></span> Girls
          </label><br>
          <label style="font-size: 18px;" class="radio-label">
            <input type="radio" name="hosteltype" value="Both"<% if("Both".equalsIgnoreCase(obj.getHosteltype())){%> checked="true"<%}%>>
            <span class="custom-radio"></span> Both
          </label>
        </td>
    </tr>
    <tr>
      <td>Total available rooms (for Boys): </td>
      <td><input type="number" name="hostelboysroom" value="<%=obj.getHostelboysroom()%>"></td>
    </tr> 
    <tr>
      <td>Total available rooms (for Girls): </td>
      <td><input type="number" name="hostelgirlsroom" value="<%=obj.getHostelgirlsroom()%>"></td>
    </tr> 
    <tr>
      <td>Amenities*: </td>
       <td class="left-align">
          <label class="checkbox-label">
            <input type="checkbox" id="airconditioner" name="airconditioner" value="Air Conditioner" <% if("1".equals(obj.getAirconditioner())){%> checked="true"<%}%>>
            <span class="custom-checkbox"></span> Air Conditioner
          </label><br>
          <label class="checkbox-label">
            <input type="checkbox" id="mess" name="mess" value="Mess" <% if("1".equals(obj.getMess())){%> checked="true"<%}%>>
            <span class="custom-checkbox"></span> Mess
          </label><br>
          <label class="checkbox-label">
            <input type="checkbox" id="wifi" name="wifi" value="Wifi" <% if("1".equals(obj.getWifi())){%> checked="true"<%}%>>
            <span class="custom-checkbox"></span> Wifi
          </label><br>
          <label class="checkbox-label">
            <input type="checkbox" id="kitchen" name="kitchen" value="Kitchen" <% if("1".equals(obj.getKitchen())){%> checked="true"<%}%>>
            <span class="custom-checkbox"></span> Kitchen
          </label><br>
          <label class="checkbox-label">
            <input type="checkbox" id="locker" name="locker" value="Lockers" <% if("1".equals(obj.getLockers())){%> checked="true"<%}%>>
            <span class="custom-checkbox"></span> Lockers
          </label><br>
          <label class="checkbox-label">
            <input type="checkbox" id="laundry" name="laundry" value="Laundry" <% if("1".equals(obj.getLaundry())){%> checked="true"<%}%>>
            <span class="custom-checkbox"></span> Laundry
          </label>
        </td>
    </tr>
    <tr>
      <td>Extra amenities (if any)*: </td>
      <td><input type="textarea" name="hostelextraamenities" value="<%=obj.getHostelextraamenities()%>"></td>
    </tr>
     <tr>
      <td>Annual Rent (INR): </td>
      <td><input type="textarea" name="hostelrent" value="<%=obj.getHostelrent()%>"></td>
    </tr>
    <tr>
                <td></td>
                <td></td>
              </tr>
  </table>

  </BR>
  </BR>

  </BR><p class='details'>Contact details of your hostel: </p></BR>
  <table class="table1">
      <tr>
                <td></td>
                <td></td>
              </tr>
    <tr>
      <td>Contact number: </td>
      <td><input type="tel" name="hostelcontact" value="<%=obj.getHostelcontact()%>"></td>
    </tr>
    <tr>
      <td>Email id: </td>
      <td><input type="email" name="hostelemailid" value="<%=obj.getHostelemailid()%>"></td>
    </tr>
 
    <tr>
          <td><input type="reset"></input></td>
          <td><input type="submit" value="Update"></input></td>
    </tr>
  </table>
</div>
</form>
    </BR>
        <%if(isValid.equals("1")){%><h6>*If you will update this field detail of your hostel, it will lose its 'Verified' status and the verification process will restart!<h6><%}%> 
         </BR>
    </BR>
    </BR>
           <p class='footer'>@Author: Atharva Bagdare</p> 
    </body>
</html>
