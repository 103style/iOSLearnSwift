import UIKit

// 函数
func funcDemo() {
    let res = 5 * 2
}

funcDemo()

// 带参数的函数
func sum(x: Int, y: Int) {
    let res = x * y
}

sum(x: 5, y: 4)

// 带返回值函数
func add(x: Int, y: Int) -> Int {
    return x * y
}

let addSum = add(x: 5, y: 6)

// 返回一个元组
func countLetter(word: String) -> (String, Int) {
    var res = ""
    var count = 0
    for letter in word {
        res += "\(letter) "
        count += 1
    }
    return (res, count)
}

var (res, count) = countLetter(word: "Hello")
var msg = "\(res) have \(count) letter"

// gurad 指令
func doubleValue(value: Int) -> Int {
    guard value < 10 else {
        return value
    }
    return value * 2
}

var a = 5
var result = doubleValue(value: a)
msg = "doubleValue(\(a))'s result is \(result)"

// &修饰的参数告诉系统该值会被修改， 接收值的函数参数需要 添加 inout关键字
func first() {
    var number = 25
    second(value: &number)
    print("The result is \(number)")
}

func second(value: inout Int) {
    value = value * 2
}

first()

// 声明参数标签
func mulitValue(years number: Int) -> Int {
    number * 2
}

result = mulitValue(years: 8)
msg = "the result is \(result)"

// 不关注参数标签的话 可以用_代替
func mulitValue2(number1 x: Int, _ y: Int) -> Int {
    x * y
}

result = mulitValue2(number1: 5, 6)
msg = "the result is \(result)"

// 函数参数带默认值的示例
func sayHello(name: String = "Default") -> String {
    return "your name is \(name)"
}

sayHello()

// 参数类型不同则为不同的函数
func des(number: Int) -> String {
    return "The price is \(number)"
}

func des(name: String) -> String {
    return "The name is \(name)"
}

des(number: 100)
des(name: "Bilibili")

// 定义泛型函数
func des1<T>(value: T) -> String {
    return "The des is \(value)"
}

des1(value: "TT")
des1(value: 200)

// 标准函数
print("......")
abs(-1)
max(11, -1, 213)
min(11, -1, 213)

// fatalError("")
// precondition(false)

let text = repeatElement("Hello", count: 5)

// [from, to)
let numbers = stride(from: 0, through: 10, by: 2) // 0, 2, 4, 6, 8
// [from, through]
// let numbers = stride(from: 0, through: 10, by: 2) //0, 2, 4, 6, 8, 10

let sequence = zip(text, numbers)
for (t, number) in sequence {
    print("\(t) - \(number)")
}
