#include "Tests/Tests.cuh"
#include "GPUTree.cuh"

void Given_Data_When_BinaryTreeBuilded_Then_TreePropertiesSetted()
{
	TestInit(__FUNCTION__);

	//given
	int count = 100;
	int lenght = 50;

	int *data = static_cast<int*>(malloc(count * lenght * sizeof(int)));

	//when
	GPUTree tree = BuildTree(data, count, lenght, 1);

	//then
	Assert(
		tree.Count == count,
		tree.Lenght == lenght,
		tree.BitsPerLevel == 1,
		tree.LevelCount == lenght * sizeof(int),
		tree.ChildrenPerLevel == 2
		);

	//cleanup
	free(data);
}

void Given_Data_When_OctalTreeBuilded_Then_TreePropertiesSetted()
{
	TestInit(__FUNCTION__);

	//given
	int count = 100;
	int lenght = 60;

	int *data = static_cast<int*>(malloc(count * lenght * sizeof(int)));

	//when
	GPUTree tree = BuildTree(data, count, lenght, 3);

	//then
	Assert(
		tree.Count == count,
		tree.Lenght == lenght,
		tree.BitsPerLevel == 3,
		tree.LevelCount == lenght * sizeof(int) / 3,
		tree.ChildrenPerLevel == 8
		);

	//cleanup
	free(data);
}

void TreeBuildingTests()
{
	InitPack();

	Given_Data_When_BinaryTreeBuilded_Then_TreePropertiesSetted();
	Given_Data_When_OctalTreeBuilded_Then_TreePropertiesSetted();

	PackReport();
}