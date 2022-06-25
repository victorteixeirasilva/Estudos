#include <iostream>
#define N 6

int main() {
    float notas[N];
    float menor=10,maior=0;
    float soma=0;
    // Entrada de Processamento
    for(int i=1; i<=N; i++){
        printf("\n Nota do juiz %d: ", i);
        scanf("%f", &notas[i-1]);
        soma += notas[i-1];
        if(notas[i-1] < menor) menor = notas[i-1];
        if(notas[i-1] > maior) maior = notas[i-1];
    }
    printf("\n\n");
    float notaAtleta = (soma-menor-maior)/(N-2);

    for(int i=1; i<=N; i++){
        printf("\n NOTA DO JUIZ %d: %.2f", i, notas[i-1]);
    }
    printf("\n A MENOR NOTA DESCARTADA É: %.2f", menor);
    printf("\n A MAIOR NOTA DESCARTADA É: %.2f", maior);
    printf("\n A MÉDIA DO ATLETA É: %.2f", notaAtleta);

    /*
    // Variaveis
    float notas=0;
    float menor=10,maior=0;
    float soma=0;
    // Entrada de Processamento
    for(int i=1; i<=6; i++){
        printf("\n Nota do juiz %d: ", i);
        scanf("%f", &notas);
        soma += notas;
        if(notas < menor) menor = notas;
        if(notas > maior) maior = notas;
    }
    float notaAtleta = (soma-menor-maior)/4;
    printf("\n A MENOR NOTA DESCARTADA É: %.2f", menor);
    printf("\n A MAIOR NOTA DESCARTADA É: %.2f", maior);
    printf("\n A MÉDIA DO ATLETA É: %.2f", notaAtleta);
*/

    return 0;
}
