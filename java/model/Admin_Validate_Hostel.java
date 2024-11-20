package model;

import db.DBConnector;
import dto.Hostel_DTO;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Atharva Bagdare
 */
public class Admin_Validate_Hostel 
{
    public void validHostel(Hostel_DTO obj)
    {
        
        String hostelid=obj.getHostelid();
        String query="UPDATE admin_table SET valid='1' WHERE  hostel_id='"+hostelid+"'";
        System.out.println(query);
        try
        {
            Statement st=DBConnector.getStatement();
            st.execute(query);    
        }
        catch(SQLException e)
        {
            System.out.println(e);
        }
    }
}
