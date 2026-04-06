CXX = g++
CXXFLAGS = -Wall

build:
	$(CXX) $(CXXFLAGS) src/main.cpp -o build/app

test:
	$(CXX) $(CXXFLAGS) src/main.cpp tests/test.cpp -o build/test
	./build/test

clean:
	rm -rf build/*
