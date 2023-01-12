trigger task11 on Account (after update) {
    Account before = Trigger.old[0];
    // Account after = Trigger.new[0];
    Account accafter = [SELECT Rating, Id FROM Account WHERE Id=: before.Id];
    if(before.Rating != 'Hot'){
        if(accafter.Rating.equals('Hot')){
            System.debug('1234');
            AccountShare a = new AccountShare();
            // user name datt11 in my addmin section 
            a.UserOrGroupID = '0015g00000ztnKtAAI';
            a.AccountId = accafter.Id;
            a.AccountaccessLevel = 'Edit';
            a.OpportunityAccessLevel = 'Read';
            // a.ContactAccessLevel = 'Read';
            // a.CaseAccessLevel = '';
            insert a;
        }
        
    }
}
