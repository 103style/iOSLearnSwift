//
//  AnimationCoordinatingTransitionsDemoView.swift
//  iOSLearn
//
//  教程：https://www.bilibili.com/video/BV187E3zLEbi?p=94
//  动画组 通过 matchedGeometryEffect 同一个组使用统一的 id 和 in
//
//  Created by kempluo on 2025/6/19.
//

import SwiftUI

struct AnimationCoordinatingTransitionsDemoView: View {
    @Namespace private var myAnim
    @State private var showInfo = false
    var body: some View {
        // 1.-----------------------
        Button("show transition") {
            showInfo.toggle()
        }.padding()

        HStack {
            if !showInfo {
                Text("Left")
                    .transition(.scale.animation(.default))
            }
            Spacer()
            if showInfo {
                Text("Right")
                    .transition(.scale.animation(.default))
            }
        }

        // 2.---------动画组--------------
        Button("show matchedGeometryEffect") {
            withAnimation(.easeInOut) {
                showInfo.toggle()
            }
        }.padding()

        HStack {
            if !showInfo {
                Text("Left")
                    .matchedGeometryEffect(id: "textAnim", in: myAnim)
            }
            Spacer()
            if showInfo {
                Text("Right")
                    .matchedGeometryEffect(id: "textAnim", in: myAnim)
            }
        }
    }
}

#Preview {
    AnimationCoordinatingTransitionsDemoView()
}
