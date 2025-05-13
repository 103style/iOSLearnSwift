import UIKit

var letter: Character = "😃"

var text: String = "😍😘"

var heelo: String = "My name is "
heelo = heelo + "kemp"
heelo += "luo"

// 通过 \(var) 插入其他变量或常量
let age = 18
let ageInfo = "I am \(age) years old."
let ageInfo1 = "I am \(age + 10) years old."

// 添加特殊字符
// 1.通过对双引号加反斜杠
// 2.整个字符串首位添加 #
let text1 = "This is \"my\" age"
let text2 = #"this is "my" age"#

// 多行文本
let twoLines = "This is the first line\nThis is the second line."

let multiLines = """
This is the first line
This is the second line
This is the third line
"""

// Boolean
var valid = true

// 可选值， 可以为空, 使用可选值 需要在后面添加！来解包
var number: Int? = 6
number = nil

var number1: Int?
number1 = 6
// var total = 4 + number1  // compile error
var total = 4 + number1!

var number2: Int?
number2 = 5
var tota2 = number2

var number3: Int!
number3 = 6
var total3 = number3 * 10

// 元组 tuple
var myName: (String, String) = ("Hi", "haha")
var myBrosName = ("HeiHei", "HeHe", "XiXi", 24)
var myTupleText = "\(myBrosName.0) is \(myBrosName.3) years old"

var myBrosName2 = (name: "HeiHei", surname: "HeHe", age: 24)
var showBrosText = "\(myBrosName2.name) is \(myBrosName2.age) years old"
myBrosName2.surname

// 忽略元组中的值
var myBrosName3 = ("HeiHei", "HeHe", "XiXi", 24)
var (name1, _, _, age1) = myBrosName3
var showBrosText2: String = "\(name1) is \(age1) years old"
