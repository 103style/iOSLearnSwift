//
//  GestureStructDemoView.swift
//  iOSLearn
//
//  教程：https://www.bilibili.com/video/BV12CEgzBE7J?p=3 - 4
//  .gesture 操作符 响应手势，.updating更新 .onEnded响应
//
//  Created by kempluo on 2025/6/20.
//

import SwiftUI

struct GestureStructDemoView: View {
    @State private var expand: Bool = false
//    @GestureState private var pressing: Bool = false
    @GestureState private var pressingState = PressingState.inactive

    var body: some View {
        Image(.flower)
            .resizable()
            .scaledToFit()
            .frame(width: 160, height: 200)
//            .opacity(pressing ? 0.5 : 1)
            .opacity(pressingState.isActive ? 0.5 : 1)
//            .gesture(
//                TapGesture(count: 1).onEnded {
//                    expand = true
//                }
//            )
            .gesture(
                // LongPressGesture(minimumDuration: 1).updating($pressing) { value, state, transaction in
                // state = value
                LongPressGesture(minimumDuration: 1).updating($pressingState) { value, state, transaction in
                    state = value ? .active : .inactive
                    transaction.animation = Animation.easeOut(duration: 1.5)
                }
                .onEnded { _ in
                    expand = true
                }
            )

            .sheet(isPresented: $expand) {
                ShowImage()
            }
    }
}

private enum PressingState {
    case active
    case inactive

    var isActive: Bool {
        switch self {
        case .active:
            return true
        case .inactive:
            return false
        }
    }
}

private struct ShowImage: View {
    var body: some View {
        Image(.flower)
            .resizable()
            .scaledToFit()
            .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    GestureStructDemoView()
}
