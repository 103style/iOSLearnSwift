//
//  AsyncConcurrentDemoView.swift
//  iOSLearn
//
//  教程： https://www.bilibili.com/video/BV187E3zLEbi?p=43
//
//  async let 关键字
//
//  Created by kempluo on 2025/6/13.
//

import SwiftUI

struct AsyncConcurrentDemoView: View {
    var body: some View {
        VStack {
            Text("HaHa")
        }.onAppear {
            let curTime = Date()

            Task(priority: .background) {
                // async let 并发执行
                async let image1 = loadImage(name: "image1")
                async let image2 = loadImage(name: "image2")
                async let image3 = loadImage(name: "image3")

                let listName = await "\(image1). \(image2) and \(image3)"
                print(listName)

                print("Total Time: \(Date().timeIntervalSince(curTime))")
            }
        }
    }

    private func loadImage(name: String) async -> String {
        try? await Task.sleep(nanoseconds: 3 * 1_000_000_000)
        return "Name:\(name)"
    }
}

#Preview {
    AsyncConcurrentDemoView()
}
