import UIKit

// keypath 键路径
struct Item {
    let name: String
    let price: Double
}

var purchase: Item = .init(name: "Lamps", price: 27.5)
let keyPrice = \Item.price // 常量， 只读键路径
print(purchase[keyPath: keyPrice])

// 键路径 变量类型
struct Goods {
    var name: String
    var price: Double
}

var paper: Goods = .init(name: "Paper", price: 860_000)
let paperPrice = \Goods.price
paper[keyPath: paperPrice] = 1.0
print(paper.price)

// 结构体的方法
struct Buy {
    var name = "NOT DEFINE"
    var price = 0.0

    func total(quantity: Double) -> Double {
        return quantity * price
    }

    mutating func changeName(value: String) {
        name = value
    }
}

var good = Buy(name: "Lamp", price: 10.5)

// 使用键路径修改价格
let goodPrice = \Buy.price
good[keyPath: goodPrice] = 13.14

var total = good.total(quantity: 3)

// 可变方法 用 mutation 关键字修饰函数
good.changeName(value: "CoCa-Cola")
var count = 4.0
var cost = good.total(quantity: count)
print("buy \(count) \(good.name) cost \(cost)")
