public class TabelaShowController {
    
    // Variavel de uma visualforce pode 
    // PEGAR ( get ) 
    // COLOCAR (set) valores nessa variavel
 	
    public List<Account> lstAcc {get; set;}
    public List<Contact> lstCtt {get; set;}
    public List<Lead> lstLead  	{get; set;}
    public List<Case> lstCase   {get; set;}
    
    public TabelaShowController(){
        // INSTANCIANDO minha variavel
        lstAcc = new List<Account>();
        lstAcc = pegaAccVF();
        
        lstCtt = new List<Contact>();
        lstCtt = pegaContatos();
        
        lstLead = new List<Lead>();
        lstLead = pegaLead();
        
        lstCase = new List<Case>();
        lstCase = pegaCase();
    	//valor1 = 'Cleiton Rasta';
    }  
    
    // QUERO MOSTRAR OS MEUS TOP 10 CLIENTES NA TELA
    public List<Account> pegaAccVF(){
        // STRING, DECIMAL<, Boolean, Integer
        // List, Set, Map
    	return [SELECT 	Id, Name, Type, Phone, Rating FROM Account LIMIT 10];
    }
    
    @AuraEnabled
    public static List<Account> pegaAcc(){
        // STRING, DECIMAL<, Boolean, Integer
        // List, Set, Map
    	return [SELECT 	Id, Name, Type, Phone, Rating FROM Account LIMIT 10];
    }

    @AuraEnabled
    public static Account pegaTop1Acc(){
        // STRING, DECIMAL<, Boolean, Integer
        // List, Set, Map
    	return [SELECT 	Id, Name, Type, Phone, Rating FROM Account LIMIT 1];
    }
    
  
    public List<Contact> pegaContatos(){
        return [SELECT Id, Name, Email, Birthdate, Title 
                FROM Contact 
                LIMIT 10];
    }
    
    @AuraEnabled
     public static List<Lead> pegaLead(){
       return [SELECT Name, Phone, Company, CPF__c
               FROM Lead 
               LIMIT 10];
    }
    
    public List<Case> pegaCase(){
        return [SELECT ParentId, CreatedById, CreatedDate, ClosedDate, Priority
               FROM Case
               LIMIT 10];
    }
}