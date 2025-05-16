import Foundation
import UIKit

var text = NSString(string: "Hello")
print(text)

// String 可以直接转换为 NSString

var nsText = text as NSString
print(nsText)

// 占位符
// %d 整数   %.5d 表示字符串的数字有5位  18 -> 00018
// %f 浮点数  %.2f 表示只保留两位小数
// %g 移除多余的0
// %@ 对象或结构体
var age = 18
text = NSString.localizedStringWithFormat("she is %.5d years old", age)
print(text)

// compare 比较结果 会有三个枚举类型 相同、升序、降序
var a = "A"
var b = "B"
var result = a.compare(b)
// 不区分大小写
// var result = a.compare(b, options: .caseInsensitive)
// 比较对应区间的字符
// var result = a.compare(b, options: .caseInsensitive, range: a.startIndex ..< a.endIndex)
switch result {
case .orderedSame:
    print("same")
case .orderedAscending:
    print("\(a) follows \(b)")
case .orderedDescending:
    print("\(a) precedes \(b)")
}

// --------

// 在 字符串A 中找到 目标字符串B, 然后替换成字符串C
var textA = "this is a Swift NSString demo"
var textB = " demo   "
var textC = "code exercise"
// 去除前后空白
textB = textB.trimmingCharacters(in: .whitespacesAndNewlines)
// 找到范围
var range = textA.range(of: textB, options: .caseInsensitive)
print("range:\(range)")
if let r = range {
    textA.replaceSubrange(r, with: textC)
}

print(textA)

// ---------------

// 按指定字符分割成数组

let elements = textA.components(separatedBy: " ")
print("fist:\(elements.first), last:\(elements.last)")
