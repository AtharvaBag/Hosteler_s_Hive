 <%@page import="model.Owner_Login_Authenticator"%>
<%@page import="dto.Owner_DTO"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Collection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="db.DBConnector"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
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
      padding: 10px;box-sizing: border-box;
      }

    
    .updateprofilebutton{
        font-family: sans-serif;
        font-size: 17px;
        border:0px;
        color: #333;
        text-align: center;
        background-color: transparent; 
        height: 48px;
        width: 200px;
    }
    
    .updateprofilebutton:hover{
        background-color: orangered;
        color: white;
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
  font-size: 30px;
  font-family: sans-serif;
  text-transform: uppercase;
  text-align:center;
  color: red;
}

.subhead{
  font-size: 25px;
  font-family: sans-serif;
  text-transform: uppercase;
  text-align:center;
}

.message{
     font-size: 25px;
  font-family: sans-serif;
  text-align:center;
}

H1{
    font-size: 40px;
    color: #333;
    text-transform: uppercase;
    text-align: center;
}
.table1{
  display: flex;
  justify-content: center;
  align-items: center;
}

.table1 input[type=submit]{
  background-color: transparent;
  border: 2px solid #333;
  color: #333;
  padding: 10px 16px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  cursor: pointer;
  border-radius: 25px;
}

.table1 input[type=submit]:hover{
    border: 2px solid white;
    color: white;
    background-color: black;
    opacity: 0.8;
}

.table2 td{
  padding:10px;
  font-size: 20px;
  font-family: sans-serif;
}

.table2 {
    margin-left: auto;
    margin-right: auto;
    background-color: black;
    opacity: 0.8;
    width: 40%;
    border-radius: 25px;
    border-collapse: collapse;
}
.table2 input{
  padding: 5px;
  background-color: transparent;
  border-radius: 20px;
  border: 1px solid white;
  text-align: center;
  color: white;
}

.table2 input[type='submit']{
    border: 2px solid white;
    background-color: transparent;
    color: white;
    font-size: 15px;
}

.table2 input[type='submit']:hover{
    color: red;
    border: 2px solid red;
}

 
        </style>
        <title>Hostel Finder | Owner Home Page</title>
        <link rel="icon" type="image/png" href="images/Hosteler's Hive Logo.png">
    </head>
    <body>
        <div class="topnav">
            <a class="active" href="Owner_Home.jsp">Home</a>
              <form action="Owner_Data_Update_Checker" method="post">
                    <input class="updateprofilebutton" type="Submit" value="Check/Update Profile"></input>
                </form>
            <div class="topnav-right">
              
                <a href="logout.jsp">Log Out</a>
            </div>

        </div>
        <%
            String username = (String) session.getAttribute("ownername");
            String userid = (String) session.getAttribute("ownerid");
            
            System.out.println("From Owner Home: "+ username+" "+userid);
            
            if (userid == null || userid.trim().equals("")) {
                response.sendRedirect("login.html");
            }
            
            Owner_DTO obj = (Owner_DTO)session.getAttribute("obj");
            Owner_Login_Authenticator check = new Owner_Login_Authenticator();
            HashMap <String, String>hostelnameidhashmap = check.getOwnerHostelData(obj);
            HashMap <String, String>verifiedhostelnameidhashmap = check.verifiedHostels(obj);
            
            System.out.println("Owner_Login jsp: "+hostelnameidhashmap);
            System.out.println("Owner_Login jsp: "+verifiedhostelnameidhashmap);
        %>
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
  

        </BR>
        <p class='greet'>Welcome <%=username%>!</p>
        </BR>
        <p class='subhead'>Owner ID: <%=userid%></p>
        </BR>
        </BR>
        <p class="message">List of your registered hostels (Under Verification/Re-verification Process): </p>
        </BR>

        <table  class="table2">
            <tr>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            
            <tr style="text-align: center; font-size: 20px">
                <td style="color: white"><b>Hostel Name</b></td>
                <td style="color: white"><b>Hostel Id</b></td>
                <td></td>
            </tr>
            <%
            if(!hostelnameidhashmap.isEmpty())
            {
                  for(String i: hostelnameidhashmap.keySet())
                  {
                      
            %>
            
            <form action="Hostel_Name_Getter" method="post">
            
            <tr>
                <td style="text-align: center; font-size: 20px; font-family: sans-serif; color: white">
                    <input type="text" value="<%=hostelnameidhashmap.get(i)%>" name="hostelname" id="hostelname" readonly></input>
                </td>
                 
                <td style="text-align: center; font-size: 20px; font-family: sans-serif; color: white">
                    <input type="text" value="<%=i %>" name="hostelid" id="hostelid" readonly></input>
                </td>
                
                <td>
                    <input type="submit"  name="submit" value="Get Details"></input>
                </td>
            </tr>
            </form>
            <%
                    }
            }
            else
            {
            %>
            <tr>
                <td style="text-align: center; font-size: 20px; font-family: sans-serif; color: white"><input type="text" value="No Data Found" readonly></input></td>
                
                <td style="text-align: center; font-size: 20px; font-family: sans-serif; color: white"><input type="text" value="No Data Found" readonly></input></td>
                <td></td>
            </tr>
            <%}%>
            <tr>
                <td></td>
                <td></td>
                <td></td>
            </tr>
        </table>
        </BR>
        </BR>
        
        <form action='hostel_register.html' method='post'>
            <div class="buttons">
                <table class="table1">
                    <tr>
                        <td><input type="submit" value="Add More Hostel +"></input></td>
                        <td></td>
                    </tr>
                </table>
            </div>
        </form>
        </BR>
        
        
        </BR>
        <p class="message">List of your registered and verified hostels: </p>
        </BR>
        
        <table class="table2">
            <tr>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr style="text-align: center; font-size: 20px">
                <td style="color: white"><b>Hostel Name</b></td>
                <td style="color: white"><b>Hostel Id</b></td>
                <td></td>
            </tr>
            <%
                if(!verifiedhostelnameidhashmap.isEmpty())
                {
                      for(String i: verifiedhostelnameidhashmap.keySet())
                      {
                      
            %>
            <form action="Hostel_Name_Getter" method="post">
            <tr>
                <td style="text-align: center; font-size: 20px; font-family: sans-serif; color: white">
                    <input type="text" value="<%=verifiedhostelnameidhashmap.get(i)%>" name="hostelname" id="hostelname" readonly></input></td>
                 
                <td style="text-align: center; font-size: 20px; font-family: sans-serif; color: white">
                    <input type="text" value="<%=i%>" name="hostelid" id="hostelid" readonly></input></td>
                
                <td>
                    <input type="submit" name="submit" value="Get Details"></input>
                </td>
            </tr>
            </form>
            <%
                    }
                }
                else
                {
            %>
            <tr>
                 <td style="text-align: center; font-size: 20px; font-family: sans-serif; color: white"><input type="text" value="No Data Found" readonly></input></td>
                
                <td style="text-align: center; font-size: 20px; font-family: sans-serif; color: white"><input type="text" value="No Data Found" readonly></input></td>
                <td></td>
            
            </tr>
            <%}%>
            <tr>
                <td></td>
                <td></td>
                <td></td>
            </tr>
        </table>
        </BR>
        </BR>
       <div class="footer">
           <p>@Author: Atharva Bagdare</p>
        </div>
</body>
</html>
