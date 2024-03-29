global class regc implements Auth.RegistrationHandler{

    
    
    global User createUser(Id portalId, Auth.UserData data){
    
        if(data.attributeMap.containsKey('sfdc_networkid')) {
        
            System.debug('map:' + data);

            String constructedUsername =  data.email + '.customercompany';
            List<User> userList = [SELECT id from User where username = :constructedUsername];
            if (userList.size() == 1) return userList.get(0);
           
            Account a = [SELECT Id FROM account WHERE name='Customers'];
            Contact c = new Contact();
            c.accountId = a.Id;
            c.email = data.email;
            c.firstName = data.firstName;
            c.lastName = data.lastName;
            insert(c);
            
			/*  Only supported if Social Person is enabled
			 *
            if ( data.provider == 'Facebook' ) {
                SocialPersona sp = new SocialPersona();
                sp.AreWeFollowing = false;
                sp.ExternalId = data.identifier;
                sp.IsBlacklisted = false; 
                sp.IsDefault = true;
                sp.IsFollowingUs = false;
                sp.Provider = data.provider;
                sp.Name = data.identifier;
                if (data.attributeMap.containsKey('picture')) {
                    sp.ExternalPictureURL = data.attributeMap.get('picture');
                } else if ( data.provider == 'Facebook' ) {
                    sp.ExternalPictureURL = 'https://graph.facebook.com/' + data.identifier + '/picture?type=large&return_ssl_resources=1';
                }
                sp.ParentId = c.id;
                insert(sp);
            }
			*/
    
            User u = new User();
            Profile p = [SELECT Id FROM profile WHERE name='Customers'];
            u.username = constructedUsername;
            u.email = data.email;
            u.lastName = data.lastName;
            u.firstName = data.firstName;
            String alias = data.email;
            //Alias must be 8 characters or less
            if(alias.length() > 8) {
                alias = alias.substring(0, 8);
            }
            u.alias = alias;
            u.languagelocalekey = UserInfo.getLocale();
            u.localesidkey = UserInfo.getLocale();
            u.emailEncodingKey = 'UTF-8';
            u.timeZoneSidKey = 'America/Los_Angeles';
            u.profileId = p.Id;
            u.contactId = c.Id;
            // if (data.attributeMap.containsKey('picture')) {
            //     u.ExternalProfilePic__c = data.attributeMap.get('picture');
            // } else if ( data.provider == 'Facebook' ) {
            //     u.ExternalProfilePic__c = 'https://graph.facebook.com/' + data.identifier + '/picture?type=large&return_ssl_resources=1';
            // }
            
            return u;
        } 
        return null;
    }
    
    global void updateUser(Id userId, Id portalId, Auth.UserData data){
    
        System.debug('map:' + data + ' sid ' + UserInfo.getSessionId());

        User u = new User(id=userId);
        u.lastName = data.lastName;
        u.firstName = data.firstName;
        // if (data.attributeMap.containsKey('picture')) {
        //     u.ExternalProfilePic__c = data.attributeMap.get('picture');
        // } else if ( data.provider == 'Facebook' ) {
        //     u.ExternalProfilePic__c = 'https://graph.facebook.com/' + data.username + '/picture?type=large';
        // }
        update(u);
    }
}