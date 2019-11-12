
cmake_minimum_required(VERSION 3.8 FATAL_ERROR)
project(hello_world LANGUAGES CXX CUDA)

# Build the kernel separately
add_library(hello_world_kernel STATIC
  kernels.cu
  )

# Request that particles be built with -std=c++11
# As this is a public compile feature anything that links to particles
# will also build with -std=c++11
target_compile_features(hello_world_kernel PUBLIC cxx_std_11)

# We need to explicitly state that we need all CUDA files in the particle
# library to be built with -dc as the member functions could be called by
# other libraries and executables
set_target_properties( hello_world_kernel
                       PROPERTIES CUDA_SEPARABLE_COMPILATION ON
                      )

# Build the frontend
add_executable(hello_world main.cpp)

# Link
set_target_properties(hello_world PROPERTIES CUDA_SEPARABLE_COMPILATION ON)
target_link_libraries(hello_world PRIVATE hello_world_kernel)


