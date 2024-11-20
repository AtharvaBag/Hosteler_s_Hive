/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import db.DBConnector;
import dto.Hostel_DTO;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Hostel_Registration_Authenticator {
        
        public boolean isValid(Hostel_DTO obj) 
        {
            String airconditioner, mess, wifi, kitchen, lockers, laundry, hostelid=null;
            if(!(obj.getHostelname().trim()==null) && !(obj.getHosteladdress().trim()==null) && !(obj.getHostelpin()==null) && !(obj.getHostelcontact()==null) && !(obj.getHostelcity()==null))
            {
                 if(obj.getAirconditioner()==null)
                       airconditioner="0";
                else
                    airconditioner="1";
                
                 if(obj.getMess()==null)
                       mess="0";
                else
                    mess="1";
                
                  if(obj.getWifi()==null)
                       wifi="0";
                else
                    wifi="1";
                  
                   if(obj.getKitchen()==null)
                       kitchen="0";
                else
                    kitchen="1";
                   
                    if(obj.getLockers()==null)
                       lockers="0";
                else
                    lockers="1";
                    
                     if(obj.getLaundry()==null)
                       laundry="0";
                else
                    laundry="1";
                     
                     String query = "INSERT INTO hostel_table(hostel_name, hostel_address, hostel_landmark, hostel_pin, hostel_city, hostel_state, hostel_type, hostel_boys_room, hostel_girls_room, hostel_annual_rent, hostel_contact, hostel_emailid, hostel_amenity_1, hostel_amenity_2, hostel_amenity_3, hostel_amenity_4, hostel_amenity_5, hostel_amenity_6, hostel_other_amenity) VALUES ('"+obj.getHostelname()+"', '"+obj.getHosteladdress()+"', '"+obj.getHostellandmark()+"', '"+obj.getHostelpin()+"','"+obj.getHostelcity()+"', '"+obj.getHostelstate()+"',  '"+obj.getHosteltype()+"', '"+obj.getHostelboysroom()+"', '"+obj.getHostelgirlsroom()+"', '"+obj.getHostelrent()+"', '"+obj.getHostelcontact()+"', '"+obj.getHostelemailid()+"', '"+airconditioner+"', '"+mess+"', '"+wifi+"', '"+kitchen+"', '"+lockers+"', '"+laundry+"', '"+obj.getHostelextraamenities()+"')";
                     System.out.println(query);
                     String query2 = "SELECT hostel_id FROM hostel_table WHERE hostel_name='"+obj.getHostelname()+"' AND hostel_address='"+obj.getHosteladdress()+"'";
                     try
                     {
                         Statement st = DBConnector.getStatement();
                         
                         int i = st.executeUpdate(query);
                         
                         if(i>0)
                         {
                             System.out.println(i+" row(s) inserted");
                             ResultSet rs = st.executeQuery(query2);
                             
                             if(rs.next())
                             {
                                 hostelid=rs.getString(1);
                             }
                             obj.setHostelid(hostelid);
                          } 
                         else
                         {
                             System.out.println("No Updation");
                         }
                      }
                     catch(SQLException e)
                     {
                         System.out.println(e);
                     }  
                      return true;
                }
               
                else
                {
                        return false;
                }
        }
        
        public void adminTableRegistration(Hostel_DTO obj, String ownerid)
        {
             String query3 = "INSERT INTO admin_table(owner_id, hostel_id, valid) VALUES ('"+ownerid+"', '"+obj.getHostelid()+"', '0')";
                     System.out.println(query3);
                     
                     try
                     {
                         Statement st = DBConnector.getStatement();
                         int i=st.executeUpdate(query3);
                         if(i>0)
                         {
                             System.out.println(i+" row(s) inserted in admin table");
                         }
                         else
                         {
                             System.out.println("No Updation in admin_table");
                         }
                     }
                     catch(SQLException e)
                     {
                         System.out.println(e);
                     }
        }  
}
