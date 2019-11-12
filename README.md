# Cuda_cmake_example

# Configure project with Nsight Eclipse:
	git clone https://github.com/Airunix-2020-SCU/Cuda_cmake_example.git
	mkdir nsight_workspace
	mkdir nsight_workspace/Cuda_cmake_example
	cd nsight_workspace/Cuda_cmake_example
	cmake ../../Cuda_cmake_example -G"Eclipse CDT4 - Unix Makefiles"
Then change eclipse workspace to nsight_workspace, import this project as Makefile project.

# Reference:
https://devblogs.nvidia.com/building-cuda-applications-cmake/
https://github.com/robertmaynard/code-samples/blob/master/posts/cmake/CMakeLists.txt
https://stackoverflow.com/questions/9453851/how-to-configure-eclipse-cdt-for-cmake