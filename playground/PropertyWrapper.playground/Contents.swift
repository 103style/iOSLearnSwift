import UIKit

// 属性包装器

// 实现一个包装属性 来控制传入数值是否超出范围
@propertyWrapper
struct RangeValue {
    var vaule: Int = 0
    var min: Int = 0
    var max: Int = 255

    var wrappedValue: Int {
        get {
            vaule
        }
        set {
            if newValue < min {
                vaule = min
            } else if newValue > max {
                vaule = max
            } else {
                vaule = newValue
            }
        }
    }

    init(min: Int, max: Int) {
        self.min = min
        self.max = max
    }
}

var range = RangeValue(min: 0, max: 255)
print(range.wrappedValue)
range.wrappedValue = 123
print(range.wrappedValue)
range.wrappedValue = -123
print(range.wrappedValue)
range.wrappedValue = 23
print(range.wrappedValue)
