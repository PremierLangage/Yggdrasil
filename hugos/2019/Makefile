CXXFLAGS=-Wall -std=c++11
SRC_FILES= $(wildcard *.cpp)
EXEC_FILES = $(SRC_FILES:.cpp=)

all: $(EXEC_FILES)

test: $(EXEC_FILES)
	for f in $(EXEC_FILES);	do \
	    echo '0\n1\n2\n' | ./$$f; \
	    echo; \
	done

clean:
	rm -rf $(EXEC_FILES)
