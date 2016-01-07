#include "GPUTree.cuh"

GPUTree BuildTree(int *data, int count, int lenght, int bitsPerLevel)
{
	DV newData(data, data + count * lenght);
	return BuildTree(newData, count, lenght, bitsPerLevel);
}

#include <thrust/sort.h>

GPUTree BuildTree(DV &data, int count, int lenght, int bitsPerLevel)
{
	GPUTree tree;

	//Filling basic properties
	tree.Count = count;
	tree.Lenght = lenght;
	tree.BitsPerLevel = bitsPerLevel;
	tree.ChildrenPerLevel = 1 << bitsPerLevel;
	tree.LevelCount = lenght * INT_SIZE / bitsPerLevel;

	//Sorting data
	DV permutation = SortData(count, lenght, data);

	return tree;
}
