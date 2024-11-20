<%-- 
    Document   : Admin_Hostel_Verify
    Created on : 30 Jun, 2024, 12:43:05 PM
    Author     : Atharva Bagdare
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="db.DBConnector"%>
<%@page import="dto.Hostel_DTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
        String ownerid = (String)session.getAttribute("ownerid");
        if(ownerid==null)
            response.sendRedirect("admin_login.html");
        
        Hostel_DTO obj = (Hostel_DTO)session.getAttribute("obj3");
        String valid=(String)session.getAttribute("valid");
        System.out.println(obj.getHostelname()); 
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
   /*background-image: url('https://assets.hongkiat.com/uploads/minimalist-dekstop-wallpapers/4k/original/12.jpg?3');*/
        background-image: url('https://static.vecteezy.com/system/resources/previews/022/737/904/original/modern-city-scape-silhouette-simple-minimalist-blue-city-skyline-background-urban-cityscape-silhouettes-illustration-vector.jpg');
        background-size: 100%;
        background-repeat: no-repeat;
        background-attachment: fixed;
        background-color: #506c9c; /* Fallback color if the image doesn't cover the whole area */
}

H1{
    font-size: 40px;
    font-family: sans-serif;
    text-transform: uppercase;
    text-align: center;
    color: #333;
}
H3{
  font-size: 20px;
  font-family: sans-serif;
  text-transform: uppercase;
  text-align: center;
}

h2{
  font-size: 30px;
  font-family: sans-serif;
  text-transform: uppercase;
  text-align: center;
}

.hostelidhead {
  font-size: 20px;
  font-family: sans-serif;
  text-transform: uppercase;
  text-align: center;
}

.statushead{
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
    font-size: 15px;
    text-align: center;
  padding: 5px;
  
  border-radius: 20px;
  border: 1px solid white;
  background-color: transparent;
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
  float: right;
  
}

.invalidatebutton{
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

.table1 input[type=submit]:hover,
.invalidatebutton:hover{
    background-color: transparent;
  border: 2px solid red;
  color: red;
}

.ownerdetailsbutton{
        font-family: sans-serif;
        font-size: 17px;
        color: #333;
        text-align: center;
        background-color: transparent; 
        height: 48px;
        width: 150px;
        border: 0px;
    }
    
    .ownerdetailsbutton:hover{
        background-color: red;
        color: white;
    }
    
    input[type="radio"],
        input[type="checkbox"] {
            position: relative;
            width: 8px;
            height: 8px;
            margin-right: 10px;
            appearance: none;
            background-color: #333;
            border: 2px solid #333;
            border-radius: 10px;
            cursor: pointer;
        }
        
        input[type="radio"]::before,
        input[type="checkbox"]::before {
            content: '';
            position: absolute;
            top: 50%;
            left: 50%;
            width: 7px;
            height: 7px;
            background-color: orangered;
            transform: translate(-50%, -50%);
            border-radius: 10px;
            opacity: 0;
            transition: opacity 0.1s ease-in-out;
        }

        input[type="radio"]:checked::before,
        input[type="checkbox"]:checked::before {
            opacity: 1;
        }
        
        .statushead{
            text-align: center;
            font-size: 25px;
        }
        </style>
        <title>Hostel Finder | Admin Hostel Verify</title>
        <link rel="icon" type="image/png" href="images/Hosteler's Hive Logo.png">
    </head>
    <body>
        <div class="topnav">
            <a class="active" href="admin_page.jsp">Home</a>
            <form action="Admin_Get_Owner_Details" method="post">
                <input class="ownerdetailsbutton" type="Submit" value="Owner Details"></input>
            </form>
            <div class="topnav-right">
                <a href="Admin_Hostel_Delete.jsp">Delete Hostel</a>
                <a href="admin_page.jsp">Back</a>
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
        <h2 style="color: orangered">Hostel's Information</h2>
        </BR>
        <p class="hostelidhead">Hostel ID: <%=obj.getHostelid()%></p>
        </BR>
        <%if(valid.equals("1")){%><p class="statushead" style="text-align: center; font-size: 20px; color: green">Registered and Verified!</p><% }else if(valid.equals("0")){%><p style="text-align: center; font-size: 20px; color: red;">Registered!</p><% }else if(valid.equals("2")){ %><p style="text-align: center; font-size: 20px; color: blue">Registered and Under Re-verification Process!<%}%></p>
        </BR>
        </BR>
        <form action="Admin_Hostel_Status" method="post">
             <H3>Hostel Basic Details: </H3>
             </BR>
            <table class="table1">
                <tr>
                    <td></td>
                    <td></td>
                </tr>
            <tr>
                <td>Hostel Name: </td>
                <td><input type="text" name="hostelname" value="<%=obj.getHostelname()%>" readonly></td>
            </tr>
            <tr>
                <td>Address: </td>
                <td><input type="text" name="hosteladdress" value="<%=obj.getHosteladdress()%>" readonly></td>
            </tr>
            <tr>
                <td>Landmark: </td>
                <td><input type="text" name="hostellandmark" value="<%=obj.getHostellandmark()%>" readonly></td>
            </tr>
           <tr>
                <td>Hostel Area Pin Code: </td>
                <td><input type="tel" name="hostelpin" value="<%=obj.getHostelpin()%>" readonly></td>
            </tr>
            
            <tr>
                <td>City: </td>
                <td><input type="text" name="hostelcity" value="<%=obj.getHostelcity()%>" readonly></td>
            </tr>
            <tr>
                <td>State: </td>
                <td><input type="text" name="hostelstate" value="<%=obj.getHostelstate()%>" readonly></td>
            </tr>
            <tr>
                    <td></td>
                    <td></td>
                </tr>
            </table>
            </BR>
            </BR>

            <H3>Accommodation details of hostel: </H3>
            </BR>
            <table class="table1">
                <tr>
                    <td></td>
                    <td></td>
                </tr>
            <tr>
                <td>Hostel type: </td>
                <td><input type="text" name="hosteltype" <% if("Boys".equalsIgnoreCase(obj.getHosteltype())){%> value="Boys" <%} else if("Girls".equalsIgnoreCase(obj.getHosteltype())){%> value="Girls" <%} else if("Both".equalsIgnoreCase(obj.getHosteltype())){%> value="Both (Boys and Girls)" <%}%> readonly></td>
            </tr>
             <tr>
                <td>Total available rooms (for Boys): </td>
                <td><input type="number" name="hostelboysroom" value="<%=obj.getHostelboysroom()%>" readonly></td>
              </tr> 
              <tr>
                <td>Total available rooms (for Girls): </td>
                <td><input type="number" name="hostelgirlsroom" value="<%=obj.getHostelgirlsroom()%>" readonly></td>
              </tr> 
            <tr>
                <td>Amenities: </td>
                <td>
                    <input type="checkbox" id="airconditioner" name="airconditioner" value="Air Conditioner" <% if("1".equals(obj.getAirconditioner())){%> checked="true"<%}%> disabled>
                    <label for="Air Conditioner">  Air Conditioner</label>
                </br>
                    <input type="checkbox" id="mess" name="mess" value="Mess" <% if("1".equals(obj.getMess())){%> checked="true"<%}%> disabled>
                    <label for="Mess"> Mess</label>
                </br>
                    <input type="checkbox" id="wifi" name="wifi" value="Wifi" <% if("1".equals(obj.getWifi())){%> checked="true"<%}%> disabled>
                    <label for="wifi"> Wifi</label>
                </br>
                    <input type="checkbox" id="kitchen" name="kitchen" value="Kitchen" <% if("1".equals(obj.getKitchen())){%> checked="true"<%}%> disabled>
                    <label for="kitchen"> Kitchen</label>
                </br>
                    <input type="checkbox" id="lockers" name="lockers" value="Lockers" <% if("1".equals(obj.getLockers())){%> checked="true"<%}%> disabled>
                    <label for="lockers"> Lockers</label>
                </br>
                    <input type="checkbox" id="laundry" name="laundry" value="Laundry" <% if("1".equals(obj.getLaundry())){%> checked="true"<%}%> disabled>
                    <label for="laundry"> Laundry</label>
                </td>
    </tr>
    <tr>
      <td>Extra amenities (if any): </td>
      <td><input type="textarea" name="hostelextraamenities" value="<%=obj.getHostelextraamenities()%>" readonly></td>
    </tr>
     <tr>
      <td>Annual Rent: </td>
      <td><input type="textarea" name="hostelrent" value="INR <%=obj.getHostelrent()%>/-" readonly></td>
    </tr>
    <tr>
                    <td></td>
                    <td></td>
                </tr>
  </table>

  </BR>
  </BR>

  <H3>Contact details of hostel: </H3>
  </BR>
  <table class="table1">
      <tr>
                    <td></td>
                    <td></td>
                </tr>
    <tr>
      <td>Contact number: </td>
      <td><input type="tel" name="hostelcontact" value="<%=obj.getHostelcontact()%>" readonly></td>
    </tr>
    <tr>
      <td>Email id: </td>
      <td><input type="email" name="hostelemailid" value="<%=obj.getHostelemailid()%>" readonly></td>
    </tr>
    <tr>
        <td><button class = "invalidatebutton" type="button" onclick="location.href='Admin_Invalid_Hostel.jsp'">Invalidate</button></td>
          <td><input type="submit" value="Validate"></input></td>
    </tr>
    <tr>
                    <td></td>
                    <td></td>
                </tr>
  </table>
</div>
</form>
       </BR>
       </BR>
       <div class="footer">
           <p>@Author: Atharva Bagdare</p>
        </div>
    </body>
</html>
