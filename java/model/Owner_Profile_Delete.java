package model;

import db.DBConnector;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Atharva Bagdare
 */
public class Owner_Profile_Delete {
    
        public boolean deleteProfile(String ownerid)
        {
                        String query="DELETE FROM owner_table WHERE owner_id='"+ownerid+"'";
                        System.out.println(query);
                        String query2="SELECT hostel_id FROM admin_table WHERE owner_id='"+ownerid+"'";
                        System.out.println(query2);
        
                        List<String> hostelidlist= new ArrayList<>();
        
        
                        try{
                        Statement st= DBConnector.getStatement();
                        st.execute(query);
                        ResultSet rs=st.executeQuery(query2);
                        while(rs.next())
                        {
                                hostelidlist.add(rs.getString(1));
                        }
                        System.out.println(hostelidlist);
                        for(int i=0; i<hostelidlist.size();i++)
                        {
                                st.execute("DELETE FROM hostel_table WHERE hostel_id='"+hostelidlist.get(i)+"'");
                                System.out.println("DELETE FROM hostel_table WHERE hostel_id='"+hostelidlist.get(i)+"'");
                        }
                        String query3="DELETE FROM admin_table WHERE owner_id='"+ownerid+"'";
                        System.out.println(query3);
                        st.execute(query3);
                }
                catch(SQLException e)
                {
                    System.out.println(e);
                }
                        return true;
        }
}

