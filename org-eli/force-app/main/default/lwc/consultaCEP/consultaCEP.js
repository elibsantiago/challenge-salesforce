import { LightningElement, api} from 'lwc';
import consultarCEP from '@salesforce/apex/consultaCEPController.consultaCEP';
import saveAddress from '@salesforce/apex/consultaCEPController.saveAddress';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';


export default class ConsultaCEP extends LightningElement {

    @api recordId

    endereco = {};
    cep = '';

    ativaConsulta() {
        consultarCEP({cepDigitado : this.cep})
            .then(result => {
                this.endereco = result;
                console.log(JSON.stringify(result));
                console.log(this.cep)
                console.log(this.recordId)
                //console.log(result.logradouro)
            })
            .catch(error => {
                this.error = error;
                
            });
    }

    handleCepSearch(event) {
        this.cep  = event.target.value
    }


    async handleSave (event) {
        let parametro = {
            recordId : this.recordId,
           // address : JSON.stringify(this.endereco)
           endereco : {...this.endereco}
           
        //     "cep"  : this.endereco.cep,
        //     "logradouro" : this.endereco.logradouro,
        //     "complemento"  : this.endereco.complemento,
        //     "bairro" : this.endereco.bairro,
        //     "localidade" : this.endereco.localidade,
        //     "uf" : this.endereco.uf,
        //     "ibge" : this.endereco.ibge,
        //     "gia" : this.endereco.gia,
        //     "ddd" : this.endereco.ddd,
        //     "siafi" : this.endereco.siafi
        //    }
        }
        console.log(JSON.stringify(parametro))
      await saveAddress(parametro) 
      .then(result => {
        console.log(result)
        this.dispatchEvent(new ShowToastEvent({ title: 'Efsdaf!', message: "Escolha uma data futura.", variant: 'success' }));
      })
      .catch(error => {
        this.dispatchEvent(new ShowToastEvent({ title: 'Erro!', message: error, variant: 'error' }));
      })
    }
}
