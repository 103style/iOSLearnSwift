import UIKit

// 不透明类型， 用 some 关键字

func reverseit(list: [Int]) -> ReversedCollection<[Int]> {
    let res = list.reversed()
    return res
}

let list = reverseit(list: [1, 2, 3, 4, 5, 6])
print(Array(list))

// ------

// 将上面的例子定义为不透明类型
func reverseit2(list: [String]) -> some Collection {
    let res = list.reversed()
    return res
}

let strings = reverseit2(list: ["A", "B", "C", "D"])
print(Array(strings))
