import Foundation
import UIKit

// 正则表达式

// \s 匹配任意空白字符
// \t 只匹配tab
// \d 数字

// /Message/ : 匹配带Message的字符串

// /Name:/s+[a-zA-Z]+/ : 匹配  固定字符Name + 一个或多个空白字符  + 一个或多个 大小写字母

var msg = "Name: Jerry"
let regex = /Name:\s+[a-zA-z]+/

if let mactch = msg.firstMatch(of: regex) {
    let find = mactch.output
    print("find \(find)") // find Name: Jerry
}

// ()包起来的内容可以通过output对应的索引读取
//    (\s+)    : mactch.output.1
// ([a-zA-z]+) : mactch.output.2
let regex2 = /Name:(\s+)([a-zA-z]+)/
if let mactch = msg.firstMatch(of: regex2) {
    let find0 = mactch.output.0
    let find1 = mactch.output.1
    let find2 = mactch.output.2
    print("find0：\(find0), find1：\(find1), find2：\(find2)") // find0：Name: Jerry, find1： , find2：Jerry
}

var text = "Hello, I am a Android Developer, I am learning Swift UI now."
let regex3 = /I\s[a-zA-Z]+\s/
let matchs = text.matches(of: regex3)
if !matchs.isEmpty {
    let finds = matchs.map { value in
        value.output
    }
    let list = finds.joined(separator: ", ")
    print("finds are \(list)") // finds are I am , I am
}
