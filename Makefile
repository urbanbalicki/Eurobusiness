.PHONY: clean all

all: build/main build/main-ut

#exec
build/main: build/main.o build/TestClass.o 
	g++ -g -std=c++14 build/main.o \
	build/TestClass.o \
	-o build/main                                                           

build/main-ut: build/test_main.o build/TestClassUnitTest.o 
	g++ -g -std=c++14 /usr/lib/libgtest.so /usr/lib/libgtest_main.so -pthread \
	build/test_main.o \
	build/TestClassUnitTest.o \
	build/TestClass.o \
	-o build/main-ut											

#src
build/main.o: src/main.cpp
	g++ -g -c src/main.cpp -o build/main.o

build/TestClass.o: src/TestClass.cpp
	g++ -g -c src/TestClass.cpp -o build/TestClass.o

#gtest
build/test_main.o: tests/test_main.cpp
	g++ -g -c tests/test_main.cpp -o build/test_main.o 

build/TestClassUnitTest.o: tests/TestClassUnitTest.cpp
	g++ -g -c tests/TestClassUnitTest.cpp -o build/TestClassUnitTest.o 

#clean
clean:
	rm -f build/*.o build/main build/main-ut			
