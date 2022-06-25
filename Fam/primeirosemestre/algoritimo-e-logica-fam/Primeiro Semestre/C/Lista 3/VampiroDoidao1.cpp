#include <iostream>
#include <stdio.h>

/* run this program using the console pauser or add your own getch, system("pause") or input loop */

int main(int argc, char** argv){
		/*
	Nome: Victor Teixeira Silva RA: 00342509
	Nome: Adriano Marinho do Santos RA: 00342432
	Problema 1       Nome do Problema: VAMPIRO 
	Problema: Escreva  um  programa  que,  dada  a  idade  de 
um  indivíduo  (valor  inteiro),  determine  sua 
condição de acordo com as premissas a 
seguir: 
• se a idade for menor ou igual a 0 (zero): 
O indivíduo não nasceu 
• se  a  idade  for  maior  do  que  0  (zero)  e 
menor ou igual a 150: 
O indivíduo está vivo 
• se a idade for maior do que 150 
O indivíduo é um Vampiro 
	*/
	int idade;
	idade=1;
	
	printf("Ola\n por favor insira a idade do individuo.\n");
	scanf("%d", &idade);
	
	if(idade <0 ){
		printf("O individuo nao nasceu.");
	}else if(idade > 0 && idade <=150){
			 printf("o individuo esta vivendo .");
	}else if(idade >150){
		     printf("o individuo e um vampiro ");
	}
	
	return 0;
	}
