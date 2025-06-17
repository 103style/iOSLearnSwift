//
//  StrokeStyleDemoView.swift
//  iOSLearn
//
//  Created by kempluo on 2025/6/17.
//

import SwiftUI

struct StrokeStyleDemoView: View {
    private let lineStyle = StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round, miterLimit: 0, dash: [10], dashPhase: 0)

    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .stroke(Color.red, lineWidth: 10) // 外边框
                .frame(width: 100, height: 100)

            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .strokeBorder(Color.red, lineWidth: 10) // 内边框
                .frame(width: 100, height: 100)

            // 自定义边框
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .strokeBorder(style: lineStyle)
                .frame(width: 100, height: 100)
        }
    }
}

#Preview {
    StrokeStyleDemoView()
}
