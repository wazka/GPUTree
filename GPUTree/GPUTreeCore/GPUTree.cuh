#include "../Tools/Tools.cuh"

struct GPUTree
{
	int Count;
	int Lenght;
	int BitsPerLevel;
	int ChildrenPerLevel;
	int LevelCount;
};

GPUTree BuildTree(int *data, int count, int lenght, int bitsPerLevel);

GPUTree BuildTree(DV &data, int count, int lenght, int bitsPerLevel);

