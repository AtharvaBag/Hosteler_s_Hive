package model;

import db.DBConnector;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class Hostel_Page_Pincode_Authenticator {
    
    public static List <String> listofhostel = new ArrayList<>();
    public static List <String> listofvalidhostel = new ArrayList<>();
    public static List <String> listofhostelname = new ArrayList<>();
    public static List <String> listofhosteladdress = new ArrayList<>();
    public static List <String> listofhostelcontact = new ArrayList<>();
    public static List <String> listofhostelemailid  = new ArrayList<>();
    public static List <String> listofhosteltype  = new ArrayList<>();
            
        public boolean getOutput(String inputhostelpin)
        {
            int i=1, j=0;
            listofhostel.clear();
            listofvalidhostel.clear();
            String query="SELECT hostel_id FROM hostel_table WHERE hostel_pin='"+inputhostelpin+"'";
            System.out.println(query);
            try{
                Statement st = DBConnector.getStatement();
                ResultSet rs = st.executeQuery(query);
                while(rs.next())
                {
                    listofhostel.add(rs.getString(i));
                }
                System.out.println("All hostels: "+listofhostel);
                while(j<listofhostel.size())
                {
                    rs=st.executeQuery("SELECT hostel_id FROM admin_table WHERE valid='1' AND hostel_id='"+listofhostel.get(j)+"'");
                    if(rs.next())
                    {
                        listofvalidhostel.add(rs.getString(1));
                    }
                    j++; 
                }
                listofhostel.clear();
            }
            catch(SQLException e)
            {
                System.out.println(e);
            }
            System.out.println("Model: "+listofvalidhostel);
            if(listofvalidhostel.isEmpty())
            {
                return false;
            }
            else
            {
                return true;
            }
        }
        
        public List getDetailsOfHostels(String inputhostelpin)
        {
            int i=0;
           try{
               Statement st = DBConnector.getStatement();
               ResultSet rs = null;
                listofhostelname.clear();
                listofhosteladdress.clear();
                listofhostelcontact.clear();
                listofhostelemailid.clear();
                listofhosteltype.clear();
               while(i<listofvalidhostel.size())
               {
                   rs=st.executeQuery("SELECT hostel_name, hostel_address, hostel_contact, hostel_emailid, hostel_type FROM hostel_table WHERE hostel_id='"+listofvalidhostel.get(i)+"'");
                   System.out.println("SELECT hostel_name, hostel_address, hostel_contact, hostel_emailid, hostel_type FROM hostel_table WHERE hostel_id='"+listofvalidhostel.get(i)+"'");
                   while(rs.next())
                   {
                       listofhostelname.add(rs.getString(1));
                       listofhosteladdress.add(rs.getString(2));
                       listofhostelcontact.add(rs.getString(3));
                       listofhostelemailid.add(rs.getString(4));
                       listofhosteltype.add(rs.getString(5));
                   }
                   i++;
               }
           }
           catch(SQLException e)
           {
               System.out.println(e);
           }
           return listofvalidhostel;
        }
        
        public List getNameOfHostels(String inputhostelpin)
        {
            return listofhostelname;
        }
        
        public List getAddressOfHostels(String inputhostelpin)
        {
            return listofhosteladdress;
        }
        
        
        public List getContactOfHostels(String inputhostelpin)
        {
            return listofhostelcontact;
        }
        
        public List getEmailidOfHostels(String inputhostelpin)
        {
            return listofhostelemailid;
        }
        
        public List getTypeOfHostels(String inputhostelpin)
        {
            return listofhosteltype;
        }
        
        
}
