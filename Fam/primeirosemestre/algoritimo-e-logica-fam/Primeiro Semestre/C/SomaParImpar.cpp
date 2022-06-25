#include <iostream>

/* run this program using the console pauser or add your own getch, system("pause") or input loop
   none: Victor Teixeira Silva RA: 00342509
   Este programa soma todos os números pares entre 0 e 100, soma todos os números ímpares entre 0 e 100 e verifica se a soma dos pares é igual a
   soma dos impares
 */
 
int main(int argc, char** argv) {
	int somaPar, somaImpar = 0;
	for(int i = 0;i<=100;i++){
		if(i%2==0){
			somaPar+=i;
		}else {
			somaImpar+=i;
		}
	}
	printf("Soma dos pares = %d \n", somaPar);
		printf("Soma dos Impares = %d \n", somaImpar);
		if(somaPar==somaImpar){
			printf("A Soma Dos Pares e dos Impares e igual");
		}else {
			printf("A soma dos pares e dos Impares e diferente");
		}
	return 0;
}
