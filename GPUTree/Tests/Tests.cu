#include "Tests.cuh"

#include "cuda_runtime.h"

int ALL_TESTS = 0;
int PASSED_TESTS = 0;

cudaEvent_t start;
cudaEvent_t stop;

cudaEvent_t startPack;
cudaEvent_t stopPack;


void InitAllTests()
{
	cudaEventCreate(&start);
	cudaEventCreate(&stop);
	cudaEventRecord(start, 0);

	ALL_TESTS = 0;
    PASSED_TESTS = 0;
}

void InitPack()
{
	cudaEventCreate(&startPack);
	cudaEventCreate(&stopPack);
	cudaEventRecord(startPack, 0);
}

void TestInit(const char *testName)
{
	printf("%135s  ", testName);
	++ALL_TESTS;
}

void Assert(bool arg1, bool arg2, bool arg3, bool arg4, bool arg5, bool arg6, bool arg7, bool arg8, bool arg9, bool arg10)
{

	if (arg1 && arg2 && arg3 && arg4 && arg5
		&& arg6 && arg7 && arg8 && arg9 && arg10)
	{
		++PASSED_TESTS;
		printf("   PASS\n");
	}
	else
	{
		printf("   FAILED\n");
	}
}

void Output(std::string output)
{
	printf("\nTest output:\n%s\n", output.c_str());
}

void FinalReport()
{
	float time;
	cudaEventRecord(stop, 0);
	cudaEventSynchronize(stop);
	cudaEventElapsedTime(&time, start, stop);

	printf("===== FINAL REPORT =====\n\n");
	printf("\nPASSED %d / %d\n", PASSED_TESTS, ALL_TESTS);
	printf("ELAPSED TIME: %f\n\n", time);
}

void PackReport()
{
	float time;
	cudaEventRecord(stopPack, 0);
	cudaEventSynchronize(stopPack);
	cudaEventElapsedTime(&time, startPack, stopPack);

	printf("ELAPSED TIME: %f\n\n", time);
}

void PrintException(std::exception e)
{
	printf("   EXCEPTION: %s\n", e.what());
}

void PrintException()
{
	printf("   EXCEPTION\n");
}
