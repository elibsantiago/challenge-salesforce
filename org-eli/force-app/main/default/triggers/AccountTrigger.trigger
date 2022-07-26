trigger AccountTrigger on Account (before insert, before update, after insert, after update) {
    /*for(Account acc : Trigger.new) {
        if(acc.Type == 'Prospect'){
            acc.Rating='Cold';
        }
        if(acc.Type == 'Installation Partner' ){
            acc.Rating='Cold';
        }
        if(acc.Type == 'Technology Partner'){
            acc.Rating='Hot';
        }
        if(acc.name.length() < 3){
            acc.name.adderror('Não pode nome com menos de 3 VEEIIII');
        }
        if(acc.AnnualRevenue < 0){
            acc.AnnualRevenue.adderror('Receita Anual não pode ser menor que 0');
        }
    } */
    
    if (Trigger.isAfter) {
        if(Trigger.isInsert){
            AccountBO.criarContato(Trigger.new);
            AccountBO.enviarEmailAuto(Trigger.new);
        }
    }
}