//
//  StateDemoView.swift
//  iOSLearn
//
//  @State声明状态变量，视图使用变量，修改状态变量，视图则会自动刷新
//
//  Created by kempluo on 2025/5/21.
//

import SwiftUI

struct StateDemoView: View {
    // 直接使用 @State 的变量单向绑定
    // 通过 $ + @State的变量($title) 使用，则是双向绑定

    @State private var title: String = "Hello, State"

//    @State private var isValid: Bool = true

    @State private var titleInput: String = ""

//    var body: some View {
//        Text(title).padding()
//
//        Button(action: {
//            isValid.toggle()
//            title = isValid ? "Valid" : "Invalid"
//        }, label: {
//            Text("change title")
//        }).padding()
//
//        Spacer()
//    }

    var body: some View {
        Text(title).padding()

        TextField("Insert Title", text: $titleInput) // $titleInput：双向绑定
            .textFieldStyle(.roundedBorder)
            .padding(.horizontal, 4)

        Button(action: {
            title = titleInput
            titleInput = ""
        }, label: {
            Text("change title")
        }).padding()

        Spacer()
    }
}

#Preview {
    StateDemoView()
}
