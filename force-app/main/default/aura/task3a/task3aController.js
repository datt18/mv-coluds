   
  // ({
//     nextTab : function(component, event, helper) {
//         component.set("v.setMessage", '');           
//         var showAccount = component.get("v.showAccount");
//         var showContact = component.get("v.showContact");
//         var showOpportunity = component.get("v.showOpportunity");
//         var showData = component.get("v.showData");
        
        
//         if(showAccount == true){
//             var accountName = component.find("Name").get("v.value");
//             console.log('accountName:::'+accountName);
//             if(accountName =='' || accountName == null){
//                 component.set("v.setMessage",'error');           
//             }
//             if(component.get("v.setMessage")=='error')
//             { 
//                 component.set("v.showContact",false);
//                 component.set("v.showOpportunity", false);
//                 component.set("v.showError", true);
//                 component.set("v.showData", false);
                
//             }
//             else
//             { 
//                 component.set("v.showAccount", false);
//                 component.set("v.showContact", true);
//                 component.set("v.showOpportunity", false); 
//                 component.set("v.showError", false);
//                 component.set("v.showData", false);
//             }
//         }    
//         if(showContact == true){
//             var lastName = component.find("LastName").get("v.value");
//             console.log('lastName:::'+lastName);
//             if(lastName =='' || lastName == null){
//                 component.set("v.setMessage",'error');           
//             }
//             if(component.get("v.setMessage")=='error')
//             { 
//                 component.set("v.showAccount", false);
//                 component.set("v.showOpportunity", false);
//                 component.set("v.showError", true);
//                 component.set("v.showData", false);
//             }
//             else
//             { 
//                 component.set("v.showAccount", false);
//                 component.set("v.showContact", false);
//                 component.set("v.showOpportunity", true);
//                 component.set("v.showError", false);
//                 component.set("v.showData", false);
//             }
//         }   
        
//         if(showOpportunity == true){
//             var OpportunityName = component.find("OpportunityName").get("v.value");
//             console.log('OpportunityName:::'+OpportunityName);
//             var StageName = component.find("StageName").get("v.value");
//             console.log('StageName:::'+StageName);
//             var closeDate = component.find("closeDate").get("v.value");
//             console.log('closeDate:::'+closeDate);
//             if((OpportunityName =='' || OpportunityName == null) || (StageName =='' || StageName == null) || (closeDate =='' || closeDate == null)){
//                 component.set("v.setMessage",'error');           
//             }
//             if(component.get("v.setMessage")=='error')
//             { 
//                 component.set("v.showAccount", false);
//                 component.set("v.showContact", false);
//                 component.set("v.showError", true);
//                 component.set("v.showData", false);
                
//             }
//             else
//             { 
//                 component.set("v.showOpportunity", false);
//                 component.set("v.showContact", false);
//                 component.set("v.showAccount", false)
//                 component.set("v.showError", false);
//                 component.set("v.showData", true);
//             }
//         }   
        
//     },
//     prevTab : function(component, event, helper) {
//         var showAccount = component.get("v.showAccount");
//         var showContact = component.get("v.showContact");
//         var showOpportunity = component.get("v.showOpportunity");
//         var showData = component.get("v.showData");
        
        
//         if(showContact == true){
//             component.set("v.showAccount", true);
//             component.set("v.showContact", false);
//             component.set("v.showOpportunity", false);
//             component.set("v.showError", false);
//             component.set("v.showData", false);
//         }    
//         if(showOpportunity == true){
//             component.set("v.showAccount", false);
//             component.set("v.showContact", true);
//             component.set("v.showOpportunity", false);
//             component.set("v.showError", false);
//             component.set("v.showData", false);
//         } 
//         if(showData == true){
//             component.set("v.showAccount", false);
//             component.set("v.showContact", false);
//             component.set("v.showOpportunity", true);
//             component.set("v.showError", false);
//             component.set("v.showData", false);
//         }  
//     },
    
//     onSelectChange : function(component, event, helper) {
//         var selected = component.find("StageName").get("v.value");
//         component.set("v.OpportunityData.StageName",selected);
//         console.log('opp::::'+JSON.stringify(selected));
//     },
    
//     saveRecord : function(component, event, helper) {
//         helper.saveData(component, event, helper);               
//     }
// })




({
    nextTab : function(component, event, helper) {
        component.set("v.setMessage", '');           
        var showAccount = component.get("v.showAccount");
        var showContact = component.get("v.showContact");
        var showEvent = component.get("v.showEvent");
        
        if(showAccount == true){
            var accountName = component.find("Name").get("v.value");
            console.log('accountName:::'+accountName);
            if(accountName ==''|| accountName.split(' ').join('').length == 0 || accountName == null){
                component.set("v.setMessage",'error');           
            }
            if(component.get("v.setMessage")=='error')
            { 
                component.set("v.showContact",false);
                component.set("v.showEvent", false);
                component.set("v.showError", true); 
            }
            else
            { 
                component.set("v.showAccount", false);
                component.set("v.showContact", true);
                component.set("v.showEvent", false); 
                component.set("v.showError", false);
                component.set('v.progress',33);
                component.set('v.message', 'Account was successfully entered')
            }
        }    
        if(showContact == true){
            var lastName = component.find("LastName").get("v.value");
            console.log('lastName:::'+lastName);
            if(lastName =='' || lastName.split(' ').join('').length == 0 || lastName == null){
                component.set("v.setMessage",'error');           
            }
            if(component.get("v.setMessage")=='error')
            { 
                component.set("v.showAccount", false);
                component.set("v.showEvent", false);
                component.set("v.showError", true);
            }
            else
            { 
                component.set("v.showAccount", false);
                component.set("v.showContact", false);
                component.set("v.showEvent", true);
                component.set("v.showError", false);
                component.set('v.progress', 66);      
                component.set('v.message', 'Contact was successfully entered');
                var action1 = component.get('c.userList');
        action1.setCallback(this, function(res) {
            var state = res.getState();
            var ulist = res.getReturnValue();
            console.log("ulist>>>>>>>>" +JSON.stringify(ulist));
            if(state == 'SUCCESS' && component.isValid()) {
                component.set('v.users', ulist);
            }
            var test = component.get('v.users');
            console.log("test>>>>>>>>" +JSON.stringify(test));
        });$A.enqueueAction(action1);
            }
        }   
        
        if(showEvent == true){
            var subject = component.find("subject").get("v.value");
            console.log('subject:::'+subject);
            var assignUser = component.find("assignUser").get("v.value");
            console.log('assignUser:::'+assignUser);
            var start = component.find("start").get("v.value");
            console.log('start:::'+start);
            var end = component.find("end").get("v.value");
            console.log('end:::'+end);
            if((subject =='' || subject == null) || (assignUser =='' || assignUser == null) || (start =='' || start == null) || (end =='' || end == null)){
                component.set("v.setMessage",'error');           
            }
            if(component.get("v.setMessage")=='error')
            { 
                component.set("v.showAccount", false);
                component.set("v.showContact", false);
                component.set("v.showError", true);
            }
            else
            { 
                component.set("v.showEvent", false);
                component.set("v.showContact", false);
                component.set("v.showAccount", false)
                component.set("v.showError", false);
                // component.set('v.showThanks', true);
                helper.saveData(component, event, helper);
            }
        }   
        
    },
    prevTab : function(component, event, helper) {
        var showAccount = component.get("v.showAccount");
        var showContact = component.get("v.showContact");
        var showEvent = component.get("v.showEvent");
        
        
        if(showContact == true){
            component.set("v.showAccount", true);
            component.set("v.showContact", false);
            component.set("v.showEvent", false);
            component.set("v.showError", false);
            component.set('v.progress', 0);
            component.set('v.message', '');
        }    
        if(showEvent == true){
            component.set("v.showAccount", false);
            component.set("v.showContact", true);
            component.set("v.showEvent", false);
            component.set("v.showError", false);
            component.set('v.progress', 33);
            component.set('v.message', '');
        } 
        // if(showData == true){
        //     component.set("v.showAccount", false);
        //     component.set("v.showContact", false);
        //     component.set("v.showEvent", true);
        //     component.set("v.showError", false);
        // }  
    },
    
    onSelectChange : function(component, event, helper) {
        var selected = component.find("assignUser").get("v.value");
        component.set("v.eventData.OwnerId",selected);
        console.log('opp::::'+JSON.stringify(selected));
    },
    
    // saveRecord : function(component, event, helper) {
    //     helper.saveData(component, event, helper);
    //     // helper.accNext(component);
    //     // helper.cntNext(component);              
    // }
}) 
   
   
   
   
   
   ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
   
   
   
   // ({
//     nextTab : function(component, event, helper) {
//         component.set("v.setMessage", '');           
//         var showAccount = component.get("v.showAccount");
//         var showContact = component.get("v.showContact");
//         var showOpportunity = component.get("v.showOpportunity");
//         var showData = component.get("v.showData");
        
        
//         if(showAccount == true){
//             var accountName = component.find("Name").get("v.value");
//             console.log('accountName:::'+accountName);
//             if(accountName =='' || accountName == null){
//                 component.set("v.setMessage",'error');           
//             }
//             if(component.get("v.setMessage")=='error')
//             { 
//                 component.set("v.showContact",false);
//                 component.set("v.showOpportunity", false);
//                 component.set("v.showError", true);
//                 component.set("v.showData", false);
                
//             }
//             else
//             { 
//                 component.set("v.showAccount", false);
//                 component.set("v.showContact", true);
//                 component.set("v.showOpportunity", false); 
//                 component.set("v.showError", false);
//                 component.set("v.showData", false);
//             }
//         }    
//         if(showContact == true){
//             var lastName = component.find("LastName").get("v.value");
//             console.log('lastName:::'+lastName);
//             if(lastName =='' || lastName == null){
//                 component.set("v.setMessage",'error');           
//             }
//             if(component.get("v.setMessage")=='error')
//             { 
//                 component.set("v.showAccount", false);
//                 component.set("v.showOpportunity", false);
//                 component.set("v.showError", true);
//                 component.set("v.showData", false);
//             }
//             else
//             { 
//                 component.set("v.showAccount", false);
//                 component.set("v.showContact", false);
//                 component.set("v.showOpportunity", true);
//                 component.set("v.showError", false);
//                 component.set("v.showData", false);
//             }
//         }   
        
//         if(showOpportunity == true){
//             var OpportunityName = component.find("OpportunityName").get("v.value");
//             console.log('OpportunityName:::'+OpportunityName);
//             var StageName = component.find("StageName").get("v.value");
//             console.log('StageName:::'+StageName);
//             var closeDate = component.find("closeDate").get("v.value");
//             console.log('closeDate:::'+closeDate);
//             if((OpportunityName =='' || OpportunityName == null) || (StageName =='' || StageName == null) || (closeDate =='' || closeDate == null)){
//                 component.set("v.setMessage",'error');           
//             }
//             if(component.get("v.setMessage")=='error')
//             { 
//                 component.set("v.showAccount", false);
//                 component.set("v.showContact", false);
//                 component.set("v.showError", true);
//                 component.set("v.showData", false);
                
//             }
//             else
//             { 
//                 component.set("v.showOpportunity", false);
//                 component.set("v.showContact", false);
//                 component.set("v.showAccount", false)
//                 component.set("v.showError", false);
//                 component.set("v.showData", true);
//             }
//         }   
        
//     },
//     prevTab : function(component, event, helper) {
//         var showAccount = component.get("v.showAccount");
//         var showContact = component.get("v.showContact");
//         var showOpportunity = component.get("v.showOpportunity");
//         var showData = component.get("v.showData");
        
        
//         if(showContact == true){
//             component.set("v.showAccount", true);
//             component.set("v.showContact", false);
//             component.set("v.showOpportunity", false);
//             component.set("v.showError", false);
//             component.set("v.showData", false);
//         }    
//         if(showOpportunity == true){
//             component.set("v.showAccount", false);
//             component.set("v.showContact", true);
//             component.set("v.showOpportunity", false);
//             component.set("v.showError", false);
//             component.set("v.showData", false);
//         } 
//         if(showData == true){
//             component.set("v.showAccount", false);
//             component.set("v.showContact", false);
//             component.set("v.showOpportunity", true);
//             component.set("v.showError", false);
//             component.set("v.showData", false);
//         }  
//     },
    
//     onSelectChange : function(component, event, helper) {
//         var selected = component.find("StageName").get("v.value");
//         component.set("v.OpportunityData.StageName",selected);
//         console.log('opp::::'+JSON.stringify(selected));
//     },
    
//     saveRecord : function(component, event, helper) {
//         helper.saveData(component, event, helper);               
//     }
// })