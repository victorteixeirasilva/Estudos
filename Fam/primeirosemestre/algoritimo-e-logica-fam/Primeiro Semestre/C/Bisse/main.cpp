#include <iostream>

using namespace std;

int main() {
    printf("Digite um ano e diremos se %c ou n%co, bissexto: ", 130,198);
    int ano;
    scanf("%d", &ano);
    if((ano%4==0)&&(ano%100!=0)||(ano%4==0)){
        printf("O Ano %c Bissexto!", 130);
    } else{
        printf("O Ano N%co %c Bissexto!", 198,130);

    }


    return 0;
}
