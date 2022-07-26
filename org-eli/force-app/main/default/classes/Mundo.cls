public class Mundo {
	string olaMundo = 'Minha primeira Classe! Ah, Olá mundol! =D';
    
    public void imprimir(){
    system.debug(olaMundo);
    }
    
 public Decimal calc(Decimal n1, Decimal n2, string op){
     if(op == '+'){
         return n1+n2;
     }else if(op == '-'){
         return n1-n2;
     }else if(op == '/'){
         return n1/n2;
     }else if(op == '*'){
         return n1*n2;
     }
     return 0;
    }

public Decimal subt(){
        Decimal a1 = 5;
        Decimal a2 = 10;
        return a1-a2;
    }
    
public Decimal mult(){
        Decimal a1 = 5;
        Decimal a2 = 10;
        return a1*a2;
    }
    
}