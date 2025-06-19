//
//  TransitionsDemoView.swift
//  iOSLearn
//
//  教程：https://www.bilibili.com/video/BV187E3zLEbi?p=94
//  通过 .transition 添加过渡动画
//  自定义过渡动画示例
//
//  Created by kempluo on 2025/6/19.
//

import SwiftUI

struct AnimationTransitionsDemoView: View {
    @State private var showInfo = false
    @State private var offsetAnim = false

    var body: some View {
        VStack {
            Button("show info") {
                showInfo.toggle()
            }.padding()

            // 1-----------------------------------------------
            if showInfo {
                // 直接操作视图 不好复用
//                Text("This is the information")
//                    .transition(.scale.animation(.default))

                // 定义自定义过渡效果,方便复用
                Text("This is the scale transition")
                    .transition(.easeInOutScaleTransition)

                Text("This is asymmetric transition")
                    .transition(.asymmetricTransition)

                Text("This is scale opacity combined transition")
                    .transition(.scaleCombinedTransition)

                // 2-----------------------------------------------
                Button("offset transition") {
                    withAnimation {
                        offsetAnim.toggle()
                    }
                }
            }

            if offsetAnim {
                // 从屏幕左侧进出界面的过渡
                Text("This is scale opacity combined transition")
                    .transition(.offset(x: 400, y: 0))
            }

            Spacer()
        }
    }
}

extension AnyTransition {
    static var easeInOutScaleTransition: AnyTransition {
        let animation = Animation.easeInOut(duration: 2)
        let transition = AnyTransition.scale
            .animation(animation)
        return transition
    }

    // 不对称过渡
    static var asymmetricTransition: AnyTransition {
        let animation = Animation.easeInOut(duration: 2)
        // 显示时 渐变， 移除时 缩小
        let transition = AnyTransition.asymmetric(insertion: .opacity, removal: .scale)
            .animation(animation)
        return transition
    }

    static var scaleCombinedTransition: AnyTransition {
        let animation = Animation.easeInOut(duration: 2)
        // 缩放时同时渐变
        let transition = AnyTransition.scale.combined(with: .opacity)
            .animation(animation)
        return transition
    }
}

#Preview {
    AnimationTransitionsDemoView()
}
