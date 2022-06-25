#include <iostream>

/*
   Media Ponderada
 */

int main(int argc, char** argv) {
	char nome[50];
	printf("DIGITE O NOME DO ALUNO: ");
	scanf("%s",&nome);
	float m1,m2;
	//ENTRADA DE DADOS
	printf("Digite a nota do primeiro bimestre: ");
	scanf("%f", &m1);
	printf("Digite a nota do segundo bimestre: ");
	scanf("%f", &m2);
	//CALCULO
	float resul;
	resul = m2+m2;
	resul = resul+m1;
	resul = resul/2;
	//SAIDA
	printf("------------------------------------------- \n");
	printf("O ALUNO %s \n",nome);
	printf("RESULTADO DA MEDIA PONDERADA: %.2f", resul);
	return 0;
}
