#pragma once

#include <string>


void TestInit(const char *testName);
void Output(std::string output);
void Assert(bool arg1 = true, bool arg2 = true, bool arg3 = true, bool arg4 = true, bool arg5 = true, bool arg6 = true, bool arg7 = true, bool arg8 = true, bool arg9 = true, bool arg10 = true);
void FinalReport();
void PrintException();
void PrintException(std::exception e);
void InitAllTests();
void PackReport();
void InitPack();
