trigger AccTrigger on Account (before insert,after insert, before update) {
  
        if(trigger.isInsert && Trigger.isBefore){
           AccountBO.Validacao(Trigger.new);
           AccountBO.configuraRating(Trigger.new);
        }
        
        if(trigger.isInsert && Trigger.isAfter){           
           accountBO.criarOportunidade(Trigger.new);
           accountBO.criarTarefa(Trigger.new);
        }
        if(Trigger.isUpdate){
            AccountBO.impedeAlterarRating(Trigger.new);
            }
        }