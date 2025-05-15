import UIKit

// 协议

//   特性            Swift 的 protocol                        Java 的 interface
// 属性要求​​    可以定义属性（var/let），指定读写权限     只能定义常量（public static final），方法默认 public abstract
// ​​默认实现​​       支持通过 extension 提供默认实现              Java 8+ 支持 default 方法实现
//  多继承​​         一个类型可遵循多个 protocol              类只能单继承，但可实现多个 interface
// ​​关联类型​​           支持（associatedtype）                  通过泛型模拟（如 Comparable<T>）
// ​​值类型支持​​    结构体（struct）、枚举（enum）均可遵循             仅类（class）可实现接口
// ​​可选方法​​    通过 @objc 和 optional 标记（仅限于类）         Java 8+ 可用 default 方法变相实现

protocol Printer {
    // { get set } 表示属性必须​​可读可写
    // { get }     表示只读
    var name: String { get set }

    func printDes()
}

// 结构体
struct Employees: Printer {
    var name: String
    var age: Int

    func printDes() {
        print("Employees name:\(name), age:\(age)")
    }
}

let e = Employees(name: "John", age: 18)
e.printDes()

// 对象
class Offices: Printer {
    var name: String
    var age: Int

    init() {
        self.name = "Jack"
        self.age = 30
    }

    func printDes() {
        print("Offices name:\(name), age:\(age)")
    }
}

let office = Offices()
// 协议作为类型
var list: [Printer] = [e, office]
for e in list {
    e.printDes()
}

// 协议作为参数 或者 返回值
func test() -> Printer {
    return Employees(name: "GG", age: 24)
}

test().printDes()

// --------------

// 通用协议
protocol Good {
    // 通过 associatedtype 定义通用协议
    associatedtype protype
    var value: protype { get set }
}

struct XiaoMiSu7: Good {
    var value: String
}

class NumberProtocol: Good {
    var value: Int = 0
}

let su7 = XiaoMiSu7(value: "su7 Max")
let number = NumberProtocol()
number.value = 12

// ----

// 让编译器创建协议方法以供使用
// Equatable
// Comparable
// Hashable
// Numeric
// CaseIterable

// 自定义 == 方法实现
struct Food: Equatable, Hashable {
    var name: String
    var price: Double

    // 默认==会比较 name和 price， 如果只需要比较 name，则需要自己实现==方法
    static func == (value1: Food, value2: Food) -> Bool {
        return value1.name == value2.name
    }

    // 自定义实现 比较函数
    static func < (v1: Food, v2: Food) -> Bool {
        return v1.price < v2.price
    }

    static func > (v1: Food, v2: Food) -> Bool {
        return v1.price > v2.price
    }

    static func <= (v1: Food, v2: Food) -> Bool {
        return v1.price <= v2.price
    }

    static func >= (v1: Food, v2: Food) -> Bool {
        return v1.price >= v2.price
    }

    // 自定义hash值
    func hash(into hasher: inout Hasher) {
        hasher.combine(price)
    }
}

var rice = Food(name: "Rice", price: 2.0)
var danchaofan = Food(name: "Rice", price: 10)
print(rice == danchaofan)
print(rice <= danchaofan)
print(rice > danchaofan)
print(rice.hashValue)
print(danchaofan.hashValue)

// ---

// 类型约束
func compareValues<T: Equatable>(v1: T, v2: T) -> String {
    let msg = v1 == v2 ? "equal" : "diff"
    return msg
}

let result = compareValues(v1: rice, v2: danchaofan)
print("result:\(result)")

func sumNumeric<T: Numeric>(a: T, b: T) -> any Numeric {
    return a + b
}

let sum = sumNumeric(a: 10, b: 11.0)

// ----
