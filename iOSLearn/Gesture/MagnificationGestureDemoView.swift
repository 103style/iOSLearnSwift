//
//  MagnificationGestureDemoView.swift
//  iOSLearn
//
//  教程：https://www.bilibili.com/video/BV12CEgzBE7J?p=6
//  缩放手势
//
//  Created by kempluo on 2025/6/20.
//

import SwiftUI

struct MagnificationGestureDemoView: View {
    @GestureState private var magnification: CGFloat = 1
    @State private var zoom: CGFloat = 1

    var body: some View {
        Image(.flower)
            .resizable()
            .scaledToFit()
            .frame(width: 160, height: 160)
            .scaleEffect(getCurZoom(magnification: magnification))
            .gesture(
                MagnificationGesture()
                    .updating($magnification) { value, state, _ in
                        state = value
                    }
                    .onEnded { value in
                        // 计算放缩比例
                        zoom = getCurZoom(magnification: value)
                    }
            )
    }

    private func getCurZoom(magnification: CGFloat) -> CGFloat {
        let minZoom: CGFloat = 0.5
        let maxZoom: CGFloat = 3

        var cur = zoom * magnification
        cur = max(min(cur, maxZoom), minZoom)
        return cur
    }
}

#Preview {
    MagnificationGestureDemoView()
}
