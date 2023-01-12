public with sharing class  landingc{
    
    // Code we will invoke on page load.
    public PageReference forwardToStartPage() {
        
        String communityUrl = Site.getBaseUrl();
        String startUrl = System.currentPageReference().getParameters().get('startURL');
        if (startUrl == null) startUrl = '';
        if (UserInfo.getUserType().equals('Guest')) {
            return new PageReference(communityUrl + '/signin?startURL=' + EncodingUtil.urlEncode(startUrl, 'UTF-8'));
        } else {
            return Network.communitiesLanding(); 
        }   
        
    }
    public landingc() {}

}