import UIKit

// 委托

// 通过协议来实现委托 可以避免委托者只能是单一对象
protocol FoodProtocol {
    func des() -> String
}

struct Rice: FoodProtocol {
    func des() -> String {
        "danchaofan"
    }
}

struct Eatter {
    var delegate: FoodProtocol

    func show() -> String {
        delegate.des()
    }
}

var rice = Rice()
var eatter = Eatter(delegate: rice)
print(eatter.show())
