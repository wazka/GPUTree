#include "GPUTree.cuh"

GPUTree BuildTree(int *data, int count, int lenght, int bitsPerLevel)
{
	thrust::device_vector<int> newData(data, data + count * lenght);
	
	return BuildTree(newData, count, lenght, bitsPerLevel);
}

GPUTree BuildTree(thrust::device_vector<int> &data, int count, int lenght, int bitsPerLevel)
{
	GPUTree tree;

	tree.Count = count;
	tree.Lenght = lenght;
	tree.BitsPerLevel = bitsPerLevel;
	tree.ChildrenPerLevel = 1 << bitsPerLevel;
	tree.LevelCount = lenght * sizeof(int) / bitsPerLevel;

	return tree;
}
