package model;

import db.DBConnector;
import dto.Hostel_DTO;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Hostel_Details_Provider {
    
    public Hostel_DTO getHostelDetails(String hostelid)
    {
        Hostel_DTO obj = new Hostel_DTO();
        String query="SELECT hostel_name, hostel_address, hostel_city, hostel_state, hostel_pin, hostel_landmark, hostel_contact, hostel_emailid, hostel_type, hostel_boys_room, hostel_girls_room, hostel_annual_rent, hostel_amenity_1, hostel_amenity_2,hostel_amenity_3,hostel_amenity_4,hostel_amenity_5,hostel_amenity_6, hostel_other_amenity FROM hostel_table WHERE hostel_id='"+hostelid+"'";
        try
        {
                Statement st=DBConnector.getStatement();
                ResultSet rs=st.executeQuery(query);
                if(rs.next())
                {
                    obj.setHostelname(rs.getString(1));
                    obj.setHosteladdress(rs.getString(2));
                    obj.setHostelcity(rs.getString(3));
                    obj.setHostelstate(rs.getString(4));
                    obj.setHostelpin(rs.getString(5));
                    obj.setHostellandmark(rs.getString(6));
                    obj.setHostelcontact(rs.getString(7));
                    obj.setHostelemailid(rs.getString(8));
                    obj.setHosteltype(rs.getString(9));
                    obj.setHostelboysroom(rs.getString(10));
                    obj.setHostelgirlsroom(rs.getString(11));
                    obj.setHostelrent(rs.getString(12));
                    obj.setAirconditioner(rs.getString(13));
                    obj.setMess(rs.getString(14));
                    obj.setWifi(rs.getString(15));
                    obj.setKitchen(rs.getString(16));
                    obj.setLockers(rs.getString(17));
                    obj.setLaundry(rs.getString(18));
                    obj.setHostelextraamenities(rs.getString(19));
                    
                    
                }
        }
        catch(SQLException e)
        {
            System.out.println(e);
        }
        return obj;
    }
    
    public String getValidInfo(String hostelid)
    {
        String query="SELECT valid FROM admin_table WHERE hostel_id='"+hostelid+"'";
        String valid=null;
        try
        {
            Statement st = DBConnector.getStatement();
            ResultSet rs = st.executeQuery(query);
            if(rs.next())
            {
                valid=rs.getString(1);
            }
        }
        catch(SQLException e)
        {
            System.out.println(e);
        }
        return valid;
    }
}