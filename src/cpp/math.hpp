// mycpp.hpp
#ifndef MATH_HPP
#define MATH_HPP

// 定义一个简单的 C++ 类
class Calculator {
public:
    Calculator();  // 构造函数
    int add(int a, int b);  // 加法
};

extern "C" {
// 包装类的构造函数、析构函数和成员函数，使其可以通过 C 接口调用

// 创建 Calculator 对象的包装函数
Calculator* create_calculator();

// 销毁 Calculator 对象的包装函数
void destroy_calculator(Calculator* calc);

// 包装 Calculator 类的加法操作
int calculator_add(Calculator* calc, int a, int b);
}

#endif // MATH_HPP
