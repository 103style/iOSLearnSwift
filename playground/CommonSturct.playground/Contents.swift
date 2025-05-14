import UIKit

// 通用结构体 泛型结构体
struct CommonStruct<T> {
    var vaule: T

    func des() {
        print("this value is: \(vaule)")
    }
}

let instance = CommonStruct<Int>(vaule: 10)
instance.des()

// 自动推断类型
let car = CommonStruct(vaule: "Xiaomi")
car.des()
