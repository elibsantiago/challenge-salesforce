public class ViaCEP {

	@AuraEnabled public String cep{get; set;}
	@AuraEnabled public String logradouro{get; set;}
	@AuraEnabled public String complemento{get; set;}
	@AuraEnabled public String bairro{get; set;}
	@AuraEnabled public String localidade{get; set;}
	@AuraEnabled public String uf{get; set;}
	@AuraEnabled public String ibge{get; set;}
	@AuraEnabled public String gia{get; set;}
	@AuraEnabled public String ddd{get; set;}
	@AuraEnabled public String siafi{get; set;}

	
	public static ViaCEP nav (String json) {
		return (ViaCEP) System.JSON.deserialize(json, ViaCEP.class);
	}
}