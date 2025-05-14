import UIKit

// 闭包 内部需要使用关键字in
// 闭包的参数名称不会转换为参数标签
// 即调用时不需要写成 multi(number:10, times: 5) 而是直接写成multi(10, 5))
let multi = { (number: Int, times: Int) -> Int in
    let total = number * times
    return total
}

print("The result is \(multi(10, 5))")

// 使用闭包初始化值
let value = { () -> Int in
    var total = 0
    let list = stride(from: 1, through: 9, by: 1)
    for i in list {
        total += i
    }
    return total
}() // 注意{..} 是一个函数，即闭包本身， {..}()才是闭包的返回值

print("the value is \(value)")

// 无参闭包可以省略为
let total: Int = {
    var total = 0
    let list = stride(from: 1, through: 9, by: 1)
    for i in list {
        total += i
    }
    return total
}()

print("the total is \(total)")

// 闭包作为参数的示例
let a = { (number: Int, times: Int) -> Int in
    return number * times
}

func processClosure(closure: (Int, Int) -> Int) {
    let value = closure(5, 6)
    print("the value is \(value)")
}

processClosure(closure: a)

// 直接将闭包填入函数参数
func processClosure2(closure: (Int, Int) -> Int) {
    print("the value is \(closure(5, 6))")
}

processClosure2(closure: { (number: Int, times: Int) -> Int in
    number * times
})

// 当函数的最后一个参数时闭包时，可以使用尾随闭包模式
processClosure2 { (number: Int, times: Int) -> Int in
    number * times
}

// 推断闭包数据类型, 第一个参数为 $0, 第二个为$1, 第n个为$(n-1)
processClosure2 { $0 * $1 }
