package model;

import db.DBConnector;
import dto.HostelDetails_DTO;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class User_Hostel_Provider {
    
     static List <String> listofreqiredhostels = new ArrayList<>();
     static List <String> listofreqiredvalidhostels = new ArrayList<>();
     static List <String> listofreqiredvalidhostelname = new ArrayList<>();
     static List <String> listofreqiredvalidhosteladdress = new ArrayList<>();
     static List <String> listofreqiredvalidhostelcontact = new ArrayList<>();
     static List <String> listofreqiredvalidhostelemailid = new ArrayList<>();
     static List <String> listofreqiredvalidhostelpincode = new ArrayList<>();
     static List <String> listofreqiredvalidhosteltype = new ArrayList<>();
      
    public boolean checkHostel(HostelDetails_DTO setData)
    {
        String inputstate =  setData.getResulthostelstate();
        String inputcity = setData.getResulthostelcity();
        String inputpincode = setData.getResulthostelpin();
        if(inputpincode.isEmpty())
            inputpincode=null;
        String inputextraamenity = setData.getResultextraamenity();
        if(inputextraamenity.isEmpty())
            inputextraamenity=null;
        String inputhosteltype = setData.getResulthosteltype();
        if(inputhosteltype == null)
            inputhosteltype="both";
        
        String inputannualrent = setData.getResultannualrent();
        
        String inputkitchen = setData.getResultkitchens();
        if(inputkitchen == null)
               inputkitchen="0";
        else
                inputkitchen="1";
        String inputwifi = setData.getResultwifi();
         if(inputwifi == null)
               inputwifi="0";
        else
                inputwifi="1";
        String inputmess = setData.getResultmess();
        if(inputmess == null)
               inputmess="0";
        else
                inputmess="1";
        String inputairconditioner = setData.getResultairconditioner();
        if(inputairconditioner == null)
               inputairconditioner="0";
        else
                inputairconditioner="1";
        String inputlaundry = setData.getResultlaundry();
         if(inputlaundry == null)
               inputlaundry="0";
        else
                inputlaundry="1";
        String inputlocker = setData.getResultlockers();
        if(inputlocker == null)
               inputlocker="0";
        else
                inputlocker="1";
        
        //System.out.println(inputstate +" "+ inputcity +" "+ inputpincode +" "+ inputextraamenity +" "+ inputhosteltype +" "+ inputannualrent +" "+inputmess+" "+ inputkitchen +" "+ inputwifi +" "+ inputlaundry +" "+ inputlocker +" "+ inputairconditioner);
        
        String query="SELECT Hostel_id FROM Hostel_Table WHERE hostel_city = '"+inputcity.trim()+"' ";
       
         if(!(inputstate==null))
        {
            query=query+"AND hostel_state='"+inputstate+"' ";
        }
        if(!(inputpincode==null))
        {
            query=query+"AND hostel_pin='"+inputpincode+"' ";
        }
        
        if(!(inputhosteltype==null))
        {
            query=query+"AND hostel_type='"+inputhosteltype+"' ";
        }
        else
        {
            query=query+"AND hostel_type='both' ";
        }
        
        if(!(inputannualrent==null))
        {
            if(inputannualrent.equals("rent1"))
                query=query+"AND hostel_annual_rent>=25000 AND hostel_annual_Rent<35000 ";
            
            else if(inputannualrent.equals("rent2"))
                query=query+"AND hostel_annual_rent>=35000 AND hostel_annual_Rent<45000 ";
            
            else if(inputannualrent.equals("rent3"))
                query=query+"AND hostel_annual_rent>=45000 AND hostel_annual_Rent<55000 ";
            
            else if(inputannualrent.equals("rent4"))
                query=query+"AND hostel_annual_rent>=55000 AND hostel_annual_Rent<65000 ";
            
            else if(inputannualrent.equals("rent5"))
                query=query+"AND hostel_annual_rent>=65000 ";
        }
        
        if(inputairconditioner.equals("1"))
            query=query+"AND hostel_amenity_1='1' ";
        
        
        if(inputmess.equals("1"))
            query=query+"AND hostel_amenity_2='1' ";
        
        
        if(inputwifi.equals("1"))
            query=query+"AND hostel_amenity_3='1' ";
        
        
        if(inputkitchen.equals("1"))
            query=query+"AND hostel_amenity_4='1' ";
        
        if(inputlocker.equals("1"))
            query=query+"AND hostel_amenity_5='1' ";
        
        if(inputlaundry.equals("1"))
            query=query+"AND hostel_amenity_6='1' ";
        
        if(!(inputextraamenity==null))
            query=query+"AND hostel_other_amenity LIKE '%"+inputextraamenity.trim()+"%' ";
        
        int i=0;
        
        System.out.println(query);
        try{
            Statement st = DBConnector.getStatement();
            ResultSet rs = st.executeQuery(query);
            listofreqiredhostels.clear();
            listofreqiredvalidhostels.clear();
            while(rs.next())
            {
                listofreqiredhostels.add(rs.getString(1));
            }
            while(i<listofreqiredhostels.size())
            {
                 rs=st.executeQuery("SELECT hostel_id FROM admin_table WHERE valid='1' AND hostel_id='"+listofreqiredhostels.get(i)+"'");
                if(rs.next())
                {
                    listofreqiredvalidhostels.add(rs.getString(1));
                }
                i++;
            }
            
        }
        catch(SQLException e)
        {
            System.out.println(e);
        }
        
        System.out.println("List of valid hostels: "+listofreqiredvalidhostels);
        
        if(listofreqiredvalidhostels.isEmpty())
        {
             listofreqiredvalidhostelname.clear();
            listofreqiredvalidhostelpincode.clear();
            listofreqiredvalidhostelcontact.clear();
            listofreqiredvalidhostelemailid.clear();
            listofreqiredvalidhosteladdress.clear();
            listofreqiredvalidhosteltype.clear();
            return false;
        }
        
        else
        {
            i=0;
            listofreqiredvalidhostelname.clear();
            listofreqiredvalidhostelpincode.clear();
            listofreqiredvalidhostelcontact.clear();
            listofreqiredvalidhostelemailid.clear();
            listofreqiredvalidhosteladdress.clear();
            listofreqiredvalidhosteltype.clear();
            try
            {
                Statement st = DBConnector.getStatement();
                ResultSet rs = null;
                while(i<listofreqiredvalidhostels.size())
                {
                    rs = st.executeQuery("SELECT hostel_name, hostel_pin, hostel_contact, hostel_emailid, hostel_address, hostel_type FROM hostel_table WHERE hostel_id='"+listofreqiredvalidhostels.get(i)+"'");
                    if(rs.next())
                    {
                        listofreqiredvalidhostelname.add(rs.getString(1));
                        listofreqiredvalidhostelpincode.add(rs.getString(2));
                        listofreqiredvalidhostelcontact.add(rs.getString(3));
                        listofreqiredvalidhostelemailid.add(rs.getString(4));
                        listofreqiredvalidhosteladdress.add(rs.getString(5));
                        listofreqiredvalidhosteltype.add(rs.getString(6));
                    }
                    i++;
                }
            }
            catch(SQLException e)
            {
                System.out.println(e);
            }
            System.out.println("list of required valid hostel name: "+listofreqiredvalidhostelname);
            return true;
        }
            
    }
    
    public List provideHostelName()
    {
        return listofreqiredvalidhostelname;
    }
    
    public List provideHostelContact(){
        return listofreqiredvalidhostelcontact;
    }
    
    public List provideHostelAddress(){
        return listofreqiredvalidhosteladdress;
    }
    
    public List provideHostelEmailid(){
        return listofreqiredvalidhostelemailid;
    }
    
    public List provideHostelPincode(){
        return listofreqiredvalidhostelpincode;
    }
    
    public List provideHostelType(){
        return listofreqiredvalidhosteltype;
    }
    
    public static List <String> listofhostelsnearbytopincode = new ArrayList<>();
    public static List <String> listofvalidhostelsnearbytopincode = new ArrayList<>();
    public static List <String> listofnameofvalidhostelsnearbytopincode = new ArrayList<>();
    public static List <String> listoftypeofvalidhostelsnearbytopincode = new ArrayList<>();
    public static List <String> listofcontactofvalidhostelsnearbytopincode = new ArrayList<>();
    public static List <String> listofaddressofvalidhostelsnearbytopincode = new ArrayList<>();
    public static List <String> listofemailidvalidhostelsnearbytopincode = new ArrayList<>();
    public static List <String> listofpincodevalidhostelsnearbytopincode = new ArrayList<>();
    
    
    public boolean nearbyHostelsToPincode(String inputcity, String inputpincode)
    {
        String nearbypin = inputpincode.substring(0, 4);
        String query = "SELECT hostel_id FROM hostel_table WHERE hostel_city = '"+inputcity.trim()+"' AND hostel_pin LIKE '"+nearbypin+"%' ";
        System.out.println(query);
        try
        {
            listofhostelsnearbytopincode.clear();
            Statement st=DBConnector.getStatement();
            ResultSet rs = st.executeQuery(query);
            while(rs.next())
            {
                listofhostelsnearbytopincode.add(rs.getString(1));
            }
            System.out.println(listofhostelsnearbytopincode);
            if(listofhostelsnearbytopincode.isEmpty())
            {
                listofvalidhostelsnearbytopincode=null;
                System.out.println("From user_Hostel_Provider: no hostel found");
                return false;
            }
            else
            {
                int i=0;
                listofvalidhostelsnearbytopincode.clear();
                while(i<listofhostelsnearbytopincode.size())
                {
                    rs=st.executeQuery("SELECT hostel_id FROM admin_table WHERE valid='1' AND hostel_id = '"+listofhostelsnearbytopincode.get(i)+"'");
                    if(rs.next())
                    {
                        listofvalidhostelsnearbytopincode.add(rs.getString(1));
                    }
                    i++;
                }
                if(!listofvalidhostelsnearbytopincode.isEmpty())
                {
                    i=0;
                    listofnameofvalidhostelsnearbytopincode.clear();
                    listoftypeofvalidhostelsnearbytopincode.clear();
                    listofcontactofvalidhostelsnearbytopincode.clear();
                    listofemailidvalidhostelsnearbytopincode.clear();
                    listofaddressofvalidhostelsnearbytopincode.clear();
                    listofpincodevalidhostelsnearbytopincode.clear();
                    while(i<listofvalidhostelsnearbytopincode.size())
                    {
                        rs=st.executeQuery("SELECT hostel_name, hostel_type, hostel_contact, hostel_emailid, hostel_address, hostel_pin FROM hostel_table WHERE hostel_id='"+listofvalidhostelsnearbytopincode.get(i)+"'");
                        if(rs.next())
                        {
                            listofnameofvalidhostelsnearbytopincode.add(rs.getString(1));
                            listoftypeofvalidhostelsnearbytopincode.add(rs.getString(2));
                            listofcontactofvalidhostelsnearbytopincode.add(rs.getString(3));
                            listofemailidvalidhostelsnearbytopincode.add(rs.getString(4));
                            listofaddressofvalidhostelsnearbytopincode.add(rs.getString(5));
                            listofpincodevalidhostelsnearbytopincode.add(rs.getString(6));
                        }
                        i++;
                    }
                }
            }
        }
        catch(SQLException e)
        {
            System.out.println(e);
        }
        if(listofvalidhostelsnearbytopincode.isEmpty())
            return false;
        else 
            return true;
    }
    
    public List provideValidHostelsNearbyToPincode()
    {
        return listofvalidhostelsnearbytopincode;
    }
    
    public List provideNameOfValidHostelsNearbyToPincode()
    {
        return listofnameofvalidhostelsnearbytopincode;
    }
    
    public List provideTypeOfValidHostelsNearbyToPincode()
    {
        return listoftypeofvalidhostelsnearbytopincode;
    }
    
    public List provideContactOfValidHostelsNearbyToPincode()
    {
        return listofcontactofvalidhostelsnearbytopincode;
    }
    
    public List provideEmailidOfValidHostelsNearbyToPincode()
    {
        return listofemailidvalidhostelsnearbytopincode;
    }
    
     public List provideAddressOfValidHostelsNearbyToPincode()
    {
        return listofaddressofvalidhostelsnearbytopincode;
    }
    
     public List providePincodeOfValidHostelsNearbyToPincode()
    {
        return listofpincodevalidhostelsnearbytopincode;
    }

     static List <String> listofallhostelsincity = new ArrayList<>();
     static List <String> listofallvalidhostelsincity = new ArrayList<>();
     static List <String> listofnameofallvalidhostelsincity = new ArrayList<>();
     static List <String> listofaddressofallvalidhostelsincity = new ArrayList<>();
     static List <String> listofcontactofallvalidhostelsincity = new ArrayList<>();
     static List <String> listofemailidofallvalidhostelsincity = new ArrayList<>();
     static List <String> listofpincodeofallvalidhostelsincity = new ArrayList<>();
     static List <String> listoftypeofallvalidhostelsincity = new ArrayList<>();
     
     
    public boolean getAllHostelsOfCity(String inputcity) {
                String query="SELECT hostel_id FROM hostel_table WHERE hostel_city='"+inputcity.trim()+"'";
                System.out.println(query);
                try
                {
                    Statement st=DBConnector.getStatement();
                    ResultSet rs = st.executeQuery(query);
                    listofallhostelsincity.clear();
                    while(rs.next())
                    {
                        listofallhostelsincity.add(rs.getString(1));
                    }
                    if(listofallhostelsincity.isEmpty())
                        return false;
                    else
                    {
                        int i=0;
                        listofallvalidhostelsincity.clear();
                        listofnameofallvalidhostelsincity.clear();
                        listofaddressofallvalidhostelsincity.clear();
                        listofcontactofallvalidhostelsincity.clear();
                        listofemailidofallvalidhostelsincity.clear();
                        listofpincodeofallvalidhostelsincity.clear();
                        listoftypeofallvalidhostelsincity.clear();
                        
                        while(i<listofallhostelsincity.size())
                            {
                                rs=st.executeQuery("SELECT hostel_id FROM admin_table WHERE valid='1' AND hostel_id='"+listofallhostelsincity.get(i)+"'");
                                if(rs.next())
                                {
                                    listofallvalidhostelsincity.add(rs.getString(1));
                                }
                                i++;
                        }
                        System.out.println(listofallhostelsincity);
                        if(listofallvalidhostelsincity.isEmpty())
                                return false;
                        else
                        {
                            i=0;
                            while(i<listofallvalidhostelsincity.size())
                            {
                                rs=st.executeQuery("SELECT hostel_name, hostel_type, hostel_contact, hostel_emailid, hostel_address, hostel_pin FROM hostel_table WHERE hostel_id='"+listofallvalidhostelsincity.get(i)+"'");
                                if(rs.next())
                                {
                                    listofnameofallvalidhostelsincity.add(rs.getString(1));
                                    listoftypeofallvalidhostelsincity.add(rs.getString(2));
                                    listofcontactofallvalidhostelsincity.add(rs.getString(3));
                                    listofemailidofallvalidhostelsincity.add(rs.getString(4));
                                    listofaddressofallvalidhostelsincity.add(rs.getString(5));
                                    listofpincodeofallvalidhostelsincity.add(rs.getString(6));
                                }
                                i++;
                            }
                            System.out.println(listofnameofallvalidhostelsincity);
                        }
                        
                    }
                }
                catch(SQLException e)
                {
                            System.out.println(e);
                }
                 return true;
    }
    
    public List<String> sendListOfAllvalidHostels()
    {
        return listofallvalidhostelsincity;
    }
    
    public List<String> sendNameOfAllHostels()
    {
        return listofnameofallvalidhostelsincity;
    }
    
    public List<String> sendPincodeOfAllHostels()
    {
        return listofpincodeofallvalidhostelsincity;
    }
    
    public List<String> sendAddressOfAllHostels()
    {
        return listofaddressofallvalidhostelsincity;
    }
    
    public List<String> sendEmailidOfAllHostels()
    {
        return listofemailidofallvalidhostelsincity;
    }
    
    public List<String> sendContactOfAllHostels()
    {
        return listofcontactofallvalidhostelsincity;
    }
    
    public List<String> sendTypeOfAllHostels()
    {
        return listoftypeofallvalidhostelsincity;
    }
    
}
