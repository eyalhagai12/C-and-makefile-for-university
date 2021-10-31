#include <stdio.h>

int factor(int num)
{
	if (num == 0)
	{
		return 1;
	}

	return factor(num - 1) * num;
}