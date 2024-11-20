package model;
import dto.Owner_DTO;
import db.DBConnector;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Owner_Registration_Authenticator
{
    public boolean registrationAuthenticator(Owner_DTO obj)
        {
            String ownerpassword=obj.getOwnerPassword();
            String ownerconfirmpassword=obj.getOwnerConfirmPassword();
            
            if(!ownerpassword.trim().equals("") && !ownerconfirmpassword.trim().equals("") && ownerpassword.equals(ownerconfirmpassword))
            {
                String ownerid=null;
                String ownername=obj.getOwnerName();
                String ownercontact=obj.getOwnerContact();
                String owneremail=obj.getOwnerEmail();
                String ownerdob=obj.getOwnerDob();
                String ownergender=obj.getOwnerGender();
                String owneraddress=obj.getOwnerAddress();
                String ownercity=obj.getOwnerCity();
                String ownerstate=obj.getOwnerState();
                
                try{
                    
                    String query="INSERT INTO owner_table(owner_name, owner_contact, owner_mailid, owner_dob, owner_gender, owner_address, owner_city, owner_state, owner_password) VALUES ('"+ownername+"','"+ownercontact+"','"+owneremail+"', '"+ownerdob+"' ,'"+ownergender+"', '"+owneraddress+"','"+ownercity+"' , '"+ownerstate+"', '"+ownerpassword+"') ";
                    
                     System.out.println(query);
                     
                    String query2 ="SELECT owner_id FROM owner_table WHERE owner_name='"+ownername+"' AND owner_password='"+ownerpassword+"'";
                    
                    System.out.println(query2);
                    
                    Statement st=DBConnector.getStatement();
                    
                    int i=st.executeUpdate(query);
                    
                    if(i>0)
                    {
                        System.out.println(i+" record(s) inserted");
                        ResultSet rs=st.executeQuery(query2);
                        if(rs.next())
                        {
                            ownerid=rs.getString(1);
                        }
                        obj.setOwnerId(ownerid);
                    }
                    else
                    {
                        System.out.println("No updation");
                    }
                }
                catch(SQLException e)
                {
                    System.out.println(e);
                }
                return true;
            }
            return false;
        }
    
}