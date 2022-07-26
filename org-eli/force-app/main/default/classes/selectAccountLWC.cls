public class selectAccountLWC {
	
    @AuraEnabled
    public static List<Account> pegaTop10Clientes(){
    	return [SELECT 	Id, 
                		Name,
                		Phone, 
                		BillingAddress
               		FROM Account 
                	LIMIT 10];
    }
    
}