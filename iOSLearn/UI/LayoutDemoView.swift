//
//  LayoutDemoView.swift
//  iOSLearn
//
//  布局练习
//  VStack  垂直排列  LinearLayout vertical
//  HStack  水平排列  LinearLayout horizonal
//  ZStack  层叠排列  Framelayout
//
//  Created by kempluo on 2025/5/20.
//

import SwiftUI

struct LayoutDemoView: View {
    var body: some View {
        // 垂直布局
        // alignment 默认 .center
        // spacing 每个子View间的间距
        VStack(alignment: .leading, spacing: 20) { // 所有子View左对齐
            Text("City")
            Text("VStack")
        }

        // 水平布局
        // alignment 默认 居中对齐，
        // spacing 子View的间距为标准间距，通常为8
        HStack(alignment: .center, spacing: 10) {
            Image(systemName: "speaker.wave.2.bubble")
                .font(Font.system(size: 40))
            Text("HStack")
        }.padding(.vertical, 4)

        // 层叠布局
        // zIndex 子View可以通过设置该属性来控制层叠的位置， 根据其值从小到大 依次 从下到上堆叠
        // alignment 默认 居中对齐，
        ZStack(alignment: .trailing) { // 尾部对齐
            Image(systemName: "pencil.circle")
                .font(Font.system(size: 40))
                .zIndex(1)

            Text("ZStack")
                .padding(4)
                .font(.body.bold())
                .background(.blue)
                .zIndex(-1) // 设置在第几层，越小越下面
        }.foregroundColor(Color.red) // 可以设置所有子View的前景

        // 多种布局

        HStack(alignment: .center, spacing: 10) {
            Image(systemName: "widget.medium")
                .font(Font.system(size: 40))
            VStack(alignment: .leading, spacing: 10) {
                Text("HStack")
                    .font(.title)
                    .foregroundColor(Color.red)
                Text("VStack")
                    .foregroundColor(.gray)
            }
        }.padding(.vertical, 4)

        // 间隔试图
        // Spacer: 弹性空间
        HStack(alignment: .center, spacing: 10) {
            Image(systemName: "widget.medium")
                .font(Font.system(size: 40))

//            Spacer() // 弹性空间  类似linearlayout中 设置了weight属性

            VStack(alignment: .leading, spacing: 10) {
                Text("HStack")
                    .font(.title)
                    .foregroundColor(Color.red)
                Text("VStack")
                    .foregroundColor(.gray)
            }
            
            Spacer() // 让内容到屏幕左侧
        }.padding(.vertical, 4)

        Spacer() // 将内容顶部对齐
    }
}

#Preview {
    LayoutDemoView()
}
