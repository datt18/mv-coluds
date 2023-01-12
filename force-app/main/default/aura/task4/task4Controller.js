
({
    gotoURL : function (component, event, helper) {
    var urlEvent = $A.get("e.force:navigateToURL");
    urlEvent.setParams({
    //   "url": "skbteqforce:AccountCreateComponent"
    "url" : "https://mvclouds65-dev-ed.develop.lightning.force.com/lightning/o/Account/new?count=1&nooverride=1&useRecordTypeCheck=1&navigationLocation=LIST_VIEW&uid=167124996940919260&backgroundContext=%2Flightning%2Fo%2FAccount%2Flist%3FfilterName%3D00B5g00000cngDLEAY"
    });
    urlEvent.fire();
    }
    
})