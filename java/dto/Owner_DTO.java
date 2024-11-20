package dto;

public class Owner_DTO 
{
    
        //For owner login
        private String ownername, ownerpassword, ownerid;
        
        public void setOwnerName(String ownername)
        {
                this.ownername=ownername;
        }
        
        public String getOwnerName()
        {
            return ownername;
        }
        
        public void setOwnerPassword(String ownerpassword)
        {
            this.ownerpassword=ownerpassword;
        }
        
        public String getOwnerPassword()
        {
            return ownerpassword;
        }
        
        public void setOwnerId(String ownerid)
        {
            this.ownerid=ownerid;
        }
        
        public String getOwnerId()
        {
            return ownerid;
        }
        
        //For owner registration
        private String ownercontact, owneremail, ownergender, ownerdob, owneraddress, ownercity, ownerstate, ownerconfirmpassword;
        public void setOwnerContact(String ownercontact)
        {
            this.ownercontact=ownercontact;
        }
        
        public void setOwnerEmail(String owneremail)
        {
            this.owneremail=owneremail;
        }
        
        public void setOwnerGender(String ownergender)
        {
            this.ownergender=ownergender;
        }
        
        public void setOwnerDob(String ownerdob)
        {
            this.ownerdob=ownerdob;
        }
        
        public void setOwnerAddress(String owneraddress)
        {
            this.owneraddress=owneraddress;
        }
        
        public void setOwnerCity(String ownercity)
        {
            this.ownercity=ownercity;
        }
        
        public void setOwnerState(String ownerstate)
        {
            this.ownerstate=ownerstate;
        }
        
        public void setOwnerConfirmPassword(String ownerconfirmpassword)
        {
            this.ownerconfirmpassword=ownerconfirmpassword;
        }
        
        public String getOwnerContact()
        {
            return this.ownercontact;
        }
        
        public String getOwnerEmail()
        {
            return this.owneremail;
        }
        
        public String getOwnerDob()
        {
            return this.ownerdob;
        }
        
        public String getOwnerGender()
        {
            return this.ownergender;
        }
        
        public String getOwnerCity()
        {
            return this.ownercity;
        }
        
        public String getOwnerAddress()
        {
            return this.owneraddress;
        }
        
         public String getOwnerState()
        {
            return this.ownerstate;
        }
         
         public String getOwnerConfirmPassword()
        {
            return this.ownerconfirmpassword;
        }
       
}