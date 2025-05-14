import UIKit

var age = String(44)
var text = "Total digits \(age.count)"

// String(Value)
// isEmpty
// count
// first
// last
// lowercased()
// uppercased()
// hasPrefixed(String)
// hasSuffixed(String)
// contains(Character)

text = "Hello World"
text.isEmpty
text.first
text.last
text.lowercased()
text.uppercased()
text.hasPrefix("H")
text.hasSuffix("H")
text.contains("H")

// startIndex
// endIndex
// firstIndex(of: Character)
// lastIndex(of: Character)
// insert(Character, at:Index)
// insert(contentsOf:String, at:Index)
// remove(at:Index)
// prefix(through:Index)
// prefix(upTo:Index)
// replaceSubrange(Range, with:String)
// removeSubRange(Range)

var start = text.startIndex
var next = text.index(after: start) // start索引的下一个索引
var end = text.endIndex
// next = text.index(after: end) // error
text.firstIndex(of: "l")
text.lastIndex(of: "l")

var findIndex = text.firstIndex(of: " ")
if let end = findIndex {
    text.replaceSubrange(start ..< end, with: "GoodBye")
}

findIndex = text.firstIndex(of: " ")
if let start = findIndex {
    text.removeSubrange(start...) // 移除 findIndex及后面的字符
}

text.insert("!", at: text.endIndex)
text.insert(contentsOf: " Swift", at: text.index(text.endIndex, offsetBy: -1))
