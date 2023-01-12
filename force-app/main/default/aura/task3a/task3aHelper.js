
({
    saveData : function(component, event, helper) {
        var action = component.get("c.createEvent");
        action.setParams({
            'eventData' : component.get("v.eventData"),
            'contactData' : component.get("v.contactData"),
            'accountData' : component.get("v.accountData")
        });
        action.setCallback(this, function(response){
            var state = response.getState();
            if(state == 'SUCCESS' && component.isValid()) {
                var message = response.getReturnValue();
                component.set("v.message", message);
                // component.getElementById('prog').style.width = '100%';
                if(message == 'Event successfully created'){
                    component.set('v.showThanks',true);
                    component.set('v.progress', 100);
                    component.set('v.message', message);
                    document.getElementById("star").style.display = "none";
                document.getElementById("showErrorrTractConfig").style.display = "none";
                document.getElementById("showMessageTractConfig").style.display = "block";
            }else{
                document.getElementById("showMessageTractConfig").style.display = "none";
                document.getElementById("showErrorrTractConfig").style.display = "block";
            }
        }
        });  
        $A.enqueueAction(action);
    },

    accNext : function(component) {
        var action = component.get('c.createAcc');
        action.setParams({
            'accountData' : component.get("v.accountData")
        });
        action.setCallback(this, function(res) {
            var state = res.getState();
            var message = res.getReturnValue();
            console.log("message>>>>>>>>" +JSON.stringify(message));
            if(state == 'SUCCESS' && component.isValid()) {
                    component.set("v.message", message);
                    component.set('v.progress', 33);
                    // component.getElementById('prog').style.width = '33%';
                if(message == 'Account successfully created'){
                    document.getElementById("showErrorrTractConfig").style.display = "none";
                    document.getElementById("showMessageTractConfig").style.display = "block";
                }else{
                    document.getElementById("showMessageTractConfig").style.display = "none";
                    document.getElementById("showErrorrTractConfig").style.display = "block";
            }
        }
        });$A.enqueueAction(action);
    },

    cntNext : function(component) {
        var action = component.get('c.createCnt');
        action.setParams({
            'accountData' : component.get("v.accountData"),
            'contactData' : component.get("v.contactData")
        });
        action.setCallback(this, function(res) {
            var state = res.getState();
            var message = res.getReturnValue();
            console.log("message>>>>>>>>" +JSON.stringify(message));
            if(state == 'SUCCESS' && component.isValid()) {
                    component.set("v.message", message);
                    component.set('v.progress', 66);
                    // component.getElementById('prog').style.width = '66%';
                if(message == 'Contact successfully created'){
                    document.getElementById("showErrorrTractConfig").style.display = "none";
                    document.getElementById("showMessageTractConfig").style.display = "block";
                }else{
                    document.getElementById("showMessageTractConfig").style.display = "none";
                    document.getElementById("showErrorrTractConfig").style.display = "block";
            }
        }
        });$A.enqueueAction(action);
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
    },

})







// ({
//     saveData : function(component, event, helper) {
//         var action = component.get("c.save");
//         action.setParams({
//             accountData : component.get("v.accountData"),
//             contactData : component.get("v.contactData"),
//             opportunityData : component.get("v.opportunityData")}
//                         );
//         action.setCallback(this, function(response){
//             var state = response.getState();
//                 var message = response.getReturnValue();
//                 console.log("message>>>>>>>>" +JSON.stringify(message));
//                 component.set("v.message", message);
//             if(message == 'record successfully insert'){
//                 document.getElementById("showErrorrTractConfig").style.display = "none";
//                 document.getElementById("showMessageTractConfig").style.display = "block";
//             }else{
//                 document.getElementById("showMessageTractConfig").style.display = "none";
//                 document.getElementById("showErrorrTractConfig").style.display = "block";
//             }    
//         });  
//         $A.enqueueAction(action);
//     }
// })