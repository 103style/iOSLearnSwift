//
//  AsyncDataDemoView.swift
//  iOSLearn
//
//  教程：https://www.bilibili.com/video/BV187E3zLEbi?p=44
//  异步编程的数据同步
//
//  Created by kempluo on 2025/6/13.
//

import SwiftUI

// 将全局变量设置为不完全的示例
nonisolated(unsafe) var unsafeValue = NSString(string: "Hello!")

// actor 可以将并行任务相互隔离
// actor 是Swift中的一种引用类型，用于保护其可变状态免受数据竞争的影响。
// actor内部的状态（变量）默认是隔离的，只能通过异步访问或在其内部的方法中同步访问。
private actor ItemData {
    var counter: Int = 0

    let maximum: Int = 50

    // 从actor外部调用这个方法时，必须使用await，因为它可能会被挂起
    func incrementCount() -> String {
        counter += 1
        return "Value:\(counter)"
    }

    // nonisolated 关键字表示这个方法不隔离于actor的状态。
    // 它不能访问actor的可变状态（比如counter），只能访问不可变的状态（常量）。
    // 由于这个方法不需要访问actor的可变状态，也不会阻塞actor的执行，因此从外部调用时不需要使用await
    nonisolated func maximumValue() -> String {
        return "Maximum Value is :\(maximum)"
    }
}

struct AsyncDataSyncDemoView: View {
    private var itemData: ItemData = .init()

    var body: some View {
        Button("Start Process") {
            let value = itemData.maximumValue()
            print("maximum value is \(value)")

            Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
                Task(priority: .background) {
                    async let operation = itemData.incrementCount()
                    print(await operation)
                }
            }

            Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true) { _ in
                Task(priority: .high) {
                    async let operation = itemData.incrementCount()
                    print(await operation)
                }
            }
        }
    }
}

#Preview {
    AsyncDataSyncDemoView()
}
