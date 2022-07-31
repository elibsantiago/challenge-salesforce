public class consultaCEPController {

    @AuraEnabled
    public static ViaCEP consultaCEP (string cepDigitado) {
    Http http = new Http();
    HttpRequest request = new HttpRequest();
        request.setEndpoint('https://viacep.com.br/ws/'+cepDigitado+'/json/');
        request.setMethod('GET');
    HttpResponse response = http.send(request);
        ViaCEP meuCEP = new ViaCEP();
        if(response.getStatusCode() == 200) {
        meuCep =  ViaCEP.nav(response.getBody());
           //system.debug(meuCep.cep);
           system.debug(meuCep);

           return meuCep;
        }
        return meuCep;
 
    }

    @AuraEnabled
    public static String saveAddress (String recordId, ViaCEP endereco) {
        String result;
        
        Account account = new Account();
        try {
            account.Id = recordId;
            account.BillingStreet = endereco.logradouro;
            account.BillingCity = endereco.localidade;
            account.BillingState = endereco.uf;
            account.BillingPostalCode = endereco.cep;
            
            update account;
            result = json.serialize(account);
        } catch (Exception e) {
            result = e.getMessage();
        }
       return result;
        

    }
}