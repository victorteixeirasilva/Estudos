#include <iostream>

/* run this program using the console pauser or add your own getch, system("pause") or input loop */

int main(int argc, char** argv) {
	int dia=0;
	printf("Digete um numero de 1 a 7: ");
	scanf("%d",&dia);
	if(dia==1){
		printf("Segunda Feira");
	} else if(dia==2){
		printf("Ter%ca Feira", 135);
	}else if(dia==3){
		printf("Quarta Feira");
	}else if(dia==4){
		printf("Quinta Feira");
	}else if(dia==5){
		printf("Sexta Feira");
	}else if(dia==6){
		printf("S%cbado",160);
	}else{
		printf("Domingo");
	}
	
	
	return 0;
}
