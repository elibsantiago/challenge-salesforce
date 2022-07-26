({
	doInit : function(component, event, helper){
        
        var AcaoTOP = component.get("c.pegaLead");
        
        AcaoTOP.setCallback(this,function(response){
            var state = response.getState();
            if(state == "SUCCESS"){
                var result = response.getReturnValue();
                
                component.set("v.regLead", result);    
            }else{
                alert('Tente Novamente mais tarde');
            }
        });	
        
        $A.enqueueAction(AcaoTOP); 
    },
    
    mudaCss : function(component, event, helper){
        
        var cmpTarget = component.find('MinhaDiv');
        
        $A.util.toggleClass(cmpTarget, 'divSemi');
        
    }
})