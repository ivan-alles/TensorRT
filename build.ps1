$Env:TRT_OSSPATH = "D:\ivan\projects\TensorRT"
$Env:TRT_LIBPATH="D:\lib\TensorRT-8.2.3.0"

$Env:PATH = "C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\MSBuild\15.0\Bin;" + $Env:PATH
# MSBuild version shall be 15.9.21.664
#msbuild /version

pushd $Env:TRT_OSSPATH

# Clean build, useful for debugging
if (Test-Path build) {
    rmdir -r build 
}
if (!(Test-Path build)) {
    mkdir -p build
}

# Tell VisualStudio where CUDA tools are.
# If Visual Studio is opened manually (not from this file), this variable shall be defined system-wide.
$Env:CudaToolkitDir="C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v11.4"

cd build

# We use VS 2017 as suggested in the README.md. cl.exe version shall be 19.16.27045.

cmake .. -A x64 -G "Visual Studio 15 2017" -DTRT_OUT_DIR="D:/ivan/projects/TensorRT/build/out" -DCMAKE_TOOLCHAIN_FILE="..\cmake\toolchains\cmake_x64_win.toolchain" -DCUBLASLT_LIB="C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v11.4\lib\x64\cublasLt.lib" -DCUBLAS_LIB="C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v11.4\lib\x64\cublas.lib" -DCUDART_LIB="C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v11.4\lib\x64\cudart.lib" -DCUDNN_LIB="C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v11.4\lib\x64\cudnn.lib"

 
# msbuild ALL_BUILD.vcxproj
 
popd

 