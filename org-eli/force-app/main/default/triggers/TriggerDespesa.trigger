trigger TriggerDespesa on Despesa__c (before insert, after insert) {
    
    if(Trigger.isInsert && Trigger.IsAfter){
        DespesaBO.criarTarefa(Trigger.new);
    } 
    
    if(Trigger.isInsert && Trigger.IsBefore){
        DespesaBO.atualizaDataPgto(Trigger.new);
    }
}