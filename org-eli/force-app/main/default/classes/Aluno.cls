public class Aluno {
    //declaração de variáveis
    private string nome, telefone;

    //SET -> FUNÇÃO DE ATRIBUIÇÃO (void)
    //setNome - nome da função
    public void setNome(String nomeR){
        nome = nomeR;
    }
    
    public void setTelefone(string telefoneR){
        telefone = telefoneR;        
    }
    
    //GET -> FUNÇÃO DE RETORNO DE VALOR (tipoDeRetorno)
    public string getNome(){
        return nome;
    }
    
    public string getTelefone(){
        return telefone;
    }
}