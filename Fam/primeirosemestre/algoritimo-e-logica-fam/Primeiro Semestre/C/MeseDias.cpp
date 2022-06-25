#include <iostream>

/* run this program using the console pauser or add your own getch, system("pause") or input loop */

int main(int argc, char** argv) {
	printf("Digite um n%cmero de 1 a 12: ", 163);
	int mes=0;
	scanf("%d", &mes);
    if(mes==1){
    	printf("Janeiro com 31 dias");
	}else if(mes==2){
    	printf("Fevereiro com 29 dias");
	}else if(mes==3){
    	printf("Mar%co com 31 dias",135);
	}else if(mes==4){
    	printf("Abril com 30 dias");
	}else if(mes==5){
    	printf("Maio com 31 dias");
	}else if(mes==6){
    	printf("Junho com 30 dias");
	}else if(mes==7){
    	printf("Julho com 31 dias");
	}else if(mes==8){
    	printf("Agosto com 31 dias");
	}else if(mes==9){
    	printf("Setembro com 30 dias");
	}else if(mes==10){
    	printf("Outubro com 31 dias");
	}else if(mes==11){
    	printf("Novembro com 30 dias");
	}else if(mes==12){
    	printf("Dezembro com 31 dias");
	}
	return 0;
}
