//
//  AnimationWithSFSymbolsDemoView.swift
//  iOSLearn
//
//  教程：https://www.bilibili.com/video/BV187E3zLEbi?p=95
//  通过 symbolEffect 对SF符号进行动画
//
//  Created by kempluo on 2025/6/19.
//

import SwiftUI

struct AnimationWithSFSymbolsDemoView: View {
    @State private var isActive = false
    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: "dot.radiowaves.forward")
                .font(.largeTitle)
                .symbolEffect(.variableColor.iterative, options: .nonRepeating, isActive: isActive)

            Image(systemName: "dot.radiowaves.forward")
                .font(.largeTitle)
                .symbolEffect(.bounce, options: .repeat(2), isActive: isActive) // 弹跳效果 重复2次

            HStack {
                // 摆动效果
                Image(systemName: "wifi")
                    .font(.largeTitle)
                    .symbolEffect(.wiggle.custom(angle: 45), options: .repeat(2), isActive: isActive)
                Image(systemName: "wifi")
                    .font(.largeTitle)
                    .symbolEffect(.wiggle.custom(angle: 180), options: .repeat(2), isActive: isActive)
            }
            HStack {
                Image(systemName: "wifi")
                    .font(.largeTitle)
                    .symbolEffect(.scale.up, isActive: isActive)
                Image(systemName: "wifi")
                    .font(.largeTitle)
                    .symbolEffect(.scale.down, isActive: isActive)
            }
            
            HStack {
                Image(systemName: "wifi")
                    .font(.largeTitle)
                    .symbolEffect(.appear, isActive: isActive)
                Image(systemName: "wifi")
                    .font(.largeTitle)
                    .symbolEffect(.disappear, isActive: isActive)
                Image(systemName: "wifi")
                    .font(.largeTitle)
                    .symbolEffect(.appear.up, isActive: isActive)
                Image(systemName: "wifi")
                    .font(.largeTitle)
                    .symbolEffect(.appear.down, isActive: isActive)
            }

            // 内容替换效果
            Image(systemName: isActive ? "wifi" : "wifi.slash")
                .font(.largeTitle)
                .contentTransition(.symbolEffect(.replace))

            Button("start anim") {
                isActive.toggle()
            }

            if isActive {
                Image(systemName: "wifi")
                    .font(.largeTitle)
                    .transition(.symbolEffect(.disappear))
            }

            Spacer()
        }
    }
}

#Preview {
    AnimationWithSFSymbolsDemoView()
}
