//
//  AsyncDemoView.swift
//  iOSLearn
//
//  教程： https://www.bilibili.com/video/BV187E3zLEbi?p=41
//
//  Created by kempluo on 2025/6/13.
//

import SwiftUI

struct AsyncDemoView: View {
    // 异步属性
    private var thumbnail: String {
        get async {
            try? await Task.sleep(nanoseconds: 1_000_000_000)
            return "my thumbnail"
        }
    }

    var body: some View {
        VStack {
            Text("Hello World!")
                .padding()
        }
//        .task(priority: .background) {
//            // await async 实现异步
//
//            // 三个任务需要9s执行完成
//            let imageName1 = await loadImage(name: "image1")
//            let imageName2 = await loadImage(name: "image2")
//            let imageName3 = await loadImage(name: "image3")
//            print("\(imageName1),\(imageName2) and \(imageName3)")
//        }
//        .onAppear {
//            // 手动取消示例
//            let task = Task(priority: .background) {
//                let imageName = await loadImage(name: "imageName")
//                print(imageName)
//            }
//            Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { _ in
//                print("time is up")
//                task.cancel()
//            }
//        }
        .onAppear {
            Task(priority: .background) {
                let imageName = await loadImage(name: "Image1")
                print(imageName)
            }

            Task(priority: .background) {
                let ans = await thumbnail
                print(ans)
            }
        }
    }

//    func loadImage(name: String) async -> String {
//        try? await Task.sleep(nanoseconds: 3 * 1_000_000_000)
//
//        if !Task.isCancelled {
//            return "Name:\(name)"
//        } else {
//            return "Task cancelled"
//        }
//    }

    private func loadImage(name: String) async -> String {
        // 读取异步任务返回值的示例
        let result = Task(priority: .background) { () -> String in
            let imageData = await getMetadata()
            return "Name: \(name), size:\(imageData)"
        }
        let msg = await result.value
        return msg
    }

    private func getMetadata() async -> Int {
        try? await Task.sleep(nanoseconds: 3 * 1_000_000_000)
        return 1024
    }
}

#Preview {
    AsyncDemoView()
}
