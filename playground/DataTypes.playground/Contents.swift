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
