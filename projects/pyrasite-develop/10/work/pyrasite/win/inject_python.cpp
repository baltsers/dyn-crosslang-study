#include <stdio.h>
#include <Windows.h>


















int RaisePrivileges()
{
	int retCode = 0;







	{


	}

	{


	}





	{


	}



	return retCode;
}

typedef struct
{
	HMODULE (__stdcall *pGetModuleHandle)(LPCSTR);
	FARPROC (__stdcall *pGetProcAddress)(HMODULE, LPCSTR);
	char ModuleName[9];
	char PyGILState_Ensure[18];
	char PyRun_SimpleString[19];

	char *Code;
} REMOTEDATA;

static DWORD WINAPI ExecutePythonCode(REMOTEDATA *data)
{
	DWORD retCode = 0;
	HMODULE hModule = data->pGetModuleHandle(data->ModuleName);
	if (hModule != NULL)
	{
		int (__cdecl *a)() = reinterpret_cast<int (__cdecl *)()>(data->pGetProcAddress(hModule, data->PyGILState_Ensure));

		{
			int ret = a();

			void (__cdecl *b)(char *) = reinterpret_cast<void (__cdecl *)(char *)>(data->pGetProcAddress(hModule, data->PyRun_SimpleString));

			{
				b(data->Code);


			}



			{



			}


		}


	}
	return retCode;
}

static void AfterExecutePythonCode()
{
}

int InjectPythonCode(HANDLE hProcess, const char *code, char *moduleName)
{
	int retCode = 0;
	REMOTEDATA data;
	int cbCodeSize = (PBYTE)AfterExecutePythonCode - (PBYTE)ExecutePythonCode;
	void* remoteCodeString = VirtualAllocEx(hProcess, NULL, strlen(code) + 1, MEM_COMMIT, PAGE_READWRITE);

	{


	}
	void* remoteCode = VirtualAllocEx(hProcess, NULL, cbCodeSize, MEM_COMMIT, PAGE_EXECUTE);

	{


	}
	void* remoteData = VirtualAllocEx(hProcess, NULL, sizeof(data), MEM_COMMIT, PAGE_READWRITE);

	{


	}
	if (!WriteProcessMemory(hProcess, remoteCodeString, (void*)code, strlen(code) + 1, NULL))
	{


	}
	data.pGetModuleHandle = GetModuleHandle;
	data.pGetProcAddress = GetProcAddress;
	strcpy_s(data.ModuleName, moduleName);
	strcpy_s(data.PyGILState_Ensure, "PyGILState_Ensure");
	strcpy_s(data.PyRun_SimpleString, "PyRun_SimpleString");

	data.Code = (char *)remoteCodeString;
	if (!WriteProcessMemory(hProcess, remoteData, (void*)&data, sizeof(data), NULL))
	{


	}
	if (!WriteProcessMemory(hProcess, remoteCode, (void*)ExecutePythonCode, cbCodeSize, NULL))
	{


	}
	HANDLE hRemoteThread = CreateRemoteThread(hProcess, NULL, 0, (LPTHREAD_START_ROUTINE)remoteCode, remoteData, 0, NULL);

	{


	}

	{


	}


	{


	}

	{


	}	








	return retCode;
}

int InjectPythonCodeToPID(DWORD pid, const char *code)
{
	char versions[][9] = { "Python36", "Python35", "Python34", "Python33", "Python32", "Python31", "Python30", "Python27", "Python26", "Python25", "Python24" };
	unsigned int numVersions = 11;
	unsigned int i;
	int retCode = 0;
	int ret;

	HANDLE hProcess = OpenProcess(PROCESS_ALL_ACCESS, false, pid);

	{


	}


	{


	}
#ifdef _WIN64

	{


	}
#else



	{
		retCode = 5;

	}
#endif
	for (i = 0; i < numVersions; ++i)
	{
		ret = InjectPythonCode(hProcess, code, versions[i]);

		{

		}

		{


		}
	}

	{


	}



	return retCode;
}

int main(int argc, char *argv[])
{

	{


	}
	DWORD pid = atoi(argv[1]);
	char* code = argv[2];
	int ret;


	{


	}
	ret = InjectPythonCodeToPID(pid, code);
	if (ret)
	{

		return 20 + ret;
	}
	printf("\nORBS:%d\n", ret);

}
