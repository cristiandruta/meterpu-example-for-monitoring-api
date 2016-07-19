#!/bin/bash

set -e
set -o pipefail


# Activate debug
# set -x


#g++ -DENABLE_MF -I/usr/include/x86_64-linux-gnu/c++/4.8/ -I/usr/include/c++/4.8 -I../../MeterPU/ lu_test.cpp ../src/mf_api.c ../src/contrib/mf_publisher.c -o test_mf_api  -I../ext/CuTest -I../src/ -I. -std=c++11 -pedantic  -Wall  -fPIC  -Wwrite-strings  -Wpointer-arith  -Wcast-align -I../bin/curl/include/ -I../src/ -DDEBUG -g -lm -L../bin/curl/lib/ -lcurl  -fmax-errors=1 -DENABLE_NVML -DENABLE_PTHREAD -I/home/lu/Documents/Software/Nvidia/NVML/tdk_5.319.85/NVML/include -DMETERPU_INTEGRATE_WITH_MF -O2 -L/home/lu/Documents/Software/Nvidia/NVML/tdk_5.319.85/NVML -lnvidia-ml  -lpthread
nvcc  -DENABLE_MF -I/usr/include/x86_64-linux-gnu/c++/4.8/ -I/usr/include/c++/4.8 -I../../MeterPU/ lu_test.cu ../src/mf_api.c ../src/contrib/mf_publisher.c -o test_mf_api  -I../ext/CuTest -I../src/ -I. -std=c++11 --compiler-options -pedantic --compiler-options -Wall --compiler-options -fPIC --compiler-options -Wwrite-strings --compiler-options -Wpointer-arith --compiler-options -Wcast-align -I../bin/curl/include/ -I../src/ -DDEBUG -g -lm -L../bin/curl/lib/ -lcurl --compiler-options -fmax-errors=1 -DENABLE_NVML -DENABLE_PTHREAD -I/home/lu/Documents/Software/Nvidia/NVML/tdk_5.319.85/NVML/include -DMETERPU_INTEGRATE_WITH_MF -O2 -L/home/lu/Documents/Software/Nvidia/NVML/tdk_5.319.85/NVML -lnvidia-ml  -lpthread
#nvcc -DSORT -DENABLE_MF -I/usr/include/x86_64-linux-gnu/c++/4.8/ -I/usr/include/c++/4.8 -I../../MeterPU/ lu_test.cu ../src/mf_api.c ../src/contrib/mf_publisher.c -o test_mf_api  -I../ext/CuTest -I../src/ -I. -std=c++11 --compiler-options -pedantic --compiler-options -Wall --compiler-options -fPIC --compiler-options -Wwrite-strings --compiler-options -Wpointer-arith --compiler-options -Wcast-align -I../bin/curl/include/ -I../src/ -DDEBUG -g -lm -L../bin/curl/lib/ -lcurl --compiler-options -fmax-errors=1 -DENABLE_NVML -DENABLE_PTHREAD -I/home/lu/Documents/Software/Nvidia/NVML/tdk_5.319.85/NVML/include -DMETERPU_INTEGRATE_WITH_MF -O2 -L/home/lu/Documents/Software/Nvidia/NVML/tdk_5.319.85/NVML -lnvidia-ml  -lpthread
#./test_mf_api
#rm test_mf_api
