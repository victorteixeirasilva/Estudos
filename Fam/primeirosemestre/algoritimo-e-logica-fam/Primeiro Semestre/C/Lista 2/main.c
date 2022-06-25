#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

/*
  Descrição do problema:
  Converter temperatura de graus Fahrenheit para celsius
  O usuario informa a temperatura em "F"
  O programa calcula a formula
  C = 5/9 * (F - 32)
*/

int main(int argc, char *argv[]) {
	/* QUANDO A VARIAVEL FAH FOR "int"
	// ENTRADA
	int fah = 0; // considerando a temperatura como um nunero do tipo float
	//Interface com o usuario
	printf("Digite a temperatura em Fahrenheit: ");
	scanf("%d", &fah);
	
	//PROCESSO
	// Celsius deve ser real pois é resultado de uma divisão
	float cel = (float)5*(fah-32)/9;
	
	//SAIDA
	printf("Temperatura convertida em CELSIUS = ");
	printf("%.2f", cel);
	*/	
	
	/*
	//CASO A VARIAVEL FAH JÁ FOR DECLARADA COMO FLOAT	
		// ENTRADA
	float fah = 0; // considerando a temperatura como um nunero do tipo float
	//Interface com o usuario
	printf("Digite a temperatura em Fahrenheit: ");
	scanf("%f", &fah);
	
	//PROCESSO
	// Celsius deve ser real pois é resultado de uma divisão
	float cel = 5*(fah-32)/9;
	
	//SAIDA
	printf("Temperatura convertida em CELSIUS = ");
	printf("%.2f", cel);
	*/
	
	//CONSUMO
	/* Descrição do programa
	   Vamos calcular o consumo dos carros
	   Quero saber quantos Km/Litros meu carro faz
	   Consumo = Km/L
	*/
	/*
	//ENTRADA
	float km = 0;
	float litros = 0;
	float mxtanque = 0;
	//INTERFACE COM O USUARIO
	  while (true){
	  printf("\n OLA VAMOS CALCULAR O CONSUMO POR LITRO DO SEU CARRO \n");
	  printf("DIGITE (1) PARA SIM E (2) PARA NAO \n");
	  int deci = 0;
	  scanf("%d", &deci);
	  if (deci == 1 && deci != 2) {
	  		  printf("Quantos km vc rodou? ");
	          scanf("%f", &km);
	          printf("Quantos litros gastou? ");
	          scanf("%f", &litros);
	          printf("Qual a quantidade maxima de litros do seu carro? ");
	          scanf("%f", &mxtanque);
	//PROCESSO
	  //CALCULO
	          float calculo = km/litros;
	          float calculores = mxtanque-litros;
	//SAIDA
	          printf("O consumo por litros foi: ");
	          printf("%.2f", calculo);
	          printf(" KM POR LITRO. \n");
			  printf("RESTAM ");
			  printf("%.2f", calculores); 	
			  printf(" Litros. \n");
	          } else if (deci == 2) {
	  	           printf("COMO NAO QUER CALCULAR NAO TENHO MUITA \n ULTILIDADE PRA VC \n TCHAU \n");
	               } else {
	  	               printf("JA FALEI QUE (1) ou (2), TA CHAPANDO?");
	  	
	  }
}
	  */
	
	/* Atividade Lista 2 - Programação básica
	   RA: 00342509 Nome: Victor Teixeira Silva
	   RA: 00342432 Nome: Adriano Marinho dos Santos Lima
	*/ 
	printf("DIGITE UM NUMERO: ");
	float num = 0.0;
	scanf("%f", &num);
	float pn = 0.0;
	pn = num/2*(3*num - 1);
	printf("RESULTADO: %.2f", pn);
	return 0;
}
