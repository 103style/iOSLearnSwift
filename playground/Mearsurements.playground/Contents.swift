import Foundation
import UIKit

// 计量单位 转换

var length = Measurement(value: 55, unit: UnitLength.centimeters) // 55cm
var weight = Measurement(value: 5, unit: UnitMass.pounds) // 5磅

// 长度相加
var len1 = Measurement(value: 10, unit: UnitLength.centimeters)
var len2 = Measurement(value: 30, unit: UnitLength.centimeters)
var len3 = Measurement(value: 5, unit: UnitLength.kilometers)
var len5 = Measurement(value: 25, unit: UnitLength.meters)

print(len1 + len2) // 40cm
print(len1 + len3) // 5000.1m // 统一换算成m
print(len3 + len5) // 5025.0m // 统一换算成m

// 单位转换
var km = (len3 + len5).converted(to: UnitLength.kilometers)
print("\(len3 + len5) is \(km)")

// 格式化值来表示距离
var len = Measurement(value: 40, unit: UnitLength.kilometers)
var text = len.formatted(.measurement(width: .wide, usage: .asProvided))
print("text:\(text)")

len = Measurement(value: 40, unit: UnitLength.miles)
// 这里英里会转换为当地的计量单位（km）
text = len.formatted(.measurement(width: .wide, usage: .road).locale(Locale.current))
print("text:\(text)")

// 保留2位小数点
text = len.formatted(.measurement(width: .wide, usage: .road, numberFormatStyle: .number.precision(.fractionLength(2))))
print("text:\(text)")

// 展示为一个特定地区的格式
len = Measurement(value: 30, unit: UnitLength.miles)
var local = Locale(identifier: "zh_CN")
let format = Measurement<UnitLength>.FormatStyle(width: .wide, locale: local, usage: .asProvided)
text = len.formatted(format) // 30英里
print("text:\(text)")
