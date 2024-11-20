/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import db.DBConnector;
import dto.Admin_DTO;
import dto.Hostel_DTO;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Admin_Hostel_Name_Authenticator {
    public Hostel_DTO getInfo(Admin_DTO obj)
    {
        String hostelid=obj.getHostelid();
        
        Hostel_DTO obj2 = new Hostel_DTO();
        
        String query="SELECT hostel_name, hostel_address, hostel_landmark, hostel_city, hostel_state, hostel_type, hostel_boys_room, hostel_girls_room, hostel_annual_rent, hostel_contact, hostel_emailid, hostel_amenity_1, hostel_amenity_2, hostel_amenity_3, hostel_amenity_4, hostel_amenity_5, hostel_amenity_6, hostel_other_amenity, hostel_pin FROM hostel_table WHERE hostel_id='"+hostelid+"'";
        System.out.println(query);
        
        obj2.setHostelid(hostelid);
        System.out.println(obj2.getHostelid());
        
        try
        {
            Statement st = DBConnector.getStatement();
            ResultSet rs = st.executeQuery(query);
            if(rs.next())
            {
                obj2.setHostelname(rs.getString(1));
                System.out.println(obj2.getHostelname());
                
                obj2.setHosteladdress(rs.getString(2));
                System.out.println(obj2.getHosteladdress());
                
                obj2.setHostellandmark(rs.getString(3));
                System.out.println(obj2.getHostellandmark());
                
                obj2.setHostelcity(rs.getString(4));
                System.out.println(obj2.getHostelcity());
                
                obj2.setHostelstate(rs.getString(5));
                System.out.println(obj2.getHostelstate());
                
                obj2.setHosteltype(rs.getString(6));
                System.out.println(obj2.getHosteltype());
                
                obj2.setHostelboysroom(rs.getString(7));
                System.out.println(obj2.getHostelboysroom());
                
                obj2.setHostelgirlsroom(rs.getString(8));
                System.out.println(obj2.getHostelgirlsroom());
                
                obj2.setHostelrent(rs.getString(9));
                System.out.println(obj2.getHostelrent());
                
                obj2.setHostelcontact(rs.getString(10));
                System.out.println(obj2.getHostelcontact());
                
                obj2.setHostelemailid(rs.getString(11));
                System.out.println(obj2.getHostelemailid());
                
                obj2.setAirconditioner(rs.getString(12));
                System.out.println(obj2.getAirconditioner());
                
                obj2.setMess(rs.getString(13));
                System.out.println(obj2.getMess());
                
                obj2.setWifi(rs.getString(14));
                System.out.println(obj2.getWifi());
                
                obj2.setKitchen(rs.getString(15));
                System.out.println(obj2.getKitchen());
                
                obj2.setLockers(rs.getString(16));
                System.out.println(obj2.getLockers());
                
                obj2.setLaundry(rs.getString(17));
                System.out.println(obj2.getLaundry());
                
                obj2.setHostelextraamenities(rs.getString(18));
                System.out.println(obj2.getHostelextraamenities());
                
                obj2.setHostelpin(rs.getString(19));
                System.out.println(obj2.getHostelpin());
            }
            
        }
        catch(SQLException e)
        {
            System.out.println(e);
        }
        return obj2;
    }
    
    public String getValid(Hostel_DTO obj)
    {
        String valid=null;
        String query="SELECT valid FROM admin_table WHERE hostel_id='"+obj.getHostelid()+"'";
        System.out.println(query);
        try
        {
            Statement st=DBConnector.getStatement();
            ResultSet rs=st.executeQuery(query);
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


