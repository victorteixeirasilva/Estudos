#include <iostream>

/* run this program using the console pauser or add your own getch, system("pause") or input loop */

int main(int argc, char** argv) {
	/*
	Nome: Victor Teixeira Silva RA: 00342509
	Nome: Adriano Marinho do Santos RA: 00342432
	Problema 3        Nome do Problema: CONCEITO 
	Problema: Atualmente, é cada vez mais comum as 
instituições atribuírem um conceito ao 
aproveitamento  dos  estudantes  no  lugar  de 
uma  nota.  Neste  problema,  você  deve  ler 
duas  notas  de  um  estudante  (de  0  a  10, 
atribuídas de 0,5 em 0,5 ponto), calcular sua 
média  aritmética  e  atribuir  seu  conceito  de 
aproveitamento de acordo com a tabela.
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
