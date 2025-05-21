//
//  PaddingView.swift
//  iOSLearn
//
//  内边距设置方式
//
//  Created by kempluo on 2025/5/19.

import SwiftUI

struct PaddingView: View {
    let number: Float = 3.1415926535

    var body: some View {
        Text("My number is \(number.formatted(.currency(code: "USD")))")
//            .padding(.all, 8.0) // 设置内边距
//            .padding(EdgeInsets(top: 0.0, leading: 16.0, bottom: 0.0, trailing: 16.0)) // 设置四个内边距
            .padding([.leading, .trailing], 16.0) // 当边距相同时
            .font(.title)
            .fontWeight(.bold)
            .foregroundColor(Color.purple)
            .background(Color.pink)
    }
}

#Preview {
    PaddingView()
}
