


({
    updateDraggedCase : function(component, event, helper, conId, accid) {
        var action = component.get("c.updateCase");
       
        action.setParams({ conId : conId, 
                           accid : accid});
        $A.enqueueAction(action);
    }
   
})