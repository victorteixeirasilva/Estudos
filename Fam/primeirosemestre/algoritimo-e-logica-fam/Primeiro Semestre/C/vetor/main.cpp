#include <iostream>

/*
 * By: Victor Teixeira Silva RA: 00342509
 * Vetores, Arranjos, Conjuntos, Estruturas indexadas são
 * estruturas para manipular conjuntos de valores associados,
 * tipicamente do mesmo tipo.
 */
void boasVindas(){
    printf("Olá Aluno Insira em squencia os valores do vetor:");
}
int main() {
    int vetor[6];
    int menor = 99999999, maior = 0;
    int iMenor, iMaior;
    int i = 1;
    boasVindas();
    while (i<6) {
        printf("\n Digite o valor do vetor %d: ", i);
        scanf("%d", &vetor[i]);
        if (vetor[i]<menor){
            menor = vetor[i];
            iMenor = i;
        }
        if(vetor[i]>maior){
            maior = vetor[i];
            iMaior = i;
        }
        i++;
    }
    printf("\n %d", vetor[1]);
    printf("\n %d", vetor[2]);
    printf("\n %d", vetor[3]);
    printf("\n %d", vetor[4]);
    printf("\n %d", vetor[5]);
    printf("\nMenor = %d na posição %d", menor, iMenor);
    printf("\nMaior = %d na posição %d", maior, iMaior);
    int aux;
    aux = vetor[1];
    vetor[1] = menor;
    vetor[iMenor] = aux;
    aux = vetor[5];
    vetor[5] = maior;
    vetor[iMaior] = aux;
    printf("\n %d", vetor[1]);
    printf("\n %d", vetor[2]);
    printf("\n %d", vetor[3]);
    printf("\n %d", vetor[4]);
    printf("\n %d", vetor[5]);


    return 0;
    }
