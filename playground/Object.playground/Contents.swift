import UIKit

// 对象

// 类
class Employee {
    var name = "Undefine"
    var age = 0

    func changeInfo(newName: String, newAge: Int) {
        name = newName
        age = newAge
    }

    func description() {
        print("info name:\(name), age:\(age)")
    }
}

let employee = Employee()
employee.changeInfo(newName: "Martin", newAge: 32)
print("Name: \(employee.name)")

employee.description()

var e1 = Employee()
// Employee是结构体时， e1 和 e2 ​​是两个独立的对象​​（赋值时复制值）。
// Employee是类时， e1 和 e2 ​​指向同一个对象​​（赋值时传递的是引用，不是副本）
var e2 = e1
if e1 === e2 {
    print("e1 == e2")
} else {
    print("e1 != e2")
}

// 特殊关键字 self

class SelfDemo {
    var name = "Undefine"
    var age = 0

    func changeInfo(name: String, age: Int) {
        self.name = name
        self.age = age
    }

    func description() {
        print("info name:\(name), age:\(age)")
    }
}

var selfDemo = SelfDemo()
selfDemo.changeInfo(name: "HAHA", age: 18)
selfDemo.description()

// 元类型 使用 self 引用数据类型
let ref = Int.self
let number = ref.init(12)
print(number)

// ----------

// 继承
class Parent {
    var name = "Undefined"

    func des() -> String {
        return "name:\(name)"
    }
}

class Child: Parent {
    var department = "Undefined"

    override func des() -> String {
        var t = super.des()
        return "\(t), department:\(department)"
    }
}

var child = Child()
child.name = "GGG"
child.department = "Mail"
print(child.des())

// 类型转换
class Child2: Parent {
    var gender = "Undefined"

    override func des() -> String {
        "name:\(name), gender:\(gender)"
    }
}

// 子类也属于父类
var list: [Parent] = [Parent(), Child(), Child2()]

// is as 运算符

// is as!
// for obj in list {
//    if obj is Child { // 检查类型
//        let temp = obj as! Child // 强制转换
//        temp.department = "Mail"
//        temp.name = "HA"
//    } else if obj is Child2 {
//        let temp = obj as! Child2
//        temp.gender = "Male"
//        temp.name = "HE"
//    } else {
//        obj.name = "WHO"
//    }
//
//    print(obj.des())
// }

// as?
for obj in list {
    if let temp = obj as? Child { // 安全转换
        temp.department = "Mail"
        temp.name = "HA"
    } else if let temp = obj as? Child2 {
        temp.gender = "Male"
        temp.name = "HE"
    } else {
        obj.name = "WHO"
    }
    print(obj.des())
}

// Any:结构体  AnyObject：对象  AnyClass：类

var anyList: [AnyObject] = [Parent(), Child(), Child2()]
for obj in list {
    if let temp = obj as? Child {
        temp.department = "Mail"
    } else if let temp = obj as? Child2 {
        temp.gender = "Male"
    }
}

// 初始化 init方法

class Goods {
    var name: String
    var price: Int

    init(name: String, price: Int) {
        self.name = name
        self.price = price
    }

    // 便利初始化 关键字 convenience
    convenience init() {
        self.init(name: "Undefine", price: 0)
    }
}

var car = Goods(name: "Xiaomi", price: 299_999)
var t = Goods()

class XiaoMiCar: Goods {
    var type: String
    init(type: String) {
        self.type = type
        super.init(name: "Xiaomi", price: 299_999)
    }
}

var xiaomi = XiaoMiCar(type: "SU7 Max")

// 反初始化 deinit
class Test {
    // 被释放的时候会被调用
    deinit {
        print("deinit call")
    }
}

var test: Test? = Test()
test = nil

// 相关关键字
// mutating     是一个用于​​结构体（struct）和枚举（enum）​​方法的关键字，它允许在方法内部修改实例的存储属性
// override     重写
// lazy         使用时才初始化
// final        不可修改
// public       访问范围控制
// private      访问范围控制
// internal     访问范围控制
// open         访问范围控制
// fileprivate  访问范围控制

class LazyDemo {
    lazy var name: String = {
        print("name lazy init")
        return "Undefined"
    }()

    var type = 0
}

var lazyValue = LazyDemo()
// 此时才会初始化 name
lazyValue.name

class PrivateDemo {
    // 外部不可读不可写
    private var name = "Undefined"
    // 外部可读不可写
    public private(set) var age = 0

    func show() {
        print("name:\(name) age:\(age)")
    }
}

var privateDemo = PrivateDemo()
privateDemo.show()
// privateDemo.name // 不可访问
privateDemo.age
// privateDemo.age = 1 // error
