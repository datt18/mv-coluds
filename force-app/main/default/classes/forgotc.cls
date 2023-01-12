
/**
 * An apex page controller that exposes the site forgot password functionality
 */
public with sharing class forgotc {
    public String username {get; set;}   
       
    public forgotc() {}
  
    public PageReference forgotPassword() {
      boolean success = Site.forgotPassword(username);
      PageReference pr = Page.forgotconp;
      pr.setRedirect(true);
      
      if (success) {        
        return pr;
      }
      return null;
    }
}