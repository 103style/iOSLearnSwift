import UIKit

// 集合 set和字典

// count
// isEmpty
// contains(Element)
// contains(where:Closure)
// min()
// max()
// sorted()
// sorted(by:Closure)
// randomElement()
// shuffled()
// insert(Element)
// union(Collection)
// subtract(Collection)
// intersection(Collection)
// remove(Element)
// isSubset(of:Set)
// isSuperSet(of:Set)
// isDisjoint(with:Set)

// set
var ages: Set = [15, 15, 23, 45, 25]
print(ages) // [15, 25, 23, 45]

// 插入元素
if !ages.contains(66) {
    ages.insert(66)
}

print(ages) // [45, 25, 66, 15, 23]

// 移除元素
if let removed = ages.remove(66) {
    print("\(removed) was removed")
}

var sort = ages.sorted()
print(sort) // [15, 23, 25, 45]

// 并集和差集
var furits: Set = ["Apple", "Banana"]
var newSet = furits.union(["Grapes"]) // 合并
print(newSet) // ["Apple", "Banana", "Grapes"]

newSet.subtract(furits) // newSet 移除 furits 中的元素
print(newSet) // ["Grapes"]

// 比较集合， 子集 或者 超集 或者 获取共同元素
var store: Set = ["Banana", "Apple", "Orange", "Pear"]
var basket: Set = ["Apple", "Orange"]

if basket.isSubset(of: store) {
    print("basket is subset of store")
}

store.isSuperset(of: basket)

// ------------------

// 字典结构
// 其他特有方法
// updateValue(Value, forKey:Key)
// removeValue(forKey:Key)

// var list: [String: String] = ["first": "Apple", "second": "Orange"]
var list = ["first": "Apple", "second": "Orange"]
print(list)

// 读写
list["second"] = "Grapes"
print(list)

if let first = list["first"], let second = list["second"] {
    print("first:\(first), second:\(second)")
}

// 移除
list["first"] = nil
print(list)

list["first"] = "Orange"
list.removeValue(forKey: "second")
list.updateValue("Banana", forKey: "first")
print(list)

list["second"] = "Apple"
list["third"] = "Pear"

// 遍历读取
for (key, value) in list {
    print("key:\(key), value:\(value)")
}

// 值时数组时
var goods = ["A": ["Orange", "Banana", "Pear"], "B": ["Xiaomi", "Tesla"]]

if let a = goods["A"] {
    print(a)
    if a.count > 5 {
        let item = a[5]
        print(item)
    }
}

// 分组
var numbers: Set = [12, 13, 14, 15, 15, 16, 16, 17, 18, 21]
let group2 = Dictionary(grouping: numbers, by: {
    $0 % 2 == 0 ? "Y" : "N"
})
print(group2)

// 排序
print(list)
// $0 第一个键值对
// $0.0 第一个键值对的key
// $0.1 第一个键值对的value
var sortDict = list.sorted(by: {
    print("\($0) - \($0.0) - \($0.1) - \($1) - \($1.0) - \($1.1)")
    return $0.1 < $1.1
})
print(sortDict)


// 读取字典所有的 键 或者 值
print(list.keys)
print(list.values)
