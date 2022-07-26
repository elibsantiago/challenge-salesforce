public class AccountBO {
    public static void Validacao(List<Account> Acc){
        for(Account reg : Acc){
            if(reg.AnnualRevenue < 0 || reg.AnnualRevenue == null){
                reg.AnnualRevenue.addError('Não pode ser negativo ou nulo');
        	}
    	}
    }
    public static void configuraRating(List<Account> Acc){
         for(Account itemAcc : Acc){
            if(itemAcc.AnnualRevenue < 100000 ){
                itemAcc.Rating = 'Cold';
            } 
            if(itemAcc.AnnualRevenue >= 100000 && itemAcc.AnnualRevenue < 500000){
                itemAcc.Rating = 'Warm';
            } 
            if(itemAcc.AnnualRevenue >= 500000 ){
                itemAcc.Rating = 'Hot';
            }
         }
    }
    public static void impedeAlterarRating(List<Account> lstAcc){
       for(Account itemAcc : lstAcc){
        if(itemAcc.AnnualRevenue >=500000){
                if(itemAcc.Rating != 'Hot'){
                    itemAcc.Rating.addError('Não é permitido alterar a classificação!!');
                }
            }
            if(itemAcc.AnnualRevenue >=100000){
                if(itemAcc.Rating == 'Cold'){
                    itemAcc.Rating.addError('Não é permitido alterar a classificação para Cold!!');
                }
            }
         }
    }    
    public static void criarTarefa(List<Account> lstAcc){
		List<Task> lstTarefa = new List<Task>();
        
        for(Account itemAcc : lstAcc){
            Task itemTarefa = new Task();
            itemTarefa.Subject = 'Falar com Cliente';
            itemTarefa.WhatId = itemAcc.Id;            
            itemTarefa.Status = 'Open';
            itemTarefa.Priority = 'High';
            itemTarefa.ActivityDate = system.today() +1;
            
            
            lstTarefa.add(itemTarefa);
        }
        
        //ISEMPTY retorna se está vazio ou não
        //se a lista não estiver vazia
        if(!lstTarefa.isEmpty()){
            insert lstTarefa;
        }
     }
    public static void criarOportunidade(List<Account> lstAcc){
		List<Opportunity> lstOpp = new List<Opportunity>();
        
        for(Account itemAcc : lstAcc){
            Opportunity itemOpp = new Opportunity();
            itemOpp.Name = 'Oportunidade Show';
            itemOpp.AccountId = itemAcc.Id;            
            itemOpp.StageName = 'Prospecting';
            itemOpp.Amount = 0;
            itemOpp.CloseDate = system.today() + 15;
            
                       
            lstOpp.add(itemOpp);
        }
        
        //ISEMPTY retorna se está vazio ou não
        //se a lista não estiver vazia
        if(!lstOpp.isEmpty()){
            insert lstOpp;
        }
     }
    
    //a lista é se caso vir muitos registros, a trigger ja estar preparada para essa situação
    public static void criarContato (List<Account> listaAcc){
    //para uma lista criada em account, é preciso criar uma lista para o objeto que será alvo
        list<Contact> lstCtt = new List<Contact>();
    //itemAcc será um "forEach" por onde servirá como item para percorrer os dados da Account
        for(Account itemAcc : listaAcc){
    //por cada account criada, será criada um novo contact, contendo as seguintes informações listadas
            Contact ctt 	= new Contact();
            ctt.LastName 	= itemAcc.Name;
            ctt.AccountId   = itemAcc.Id;
            ctt.Phone		= itemAcc.Phone;
            ctt.Email		= itemAcc.Email__c;
    //por boa prática, não dê insert diretamente, pq se não tiver registros em listaAcc, vai tentar inserir as informações de contato e dar problema
            lstCtt.add(ctt);
        }
        if(!lstCtt.isEmpty()){
            insert lstCtt;
        }
    }
    
    public static void enviarEmailAuto(list<Account> listaAcc){
        list<Messaging.SingleEmailMessage> mailList = new List<Messaging.SingleEmailMessage>();
   
        for(Account itemAcc : listaAcc){

               Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
               mail.setSubject('Nova conta criada');
               mail.setPlainTextBody('Foi criada a conta '+ itemAcc.Name);
               mail.setToAddresses(new String[]{itemAcc.Email__c});
               mailList.add(mail);
        }
        if(!mailList.isEmpty()){
            Messaging.sendEmail(mailList);
        }
    }
 }