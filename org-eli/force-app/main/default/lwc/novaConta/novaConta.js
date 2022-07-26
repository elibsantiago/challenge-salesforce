import { LightningElement } from 'lwc';

export default class NovaConta extends LightningElement {

    nome = "";
    telefone ="";
    email = "";

    handleOnChangeNome(event){
        this.nome = event.target.value;
        console.log("nome: "+ this.nome);
    }

    handleOnChangeTelefone(event){
        this.telefone = event.target.value;
        console.log("tel: "+ event.target.value);
    }

    handleOnChangeEmail(event){
        this.email = event.target.value;
        console.log("email: "+ event.target.value);
    }
}