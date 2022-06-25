#include <stdio.h>
#include <stdlib.h>

/* run this program using the console pauser or add your own getch, system("pause") or input loop */

int main(int argc, char *argv[]) {
	/* Atividade Lista 2 - Programação básica - Problema 2
	   RA: 00342432 Nome: Adriano Marinho dos Santos Lima
	   RA: 00342509 Nome: Victor Teixeira Silva
	   PROBLEMA: Converta um valor de tempo dado em 
segundos  pelo  usuário  em  um  valor  de  dia, 
horas, minutos e segundos. 
	*/	
	//ENTRADA
	printf("DIGITE UM VALOR EM SEGUNDOS: ");
	int dia,seg,hr,min,segg,ress,h = 0;
	scanf("%d", &seg);
	//CALCULO
    hr = seg / 3600;
    ress = seg % 3600;
	min = ress / 60;
	segg = ress % 60;	
	dia = seg / 86400;
	//SAIDA
	printf("DIAS: ");
	printf("%d", dia );
	printf(" HORAS: ");
	printf("%d", hr);
	printf(" MINUTOS: ");
	printf("%d", min);	
    printf(" SEGUNDOS ");
	printf("%d", segg);	
	return 0;
}
