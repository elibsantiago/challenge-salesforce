public class Brasileirao {
    list<string> Times = new list<string>{
    'Flamengo', 'Vasco', 'Palmeiras', 'Botafogo', 'Internacional', 'Gremio', 'Atletico'
};
    public void posicao(Integer n){
        for(Integer i = 0; i < n; i++){
            system.debug(Times[i]);
        }
    }
}