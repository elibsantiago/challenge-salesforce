({
	doInit : function(component, event, helper){
		
        // CHAMAR A FUNCAO NO APEX 
        // component.get("v.") > Valor do Atributo - View
        // component.get("c.") > Instanciar uma ação
        // Instanciando com um Classe/Controlador Apex
        // pegaTop10Clientes << VEM DO APEX
        var AcaoTOP = component.get("c.pegaAcc");
       	
        // action > Retorno 
        // Do Action eu quero o que ele retorna 
        // 
        // 1. Chamar a minha função do Apex
        // 2. callBack(resposta do que vier do item 1)
        // 3. Response TEM 
        // 			- Valores do Apex
        // 			- Status se funcionou ou não
        // 			- Erros Caso não tenha funcionado
        //          - response: variável(pode ser qualquer coisa)
            
        AcaoTOP.setCallback(this,function(response){
            console.log('response-',response);
            console.log(this.getState());
            // state > SUCESSO
            var state = response.getState();
            
            // CONDICAO
            if(state == "SUCCESS"){
                var result = response.getReturnValue();
                console.log('resposta do Apex com mais-'+result);
                console.log('resposta do Apex com virgula -',result);
                component.set("v.regConta", result);    
            }else{
                alert('Tente Novamente mais tarde');
            }
        });	
        
        $A.enqueueAction(AcaoTOP); 
        console.log(AcaoTOP.getState());
    },
    
  	// ASSINCRONO - Agendar para alguma hora ele executar (no tempinho dele)
  	// SINCRONO   - Executar exatamente no mesmo momento
        
    mudaCss : function(component, event, helper){
        // component.find > getElementBy
        var cmpTarget = component.find('MinhaDivLinda');
        // BIBLIOTECA DO AURA
        // toggleClass > LIGA E DESLIGA UM CSS EM UM ELEMENTO
        // toggleClass(ELEMENTO QUE EU QUERO MUDAR, COLOCAR O CSS)
        $A.util.toggleClass(cmpTarget, 'divSemiShow');
        
    }
})