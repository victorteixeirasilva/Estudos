#include <iostream>

/* run this program using the console pauser or add your own getch, system("pause") or input loop */

int main(int argc, char** argv) {
	float n[6];
	float nma=0;
	float nme=10;
	float ntotal=0;
	for (int i=0; i<6; i++){
		printf("Digite as nota %d:\n", i+1);
	    scanf("%f", &n[i]);
        if(n[i]<nme){
        	nme=n[i];
		} 
		if(n[i]>nma){
			nma=n[i];
		}
	}
	for (int i=0; i<6; i++){
	     ntotal = ntotal+n[i];
	}
	ntotal = ntotal - (nme + nma);
	ntotal = ntotal/4;
	printf("Resultado da media: %.2f", ntotal);
	return 0;
}
