//
//  AsyncSequenceDemoView.swift
//  iOSLearn
//
//  教程：https://www.bilibili.com/video/BV187E3zLEbi?p=46
//
//  Created by kempluo on 2025/6/13.
//

import SwiftUI

struct AsyncSequenceDemoView: View {
    let list = ["image1", "image2", "image3"]

    var body: some View {
        VStack {
            Text("Hello async sequence")
                .padding()
        }
        .onAppear {
            Task(priority: .background) {
                let loader = ImageLoader(imageList: list)

                for try await image in loader {
                    print(image)
                }
            }
        }
    }
}

// 异步迭代器
private struct ImageIterator: AsyncIteratorProtocol {
    let imageList: [String]
    var cur = 0

    mutating func next() async throws -> String? {
        guard cur < imageList.count else {
            return nil
        }

        try? await Task.sleep(nanoseconds: 3 * 1_000_000_000)

        let image = imageList[cur]

        cur += 1
        return image
    }
}

private struct ImageLoader: AsyncSequence {
    typealias Element = String

    let imageList: [String]

    func makeAsyncIterator() -> ImageIterator {
        return AsyncIterator(imageList: imageList)
    }
}

#Preview {
    AsyncSequenceDemoView()
}
