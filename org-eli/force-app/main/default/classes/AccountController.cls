public class AccountController {
	//create
    public Account insertAccount(Account newAccount){
        insert newAccount;
        return newAccount;
    }
    
	//read
    public List<Account> getAllAccounts(){
        List<Account> lstAccounts = [
    	SELECT name, phone, type, rating FROM Account
		];
		return lstAccounts;
    }
    
	//update
	//delete
}