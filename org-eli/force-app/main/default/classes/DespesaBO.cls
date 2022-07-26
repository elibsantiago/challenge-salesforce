public class DespesaBO {
	
    // 2 METODOS
    public static void atualizaDataPgto(List<Despesa__c> lstDespesa){
        
        //ITERAR OS REGISTROS PARA ATUALIZAR
        //for(TipoDeDado Variavel : Lista de Variavel)
        for(Despesa__c itemDesp : lstDespesa){
            itemDesp.DataDePagamento__c = System.today() + 30;
        }
    }
    
    public static void criarTarefa(List<Despesa__c> lstDespesa){
        List<Task> lstTarefasQueSeraoInseridas = new List<Task>();
        for(Despesa__c itemDesp : lstDespesa){
            Task newTarefa 		= new Task();
            newTarefa.Subject	= 'Tarefa - Financeiro';
            newTarefa.Status	= 'Open';
            newTarefa.Priority	= 'High';
            newTarefa.WhatId	= itemDesp.Id;
                       
            lstTarefasQueSeraoInseridas.add(newTarefa);
        }
       
        insert lstTarefasQueSeraoInseridas;
    }
}