//
//  MainThreadDemoView.swift
//  iOSLearn
//
//  教程：https://www.bilibili.com/video/BV187E3zLEbi?p=45
//  主线程
//
//  Created by kempluo on 2025/6/13.
//

import SwiftUI

struct MainThreadDemoView: View {
    @State private var text: String = "Hello, world!"

    var body: some View {
        VStack {
            Text(text)
                .padding()
        }
        .onAppear {
            Task(priority: .background) {
                try? await Task.sleep(nanoseconds: 3 * 1_000_000_000)
                await loadImage(name: "Image1")
            }

            // 主线程的任务
            Task { @MainActor in
                text = "Goodbye"
            }
        }
    }

//    // @MainActor 标记方法在主线程执行
//    @MainActor private func loadImage(name: String) async {
//        text = name
//    }

    private func loadImage(name: String) async {
        // 通过 MainActor.run 执行要在主线程执行的逻辑
        await MainActor.run {
            text = name
        }
        print(name)
    }
}

#Preview {
    MainThreadDemoView()
}
