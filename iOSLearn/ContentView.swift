//
//  ContentView.swift
//  iOSLearn
//
//  Created by kempluo on 2025/5/13.
//

import SwiftUI

struct ContentView: View {
    let date = Date()
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
                .frame(width: 100, height: 100, alignment: .center) // 设置大小、对齐方式
            Text("Hello, world!")
                .padding(/*@START_MENU_TOKEN@*/ .top, 8.0/*@END_MENU_TOKEN@*/)
                .underline()
                .frame(minWidth: 0, maxWidth: .infinity) // 设置大小 match_parent?
            Text(date.formatted(date: .abbreviated, time: .omitted))
                .padding(/*@START_MENU_TOKEN@*/ .top, 8.0/*@END_MENU_TOKEN@*/)

            // 给指定文字设置下划线
            Text("Hello \(Text("UnderLine").underline())")
                .padding(/*@START_MENU_TOKEN@*/ .top, 8.0/*@END_MENU_TOKEN@*/)

            // 多行文本居中对齐
            Text("Hello, i am a Android Developer, i am learing Swift UI now")
                .padding(/*@START_MENU_TOKEN@*/ .top, 8.0/*@END_MENU_TOKEN@*/)
                .multilineTextAlignment(.center) // 设置对齐方式
                .lineSpacing(5) // 行间距
                .textSelection(.enabled)

            // 超出范围的截断方式， 开头 中间 结尾
            Text("Hello, i am a Android Developer, i am learing Swift UI now")
                .padding(/*@START_MENU_TOKEN@*/ .top, 8.0/*@END_MENU_TOKEN@*/)
                .lineLimit(1) // 单行显示
//                .truncationMode(.head) // 开头省略
//                .truncationMode(.middle) // 中间省略
                .truncationMode(.tail) // 结尾省略
        }
        .padding()
    }
}

#Preview() {
    ContentView()
}

// #Preview("My iPhone", traits: .landscapeLeft) {
//    ContentView()
// }
//
// command + N 创建模版代码
#Preview("PaddingView") {
    PaddingView()
}

#Preview("FontView") {
    FontView()
}
