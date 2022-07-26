({
	soma : function(component, event, helper) {
		// Atribui o valor do Atributo numero1 para a variavel n1
		var n1 = parseInt(component.get("v.numero1"));
		// Atribui o valor do Atributo numero2 para a variavel n2
		var n2 = parseInt(component.get("v.numero2"));
		var result = n1 + n2;

		//SET > component.set("ATRIBUTO", "VALOR");
		component.set("v.resultado", result);
	},
	sub : function(component, event, helper) {
		// Atribui o valor do Atributo numero1 para a variavel n1
		var n1 = parseInt(component.get("v.numero1"));
		// Atribui o valor do Atributo numero2 para a variavel n2
		var n2 = parseInt(component.get("v.numero2"));
		var result = n1 - n2;

		//SET > component.set("ATRIBUTO", "VALOR");
		component.set("v.resultado", result);
	},
	mult : function(component, event, helper) {
		// Atribui o valor do Atributo numero1 para a variavel n1
		var n1 = parseInt(component.get("v.numero1"));
		// Atribui o valor do Atributo numero2 para a variavel n2
		var n2 = parseInt(component.get("v.numero2"));
		var result = n1 * n2;

		//SET > component.set("ATRIBUTO", "VALOR");
		component.set("v.resultado", result);
	},
	divi : function(component, event, helper) {
		// Atribui o valor do Atributo numero1 para a variavel n1
		var n1 = parseInt(component.get("v.numero1"));
		// Atribui o valor do Atributo numero2 para a variavel n2
		var n2 = parseInt(component.get("v.numero2"));
		var result = n1 / n2;

		//SET > component.set("ATRIBUTO", "VALOR");
		component.set("v.resultado", result);
	}
})