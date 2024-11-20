package dto;

/**
 *
 * @author Atharva Bagdare
 */
public class Admin_DTO {
    private String adminid, adminpassword;

    
    public String getAdminid() {
        return adminid;
    }

    
    public void setAdminid(String adminid) {
        this.adminid = adminid;
    }

    
    public String getAdminpassword() {
        return adminpassword;
    }

   
    public void setAdminpassword(String adminpassword) {
        this.adminpassword = adminpassword;
    }
    
    //For hostelid and ownerid
    
    private String hostelid, ownerid, valid;

    public String getHostelid() {
        return hostelid;
    }

    public void setHostelid(String hostelid) {
        this.hostelid = hostelid;
    }

    public String getOwnerid() {
        return ownerid;
    }

    public void setOwnerid(String ownerid) {
        this.ownerid = ownerid;
    }

    public String getValid() {
        return valid;
    }

    public void setValid(String valid) {
        this.valid = valid;
    }
}
