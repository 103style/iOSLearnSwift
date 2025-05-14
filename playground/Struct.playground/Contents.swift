import UIKit

// 结构体
struct Item {
    var name: String = "NOT DEFINE"
    var price: Double = 0
}

// 声明并修改属性
var paper = Item()
paper.name = "Paper"
paper.price = 860_000

print("Product: \(paper.name) $\(paper.price)")

struct Price {
    var USD = 0.0
    var CAD = 0.0
}

struct Goods {
    var name: String = "NOT DEFINE"
    var price: Price?
}

// --------------

// 可选链
var purchase = Goods()
purchase.name = "Lamps"
// purchase.price?.USD = 10.50 // nil
purchase.price = Price()
purchase.price?.USD = 10.50
print("Product: \(purchase.name) $\(String(describing: purchase.price?.USD))")

// --------------

// 初始化
struct Food {
    var name = "NOT DEFINE"
    var price = 0.0
}

// 初始化属性
var cocacola = Food(name: "Coca-Cola", price: 9.9)
print("Food \(cocacola.name) $\(cocacola.price)")

// 通过init方法初始化属性  init方法在实例创建的时候就会调用
struct Car {
    var name: String
    var price: Double

    init() {
        name = "XiaoMi"
        price = 299_999
    }

    init(initName: String, initPrice: Double) {
        name = initName
        price = initPrice
    }

    // init 方法只要参数名不同，就是不同的方法
    init(xiaomi: Double) {
        name = "XiaoMi"
        price = xiaomi
    }

    init(tesla: Double) {
        name = "Tesla"
        price = tesla
    }
}

var xiaomi = Car()
print("Car \(xiaomi.name) ¥\(xiaomi.price)")

var tesla = Car(initName: "Tesla", initPrice: 219_999)
print("Car \(tesla.name) ¥\(tesla.price)")

var xiaomi2 = Car(xiaomi: 299_999)
var tesla2 = Car(tesla: 219_999)

print("Car \(xiaomi2.name) ¥\(xiaomi2.price), \(tesla2.name) ¥\(tesla2.price)")

// ----------------

// 计算属性
struct Book {
    var price: Double
    var count: Double

//    var cost: Double {
//        get {
//            return price * count
//        }
//    }
    // 可简写为
//    var cost: Double {
//        return price * count
//    }

    var cost: Double {
        get {
            price * count
        }
//        set {
//            price = newValue
//        }
        set(newPrice) {
            price = newPrice
        }
    }
}

var android = Book(price: 33.33, count: 2)
print("Book android cost $\(android.cost)")

android.price = 34.12
android.count = 1
print("Book android cost $\(android.cost)")

android.cost = 52.0
print("Book android cost $\(android.cost)")

// ----------------------

// 属性观察器  每次为属性赋值时willSet、didSet方法都会执行
struct Computer {
    var increment: Double = 0
    var oldPrice: Double = 0

    var price: Double {
        willSet {
            increment = newValue - price
        }
        didSet {
            oldPrice = oldValue
        }
    }
}

var macmini = Computer(price: 15_999)
macmini.price = 13_444
print("New price: \(macmini.price)")
print("Old price: \(macmini.oldPrice)")
print("increment: \(macmini.increment)")

// ----------

// 类型属性及方法 static 关键字， 只能从定义本身访问
struct Phone {
    var name: String
    var price: Double

    static let type = "Phone"

    static func reserverd() -> Phone {
        return Phone(name: "IPhone", price: 6_999)
    }
}

print(Phone.type)

var iphone = Phone.reserverd()
print("the phone is \(iphone.name) ¥\(iphone.price)")
