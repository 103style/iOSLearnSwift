//
//  AsyncErrorInfoDemoView.swift
//  iOSLearn
//
// 教程： https://www.bilibili.com/video/BV187E3zLEbi?p=42
//
//  Created by kempluo on 2025/6/13.
//

import SwiftUI

private enum MyErrors: Error {
    case noData, noImage
}

struct AsyncErrorInfoDemoView: View {
    var body: some View {
        VStack {}
            .onAppear {
                Task(priority: .background) {
                    do {
                        let imageName = try await loadImage(name: "image1")
                        print(imageName)
                    } catch MyErrors.noData {
                        print("Error: no data")
                    } catch MyErrors.noImage {
                        print("Error: no image")
                    } catch { // 其他异常可以通过 error 读取
                        print("Error info: \(error)")
                    }
                }
            }
    }

    private func loadImage(name: String) async throws -> String {
        try? await Task.sleep(nanoseconds: 3 * 1_000_000_000)

        let error = true

        if error {
            throw MyErrors.noImage
        }
        return "Name:\(name)"
    }
}

#Preview {
    AsyncErrorInfoDemoView()
}
