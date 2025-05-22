import UIKit

// 单列
@MainActor // 只能在主线程访问
class Single {
    var name: String
    var age: Int

    // 提供单例对象
    static let shared = Single(name: "Single", age: 18)

    // 私有化初始化方法
    private init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

var single1 = Single.shared
var single2 = Single.shared
print("single1.name:\(single1.name), single2.name:\(single2.name)，single1==single1:\(single1 === single2) ")
