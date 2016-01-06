#include "thrust/device_vector.h"

struct GPUTree
{
	int Count;
	int Lenght;
	int BitsPerLevel;
	int ChildrenPerLevel;
	int LevelCount;
};

GPUTree BuildTree(int *data, int count, int lenght, int bitsPerLevel);

GPUTree BuildTree(thrust::device_vector<int> &data, int count, int lenght, int bitsPerLevel);

