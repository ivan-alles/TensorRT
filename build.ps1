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

cd build

# We use VS 2017 as suggested in the README.md. cl.exe version shall be 19.16.27045.

cmake .. -G "Visual Studio 15 2017" -DTRT_LIB_DIR=$Env:TRT_LIBPATH -DTRT_OUT_DIR='$(Get-Location)\out' -DCMAKE_TOOLCHAIN_FILE=..\cmake\toolchains\cmake_x64_win.toolchain 

#-DCMAKE_CUDA_ARCHITECTURES="75" 
 
# msbuild ALL_BUILD.vcxproj
 
popd




 
# cmake .. -G "Visual Studio 15 2017"  -DTRT_LIB_DIR=$Env:TRT_LIBPATH -DTRT_OUT_DIR='..\out' -DCMAKE_TOOLCHAIN_FILE="..\cmake\toolchains\cmake_x64_win.toolchain" -DCUDA_VERISON="11.4.3" -DCUDA_TOOLKIT="C:/Program Files/NVIDIA GPU Computing Toolkit/CUDA/v11.4" -DCMAKE_CUDA_ARCHITECTURES=all -DCMAKE_SYSTEM_PROCESSOR="AMD64"
 
 