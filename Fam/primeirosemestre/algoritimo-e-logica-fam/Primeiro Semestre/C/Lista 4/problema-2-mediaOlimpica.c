#include <stdio.h>
#include <stdlib.h>

/* run this program using the console pauser or add your own getch, system("pause") or input loop */

int main(int argc, char *argv[]) {
	/*
	Nome: Victor Teixeira Silva RA: 00342509
	Nome: Adriano Marinho dos Santos RA: 00342432
	Programa: 02      Nome: Média Olímpica
	Problema: Em competições de exibição olímpica (ginástica,
salto ornamental etc.) é usual que o atleta receba
um conjunto de notas de vários juízes e sua
média seja calculada eliminando-se a menor e a
maior nota para evitar injustiças.
Faça um programa que recebe 6 notas decimais
entre 0 e 10 e calcule a média eliminando-se a
menor e a maior nota.
    FORMULA: nota_soma= nota_soma - (nota_maior + nota_menor)
    nota_some / 4
	*/	
	
	//ENTRADA
	float n1,n2,n3,n4,n5,n6 = 0;
	printf("Digite a primeira nota que o atleta recebeu: \n");
	scanf("%f", &n1);
	printf("Digite a segunda nota que o atleta recebeu: \n");
	scanf("%f", &n2);
	printf("Digite a terceira nota que o atleta recebeu: \n");
	scanf("%f", &n3);
	printf("Digite a quarta nota que o atleta recebeu: \n");
	scanf("%f", &n4);
	printf("Digite a quinta nota que o atleta recebeu: \n");
	scanf("%f", &n5);
	printf("Digite a sexta nova nota que o atleta recebeu: \n");
	scanf("%f", &n6);
	//CALCULO
	float soma = n1+n2+n3+n4+n5+n6;	
	//VERIFICAÇÃO
       //Se n1 for a maior
	if (n1>n2 && n1>n3 && n1>n4 && n1>n5 && n1>n6){
						soma = soma - n1;
	}
	   //Se n1 for a menor
	if (n1<n2 && n1<n3 && n1<n4 && n1<n5 && n1<n6){
						soma = soma - n1;
	}
	   //Se n2 for a maior
	if (n2>n1 && n2>n3 && n2>n4 && n2>n5 && n2>n6){
						soma = soma - n2;
	}
	   //Se n2 for a menor
	if (n2<n1 && n2<n3 && n2<n4 && n2<n5 && n2<n6){
						soma = soma - n2;
	}
	   //Se n3 for a maior
	if (n3>n1 && n3>n2 && n3>n4 && n3>n5 && n3>n6){
						soma = soma - n3;
	}
       //Se n3 for a menor
	if (n3<n1 && n3<n2 && n3<n4 && n3<n5 && n3<n6){
						soma = soma - n3;
	}
	   //Se n4 for a maior
	if (n4>n1 && n4>n2 && n4>n3 && n4>n5 && n4>n6){
						soma = soma - n4;
	}
	   //Se n4 for a menor
	if (n4<n1 && n4<n2 && n4<n3 && n4<n5 && n4<n6){
						soma = soma - n4;
	}
	   //Se n5 for a maior
	if (n5>n1 && n5>n2 && n5>n3 && n5>n4 && n5>n6){
						soma = soma - n5;
	}
	   //Se n5 for a menor
	if (n5<n1 && n5<n2 && n5<n3 && n5<n4 && n5<n6){
						soma = soma - n5;
	}
	   //Se n6 for a maior
	if (n6>n1 && n6>n2 && n6>n3 && n6>n4 && n6>n5){
						soma = soma - n6;
	}
	   //Se n6 for a menor
	if (n6<n1 && n6<n2 && n6<n3 && n6<n4 && n6<n5){
						soma = soma - n6;
	}
	
	//SAIDA
	float med = soma / 4;
	printf("A nota media do atleta foi: %.2f", med);
	
		
//SEGUE MINHA PRIMEIRA FORMA DE RESOLUÇÃO ABAIXO	
	/*
	//ENTRADA
	float n1,n2,n3,n4,n5,n6 = 0;
	printf("Digite a primeira nota que o atleta recebeu: \n");
	scanf("%f", &n1);
	printf("Digite a segunda nota que o atleta recebeu: \n");
	scanf("%f", &n2);
	printf("Digite a terceira nota que o atleta recebeu: \n");
	scanf("%f", &n3);
	printf("Digite a quarta nota que o atleta recebeu: \n");
	scanf("%f", &n4);
	printf("Digite a quinta nota que o atleta recebeu: \n");
	scanf("%f", &n5);
	printf("Digite a sexta nova nota que o atleta recebeu: \n");
	scanf("%f", &n6);
	//CALCULO
	float soma = n1+n2+n3+n4+n5+n6;
	//VERIFICAÇÂO
	   //Se n1 for a maior
	if (n1 > n2){
		if(n1 > n3){
			if(n1 > n4){
				if(n1 > n5){
					if(n1 > n6){
						// Usei de teste para verificar a logica: printf("%f", n1);
						soma = soma - n1;
					}
				}
			}
		}
	}
	   //Se n1 for a menor
	if (n1 < n2){
		if(n1 < n3){
			if(n1 < n4){
				if(n1 < n5){
					if(n1 < n6){
						soma = soma - n1;
					}
				}
			}
		}
	}
	   //Se n2 for a maior
	if (n2 > n1){
		if(n2 > n3){
			if(n2 > n4){
				if(n2 > n5){
					if(n2 > n6){
						soma = soma - n2;
					}
				}
			}
		}
	}
	   //Se n2 for a menor
	if (n2 < n1){
		if(n2 < n3){
			if(n2 < n4){
				if(n2 < n5){
					if(n2 < n6){
						soma = soma - n2;
					}
				}
			}
		}
	}
	   //Se n3 for a maior
	if (n3 > n1){
		if(n3 > n2){
			if(n3 > n4){
				if(n3 > n5){
					if(n3 > n6){
						soma = soma - n3;
					}
				}
			}
		}
	}
       //Se n3 for a menor
	if (n3 < n1){
		if(n3 < n2){
			if(n3 < n4){
				if(n3 < n5){
					if(n3 < n6){
						soma = soma - n3;
					}
				}
			}
		}
	}
	   //Se n4 for a maior
	if (n4 > n1){
		if(n4 > n2){
			if(n4 > n3){
				if(n4 > n5){
					if(n4 > n6){
						soma = soma - n4;
					}
				}
			}
		}
	}
	   //Se n4 for a menor
	if (n4 < n1){
		if(n4 < n2){
			if(n4 < n3){
				if(n4 < n5){
					if(n4 < n6){
						soma = soma - n4;
					}
				}
			}
		}
	}
	   //Se n5 for a maior
	if (n5 > n1){
		if(n5 > n2){
			if(n5 > n3){
				if(n5 > n4){
					if(n5 > n6){
						soma = soma - n5;
					}
				}
			}
		}
	}
	   //Se n5 for a menor
	if (n5 < n1){
		if(n5 < n2){
			if(n5 < n3){
				if(n5 < n4){
					if(n5 < n6){
						soma = soma - n5;
					}
				}
			}
		}
	}
	   //Se n6 for a maior
	if (n6 > n1){
		if(n6 > n2){
			if(n6 > n3){
				if(n6 > n4){
					if(n6 > n5){
						soma = soma - n6;
					}
				}
			}
		}
	}
	   //Se n6 for a menor
	if (n6 < n1){
		if(n6 < n2){
			if(n6 < n3){
				if(n6 < n4){
					if(n6 < n5){
						soma = soma - n6;
					}
				}
			}
		}
	}
	
	//SAIDA
	float med = soma / 4;
	printf("A nota media do atleta foi: %f", med);
	
	*/
	
	return 0;
}
