# CUDA Lab Makefile

# CUDA compiler
NVCC = nvcc

# Compiler flags
NVCC_FLAGS = -O2 -arch=sm_60

# Target executables
TARGETS = basics/hello_cuda

# Default target
all: $(TARGETS)

# Compile hello_cuda
basics/hello_cuda: basics/hello_cuda.cu
	$(NVCC) $(NVCC_FLAGS) -o $@ $<

# Clean build files
clean:
	rm -f $(TARGETS)

# Run hello_cuda
run-hello: basics/hello_cuda
	./basics/hello_cuda

# Check CUDA installation
check-cuda:
	@echo "Checking CUDA installation..."
	@nvcc --version
	@echo "CUDA devices:"
	@nvidia-smi --list-gpus

.PHONY: all clean run-hello check-cuda
