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

// 可选链
var purchase = Goods()
purchase.name = "Lamps"
// purchase.price?.USD = 10.50 // nil
purchase.price = Price()
purchase.price?.USD = 10.50
print("Product: \(purchase.name) $\(String(describing: purchase.price?.USD))")

