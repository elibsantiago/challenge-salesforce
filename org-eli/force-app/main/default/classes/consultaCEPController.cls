public class consultaCEPController {

    @AuraEnabled
    public static void consultaCEP (string cepDigitado) {
    Http http = new Http();
    HttpRequest request = new HttpRequest();
        request.setEndpoint('https://viacep.com.br/ws/'+cepDigitado+'/json/');
        request.setMethod('GET');
    HttpResponse response = http.send(request);
        if(response.getStatusCode() == 200) {
        ViaCEP meuCep =  ViaCEP.nav(response.getBody());
           //system.debug(meuCep.cep);
           system.debug(meuCep);
        }
        

    }
    
}