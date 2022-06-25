#include <stdio.h>
#include <stdlib.h>

/* run this program using the console pauser or add your own getch, system("pause") or input loop */

int main(int argc, char** argv) {
	/*
	Nome: Victor Teixeira Silva  RA: 00342509
	PROBLEMA: 1. VAMPIRO 
Escreva  um  programa  que,  dada  a  idade  de 
um  indivíduo  (valor  inteiro),  determine  sua 
condição de acordo com as premissas a 
seguir
	*/
	float med;
	med=1;
	
	printf("Ola por favor insira a a sua media. ");
	scanf("%f", &med);
	
	if (med<4){
		printf("Media E");
	}else if(med >= 4 && med < 5)
			printf("Media D");
	else if(med >=5 && med <7)
			printf("Media C");
	else if(med>=7 && med<9)
			printf("Media B");
	else if(med>=9)
			printf("Media A");
			
	return 0;
}
