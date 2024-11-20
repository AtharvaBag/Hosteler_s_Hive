package model;

import db.DBConnector;
import dto.Owner_DTO;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Owner_Data_Update_Authenticator 
{
    public Owner_DTO getOwnerData(String ownername, String ownerid)
    {
            String ownercontact=null;
            String owneremail=null;
            String ownerdob=null;
            String ownergender=null;
            String owneraddress=null;
            String ownercity=null;
            String ownerstate=null;
            
            Owner_DTO obj=new Owner_DTO();
            obj.setOwnerId(ownerid);
            
            try
            {
                Statement st = DBConnector.getStatement();
                
                String query="SELECT owner_name, owner_contact, owner_mailid, owner_dob, owner_gender, owner_address, owner_city, owner_state FROM owner_table WHERE owner_id='"+ownerid+"'";
                System.out.println(query);
                
                ResultSet rs=st.executeQuery(query);
                
                if(rs.next())
                {
                    ownername=rs.getString(1);
                    obj.setOwnerName(ownername);
                    ownercontact=rs.getString(2);
                    obj.setOwnerContact(ownercontact);
                    owneremail=rs.getString(3);
                    obj.setOwnerEmail(owneremail);
                    ownerdob=rs.getString(4);
                    obj.setOwnerDob(ownerdob);
                    ownergender=rs.getString(5);
                    obj.setOwnerGender(ownergender);
                    owneraddress=rs.getString(6);
                    obj.setOwnerAddress(owneraddress);
                    ownercity=rs.getString(7);
                    obj.setOwnerCity(ownercity);
                    ownerstate=rs.getString(8);
                    obj.setOwnerState(ownerstate);
                }
               
            }
            catch(SQLException e)
            {
                System.out.println(e);
            }
            
            return obj;
    }
    
    public boolean isValid(Owner_DTO obj)
    {
        if(obj.getOwnerName()==null || obj.getOwnerEmail()==null || obj.getOwnerAddress()==null || obj.getOwnerCity()==null || obj.getOwnerContact()==null)
        {
                return false;
        }
        String query="UPDATE owner_table SET owner_name='"+obj.getOwnerName()+"', owner_contact='"+obj.getOwnerContact()+"', owner_mailid='"+obj.getOwnerEmail()+"', owner_dob='"+obj.getOwnerDob()+"', owner_gender='"+obj.getOwnerGender()+"', owner_address='"+obj.getOwnerAddress()+"', owner_city='"+obj.getOwnerCity()+"', owner_state='"+obj.getOwnerState()+"' WHERE owner_id='"+obj.getOwnerId()+"'";
        System.out.println(query);
        try
        {
            Statement st = DBConnector.getStatement();
            st.execute(query);
            return true;
        }
        catch(SQLException e)
        {
            System.out.println(e);
        }
        return false;
    }  
}