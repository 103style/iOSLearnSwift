import Foundation
import UIKit

// 定时器

// 非重复定时器
var wait = 3.0
print("Wait \(wait) seconds")
Timer.scheduledTimer(withTimeInterval: wait, repeats: false) { _ in
    print("The time is up")
}

// 重复定时器

// ​​nonisolated​​：默认表示该属性/方法不参与 actor 的隔离检查（即可以在任意地方访问，但需保证线程安全）。
// ​​(unsafe)​​：显式声明该访问是​​不安全的​​，开发者需自行确保线程安全（编译器不再检查）。

// 这个变量可以跨 actor 直接访问，但你需要自己负责线程安全问题。
nonisolated(unsafe) var counter = 1

func startTimer() {
    Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { time in
        report(time)
    }
}

func report(_ timer: Timer) {
    print("counter:\(counter)")
    counter += 1
    if counter > 10 {
        print("Finished")
        timer.invalidate() // 停用
    }
}

startTimer()
