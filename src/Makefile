

main: mf_api.o mf_publisher.o main.o
	nvcc -o $@ $^ -lm -L../monitoring-api/bin/curl/lib/ -lcurl -L/home/lu/Documents/Software/Nvidia/NVML/tdk_5.319.85/NVML -lnvidia-ml  -lpthread -L/usr/local/cuda/lib64 -lcuda -lcudart

mf_api.o:../monitoring-api/src/mf_api.c
	g++ -c $^

mf_publisher.o:../monitoring-api/src/contrib/mf_publisher.c
	g++ -c $^ -I../monitoring-api/bin/curl/include/ 

main.o:main.cu
	nvcc -c -std=c++11 -DENABLE_NVML -DENABLE_PTHREAD -I../nvidia_gdk/usr/include/nvidia/gdk/ -DMETERPU_INTEGRATE_WITH_MF -O2 -c $^ -I../monitoring-api/src/ -DSORT -DMEASURE -DENABLE_MF 


run:
	./main

allclean:
	-@rm *.o main
