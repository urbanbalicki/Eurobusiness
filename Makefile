.PHONY: clean all

all: build/main build/main-ut

#exec
build/main: build/main.o build/Person.o build/Student.o build/Employee.o
	g++ -g -std=c++14 build/main.o \
	build/Person.o \
	build/Student.o \
	build/Employee.o \
	-o build/main                                                           

build/main-ut: build/test_main.o build/PersonTest.o build/Person.o build/StudentTest.o build/Student.o build/EmployeeTest.o build/Employee.o
	g++ -g -std=c++14 /usr/lib/libgtest.so /usr/lib/libgtest_main.so -pthread \
	build/test_main.o \
	build/PersonTest.o \
	build/Person.o \
	build/StudentTest.o \
	build/Student.o \
	build/EmployeeTest.o \
	build/Employee.o \
	-o build/main-ut											

#src
build/main.o: src/main.cpp
	g++ -g -c src/main.cpp -o build/main.o

build/Person.o: src/Person.cpp
	g++ -g -c src/Person.cpp -o build/Person.o

build/Student.o: src/Student.cpp
	g++ -g -c src/Student.cpp -o build/Student.o

build/Employee.o: src/Employee.cpp
	g++ -g -c src/Employee.cpp -o build/Employee.o

#gtest
build/test_main.o: tests/test_main.cpp
	g++ -g -c tests/test_main.cpp -o build/test_main.o 

build/PersonTest.o: tests/PersonTest.cpp
	g++ -g -c tests/PersonTest.cpp -o build/PersonTest.o 

build/StudentTest.o: tests/StudentTest.cpp
	g++ -g -c tests/StudentTest.cpp -o build/StudentTest.o 

build/EmployeeTest.o: tests/EmployeeTest.cpp
	g++ -g -c tests/EmployeeTest.cpp -o build/EmployeeTest.o 

#clean
clean:
	rm -f build/*.o build/main build/main-ut			