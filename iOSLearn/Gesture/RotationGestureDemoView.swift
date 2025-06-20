//
//  RotationGestureDemoView.swift
//  iOSLearn
//
//  教程：https://www.bilibili.com/video/BV12CEgzBE7J?p=7
//  旋转手势
//
//  Created by kempluo on 2025/6/20.
//

import SwiftUI

struct RotationGestureDemoView: View {
    @GestureState private var rotationAngle: Angle = .zero
    @State private var rotation: Angle = .zero

    var body: some View {
        Image(.flower)
            .resizable()
            .scaledToFit()
            .frame(width: 160, height: 160)
            .rotationEffect(rotation + rotationAngle)
            .gesture(
                RotateGesture()
                    .updating($rotationAngle) { value, state, _ in
                        state = value.rotation
                    }
                    .onEnded { value in
                        rotation = rotation + value.rotation
                    }
            )
    }
}

#Preview {
    RotationGestureDemoView()
}
