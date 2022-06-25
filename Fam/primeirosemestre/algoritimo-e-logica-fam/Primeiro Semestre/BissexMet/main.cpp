#include <iostream>

void bissexto(int ano){
    //Processamento e Saída
    if((ano%4==0)&&(ano%100!=0)||(ano%400==0)){
        printf("O ANO É BISSEXTO!");
    }else{
        printf("O ANO NÃO É BISSEXTO!");
    }
}



int main() {
    //Variáveis de Entrada
    int ano = 0;
    //Interface com o usuário
    printf("Indique um ano: ");
    scanf("%d", &ano);
    //Chamada de métodos
    bissexto(ano);
    return 0;
}
