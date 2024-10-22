#include "math.hpp"
#include <iostream>

extern "C" {
Calculator* create_calculator() {
    std::cout << "Creating Calculator object...\n";
    return new Calculator();
}

void destroy_calculator(Calculator* calc) {
    std::cout << "Destroying Calculator object...\n";
    delete calc;
}

int calculator_add(Calculator* calc, int a, int b) {
    std::cout << "Adding numbers: " << a << " + " << b << "\n";
    return calc->add(a, b);
}
}
