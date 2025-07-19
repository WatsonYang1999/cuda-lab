#include <stdio.h>

// CUDA kernel function
__global__ void helloFromGPU() {
    printf("Hello World from GPU thread %d, block %d!\n", 
           threadIdx.x, blockIdx.x);
}

int main() {
    printf("Hello World from CPU!\n");
    
    // Launch kernel with 2 blocks of 4 threads each
    helloFromGPU<<<2, 4>>>();
    
    // Wait for GPU to finish before accessing on host
    cudaDeviceSynchronize();
    
    printf("CUDA program completed successfully!\n");
    return 0;
} 