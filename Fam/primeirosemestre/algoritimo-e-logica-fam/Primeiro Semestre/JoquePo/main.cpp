#include <iostream>
#include <stdlib.h>
#include <time.h>

void menu(){
    printf("__________JokenPo__________\n", 137);
    printf("\nVocê tem 3 (três) escolhas:\n",136,136);
    printf("\n1. Pedra.");
    printf("\n2. Papel.");
    printf("\n3. Tesoura. \n");
}
void escolha(int opcao){
    switch (opcao) {
        case 1:
            printf(" PEDRA ");
            break;
        case 2:
            printf(" PAPEL ");
            break;
        case 3:
            printf(" TESOURA ");
            break;
        default:
            printf(" INVALIDO: QUER PERDER? ");
    }

}

int main() {
    menu();

    int humano = 0, computador = 0;
    printf("\n O QUE VOCÊ QUER JOGAR:");
    scanf("%d", &humano);

    printf("\nO HUMANO INFERIOR ESCOLHEU: ");
    escolha(humano);
    srand(time(NULL));
    computador= rand() % 3+1;
    printf("\nO COMPUTADOR SUPERIOR ESCOLHEU: ");
    escolha(computador);
    if (humano==computador){
        printf("\n EMPATE");
    }else if((humano==1&&computador==3)||(humano==2&&computador==1)||(humano==3&&computador==2)){
        printf("\n HUMANO INFERIOR GANHOU");
    }else {
        printf("\n COMPUTADOR SUPERIOR GANHOU");
    }

    return 0;
}
