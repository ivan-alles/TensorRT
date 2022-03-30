if not exist build mkdir build

pushd build

set TRT_LIBPATH=D:\lib\TensorRT-8.2.3.0\lib

set PATH="C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\MSBuild\15.0\Bin";%PATH%

set PATH="C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v11.4\bin";%PATH%

:: set CMAKE_CUDA_COMPILER="C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v11.4\bin\nvcc.exe"

cmake .. -G "Visual Studio 15 2017" -DTRT_LIB_DIR=%TRT_LIBPATH% -DTRT_OUT_DIR=out -DCMAKE_TOOLCHAIN_FILE=..\cmake\toolchains\cmake_x64_win.toolchain -DCUDA_VERISON=11.4.3 

:: -DMSVC_TOOLSET_VERSION=140

popd
