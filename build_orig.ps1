$Env:TRT_OSSPATH = "D:\ivan\projects\TensorRT"
$Env:TRT_LIBPATH="D:\lib\TensorRT-8.2.3.0"

$Env:PATH = "C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\MSBuild\15.0\Bin;" + $Env:PATH
# MSBuild version shall be 15.9.21.664
#msbuild /version

 
pushd $Env:TRT_OSSPATH
mkdir -p build ; cd build

cmake .. -DTRT_LIB_DIR=$Env:TRT_LIBPATH -DTRT_OUT_DIR='$(Get-Location)\out' -DCMAKE_TOOLCHAIN_FILE=..\cmake\toolchains\cmake_x64_win.toolchain 
 
# msbuild ALL_BUILD.vcxproj
 
popd
 