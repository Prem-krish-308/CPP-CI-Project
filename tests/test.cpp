#include <cassert>

int add(int, int);

int main() {
    assert(add(2, 3) == 5);
    assert(add(0, 0) == 0);
    return 0;
}
