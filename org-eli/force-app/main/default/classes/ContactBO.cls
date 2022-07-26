public class ContactBO {

    public static void validarTelefone(list<Contact> CCs){
        
        for(Contact cc : CCs){
            if(cc.Phone.Length() < 8 && cc.Phone.Length() > 11){
                cc.Phone.AddError('Insira um telefone válido');
            }
        }
    }
}