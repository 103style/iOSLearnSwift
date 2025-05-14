import UIKit

// 数组
var list: [Int] = [15, 25, 35]

// 使用类型接口声明数组
var arr = [12, 13, 14]

// 读写数组内的元素
print(arr[0])
arr[1] = 31
print(arr)

// 数组相加
var final = list + arr
print(final)
list += arr
print(list)

// 二维数组
var arr2D: [[Int]] = [[1, 2, 3], [11, 22, 33], [111, 222, 333]]
print(arr2D)
print(arr2D[1][0]) // 11
print(arr2D[0][1]) // 2

// 清空数组
final = []
print(final)

// for 读取数组
var total = 0
for value in list {
    total += value
}

print("arr total = \(total)")

// 数组常用的方法
// isEmpty
// first   首个值 可选值
// last    最后值 可选值

// 其他方法
// append(ELement)             结尾添加元素
// insert(ELement, at:Int)     指定位置插入元素
// remove(at:Int)              删除指定位置元素
// removeFirst()
// removeLast()
// removeAll(where:Closure)    删除满足条件的元素
// removeSubrange(Range)       删除指定区间的元素
// replaceSubrange(Range, with:Array)
// dropFirst(Int)
// dropLast(Int)
// enumerated()         索引+值的列表
// min()                最小值 可选值
// max()                最大值 可选值
// sorted()             重排序
// sorted(by: Clourse)  自定义排序
// randomElement()      随机获取一个元素，返回值时可选值
// shuffled()           改变数组顺序
// reversed()           倒序
// swapAt(Int, Int)
// joined(separator:String)
// filter(Closure)      过滤出满足条件的所有元素
// map(Closure)         改变每一个元素
// contactMap(Closure)
// reduce(Value, Closure)  将元素变成一个值的方法，“累加器”
// contains(where: Closure)

// 依次读取索引和对应的值
var msg = ""
for (index, value) in list.enumerated() {
    msg += "\(index + 1)-\(value) "
}

print(msg)

// 通过count判断下标是否越界
let index = 3
if index > 0, index < list.count {
    print("the \(index)th value is \(list[index])")
}

// 添加移除元素
var fruits = ["Banana", "Orange"]
if !fruits.isEmpty {
    fruits.append("Apple")
    fruits.removeFirst()
    fruits.insert("Pear", at: 1)
    fruits.insert(contentsOf: ["Cherry", "Peach"], at: 2)
}

print(fruits)

// 一次移除多个元素
fruits.removeAll(where: { value in
    value == "Orange"
})
print(fruits)

fruits.contains(where: { value in
    value == "Peach"
})

// 获取随机值
print("random element:\(fruits.randomElement()!)")

// 改变数组顺序
fruits = fruits.shuffled()
print(fruits)

// 获取一段元素
var rangeFruits = fruits[0 ..< 2]
print(rangeFruits)

// 将数组转为数组切片
var newFruits = Array(rangeFruits)
print(newFruits)

// 替换， 删除一段元素
fruits.replaceSubrange(0 ..< 2, with: ["Pineapple", "Grape"])
print(fruits)
fruits.removeSubrange(2...)
print(fruits)

// 初始化相同的值
var sameSize = fruits.count
var sameFruits = Array(repeating: "Pineapple", count: sameSize)
print(sameFruits)

// 过滤元素
var filterArr = ["Grape", "Banana", "Grape", "Apple"]
// 过滤出不是Grape的所有元素
var filterArrRes = filterArr.filter {
    $0 != "Grape"
}

print(filterArrRes)

// 数组的元素转换
var mapList = [2, 4, 6, 8, 10]
var mapHalf = mapList.map {
    "\($0 / 2)"
}

print(mapHalf)

var stringMap = mapList.map(String.init)
print(stringMap)

// 一次处理所有的元素
let reduceArr = [1, 4, 8, 16]
let reduceArrTotal = reduceArr.reduce(0) {
    $0 + $1
}

print("arr:\(reduceArr) total:\(reduceArrTotal)")

// 排序
let sortedArr = reduceArr.sorted()
print("sortedArr:\(sortedArr)") // 默认从小到大

let sortArr = reduceArr.sorted(by: {
    $0 > $1 // 从大到小排序
})
print("sortArr:\(sortArr)")

// 获取满足条件的第一个元素的 索引 或者 值
var ageArr = [32, 64, 45, 13]
let firstIndex = ageArr.firstIndex(where: { value in
    value > 35
})
let firstIndexValue = ageArr.first(where: { value in
    value > 35
})
print("firstIndex:\(firstIndex!), firstIndexValue:\(firstIndexValue!)")
