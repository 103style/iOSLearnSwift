import UIKit

// 异常处理

enum Errors: Error {
    case OutOfStock
}

struct Stock {
    var total = 5

    // 抛出异常
    mutating func sold(amount: Int) throws -> Int {
        if amount > total {
            throw Errors.OutOfStock
        } else {
            total -= amount
        }
        return total
    }

    // 以 Result结构返回错误信息
    mutating func sold2(amount: Int) -> Result<Int, Errors> {
        if amount > total {
            return .failure(.OutOfStock)
        } else {
            total -= amount
            return .success(total)
        }
    }
}

var stock = Stock()

// 捕获对应的异常
do {
    try stock.sold(amount: 8)
    // 不关心异常信息时
    // } catch Errors.OutOfStock {
    //    print("do not have enough lamps")
    // }

    // 需要查看具体的异常时
} catch {
    print(error) // 错误信息 可以读取变量 error
}

// ------

// 通过 try? 捕获错误,  有错误则会返回nil
var res = try? stock.sold(amount: 8)
print(res) // nil
res = try? stock.sold(amount: 2)
print(res) // 3

// -----

// 先检查 然后使用 try!
stock = Stock()
var sell = 3
if stock.total > sell {
    try! stock.sold(amount: sell)
}

print("Lamps in stock:\(stock.total)")

// ------

// 以 Result结构返回错误信息

// 1.switch case 方式
stock = Stock()
var result = stock.sold2(amount: 3)
switch result {
case .success(let stock):
    print("Lamps in stock:\(stock)")
case .failure(let error):
    if error == .OutOfStock {
        print("Error: Out of Stock")
    } else {
        print("Error")
    }
}

// 2. do catch 方式
stock = Stock()
result = stock.sold2(amount: 6)
do {
    let stock = try result.get()
    print("Lamps in stock:\(stock)")
} catch Errors.OutOfStock {
    print("Error: Out of Stock")
}
