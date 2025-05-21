//
//  StateDemoView.swift
//  iOSLearn
//
//  @State声明状态变量，视图使用变量，修改状态变量，视图则会自动刷新
//  @Binding，当状态属性在不同view中时， 其他View的的双向绑定属性用 @Binding 声明
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

//    // 单向绑定
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

    // 双向绑定
//    var body: some View {
//        Text(title).padding()
//
//        TextField("Insert Title", text: $titleInput) // $titleInput：双向绑定
//            .textFieldStyle(.roundedBorder)
//            .padding(.horizontal, 4)
//
//        Button(action: {
//            title = titleInput
//            titleInput = ""
//        }, label: {
//            Text("change title")
//        }).padding()
//
//        Spacer()
//    }

    // 当状态属性在不同view中时， 其他View的的双向绑定属性用 @Binding 声明
    var body: some View {
        VStack {
            HeadView(title: title, titleInput: $titleInput)
            Button(action: {
                title = titleInput
                titleInput = ""
            }, label: {
                Text("change title")
            }).padding()

            Spacer()
        }.padding()
    }
}

// @binding
struct HeadView: View {
    var title: String
    @Binding var titleInput: String

    var body: some View {
        VStack {
            Text(title).padding()

            TextField("Insert Title", text: $titleInput) // 双向绑定，加上$前缀
                .textFieldStyle(.roundedBorder)
        }
    }
}

#Preview {
    StateDemoView()
}
