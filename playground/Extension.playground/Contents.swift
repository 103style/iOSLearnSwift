import UIKit

// 拓展   适用于 struct class  enum

// 协议
protocol Good {
    var name: String { get set }
    var price: Double { get set }
}

// 拓展good 新增des方法
extension Good {
    func des() -> String {
        "name:\(name), price:\(price)"
    }
}

struct Xiaomi: Good {
    var name: String
    var price: Double
    init() {
        name = "xiaomi su7 max"
        price = 299_999
    }
}

var su7max = Xiaomi()
print(su7max.des())

// -------

// 拓展系统数据类型
extension Int {
    func des() {
        print("the value is \(self)")
    }
}

var number: Int = 11
number.des()

// ---------

// 针对通用结构的某一类型添加拓展
struct Price<T> {
    var value: T
}

extension Price where T == Int {
    func doubleValue() -> Int {
        return value * 2
    }
}

var price = Price(value: 15)
print(price.doubleValue())

// ---------

// 自定义字符串插值
extension String.StringInterpolation {
    mutating func appendInterpolation(celsius value: Double) {
        let fahrenheit = ((value * 9) / 5) + 32
        appendLiteral(String(fahrenheit))
    }
}

print("Temperature in Fahrenheit \(celsius: 25)")
