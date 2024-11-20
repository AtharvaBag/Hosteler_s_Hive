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
        
      overflow: hidden;
      font-family: sans-serif;
      background-color: transparent;
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
      color: #333;
    }

    /* Add a color to the active/current link */
    .topnav a.active {
      background-color: #333;
      color: white;
    }

    .topnav a.active:hover {
      background-color: red;
      border-left: none;
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



*{
  padding: 0;
  margin: 0;
  font-family: sans-serif;
}

H3{
  font-size: 20px;
  font-family: sans-serif;
  text-align: center;
}

h1{
  font-size: 40px;
  font-family: sans-serif;
  text-transform: uppercase;
  text-align: center;
  color: #333;
}

body{
     
       background-image: url('https://static.vecteezy.com/system/resources/previews/022/737/904/original/modern-city-scape-silhouette-simple-minimalist-blue-city-skyline-background-urban-cityscape-silhouettes-illustration-vector.jpg');
       background-size: 100%;
        background-repeat: no-repeat;
         background-attachment: fixed;
        background-color: #506c9c; /* Fallback color if the image doesn't cover the whole area */
}

h2{
  font-size: 30px;
  font-family: sans-serif;
  text-align: center;
  color: red;
}


h3{
  font-size: 25px;
  font-family: sans-serif;
  text-align: center;
  color: #333;
}

h4{
  font-size: 23px;
  font-family: sans-serif;
  text-align: center;
  color: #333;
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
}
.table1 input{
  border-radius: 20px;
  border: 1px solid white;
  padding: 5px;
  font-size: 15px;
  background-color: transparent;
  color: white;
  text-align: center;
}


.buttons{
    width: 100%;
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

.buttons:hover{
    background-color: transparent;
    color: red;
    border: 2px solid red;
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
    </style>
    
<%
                Hostel_DTO obj = (Hostel_DTO)session.getAttribute("hostel_details_obj");
                String searchbarinputhostelpin = (String)session.getAttribute("searchbarinputhostelpin");
                if(obj.equals(null))
                {
                    response.sendRedirect("home.html");
                }
%>
          
        <title>Hostel Details | Hostel Finder</title>
        </head>
            <body>
            <div class="topnav">
            <a class="active" href="home.html">Home</a>
            <div class="topnav-right">
                <!--<a href="Home_JSP.jsp">Back</a>-->
                <%
    if(searchbarinputhostelpin==null)
    {
    %>
    <a href="Home_JSP2.jsp">Back</a>
     <%
     }
     else
    {
     %>
     <a href="Home_JSP.jsp">Back</a>
     <%
     }
     %>
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
        <h2>Hello User!<h2>
        </BR>
        <h3>Hostel Details</h3>
        </BR>
         </BR>
         <H4>Basic Details of hostel: </H4></BR>
        <table class="table1">
            <tr>
                <td></td>
                <td></td>
            </tr>
    <tr>
      <td><Strong>Hostel Name: <Strong></td>
      <td><input type="text" name="hostelname" value="<%=obj.getHostelname()%>" readonly></td>
    </tr>
    <tr>
      <td>Address: </td>
      <td><input type="text" name="hosteladdress" value="<%=obj.getHosteladdress()%>" readonl></td>
    </tr>
    <tr>
      <td>Landmark: </td>
      <td><input type="text" name="hostellandmark" value="<%=obj.getHostellandmark()%>" readonly></td>
    </tr>
    <tr>
      <td>Area Pin Code: </td>
      <td><input type="tel" name="hostelpin" value="<%=obj.getHostelpin()%>" pattern="[0-9]{6}" readonly></td>
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

  <H4>Accommodation details of hostel: </H4></BR>
  <table class="table1">
      <tr>
                <td></td>
                <td></td>
            </tr>
    <tr>
      <td>Hostel type: </td>
      <td><input TYPE="Radio" name="hosteltype" value="Boys" <% if("Boys".equalsIgnoreCase(obj.getHosteltype())){%> checked="true"<%}%> disabled="true"><Label style="color: white" for="Boys"> Boys only</Labell>
      </br>
      <INPUT TYPE="Radio" name="hosteltype" value="Girls" <% if("Girls".equalsIgnoreCase(obj.getHosteltype())){%> checked="true"<%}%> disabled="true"><Label style="color: white" for="Girls"> Girls only</Label>
      </br>
      <INPUT TYPE="Radio" name="hosteltype" value="Both" <% if("Both".equalsIgnoreCase(obj.getHosteltype())){%> checked="true"<%}%> disabled="true"><Label style="color: white" for="Both"> Both (Boys and Girls)</Label></td>
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
      <input type="checkbox" id="airconditioner" name="airconditioner" value="Air Conditioner" <% if("1".equals(obj.getAirconditioner())){%> checked="true"<%}%> disabled="true">
      <label style="color: white" for="Air Conditioner">  Air Conditioner</label>
      </br>
      <input type="checkbox" id="mess" name="mess" value="Mess" <% if("1".equals(obj.getMess())){%> checked="true"<%}%> disabled="true">
      <label style="color: white" for="Mess"> Mess</label>
      </br>
      <input type="checkbox" id="wifi" name="wifi" value="Wifi" <% if("1".equals(obj.getWifi())){%> checked="true"<%}%> disabled="true">
      <label style="color: white" for="wifi"> Wifi</label>
      </br>
      <input type="checkbox" id="kitchen" name="kitchen" value="Kitchen" <% if("1".equals(obj.getKitchen())){%> checked="true"<%}%> disabled="true">
      <label style="color: white" for="kitchen"> Kitchen</label>
      </br>
      <input type="checkbox" id="lockers" name="lockers" value="Lockers" <% if("1".equals(obj.getLockers())){%> checked="true"<%}%> disabled="true">
      <label style="color: white" for="lockers"> Lockers</label>
      </br>
      <input type="checkbox" id="laundry" name="laundry" value="Laundry" <% if("1".equals(obj.getLaundry())){%> checked="true"<%}%> disabled="true">
      <label style="color: white" for="laundry"> Laundry</label>
    </td>
    </tr>
    <tr>
      <td>Extra amenities: </td>
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

  <H4>Contact details of hostel: </H4></BR>
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
    <%
    if(searchbarinputhostelpin==null)
    {
    %>
    <tr>
          <td colspan='2'><button class="buttons" type="button" onclick="location.href='Home_JSP2.jsp'"> OK!</button></td>
     </tr>   
     <%
     }
     else
    {
     %>
      <tr>
          <td colspan='2'><button class="buttons" type="button" onclick="location.href='Home_JSP.jsp'"> OK!</button></td>
     </tr>  
     <%
     }
     %>
  <tr>
                <td></td>
                <td></td>
            </tr>
  </table>


    </BR>
        </BR>
    </BR>
        <div class="footer">
           <p>@Author: Atharva Bagdare</p>
        </div> 
    </body>

</html>
