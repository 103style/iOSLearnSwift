//
//  GestureEnableDemoView.swift
//  iOSLearn
//
//  教程：https://www.bilibili.com/video/BV12CEgzBE7J?p=2
//  设置 是否允许点击、 通过.contentShape设置内容形状才配置点击响应区域
//
//  Created by kempluo on 2025/6/20.
//

import SwiftUI

struct GestureEnableDemoView: View {
    @State private var expand: Bool = false
    @State private var allowExpansion: Bool = false
    @State private var selected: Bool = false

    var body: some View {
        Image(.flower)
            .resizable()
            .scaledToFit()
            .frame(width: 160, height: 200)
            .onTapGesture {
                expand = true
            }
            .allowsHitTesting(allowExpansion) // 设置是否能被点击
            .sheet(isPresented: $expand) {
                ShowImage()
            }

        Toggle("", isOn: $allowExpansion)
            .labelsHidden()

        VStack {
            HStack {
                Image(.flower)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)

                Text("Balmy Beach").bold()

                Spacer()
            }
            .padding(5)
            .border(selected ? Color.red : Color.gray, width: 1)
            // 通过设置内容形状来 配置点击的响应区域, 不设置只有点击图片和文字的区域才会响应点击
            .contentShape(Rectangle())
            .onTapGesture {
                selected.toggle()
            }
            .padding(4)

            Spacer()
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
    GestureEnableDemoView()
}
