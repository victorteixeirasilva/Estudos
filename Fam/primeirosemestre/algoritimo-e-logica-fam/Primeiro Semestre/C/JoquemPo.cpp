#include <iostream>
#include <stdlib.h>

/* run this program using the console pauser or add your own getch, system("pause") or input loop */

int main(int argc, char** argv) {
	int jogador[3];
	int i=0;
	while(i<2){
		i++;
	printf("Jogador %d escolha: \n (1) para papel \n (2) para pedra \n (3) para tesoura \n",i);
	scanf("%d",&jogador[i]);
	}
	if(jogador[1]==1 && jogador[2]==1){
		printf("EMPATOU");
	}else if(jogador[1]==2 && jogador[2]==2){
		printf("EMPATOU");
	}else if(jogador[1]==3 && jogador[2]==3){
		printf("EMPATOU");
	}else 	if(jogador[1]==1 && jogador[2]==2){
		printf("JOGADOR 1 GANHOU!");
	}else if(jogador[1]==2 && jogador[2]==3){
		printf("JOGADOR 1 GANHOU!");
	}else if(jogador[1]==3 && jogador[2]==1){
		printf("JOGADOR 1 GANHOU!");
	}else if(jogador[2]==1 && jogador[1]==2){
		printf("JOGADOR 2 GANHOU!");
	}else if(jogador[2]==2 && jogador[1]==3){
		printf("JOGADOR 2 GANHOU!");
	}else if(jogador[2]==3 && jogador[1]==1){	
		printf("JOGADOR 2 GANHOU!");
	}
	
	
	return 0;
}
