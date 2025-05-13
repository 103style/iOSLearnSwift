import UIKit

// switch
var age = 19
var msg = ""
switch age {
case 13 :
    msg = "HeiHei"
case 16 :
    msg = "HaHa"
case 19 :
    msg = "XiXi"
default :
    msg = "FuFi"
}


// 多个匹配想直接用 ，隔开
age = 5
msg = "you go to "
switch age {
case 2,3,4:
    msg += "Day Care"
case 5,6,7,8,9,10,11 :
    msg += "Elementray school"
case 18,19,20,21:
    msg += "College"
default :
    msg += "Work"
}


var ages = (10, 30)
msg = ""

switch ages {
case (10, 20):
    msg = "Too close"
case (10, 30):
    msg = "The right age"
case (10, 40):
    msg = "Too far"
default :
    msg = "Way too far"
}

// 不关心的值 可以用 _ 代替
switch ages {
case (_, 40):
    msg = "Too far"
case (10, _):
    msg = "The right age"
default :
    msg = "Way too far"
}

//
switch ages{
case let (x, y) where x > y :
    msg = "too young"
case let (x, y) where x == y :
    msg = "the same age"
case let (x, y) where x < y :
    msg = "too old"
default :
    msg = "not found"
}

// 变量直接等于表达式
age = 19
msg = switch age {
case 13 :
    "HeiHei"
case 16 :
    "HaHa"
case 19 :
    "XiXi"
default :
    "FuFi"
}

