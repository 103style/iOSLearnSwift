//
//  AsyncTaskGroupDemoView.swift
//  iOSLearn
//
//  教程：https://www.bilibili.com/video/BV187E3zLEbi?p=47
//  异步任务组
//
//  Created by kempluo on 2025/6/13.
//

import SwiftUI

struct AsyncTaskGroupDemoView: View {
    var body: some View {
        VStack {
            Text("Async Task Group")
                .padding()
        }
        .onAppear {
            Task(priority: .background) {
                await withTaskGroup(of: String.self) { group in
                    group.addTask(priority: .background) {
                        let imageName = await self.loadImage(name: "image1")
                        return imageName
                    }
                    group.addTask(priority: .background) {
                        let imageName = await self.loadImage(name: "image2")
                        return imageName
                    }
                    group.addTask(priority: .background) {
                        let imageName = await self.loadImage(name: "image3")
                        return imageName
                    }

                    for await result in group {
                        print(result)
                    }
                }
            }
        }
    }

    private func loadImage(name: String) async -> String {
        try? await Task.sleep(nanoseconds: 3 * 1_000_000_000)
        return "Name: \(name)"
    }
}

#Preview {
    AsyncTaskGroupDemoView()
}
