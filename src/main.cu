/*
 * =====================================================================================
 *
 *       Filename:  lu_test.c
 *
 *    Description:  
 *
 *        Version:  1.0
 *        Created:  2016-04-25 11:41:27
 *       Revision:  none
 *       Compiler:  gcc
 *
 *         Author:  Lu Li, 
 *   Organization:  
 *
 * =====================================================================================
 */
#include <stdlib.h>

#include "MeterPU.h"


#ifdef SORT
#include <thrust/sort.h>
#include <thrust/device_vector.h>
#include <vector>
#include <algorithm>
#include <iostream>

#endif

#define GPU_0 0

using namespace std;


#ifdef ENABLE_MF
#include <mf_api.h>
#endif

int main(int argc, const char *argv[])
{

#ifdef ENABLE_MF
    mf_api_new("http://mf.excess-project.eu:3030", "user_meterpu", "hello_app", NULL, "another_id");


    //define metric 
    mf_metric* metric = (mf_metric*)malloc(sizeof(mf_metric));
    
    metric->type = "meterpu";
    metric->name = "Power (milliW)";
#endif



#ifdef MEASURE
    using namespace meterpu;
    meter< NVML_Energy<GPU_0> > meter;
#endif 

#ifdef SORT
    std::vector<float> x(100000000);
    //std::vector<float> x(5);
    std::generate(x.begin(), x.end(), std::rand );
    thrust::device_vector<float> y(x.begin(), x.end() );
#endif

#ifdef MEASURE
    meter.start();
#endif 

#ifdef SORT
    thrust::sort(y.begin(), y.end() );
    cudaDeviceSynchronize();
    thrust::transform(y.begin(), y.end(), y.begin(), thrust::negate<int>());
    cudaDeviceSynchronize();
    thrust::sort(y.begin(), y.end() );
    cudaDeviceSynchronize();
    thrust::transform(y.begin(), y.end(), y.begin(), thrust::negate<int>());
    cudaDeviceSynchronize();
    thrust::sort(y.begin(), y.end() );
    cudaDeviceSynchronize();
    thrust::transform(y.begin(), y.end(), y.begin(), thrust::negate<int>());
    cudaDeviceSynchronize();
    thrust::sort(y.begin(), y.end() );
    cudaDeviceSynchronize();
    thrust::transform(y.begin(), y.end(), y.begin(), thrust::negate<int>());
    cudaDeviceSynchronize();
    thrust::sort(y.begin(), y.end() );
    cudaDeviceSynchronize();
    thrust::transform(y.begin(), y.end(), y.begin(), thrust::negate<int>());
    cudaDeviceSynchronize();
    thrust::sort(y.begin(), y.end() );
    cudaDeviceSynchronize();
    thrust::transform(y.begin(), y.end(), y.begin(), thrust::negate<int>());
    cudaDeviceSynchronize();
    thrust::sort(y.begin(), y.end() );
    cudaDeviceSynchronize();
    thrust::transform(y.begin(), y.end(), y.begin(), thrust::negate<int>());
    cudaDeviceSynchronize();
    thrust::sort(y.begin(), y.end() );
    cudaDeviceSynchronize();
    thrust::transform(y.begin(), y.end(), y.begin(), thrust::negate<int>());
    cudaDeviceSynchronize();
    thrust::sort(y.begin(), y.end() );
    cudaDeviceSynchronize();
#else
    sleep(2);
#endif

#ifdef MEASURE
    meter.stop();
#endif

#ifdef SORT
    thrust::copy(y.begin(), y.end(), x.begin() );
    //std::for_each(x.begin(), x.end(), [](float const &i){ std::cout<<i<<" ";});
    //std::cout<<endl;

#endif



#ifdef MEASURE
    meter.calc();
#endif

#ifdef ENABLE_MF
    auto it=meter.measurement_controller_object.correctedPowerDB.begin();

    auto it_t=meter.measurement_controller_object.sampling_thread_controller.get_time_db().begin();
    auto end_t=meter.measurement_controller_object.sampling_thread_controller.get_time_db().end();

    char* response;

    for (; it_t!=end_t; ++it_t, ++it) {
    	    metric->timestamp = meterpu_mf_api_get_time_from_timespec(&(*it_t));
	    cout<<metric->timestamp<<endl;
	    metric->value = std::to_string(*it).c_str();
	    response = mf_api_update(metric);

    }

    cout<<response<<endl;
#endif

#ifdef MEASURE
    meter.show_meter_reading();
#endif



#ifdef ENABLE_MF
	
        free(metric);

	mf_api_clear();
#endif
	
	return 0;
}

