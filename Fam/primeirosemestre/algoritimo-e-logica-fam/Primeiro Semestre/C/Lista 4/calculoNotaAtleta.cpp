	
#include <iostream>

/* run this program using the console pauser or add your own getch, system("pause") or input loop */
/*Em competi��es de exibi��o ol�mpica (gin�stica, 
salto ornamental etc.) � usual que o atleta receba 
um conjunto de notas de v�rios ju�zes e sua 
m�dia seja calculada eliminando-se a menor e a 
maior nota para evitar injusti�as.
Fa�a um programa que recebe 6 notas decimais 
entre 0 e 10 e calcule a m�dia eliminando-se a 
menor e a maior nota*/

int main(int argc, char** argv) {
	
	//Declara��o de variaveis e atibui��o de valores
	float nota[6];
	float menor=10;
	float maior=0;
	float notatotal=0;
	
	//Mansagem para o usu�rio
	printf("Exercicios Programas 4 de Algoritmos e Logica de Programacao\nProf Gregorio\nEste Programa calcula a nota m�dia de um atleta de ginastica olimpica\n\n");
	
	//Entrada de dados
	printf("Insira as notas em sequencia\n");	
	for (int i=0; i<6; i++) {
		
		bool canContinue = true;
		do{
			printf("Nota %d: \n", i+1);
			scanf("%f",&nota[i]);
			
			if(nota[i] >= 0 && nota[i] <= 10)
				 canContinue = false;
		}while(canContinue);
			
		if (menor>nota[i]){
			menor=nota[i];
		}
		if (maior<nota[i]){
			maior=nota[i];
		}
	}
	
	//Processamento
	for (int i=0; i<6; i++) {
		notatotal=notatotal+nota[i];
	}
	notatotal=notatotal-menor-maior;
	notatotal=notatotal/4;

	//Sa�da de dados
	printf("Media: %.1f", notatotal);
	
	return 0;
}
