//
//  ColorView.swift
//  iOSLearn
//
//  颜色
//
//  Created by kempluo on 2025/5/19.
//

import SwiftUI

struct ColorView: View {
    let radius = 20.0
    var body: some View {
        ZStack { // 叠加布局 framelayout
            Color(red: 0.9, green: 0.5, blue: 0.2, opacity: 0.5)

            VStack { // 垂直布局 linearlayout
                Color(red: 100 / 255, green: 228 / 255, blue: 255 / 255)
                    .padding(.bottom, 8.0)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 100)

                Color.red.frame(maxHeight: 100)
                    .padding(.bottom, 8.0)

                // assets.xcassets
                // assets 目录下创建的颜色 "DemoColor"  常规/夜间模式下显示不同颜色
                Color("DemoColor").frame(maxHeight: 100)
            }

            VStack {
                Text("Color Demo")
                    .font(.largeTitle)
                    .padding(8.0)
//                    .background(Color.purple)
//                    .border(Color.white, width: 2) // 添加边框
//                    .cornerRadius(20) // 圆角
//                    .overlay(Color(red: 1, green: 1, blue: 0.3, opacity: 0.2)) // 前景
                    .background(
                        // 圆角带边框的背景
                        RoundedRectangle(cornerRadius: radius)
                            .fill(Color.purple)
                            .overlay(
                                RoundedRectangle(cornerRadius: radius)
                                    .stroke(Color.white, lineWidth: 2)
                            )
                    )

                // Materials

                Text("Materials Demo")
                    .padding(12.0)
                    .font(.largeTitle)
                    .background(
                        RoundedRectangle(cornerRadius: radius)
                            .fill(Color.blue)
                    )
//                    .foregroundStyle(.thickMaterial) // 粗
//                    .foregroundStyle(.ultraThinMaterial) // 超细
                    .foregroundStyle(.ultraThickMaterial) // 超粗
            }
        }
    }
}

#Preview {
    ColorView()
}
