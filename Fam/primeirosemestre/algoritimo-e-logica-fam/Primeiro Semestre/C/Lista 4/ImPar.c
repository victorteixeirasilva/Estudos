#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[]) {
	int num;
	printf(" INFORME UM NUMERO: ");
	scanf("%d",&num);
	if(num%2==0){
		printf(" ### ESSE NUMERO E PAR ### ");
	} else{
		printf(" ### ESSE NUMERO E IMPAR ### ");
	}
	
	return 0;
}
