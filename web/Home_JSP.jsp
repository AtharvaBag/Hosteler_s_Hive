<%@page import="model.Hostel_Page_Nearby_Pincode"%>
<%@page import="model.Hostel_Page_Pincode_Authenticator"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>

<head>
  <title>Hostel Finder | Home</title>
  <link rel="icon" type="image/png" href="images/Hosteler's Hive Logo.png">
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
        background-size: 100%;
        background-repeat: no-repeat;
         background-attachment: fixed;
    }

    h1 {
      color: #333;
      text-align: center;
      text-transform: uppercase;
      font-size: 40px;
      font-family: sans-serif;
      margin-top: 10px;
    }

    .SearchBar {
      flex-grow: 1;
      display: flex;
      justify-content: center;
      margin-left: 1px;
      margin-right: 30px;
    }

    .SearchBar input::placeholder
    {
        color: #333;
    }
    .SearchBar input[type="text"] {
      padding: 6px 12px;
      margin-right: 2px;
      font-size: 17px;
      border: 2px solid #333;
      border-radius: 20px;
      background-color: transparent;
    }

    .SearchBar input[type="Submit"] {
      padding: 6px 12px;
      font-size: 17px;
      border: 2px solid red;
      border-radius: 20px;
      background-color: transparent;
      color: red;
      cursor: pointer;
      float: right;
    }

    .SearchBar input[type="Submit"]:hover {
      color: #333;
      border: 2px solid #333;
    }
      
      /* Common styles */
* {
  padding: 0;
  margin: 0;
  box-sizing: border-box;
  font-family: sans-serif;
}




.container {
  max-width: 1000px;
  width: 70%;
  margin: 10px auto;
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(400px, 1fr));
  grid-gap: 30px;
}

.box {
  padding: 20px;
  border-radius: 25px;
  color: black;
  text-align: center;
}

.table1 {
  width: 100%;
  border-collapse: collapse;
  background-color: black;
  opacity: 0.8;
  border-radius: 20px;
}

.table1 td {
    
  padding: 6px 16px;
  font-size: 20px;
  vertical-align: middle;
  text-align: left;
  color: white;
}

.table1 input {
  width: 100%;
  border-collapse: collapse;
  border: 0px;
  padding: 5px;
  font-size: 18px;
  background-color: transparent;
  color: white;
  
}

 .table1 input[type="Submit"] {
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

    .table1 input[type="Submit"]:hover {
        border: 2px solid red;
      color: red;
    }
    
    
.footer { position: fixed;
      bottom: 0;
      width: 100%;
      background-color: transparent;
      color: Black;
      text-align: left;
      padding: 10px;
      box-sizing: border-box;
    }

.greet {
  text-align: center;
  font-size: 30px;
  color: red;
}

.subhead {
  text-align: center;
  font-size: 25px;
}


      /* Style the scrollbar track */
::-webkit-scrollbar {
    width: 15px; /* Width of the entire scrollbar */
}

/* Style the scrollbar track */
::-webkit-scrollbar-track {
    background-color: transparent;
    border-radius: 20px;
}

/* Style the scrollbar thumb */
::-webkit-scrollbar-thumb {
    background-color: darkgray; /* Color of the scroll thumb */
    width: 18px;
    
    border-radius: 20px;
}

::-webkit-scrollbar-thumb:hover {
    background-color: gray; /* Color of the scroll thumb */
    width: 18px;
    
    border-radius: 20px;
}

    
 /* Up arrow button */
::-webkit-scrollbar-button:vertical:decrement {
    background-image: url("images/up-arrow.png");
    background-size: 90%;
    background-position: center;
    background-repeat: no-repeat;
    
}

/* Down arrow button */
::-webkit-scrollbar-button:vertical:increment {
    background-image: url("images/down-arrow.png");
    background-size: 90%;
    background-position: center;
    background-repeat: no-repeat;
}
  </style>
</head>

<body>
  <div class="topnav">
    <a class="active" href="home.html">Home</a>
    <a href="admin_login.html">Admin Login</a>
    <div class="SearchBar">
      <form action="Home_Page_Pincode_Checker" method="post">
        <input type="text" name="searchbarinputhostelpin" id="searchbarinputhostelpin" placeholder="Enter pin code of your area" pattern="[0-9]{6}">
        <input type="submit" value="Search">
      </form>
    </div>
    <div class="topnav-right">
      <a href="login.html">Log In</a>
      <a href="owner_register.html">Sign Up</a>
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
  <p class="greet">Welcome User!</p>
  </BR>
  <br>
  <%
    String searchbarinputhostelpin = (String) session.getAttribute("searchbarinputhostelpin");
    List<String> listofvalidhostel = new ArrayList<>();
    List<String> listofhostelname = new ArrayList<>();
    List<String> listofhostelcontact = new ArrayList<>();
    List<String> listofhosteladdress = new ArrayList<>();
    List<String> listofhostelemailid = new ArrayList<>();
    List<String> listofhosteltype = new ArrayList<>();
    if (searchbarinputhostelpin != null) {
        Hostel_Page_Pincode_Authenticator get = new Hostel_Page_Pincode_Authenticator();
        listofvalidhostel = get.getDetailsOfHostels(searchbarinputhostelpin);
        if (listofvalidhostel.isEmpty()) {
  %>
  <p class="subhead">Sorry, no verified hostels are available at the given area pincode <%= searchbarinputhostelpin %>!</p>
  <%
        } 
        else {
            listofhostelname = get.getNameOfHostels(searchbarinputhostelpin);
            listofhostelcontact = get.getContactOfHostels(searchbarinputhostelpin);
            listofhosteladdress = get.getAddressOfHostels(searchbarinputhostelpin);
            listofhostelemailid = get.getEmailidOfHostels(searchbarinputhostelpin);
            listofhosteltype = get.getTypeOfHostels(searchbarinputhostelpin);
  %>
  <p class="subhead">Following are some of our verified hostels at the given area pincode <%= searchbarinputhostelpin %>!</p>
  <%
        }
    }
  %>
  <div class="container">
    <%
      int i = 0;
     while (i < listofvalidhostel.size()) {
    %>
    <div class="box off-white">
      <form action="User_Hostel_Details" method="post">
        <table class="table1">
            <tr>
                <td></td>
                <td></td>
            </tr>
          <tr>
            <td><h3>Hostel Name:</h3></td>
            <td><input type="text" value="<%= listofhostelname.get(i) %>" name="hostelname" id="hostelname" readonly></td>
          </tr>
          <tr>
            <td><p>Hostel Type:</p></td>
            <td><input type="text" value="<%= listofhosteltype.get(i) %><% if (listofhosteltype.get(i).equals("Both")) { %> (Boys and Girls) <% } %>" name="hosteltype" id="hosteltype" readonly></td>
          </tr>
          <tr>
            <td><p>Hostel Address:</p></td>
            <td><input type="text" value="<%= listofhosteladdress.get(i) %>" name="hosteladdress" id="hosteladdress"readonly></td>
          </tr>
          <tr>
            <td><p>Hostel Contact:</p></td>
            <td><input type="text" value="<%= listofhostelcontact.get(i) %>" name="hostelcontact" id="hostelcontact" readonly></td>
          </tr>
          <tr>
            <td><p>Hostel Email:</p></td>
            <td><input type="text" value="<%= listofhostelemailid.get(i) %>" name="hostelemailid" id="hostelemailid" readonly></td>
          </tr>
            <tr>
              <td></td>  
              <td></td>
          </tr>
          <tr>  
              <td colspan='2'><input type='submit' value="Show Details" ></input></td>
          </tr>
          <tr>
              <td></td>
              <td></td>
          </tr>
        </table>
      </form>
    </div>
    <%
        i++;
      }
    %>
  </div>
  </BR>
  </BR>
  <%
            List <String> listofnearbyvalidhostel = new ArrayList <>();
            List <String> listofnearbyhostelname = new ArrayList <>();
            List <String> listofnearbyhostelpincode = new ArrayList <>();
            List <String> listofnearbyhostelcontact = new ArrayList <>();
            List <String> listofnearbyhostelemailid = new ArrayList <>();
            List <String> listofnearbyhosteladdress = new ArrayList <>();
            List <String> listofnearbyhosteltype = new ArrayList <>();
            
            Hostel_Page_Nearby_Pincode getList = new Hostel_Page_Nearby_Pincode(); 
            listofnearbyvalidhostel=getList.getNearbyHostelDetails();
            if(!listofnearbyvalidhostel.isEmpty())
            {
                %>
                 <p class="subhead">Some of our verified hostels nearby to the given area pincode <%= searchbarinputhostelpin %>!</p>
       <% 
            listofnearbyhostelname = getList.getNameOfNearbyHostels();
            listofnearbyhostelpincode = getList.getPincodeOfNearbyHostels();
            listofnearbyhostelcontact = getList.getContactOfNearbyHostels();
            listofnearbyhostelemailid = getList.getEmailidOfNearbyHostels();
            listofnearbyhosteladdress = getList.getAddressOfNearbyHostels();
            listofnearbyhosteltype = getList.getTypeOfNearbyHostels();
            %>
            <div class="container">
    <%
            i = 0;
            while (i < listofnearbyvalidhostel.size()) {
    %>
    <div class="box off-white">
      <form action="User_Hostel_Details" method="post">
        <table class="table1">
            <tr>
                <td></td>
                <td></td>
            </tr>
          <tr>
            <td><h3>Hostel Name:</h3></td>
            <td><input type="text" value="<%=listofnearbyhostelname.get(i) %>" name="hostelname" id="hostelname" readonly></td>
          </tr>
          <tr>
              <td><p>Hostel Area Pincode:</p></td>  
              <td><input type="text" value="<%= listofnearbyhostelpincode.get(i) %>" name="hostelpin" id="hostelpin" readonly></td>
          </tr>
          <tr>
            <td><p>Hostel Type:</p></td>
            <td><input type="text" value="<%= listofnearbyhosteltype.get(i) %><% if (listofnearbyhosteltype.get(i).equals("Both")) { %> (Boys and Girls) <% } %>" name="hosteltype" id="nearbyhosteltype" readonly></td>
          </tr>
          <tr>
            <td><p>Hostel Address:</p></td>
            <td><input type="text" value="<%= listofnearbyhosteladdress.get(i) %>" name="hosteladdress" id="hosteladdress"readonly></td>
          </tr>
          <tr>
            <td><p>Hostel Contact:</p></td>
            <td><input type="text" value="<%= listofnearbyhostelcontact.get(i) %>" name="hostelcontact" id="hostelcontact" readonly></td>
          </tr>
          <tr>
            <td><p>Hostel Email:</p></td>
            <td><input type="text" value="<%= listofnearbyhostelemailid.get(i) %>" name="hostelemailid" id="hostelemailid" readonly></td>
          </tr>
            <tr>
              <td></td>  
              <td></td>
          </tr>
          <tr>  
              <td colspan='2'><input type='submit' value="Show Details" ></input></td>
          </tr>
            <tr>
              <td></td>
              <td></td>
          </tr>
        </table>
      </form>
    </div>
    <%
        i++;
      }
    %>
  </div>
  </BR>
  </BR>
  <% }
  %>
 
  <div class="footer">
    <p>@Author: Atharva Bagdare</p>
  </div>
</body>

</html>
