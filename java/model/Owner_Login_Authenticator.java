package model;

import dto.Owner_DTO;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.SQLException;
import db.DBConnector;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class Owner_Login_Authenticator 
{
       public boolean isLogin(Owner_DTO owner_login_obj)
       {
           String ownername=owner_login_obj.getOwnerName().trim();
           String ownerpassword=owner_login_obj.getOwnerPassword();
           String ownerid=owner_login_obj.getOwnerId().trim();
           
           String tableOwnerPassword=null;
           String tableOwnerName=null;
           try
           {
               
               Statement st=DBConnector.getStatement();
               String query="SELECT owner_name,owner_password FROM owner_table WHERE owner_id='"+ownerid+"'";
               System.out.println(query);
               ResultSet rs=st.executeQuery(query);
               if(rs.next())
               {
                    tableOwnerName=rs.getString(1);
                    tableOwnerPassword=rs.getString(2);
               }
           }
           
           catch(SQLException e)
           {
               System.out.println(e);
           }
           tableOwnerName = tableOwnerName.trim();
           
           System.out.println(tableOwnerName+" "+tableOwnerPassword);
           if(ownername!=null && ownerpassword!=null && !ownername.trim().equals("")  && ownerpassword.equals(tableOwnerPassword) && ownerid!=null && !ownerid.trim().equals("") && ownername.equalsIgnoreCase(tableOwnerName))
           {
               System.out.println("Login Successful!");
               return true;
           }
            System.out.println("Login Unsuccessful!");
           return false;
       }
       
       public HashMap getOwnerHostelData(Owner_DTO obj)
       {
           HashMap <String, String> hostelnameidhashmap= new HashMap<>();
           List <String> hostelidlist = new ArrayList<>();
           String query="SELECT hostel_id FROM admin_table WHERE owner_id='"+obj.getOwnerId()+"'";
           System.out.println(query);
           int i=1;
           try
           {
               Statement st=DBConnector.getStatement();
               ResultSet rs=st.executeQuery(query);
               while(rs.next())
               {
                   hostelidlist.add(rs.getString(1));
               }
           }
           catch(SQLException e)
           {
               System.out.println(e);
           }
           System.out.println("Hostelid list: "+hostelidlist);
           try
           {
               Statement st=DBConnector.getStatement();
               ResultSet rs = null;
               int j=0;
               while(j<hostelidlist.size())
               {
                    rs = st.executeQuery("SELECT hostel_name FROM hostel_table WHERE hostel_id='"+hostelidlist.get(j)+"'");
                    while(rs.next())
                    {
                        hostelnameidhashmap.put(hostelidlist.get(j), rs.getString(1));
                    }
                    j++;
               }
              }
           catch(SQLException e)
           {
               System.out.println(e);
           }
           System.out.println("hostelidlist: "+hostelidlist);
           System.out.println("hostelnameidhashmap: "+hostelnameidhashmap);
           return hostelnameidhashmap;
       }
       
       public HashMap verifiedHostels(Owner_DTO obj)
       {
           HashMap <String, String> verifiedhostelnameidhashmap = new HashMap<>();
           List <String> verifiedhostelidlist = new ArrayList<>();
           String query = "SELECT hostel_id FROM admin_table WHERE owner_id = '"+obj.getOwnerId()+"' AND valid='1'";
           System.out.println(query);
           try
           {
               Statement st = DBConnector.getStatement();
               ResultSet rs = st.executeQuery(query);
               while(rs.next())
               {
                   verifiedhostelidlist.add(rs.getString(1));
               }
           }
           catch(SQLException e)
           {
               System.out.println(e);
           }
            System.out.println(verifiedhostelidlist);
          try
          {
              Statement st = DBConnector.getStatement();
              ResultSet rs;
              int i=0;
              while(i<verifiedhostelidlist.size())
              {
                  rs= st.executeQuery("SELECT hostel_name FROM hostel_table WHERE hostel_id='"+verifiedhostelidlist.get(i)+"'");
                  if(rs.next())
                  {
                      verifiedhostelnameidhashmap.put(verifiedhostelidlist.get(i), rs.getString(1));
                  }
                  i++;
              }
            }
           catch(SQLException e)
           {
                    System.out.println(e);
           }
          System.out.println("verfied hostel id hash map: "+verifiedhostelnameidhashmap);
          return verifiedhostelnameidhashmap;
       }
}