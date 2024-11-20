package model;

import db.DBConnector;
import dto.Admin_DTO;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;

/**
 *
 * @author Atharva Bagdare
 */
public class Admin_Login_Authenticator {
    public boolean isValid(Admin_DTO obj)
    {
        if("1".equals(obj.getAdminid()) && "321".equals(obj.getAdminpassword()))
        {
            return true;
        }
        else
        {
            return false;
        }
    }
    
    public HashMap Valid_0Info()
    {
        HashMap <String, String> hostelidowneridvalid0hashmap = new HashMap<>();
        String query = "SELECT hostel_id, owner_id FROM admin_table WHERE valid=0";
        try
        {
            Statement st = DBConnector.getStatement();
            ResultSet rs= st.executeQuery(query);
            while(rs.next())
            {
                hostelidowneridvalid0hashmap.put(rs.getString(1),rs.getString(2));
            }
        }
        catch(SQLException e)
        {
            System.out.println(e);
        }
        System.out.println(hostelidowneridvalid0hashmap);
        return hostelidowneridvalid0hashmap;
    }
    
    public HashMap Valid_1Info()
    {
        HashMap <String, String> hostelidowneridvalid1hashmap = new HashMap<>();
        String query = "SELECT hostel_id, owner_id FROM admin_table WHERE valid=1";
        try
        {
            Statement st = DBConnector.getStatement();
            ResultSet rs= st.executeQuery(query);
            while(rs.next())
            {
                hostelidowneridvalid1hashmap.put(rs.getString(1),rs.getString(2));
            }
        }
        catch(SQLException e)
        {
            System.out.println(e);
        }
        System.out.println(hostelidowneridvalid1hashmap);
        return hostelidowneridvalid1hashmap;
    }
    
    public HashMap Valid_2Info()
    {
        HashMap <String, String> hostelidowneridvalid2hashmap = new HashMap<>();
        String query = "SELECT hostel_id, owner_id FROM admin_table WHERE valid=2";
        try
        {
            Statement st = DBConnector.getStatement();
            ResultSet rs= st.executeQuery(query);
            while(rs.next())
            {
                hostelidowneridvalid2hashmap.put(rs.getString(1),rs.getString(2));
            }
        }
        catch(SQLException e)
        {
            System.out.println(e);
        }
        System.out.println(hostelidowneridvalid2hashmap);
        return hostelidowneridvalid2hashmap;
    }
    
}
