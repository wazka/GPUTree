#include "Tools.cuh"

void UpdatePermutation(DV &keys, int index, int lenght, int count, DV &permutation)
{
	DV temp(count);
	DV::iterator iter = keys.begin() + index * count;
	thrust::gather(permutation.begin(), permutation.end(), iter, temp.begin());
	thrust::stable_sort_by_key(temp.begin(), temp.end(), permutation.begin());
}

void ApplyPermutation(DV &keys, int index, int lenght, int count, DV &permutation)
{
	DV::iterator begin = keys.begin() + index * count;
	DV::iterator end = begin + count;

	DV temp(begin, end);
	thrust::gather(permutation.begin(), permutation.end(), temp.begin(), begin);
}

DV SortData(int count, int length, DV &data)
{
	DV permutation(count);
	thrust::sequence(permutation.begin(), permutation.end());

	for (int i = length - 1; i >= 0; --i)
		UpdatePermutation(data, i, length, count, permutation);

	return permutation;

}