$Env:TRT_OSSPATH = "D:\ivan\projects\TensorRT"
$Env:PATH = "C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\MSBuild\15.0\Bin;" + $Env:PATH
$Env:TRT_LIBPATH="D:\lib\TensorRT-8.2.3.0\lib"

$Env:PATH = "C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v11.4\bin" + $Env:PATH
 
pushd $Env:TRT_OSSPATH
mkdir -p build ; cd build
cmake .. -G "Visual Studio 15 2017"  -DTRT_LIB_DIR=$Env:TRT_LIBPATH -DTRT_OUT_DIR='..\out' -DCMAKE_TOOLCHAIN_FILE="..\cmake\toolchains\cmake_x64_win.toolchain" -DCUDA_VERISON="11.4.3" -DCUDA_TOOLKIT="C:/Program Files/NVIDIA GPU Computing Toolkit/CUDA/v11.4" -DCMAKE_CUDA_ARCHITECTURES=all
 
 
# msbuild ALL_BUILD.vcxproj
 
popd
 