import UIKit

// 枚举

// 定义
enum Number {
//    case one
//    case two
//    case three

    case one, two, three
}

var myNumber = Number.one
myNumber = .two

// switch 和 枚举
switch myNumber {
case .one:
    print("one")
case .two:
    print("two")
case .three:
    print("three")
}
