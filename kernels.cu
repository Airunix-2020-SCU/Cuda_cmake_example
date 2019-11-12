#include <cuda_runtime.h>
#include <stdio.h>

#include "kernels.h"


// Kernel definition
__global__ void VecAdd(float* A, float* B, float* C,int nums)
{
	int i = blockDim.x * blockIdx.x + threadIdx.x;
	//C[i] = A[i] + B[i];
	if(i<nums){
		//C[i]=A[i]+B[i];
		C[i]=static_cast<float>(i);
	}
}

void printerr(cudaError_t err){
	if (err != cudaSuccess)
	{
		fprintf(stderr, "error code %s\n", cudaGetErrorString(err));
		exit(EXIT_FAILURE);
	}
}

void VecAddWrapper(float* A, float* B, float* C,int Count){
	cudaError_t err = cudaSuccess;
	size_t size=Count*sizeof(float);
	float *d_A = NULL;
	err = cudaMalloc(&d_A, size);
	printerr(err);
	float *d_B = NULL;
	err = cudaMalloc(&d_B, size);
	printerr(err);
	float *d_C = NULL;
	err = cudaMalloc(&d_C, size);
	printerr(err);
	err = cudaMemcpy(d_A, A, size, cudaMemcpyHostToDevice);
	printerr(err);
	err = cudaMemcpy(d_B, B, size, cudaMemcpyHostToDevice);
	printerr(err);
	dim3 tpB(128,1);
	VecAdd<<<1, tpB>>>(d_A, d_B, d_C, Count);
	printerr(err);
	err = cudaMemcpy(C, d_C, size, cudaMemcpyDeviceToHost);
	printerr(err);
	err = cudaFree(d_A);
	printerr(err);
	err = cudaFree(d_B);
	printerr(err);
	err = cudaFree(d_C);
	printerr(err);
}
