package model;

import db.DBConnector;
import dto.Hostel_DTO;
import java.sql.SQLException;
import java.sql.Statement;

public class Admin_Hostel_Valid {
    public boolean invalidHostel(Hostel_DTO obj) 
    {
        String query = "UPDATE admin_table SET valid='2' WHERE hostel_id='"+obj.getHostelid()+"'";
        System.out.println(query);
        int i=0;
        try
        {
            Statement st=DBConnector.getStatement();
            i=st.executeUpdate(query);
        }
        catch(SQLException e)
        {
            System.out.println(e);
        }
        if(i==1)
        {
            return true;
        }
        else
             return false;
    }
}
