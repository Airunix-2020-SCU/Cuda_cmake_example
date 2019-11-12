/*
 * main.cpp
 *
 *  Created on: Sep 10, 2019
 *      Author: salimterryli
 */
#include <string.h>
#include <stdio.h>

#include "kernels.h"



// Main
int main(){
	int N=128;
	float A[N],B[N],C[N];
	for(int i=0;i<N;i++){
		A[i]=0.25;
		B[i]=0.1;
	}
	//memset(C,(float)0.01,sizeof(C));
	VecAddWrapper(A,B,C,N);

	/*int check=0;
	for(int i=0;i<N;i++){
		if(C[i]!=A[i]+B[i]){
			check++;
		}
	}

	printf("Check: %d\n",check);*/

	for(int i=0;i<N;i++){
			printf("%f ",C[i]);
		}
}
