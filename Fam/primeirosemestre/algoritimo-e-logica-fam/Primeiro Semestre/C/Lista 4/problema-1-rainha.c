#include <stdio.h>
#include <stdlib.h>

/* run this program using the console pauser or add your own getch, system("pause") or input loop */

int main(int argc, char *argv[]) {
	/*
	Nome: Victor Teixeira Silva RA: 00342509
	Nome: Adriano 
	Programa: 01      Nome: Rainha
	Problema: A rainha m� dos
contos de fada solicitou os servi�os de um
ca�ador de cabe�as para se livrar dos
�bonzinhos� do reino. O ca�ador pediu,
como forma de pagamento, moedas
dispostas em um tabuleiro de xadrez de
forma que, na primeira casa haveria 1 moeda
e nas casas seguintes, o dobro da casa
anterior at� alcan�ar o n�mero de casas
correspondente ao n�mero de cabe�as
trazidas pelo ca�ador.
Dado o n�mero de cabe�as trazido, calcule a
quantidade de moedas que a rainha m� ter�
que pagar ao ca�ador.
	*/
	
	//ENTRADA
	printf("Ola cacador de cabecas sou a rainha ma. \n quantas cabecas trouxe para mim?  ");
	int cab, i, calc = 0;
	int in = 1;
	scanf ("%d", &cab);
	//CALCULO E LOOP
	i = 0;
	while (i < cab) {
		i = i + 1;
		in = in * 2;
		calc = in;
		//SAIDA
		printf("Voce trouxe: ");
		printf("%0.2d cabecas", i);
		printf("\n");
		printf("Vai receber o total de: ");
		printf("%0.2d moedas", calc);
		printf("\n");	
	}
	
	
	
	
	return 0;
}
