#include <stdio.h>
#include <stdlib.h>

/* run this program using the console pauser or add your own getch, system("pause") or input loop */

int main(int argc, char *argv[]) {
		/* Atividade Lista 2 - Programa��o b�sica - Problema 3
	   RA: 00342432 Nome: Adriano Marinho dos Santos Lima
	   RA: 00342509 Nome: Victor Teixeira Silva
	   PROBLEMA: Fa�a um programa que, dado �n�, calcule seu 
n�mero pentagonal. 
	*/ 
	//ENTRADA
	printf("DIGITE UM NUMERO: ");
	float num = 0.0;
	scanf("%f", &num);
	//CALCULO
	float pn = 0.0;
	pn = num/2*(3*num - 1);
	//SAIDA
	printf("RESULTADO DO NUMERO PENTAGONAL E: %.2f", pn);
	return 0;
}
