import UIKit

// 条件语句 if
var age = 15
var msg = "John is old"

if age <= 18 {
    msg = "John is young"
}

// ! 取反
var underAge = false
msg = ""
if !underAge {
    msg = "underAge is true"
}

// && 与  || 或
var smart = true
var age1 = 19
var msg1 = "John is underage or dumb"

if (age1 < 21) && smart {
    msg1 = "John is underAge and smart"
}
if (age1 < 21) || smart {
    msg1 = "John is underage or smart"
}


// 可选值
var count = 0
var myOptional: Int? = 5
if myOptional != nil {
    let value = myOptional!
    count += value
}

// 可选绑定
count = 1
if let value = myOptional {
    count += value
}

// if中声明的常量myOptional 仅在if内生效
if let myOptional = myOptional {
    count += myOptional
}

// 可简写为如下代码
if let myOptional {
    count += myOptional
}

count = 0
myOptional = 5
// 相当于 myOptional != nil && myOptional == 5
if let myOptional, myOptional == 5 {
    count += myOptional
}

// if else
count = 6
if count % 2 == 0 {
    count += 2
} else {
    count += 1
}

// if -> else if -> else
age = 21
msg = "the use is "
if age < 21 {
    msg += "under age"
} else if age > 21 {
    msg += "allowd"
} else {
    msg += "21 years old"
}

// 三元运算符
age = 19
msg = age < 18 ? "Underage" : "Allowed"

// 可选值的三元运算符
var a: Int? = 5
var b = a != nil ? a!: 0
// 可简写为
var c: Int?
b = c ?? 0
