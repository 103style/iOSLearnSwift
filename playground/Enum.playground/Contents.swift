import UIKit

// 枚举

// 定义
enum Number {
//    case one
//    case two
//    case three

    case one, two, three // 默认从0开始
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

// 自定义枚举的值
enum Type: String {
    case one = "TypeOne"
    case two = "TypeTwo"
    case three = "TypeThree"

    func getMsg() -> String {
        switch self { // self代表当前值
        case .one:
            return "ONE"
        case .two:
            return "TWO"
        case .three:
            return "THREE"
        }
    }
}

var myType = Type.one
print("rawValue = \(myType.rawValue)") // TypeOne

var testType = Type(rawValue: "TypeOne")
if testType == Type.one {
    print("correct value")
}

print(myType.getMsg())

// ---------

enum MyCharacters {
    case number(Int, String)
    case letter(Character, String)
}

var character = MyCharacters.number(1, "Number One")

switch character {
case .number(let value, let des):
    print("value:\(value), des:\(des)") // value:1, des:Number One
case .letter(let value, let des):
    print("value:\(value), des:\(des)")
}

// if中读取关联值
if case .number(let number, let des) = character {
    print("number:\(number)")
    print("des:\(des)")
}
