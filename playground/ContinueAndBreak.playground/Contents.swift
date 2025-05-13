import UIKit


var text = "Hello"
var count = 0

// continue
for letter in text {
    if letter == "l" {
        continue
    }
    count += 1
}
var msg = "\(text) contains \(count) letters except letter l"


// break
count = 0
for letter in text {
    if letter == "l" {
        break
    }
    count += 1
}
msg = "\(text) has \(count) letters before letter l"


var age = 19
var res: String?
switch age {
case 13:
    res = "HaHa"
case 16:
    res = "HeiHei"
default:
    break
}

var size = 0
for letter in text {
//    if letter == "l" {
//        break
//    }
    // 同上面的if
    guard letter != "l" else {
        break
    }
    size += 1
}

