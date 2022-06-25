#include <stdio.h>
#include <stdlib.h>

/* run this program using the console pauser or add your own getch, system("pause") or input loop */

int main(int argc, char *argv[]) {
	/* Atividade Lista 2 - Programação básica - Problema 1
	   RA: 00342432 Nome: Adriano Marinho dos Santos Lima
	   RA: 00342509 Nome: Victor Teixeira Silva
	   PROBLEMA: Escreva  um  programa  que,  dada  a  idade  do 
usuário em anos, meses e dias (admita 
valores  inteiros),  calcule  sua  idade  em  dias. 
Considere que cada ano tem 365 dias e cada 
mês 30 dias.
	*/	
	//ENTRADA
	int ano,mes,dia;
	ano=1;
	mes=1;
	dia=1;
	printf("ola vamos calcular os dias vividos\ninsira os dados por favor\nanos:");
	scanf("%d", &ano);
	printf("insira os dados por favor\nmeses:");
	scanf("%d", &mes);
	printf("insira os dados por favor\ndias:");
	scanf("%d", &dia);
	//CALCULO
	dia = dia+(ano*365)+(mes*30);
	//SAIDA
	printf("o usuario viveu %d dias",dia);

	return 0;

}
