/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import db.DBConnector;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Atharva Bagdare
 */
public class Admin_Hostel_Deletion {
    public boolean deleteHostel(String hostelid)
    {
        String query1="DELETE FROM admin_table WHERE hostel_id='"+hostelid+"'";
        String query2="DELETE FROM hostel_table WHERE hostel_id='"+hostelid+"'";
        System.out.println(query1);
        System.out.println(query2);
        int i=0, j=0;
        try
        {
            Statement st = DBConnector.getStatement();
            i = st.executeUpdate(query1);
            j = st.executeUpdate(query2);
        }
        catch(SQLException e)
        {
            System.out.println(e);
        }
        if(i!=0 && j!=0)
            return true;
        else
            return false;
    }
}
