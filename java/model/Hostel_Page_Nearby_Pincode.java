package model;

import db.DBConnector;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


public class Hostel_Page_Nearby_Pincode 
{
    static String nearbyPin=null;
    static List <String> listofnearbyhostel= new ArrayList<>();
    static List <String> listofnearbyvalidhostel= new ArrayList<>();
    static List <String> listofnameofnearbyvalidhostel = new ArrayList <>();
    static List <String> listofaddressofnearbyvalidhostel = new ArrayList <>();
    static List <String> listofpincodeofnearbyvalidhostel = new ArrayList <>();
    static List <String> listoftypeofnearbyvalidhostel = new ArrayList <>();
    static List <String> listofcontactofnearbyvalidhostel = new ArrayList <>();
    static List <String> listofemailidofnearbyvalidhostel = new ArrayList <>();
    
    public boolean isAvailable(String pincode)
    {
        int j=0;
        nearbyPin=pincode.substring(0, 4);
        listofnearbyhostel.clear();
        listofnearbyvalidhostel.clear();
        String query = "SELECT hostel_id FROM hostel_table WHERE hostel_pin LIKE '" + nearbyPin + "%' AND hostel_pin <> '"+pincode+"'";
        System.out.println(query);
        try{
           Statement st=DBConnector.getStatement();
           ResultSet rs=st.executeQuery(query);
           while(rs.next())
           {
               listofnearbyhostel.add(rs.getString(1));
           }
           System.out.println("All nearby hostels: "+listofnearbyhostel);
           while(j<listofnearbyhostel.size())
           {
               rs=st.executeQuery("SELECT hostel_id FROM admin_table WHERE valid='1' AND hostel_id='"+listofnearbyhostel.get(j)+"'");
               System.out.println("SELECT hostel_id FROM admin_table WHERE valid='1' AND hostel_id='"+listofnearbyhostel.get(j)+"'");
               if(rs.next())
               {
                   listofnearbyvalidhostel.add(rs.getString(1));
               }
               j++;
           }
        }
        catch(SQLException e)
        {
            System.out.println(e);
        }
        System.out.println("Nearby valid hostel list: "+listofnearbyvalidhostel);
        if(listofnearbyvalidhostel.isEmpty())
        {
            return false;
        }
        else
        {
            return true;
        }
    }
    
    
    public List getNearbyHostelDetails()
    {
        int i=0;
        try{
               Statement st = DBConnector.getStatement();
               ResultSet rs = null;
                listofnameofnearbyvalidhostel.clear();
                listofaddressofnearbyvalidhostel.clear();
                listofpincodeofnearbyvalidhostel.clear();
                listoftypeofnearbyvalidhostel.clear();
                listofcontactofnearbyvalidhostel.clear();
                listofemailidofnearbyvalidhostel.clear();
               while(i<listofnearbyvalidhostel.size())
               {
                   rs=st.executeQuery("SELECT hostel_name, hostel_address, hostel_pin, hostel_type, hostel_contact, hostel_emailid FROM hostel_table WHERE hostel_id='"+listofnearbyvalidhostel.get(i)+"'");
                   //System.out.println("SELECT hostel_name, hostel_address, hostel_pin, hostel_type, hostel_contact, hostel_emailid FROM hostel_table WHERE hostel_id='"+listofnearbyvalidhostel.get(i)+"'");
                   while(rs.next())
                   {
                       listofnameofnearbyvalidhostel.add(rs.getString(1));
                       listofaddressofnearbyvalidhostel.add(rs.getString(2));
                       listofpincodeofnearbyvalidhostel.add(rs.getString(3));
                       listoftypeofnearbyvalidhostel.add(rs.getString(4));
                       listofcontactofnearbyvalidhostel.add(rs.getString(5));
                       listofemailidofnearbyvalidhostel.add(rs.getString(6));
                   }
                   i++;
               }
           }
           catch(SQLException e)
           {
               System.out.println(e);
           }
           return listofnearbyvalidhostel;
        }
    
        public List getNameOfNearbyHostels()
        {
            return listofnameofnearbyvalidhostel;
        }
        
        public List getAddressOfNearbyHostels()
        {
            return listofaddressofnearbyvalidhostel;
        }
        
        public List getPincodeOfNearbyHostels()
        {
            return listofpincodeofnearbyvalidhostel;
        }
        
        public List getContactOfNearbyHostels()
        {
            return listofcontactofnearbyvalidhostel;
        }
        
        public List getEmailidOfNearbyHostels()
        {
            return listofemailidofnearbyvalidhostel;
        }
        
        public List getTypeOfNearbyHostels()
        {
            return listoftypeofnearbyvalidhostel;
        }
}
    

