import UIKit

// 开闭区间
// ... 闭区间   ..< 左闭右开
var first: Int?
var last = 0
for value in 0 ... 10 {
    if first == nil {
        first = value
    }
    last = value
}

print("first:\(first!), last:\(last)")

first = nil
for value in 0 ..< 10 {
    if first == nil {
        first = value
    }
    last = value
}

print("first:\(first!), last:\(last)")

// 范围的属性方法
// lowerBound         范围的起始值
// upperBound         范围的结束值
// contains(Element)  是否在该范围内
// clamped(to: Range) 限制值在范围内
// reversed()         返回逆序的集合视图
let range = 1 ..< 5
print(range.lowerBound)
print(range.upperBound)

let numbers = 1 ..< 10
print(numbers.contains(3))

extension Comparable {
    func clamped(to range: ClosedRange<Self>) -> Self {
        return max(range.lowerBound, min(self, range.upperBound))
    }
}

let value = 10
let clampedValue = value.clamped(to: 1 ... 5)

let reversedNumbers = numbers.reversed()
print(Array(reversedNumbers))
