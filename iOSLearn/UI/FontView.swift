//
//  FontView.swift
//  iOSLearn
//
//  动态大小 、 固定大小、 字体
//
//  Created by kempluo on 2025/5/19.
//

import SwiftUI

struct FontView: View {
    let date = Date()
    var body: some View {
        VStack {
            Text(date.formatted(date: .abbreviated, time: .omitted))
                .font(.largeTitle) // 动态大小， 不同设备显示的大小不一样
                .padding(/*@START_MENU_TOKEN@*/ .top, 8.0/*@END_MENU_TOKEN@*/)
            Text(date, style: .timer)
                .padding(/*@START_MENU_TOKEN@*/ .top, 8.0/*@END_MENU_TOKEN@*/)
                .font(Font.system(size: 50)) // 固定大小
            Text(date, style: .relative)
                .padding(/*@START_MENU_TOKEN@*/ .top, 8.0/*@END_MENU_TOKEN@*/)
                .font(Font.custom("Georgia", size: 50)) // 自定义字体
            Text(date, style: .offset)
                .padding(/*@START_MENU_TOKEN@*/ .top, 8.0/*@END_MENU_TOKEN@*/)
                //  需要在项目设置的info中配置 Fonts Provided By Application，添加相关的字体
                //  设置配置的字体 horsepower.ttf
                .font(Font.custom("Horsepower-Regular", size: 50))
                .shadow(radius: 10, x: 10, y: 10) // 设置阴影
        }
        .padding()
    }
}

#Preview {
    FontView()
}
