//
//  ProgressDemoView.swift
//  iOSLearn
//
//  https://developer.apple.com/documentation/swiftui/progressview
//  自身不可修改进度的进度条
//  可以通过 .progressViewStyle(.circular) 设置为loading状态
//
//  Created by kempluo on 2025/5/22.
//

import SwiftUI

struct ProgressViewDemoView: View {
    @State private var curValue: Float = 5

    var body: some View {
        VStack {
            // 只是显示进度， 不能操作
            ProgressView(value: curValue, total: 10)

            Slider(value: $curValue, in: 0 ... 10, step: 1.0)

            // loading 状态
            ProgressView().progressViewStyle(.circular)
        }
    }
}

#Preview {
    ProgressViewDemoView()
}
