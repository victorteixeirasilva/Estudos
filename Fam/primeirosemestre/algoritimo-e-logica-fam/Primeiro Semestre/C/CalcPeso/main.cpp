#include <iostream>
/* By: Victor Teixeira Silva */
//Método de Interface Inicio
void inicio(){
    printf("==================================");
    printf("\n Vamos calcular o seu peso: \n");
    printf("==================================");
    printf("\n Digite sua massa: ");
}
//Método Pergunta Fim para repetição ou não
void fim(){
    printf("\n Deseja calcular outro peso digite (1) se deseja finalizar digite (2): ");
}
//Método de tratamento das faixas de imc
float calc(float massa, float altura){
    float peso = massa/(altura*altura);
    if(peso < 17){
        printf("\n Muito Abaixo do Peso");
    }else if(peso>=17&&peso<18.49){
        printf("\n Abaixo do Peso");
    }else if(peso>=18.50&&peso<24.99){
        printf("\n Peso Normal");
    }else if(peso>=25&&peso<29.99){
        printf("\n Acima do Peso");
    }else if(peso>=30&&peso<34.99){
        printf("\n Obeso I");
    }else if(peso>=35&&peso<39.99){
        printf("\n Obeso II");
    }else if(peso>=40){
        printf("\n Obeso III (VAMO PERDER UM PESO AI AMIGÃO!) ");
    }else{}
}
//Método calculo de IMC
float imc(float massa, float altura) {
    float resultadoImc = massa/(altura*altura);
    printf("%f", resultadoImc);
}
//Método Principal
int main() {
    //Variavel de escolha (while)
    int escolha;
    //do while: faz a verificação para a repetição no final do programa
    do {
        //Chamada do Método inicio
        inicio();
        //Entrada do Dado de Massa do usuario
        float massa = 0;
        scanf("%f", &massa);
        printf("\n==================================\n");
        //Entrada do Dado de Altura do usuario
        printf("Digite a sua altura: ");
        float altura = 0;
        scanf("%f", &altura);
        printf("\n==================================\n");
        //Chamada dos metodos de calculo de IMC, Calculo das Faixas de peso (Calc), Chamada do Método fim para escolha de repetição
        imc(massa, altura);
        calc(massa,altura);
        fim();
        //Entrada de escolha do usuario
        scanf("%d", &escolha);
        //Verificação da escolha
        if(escolha<1||escolha>2){
            printf("\n É PARA DIGITAR 1 OU 2, VOCÊ É BURRO? ");
        }else{

        }
    } while (escolha==1);
    return 0;
}
