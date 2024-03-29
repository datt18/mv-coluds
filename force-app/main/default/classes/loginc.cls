
global with sharing class loginc {

    global loginc() {
        
    }
    
    // Code we will invoke on page load.
    global PageReference forwardToAuthPage() {
        String communityUrl = Site.getBaseUrl();
        String startUrl = System.currentPageReference().getParameters().get('startURL');
        if (startUrl == null) startUrl = '';
        String displayType = System.currentPageReference().getParameters().get('display');
        return new PageReference(communityUrl + '/signin?startURL=' + EncodingUtil.urlEncode(startUrl, 'UTF-8') +  '&display=' + displayType);
    }
    
    
}