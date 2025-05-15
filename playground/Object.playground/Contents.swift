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
