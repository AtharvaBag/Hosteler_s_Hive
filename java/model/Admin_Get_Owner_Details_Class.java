/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import db.DBConnector;
import dto.Owner_DTO;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Atharva Bagdare
 */
public class Admin_Get_Owner_Details_Class {
    public Owner_DTO ownerDetails(String ownerid)
    {
        Owner_DTO obj = new Owner_DTO();
        String query="SELECT owner_name, owner_contact, owner_mailid, owner_dob, owner_gender, owner_address, owner_city, owner_state FROM owner_table WHERE owner_id='"+ownerid+"'";
        try
        {
            Statement st = DBConnector.getStatement();
            ResultSet rs = st.executeQuery(query);
            if(rs.next())
            {
                obj.setOwnerName(rs.getString(1));
                obj.setOwnerContact(rs.getString(2));
                obj.setOwnerEmail(rs.getString(3));
                obj.setOwnerDob(rs.getString(4));
                obj.setOwnerGender(rs.getString(5));
                obj.setOwnerAddress(rs.getString(6));
                obj.setOwnerCity(rs.getString(7));
                obj.setOwnerState(rs.getString(8));
            }
        }
        catch(SQLException e)
        {
            System.out.println(e);
        }
        return obj;
    }
}
