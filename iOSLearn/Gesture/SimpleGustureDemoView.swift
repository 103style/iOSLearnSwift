//
//  SimpleGustureDemoView.swift
//  iOSLearn
//
//  教程：https://www.bilibili.com/video/BV12CEgzBE7J
//  手势的简单使用 点击、长按
//
//  Created by kempluo on 2025/6/20.
//

import SwiftUI

struct SimpleGustureDemoView: View {
    @State private var expand: Bool = false
    @State private var pressing: Bool = false

    var body: some View {
        Image(.flower)
            .resizable()
            .scaledToFit()
            .opacity(pressing ? 0.5 : 1)
            .frame(width: 160, height: 200)
//            .onTapGesture {
//                // 点击事件
//                expand = true
//            }
            // 长按事件
            // 长按时间1s， 移动距离不能超过10
            .onLongPressGesture(minimumDuration: 1, maximumDistance: 10, perform: {
                expand = true
            }, onPressingChanged: { value in
                withAnimation(.easeInOut) {
                    pressing = value
                }
            })
            .sheet(isPresented: $expand) {
                ShowImage()
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
    SimpleGustureDemoView()
}
