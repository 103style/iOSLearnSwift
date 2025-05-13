import UIKit

// while
var size = 0
while size < 5 {
    size += 1
}


// 类似 do while, 不管条件是否满足都会执行一次
size = 10
repeat {
    size += 1
} while size < 5



// for in
var text = "Hello"
var msg = ""
for letter in text {
    msg += msg != "" ? "_" : ""
    msg += "\(letter)"
}

var count = 0
for _ in text {
    count += 1
}
msg = "\(text) contains \(count) letters"

count = 0
for letter in text where letter != "l" {
    count += 1
}
msg = "\(text) contains \(count) letters excpet letter l"
