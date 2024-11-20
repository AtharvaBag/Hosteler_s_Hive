package model;
import db.DBConnector;
import dto.Hostel_DTO;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Hostel_Update_Authenticator {
    public boolean isValid(Hostel_DTO obj)
    {
        /*
        
        String hostelid = obj.getHostelid();
        String valid = null;
        String query_for_valid = "SELECT valid FROM admin_table WHERE hostel_id = '"+hostelid+"'";
        String query_for_database_details = "SELECT hostel_name, hostel_address, hostel_city, hostel_landmark, hostel_state, hostel_type, hostel_amenity_1, hostel_amenity_2, hostel_amenity_3, hostel_amenity_4, hostel_amenity_5, hostel_amenity_6, hostel_other_amenity, hostel_pin FROM hostel_table WHERE hostel_id='"+hostelid+"'";
        
        String dbhostelname=null;
        String dbhosteladdress=null;
        String dbhostelcity=null;
        String dbhostellandmark=null;
        String dbhostelstate=null;
        String dbhosteltype=null;
        String dbAirconditioner=null;
        String dbMess=null;
        String dbWifi=null;
        String dbKitchen=null;
        String dbLocker=null;
        String dbLaundry=null;
        String dbhostelextraamenity=null;
         String dbhostelpin=null;
        
        
        System.out.println(query_for_valid);
        System.out.println(query_for_database_details);
        
        Statement st = DBConnector.getStatement();
        try
        {
                ResultSet rs = st.executeQuery(query_for_valid);
                if(rs.next())
                {
                    valid=rs.getString(1);
                }
                rs=null;
                rs=st.executeQuery(query_for_database_details);
                if(rs.next())
                {
                    dbhostelname=rs.getString(1);
                    dbhosteladdress=rs.getString(2);
                    dbhostelcity=rs.getString(3);
                    dbhostellandmark=rs.getString(4);
                    dbhostelstate=rs.getString(5);
                    dbhosteltype=rs.getString(6);
                    dbAirconditioner=rs.getString(7);
                    dbMess=rs.getString(8);
                    dbWifi=rs.getString(9);
                    dbKitchen=rs.getString(10);
                    dbLocker=rs.getString(11);
                    dbLaundry=rs.getString(12);
                    dbhostelextraamenity=rs.getString(13);
                    dbhostelpin=rs.getString(14);
                }
        }
        catch(SQLException e)
        {
            System.out.println(e);
        }
        
        String airconditioner=obj.getAirconditioner();
            if(airconditioner==null)
                airconditioner="0";
            else 
                airconditioner="1";
            
            String mess=obj.getMess();
            if(mess==null)
                mess="0";
            else
                mess="1";
            
            String kitchen=obj.getKitchen();
               if(kitchen==null)
                   kitchen="0";
               else
                   kitchen="1";
               
              String lockers=obj.getLockers();
              if(lockers==null)
                  lockers="0";
              else 
                  lockers="1";
              
              String laundry=obj.getLaundry();
              if(laundry==null)
                  laundry="0";
              else 
                  laundry="1";
              
              String wifi=obj.getWifi();
              if(wifi==null)
                  wifi="0";
              else 
                  wifi="1";
            
        
        System.out.println("Database Hostel details: "+dbhostelname+" "+dbhosteladdress+" "+dbhostelcity+" "+dbhostellandmark+" "+dbhostelstate+" "+dbhosteltype+" "+dbAirconditioner+" "+dbMess+" "+dbWifi+" "+dbKitchen+" "+dbLocker+" "+dbLaundry+" "+dbhostelextraamenity+" "+dbhostelpin);
        System.out.println("User Hostel details: "+obj.getHostelname()+" "+obj.getHosteladdress()+" "+obj.getHostelcity()+" "+obj.getHostellandmark()+" "+obj.getHostelstate()+" "+obj.getHosteltype()+" "+airconditioner+" "+mess+" "+wifi+" "+kitchen+" "+lockers+" "+laundry+" "+obj.getHostelextraamenities()+" "+obj.getHostelpin());
        
        if("0".equals(valid))
        {
            
        }
        
        
        */
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
       if(!(obj.getHostelname().trim()==null) && !(obj.getHosteladdress().trim()==null) && !(obj.getHostelpin()==null) && !(obj.getHostelcontact()==null) && !(obj.getHostelcity()==null))
        {
            String hostelname=null;
            String hosteladdress=null;
            String hostelcity=null;
            String hostellandmark=null;
            String hostelpin=null;
            String hostelstate=null;
            String hosteltype=null;
            String dbAirconditioner=null;
            String dbMess=null;
            String dbKitchen=null;
            String dbLocker=null;
            String dbLaundry=null;
            String dbWifi=null;
            String hostelextraamenity=null;
            
            String valid=null;
            
            String airconditioner=obj.getAirconditioner();
            if(airconditioner==null)
                airconditioner="0";
            else 
                airconditioner="1";
            
            String mess=obj.getMess();
            if(mess==null)
                mess="0";
            else
                mess="1";
            
            String kitchen=obj.getKitchen();
               if(kitchen==null)
                   kitchen="0";
               else
                   kitchen="1";
               
              String lockers=obj.getLockers();
              if(lockers==null)
                  lockers="0";
              else 
                  lockers="1";
              
              String laundry=obj.getLaundry();
              if(laundry==null)
                  laundry="0";
              else 
                  laundry="1";
              
              String wifi=obj.getWifi();
              if(wifi==null)
                  wifi="0";
              else 
                  wifi="1";
            
              String query4="SELECT valid FROM admin_table WHERE hostel_id='"+obj.getHostelid()+"'";
              System.out.println(query4);
            
            String query="SELECT hostel_name, hostel_address, hostel_city, hostel_landmark, hostel_state, hostel_type, hostel_amenity_1, hostel_amenity_2, hostel_amenity_3, hostel_amenity_4, hostel_amenity_5, hostel_amenity_6, hostel_other_amenity, hostel_pin FROM hostel_table WHERE hostel_id='"+obj.getHostelid()+"'";
        
        
        
        
        try
               {
                     Statement st = DBConnector.getStatement();
                     System.out.println(query);
                     ResultSet rs=st.executeQuery(query4);
                     if(rs.next())
                     {
                         valid=rs.getString(1);
                     }
                     
                     rs = st.executeQuery(query);
                     if(rs.next())
                     {
                        hostelname=rs.getString(1);
                        hosteladdress=rs.getString(2);
                        hostelcity=rs.getString(3);
                        hostellandmark=rs.getString(4);
                        hostelstate=rs.getString(5);
                        hosteltype=rs.getString(6);
                        dbAirconditioner=rs.getString(7);
                        dbMess=rs.getString(8);
                        dbWifi=rs.getString(9);
                        dbKitchen=rs.getString(10);
                        dbLocker=rs.getString(11);
                        dbLaundry=rs.getString(12);
                        hostelextraamenity=rs.getString(13);
                        hostelpin=rs.getString(14);
                     }
                     
                     System.out.println("Hostel_Update_Authenticator: "+hostelname+" "+hosteladdress+" "+hostelstate+" "+hostelextraamenity);
                     
                     //Verified and registered hostel wants to update data
                      if((!(obj.getHostelstate().equals(hostelstate)) || !(obj.getHostelname().equals(hostelname)) || !(obj.getHostelcity().equals(hostelcity)) || !(obj.getHostelpin().equals(hostelpin)) || !(obj.getHostellandmark().equals(hostellandmark)) || !(obj.getHosteladdress().equals(hosteladdress)) || !(obj.getHosteltype().equals(hosteltype)) || !(airconditioner.equals(dbAirconditioner)) || !(mess.equals(dbMess)) || !(wifi.equals(dbWifi)) || !(kitchen.equals(dbKitchen)) || !(lockers.equals(dbLocker)) || !(laundry.equals(dbLaundry)) || !(obj.getHostelextraamenities().equals(hostelextraamenity))) && "1".equals(valid))
                      {
                          String query2 ="UPDATE admin_table SET valid='2' WHERE hostel_id='"+obj.getHostelid()+"'";
                          System.out.println(query2);
                          st.execute(query2);
                          String query3="UPDATE hostel_table SET hostel_name='"+obj.getHostelname()+"', hostel_address='"+obj.getHosteladdress()+"', hostel_landmark='"+obj.getHostellandmark()+"', hostel_pin='"+hostelpin+"', hostel_city='"+obj.getHostelcity()+"', hostel_state='"+obj.getHostelstate()+"', hostel_type='"+obj.getHosteltype()+"', hostel_boys_room='"+obj.getHostelboysroom()+"', hostel_girls_room='"+obj.getHostelgirlsroom()+"', hostel_annual_rent='"+obj.getHostelrent()+"', hostel_contact='"+obj.getHostelcontact()+"', hostel_emailid='"+obj.getHostelemailid()+"', hostel_other_amenity='"+obj.getHostelextraamenities()+"', hostel_amenity_1='"+airconditioner+"', hostel_amenity_2='"+mess+"', hostel_amenity_3='"+wifi+"', hostel_amenity_4='"+kitchen+"', hostel_amenity_5='"+lockers+"', hostel_amenity_6='"+laundry+"' WHERE hostel_id='"+obj.getHostelid()+"'";
                           System.out.println(query3);
                           st.execute(query3);
                      }
                      //only Registered hostel and not verified wants to update data
                      else if(obj.getHostelstate().equals(hostelstate) && obj.getHostelname().equals(hostelname) && obj.getHostelcity().equals(hostelcity) && obj.getHostelpin().equals(hostelpin) && obj.getHostellandmark().equals(hostellandmark) && obj.getHosteladdress().equals(hosteladdress) && obj.getHosteltype().equals(hosteltype) && airconditioner.equals(dbAirconditioner) && mess.equals(dbMess) && wifi.equals(dbWifi) && kitchen.equals(dbKitchen) && lockers.equals(dbLocker) && laundry.equals(dbLaundry) && obj.getHostelextraamenities().equals(hostelextraamenity) || !"0".equals(valid))
                      {
                          String query3="UPDATE hostel_table SET hostel_name='"+obj.getHostelname()+"', hostel_address='"+obj.getHosteladdress()+"', hostel_landmark='"+obj.getHostellandmark()+"', hostel_pin='"+obj.getHostelpin()+"', hostel_city='"+obj.getHostelcity()+"', hostel_state='"+obj.getHostelstate()+"', hostel_type='"+obj.getHosteltype()+"', hostel_boys_room='"+obj.getHostelboysroom()+"', hostel_girls_room='"+obj.getHostelgirlsroom()+"', hostel_annual_rent='"+obj.getHostelrent()+"', hostel_contact='"+obj.getHostelcontact()+"', hostel_emailid='"+obj.getHostelemailid()+"', hostel_other_amenity='"+obj.getHostelextraamenities()+"', hostel_amenity_1='"+airconditioner+"', hostel_amenity_2='"+mess+"', hostel_amenity_3='"+wifi+"', hostel_amenity_4='"+kitchen+"', hostel_amenity_5='"+lockers+"', hostel_amenity_6='"+laundry+"' WHERE hostel_id='"+obj.getHostelid()+"'";
                          System.out.println(query3);
                          st.execute(query3);
                      }                      else
                      {
                          String query3="UPDATE hostel_table SET hostel_name='"+obj.getHostelname()+"', hostel_address='"+obj.getHosteladdress()+"', hostel_landmark='"+obj.getHostellandmark()+"', hostel_pin='"+obj.getHostelpin()+"', hostel_city='"+obj.getHostelcity()+"', hostel_state='"+obj.getHostelstate()+"', hostel_type='"+obj.getHosteltype()+"', hostel_boys_room='"+obj.getHostelboysroom()+"', hostel_girls_room='"+obj.getHostelgirlsroom()+"', hostel_annual_rent='"+obj.getHostelrent()+"', hostel_contact='"+obj.getHostelcontact()+"', hostel_emailid='"+obj.getHostelemailid()+"', hostel_other_amenity='"+obj.getHostelextraamenities()+"', hostel_amenity_1='"+airconditioner+"', hostel_amenity_2='"+mess+"', hostel_amenity_3='"+wifi+"', hostel_amenity_4='"+kitchen+"', hostel_amenity_5='"+lockers+"', hostel_amenity_6='"+laundry+"' WHERE hostel_id='"+obj.getHostelid()+"'";
                          System.out.println(query3);
                          st.execute(query3);
                      }
                      //Hostel under reverifiction wants to update its data 

                }
               catch(SQLException e)
               {
                   System.out.println(e);
               }
               return true;
        }
        return false;
    }
}