#pragma once

#include "cuda_runtime.h"
#include "device_launch_parameters.h"
#include <thrust/host_vector.h>
#include <thrust/device_vector.h>
#include <thrust/generate.h>
#include <thrust/sequence.h>
#include <thrust/sort.h>
#include <thrust/gather.h>
#include <thrust/random.h>
#include <thrust/advance.h>
#include <thrust/binary_search.h>
#include <thrust/execution_policy.h>

//Typedefs
typedef thrust::device_vector<int> DV;



//Sorting
void UpdatePermutation(DV &keys, int index, int lenght, int count, DV &permutation);

void ApplyPermutation(DV &keys, int index, int lenght, int count, DV &permutation);

DV SortData(int count, int length, DV &data);

