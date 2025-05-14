import UIKit

// 类型强转
var num1: Int = 25
var num2: Double = 2.5

// var res = num1 / num2 // error
var res = Double(num1) / num2

// string 转换为 int,
var units = "45"
if let number = Int(units) {
    let total = number + 15
    print("THe total is \(total)")
}

// 单精度类型的属性和方法
// min                    最小值
// max                    最大值
// random(in: Range)      随机
// negate()               取反
// isMultiple(of: Int)    整除

print("Int8.min = \(Int8.min)")
print("Int8.max = \(Int8.max)")
var a: Int8 = 120
var b: Int8 = 10
print(Int.random(in: 1 ..< 100))
print("\(a).negate() = \(a.negate())")
print("\(a).isMultiple(\(b) = \(a.isMultiple(of: b))")

// ----------

// 多精度类型的属性和方法
// pi
// infinity                             无穷大 ∞
// minimum(Double, Double)
// maximum(Double, Double)
// random(in: Range)
// negate()
// squareRoot()                         平方根
// remainder(dividingby: Double)        取余
// rounded(FloationPointRoundingRule)   默认四舍五入
print("Double.pi = \(Double.pi)")
print("Double.infinity = \(Double.infinity)")
let pos = 1.0 / 0.0 // 正无穷
let neg = -1.0 / 0.0 // 负无穷

var x: Double = 1.11
var y: Double = 1.1
Double.minimum(x, y)
Double.maximum(x, y)

x.squareRoot()
x.remainder(dividingBy: y)
x.rounded()
x.rounded(FloatingPointRoundingRule.awayFromZero)
