#include <iostream>

void test() {
	double A[100] = {1.1, 2.0, 3.3, 4.0, 5.5, 6.0, 7.7, 8.0, 9.9, 10.0};
	double B[100] = {1.0, 3.2, 5.0, 7.4, 9.0, 11.6, 13.0, 15.8, 17.0, 19.0};

	for (int i = 0; i < 100; i++) {
//		A[i] += B[i];
		if (A[i] != B[i])
      break;
	}

	for (int i = 0; i < 100; i++) {
		std::cout<<A[i]<<" ";
	}

	std::cout<<std::endl;
}

int main() {
	test();
	return 0;
}
