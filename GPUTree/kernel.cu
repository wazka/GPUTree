#include "Tests/Tests.cuh"


int main(int argc, char **argv)
{
	//Run tests
	if (argc == 2 && argv[1][1] == 't' && argv[1][0] == '-')
	{
		InitAllTests();

		//Tests code here
		TreeBuildingTests();

		FinalReport();
		return EXIT_SUCCESS;
	}

    return 0;
}
