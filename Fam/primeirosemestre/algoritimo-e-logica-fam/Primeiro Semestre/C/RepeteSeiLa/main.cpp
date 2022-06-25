#include <iostream>

int main() {
    //Vamos Repetir...
    int linhas = 1;
    int maxLinhas = 0;
    int maxColunas = 0;
    printf("\n Digite o numero de linhas: ");
    scanf("%d", &maxLinhas);
    printf("\n===============================\n");
    printf("\n Digite o numero de Colunas: ");
    scanf("%d", &maxColunas);
    printf("\n===============================\n");
    maxColunas = maxColunas-2;

    while(linhas <= maxLinhas){
        printf("\n*");
        for (int colunas = 0; colunas <= maxColunas; colunas++){
            printf(" *");
        }
        linhas++;
    }
    printf("\n\n===========================================\n");
    return 0;
}
