//
//  StateDemoView.swift
//  iOSLearn
//
//  @State声明状态变量，视图使用变量，修改状态变量，视图则会自动刷新
//  @Binding，当状态属性在不同view中时， 其他View的的双向绑定属性用 @Binding 声明
//
//  _title 是 @State private var title 的 ​​属性包装器投影
//  @State 属性包装器会生成两个关键属性：wrappedValue 和 projectedValue
//  wrappedValue 是 @State 属性包装器中 ​​实际存储的原始值​​。
//  projectedValue 是 @State 属性包装器生成的 ​​绑定引用​​（Binding<T>）。
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

    // ---------------------------------------------------------------------

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

    // ---------------------------------------------------------------------

    // 当状态属性在不同view中时， 其他View的的双向绑定属性用 @Binding 声明
//    var body: some View {
//        VStack {
//            HeadView(title: title, titleInput: $titleInput)
//            Button(action: {
//                title = titleInput
//                titleInput = ""
//            }, label: {
//                Text("change title")
//            }).padding()
//
//            Spacer()
//        }.padding()
//    }

    // ---------------------------------------------------------------------
//
//    init() {
//        _titleInput = State(initialValue: "Hi SwiftUI")
//    }
//
//    // @State 属性包装器会生成两个关键属性：wrappedValue 和 projectedValue
//    // _title 是 @State private var title 的 ​​属性包装器投影
//    // wrappedValue 是 @State 属性包装器中 ​​实际存储的原始值​​。
//    // Text(_title.wrappedValue) 等同于直接写 Text(title)
//    //
//    // projectedValue 是 @State 属性包装器生成的 ​​绑定引用​​（Binding<T>）。
//    // TextField(text: _titleInput.projectedValue) 等同于 TextField(text: $titleInput)
//    //
//    // ​​推荐使用语法糖​​：Text(title) 和 $titleInput 更简洁直观。
//    // 特殊场景才用显式访问​​：例如调试或自定义属性包装器时。
//    var body: some View {
//        // 显式访问：_title.wrappedValue
//        // 隐式访问（推荐） Text(title) // 直接使用变量名，更简洁
//        Text(_title.wrappedValue).padding()
//
//        TextField("Insert Title", text: _titleInput.projectedValue)
//            .textFieldStyle(.roundedBorder)
//            .padding(.horizontal, 4)
//
//        Button(action: {
//            _title.wrappedValue = _titleInput.wrappedValue
//            _titleInput.wrappedValue = ""
//        }, label: {
//            Text("change title")
//        }).padding()
//
//        Spacer()
//    }

    // ---------------------------------------------------------------------

    var body: some View {
        VStack {
            HeadView(title: $title, titleInput: $titleInput)

            Button(action: {
                _title.wrappedValue = _titleInput.wrappedValue
                _titleInput.wrappedValue = ""
            }, label: {
                Text("change title")
            }).padding()

            Spacer()
        }.padding()
    }
}

// @binding
// struct HeadView: View {
//    var title: String
//    @Binding var titleInput: String
//
//    var body: some View {
//        VStack {
//            Text(title).padding()
//
//            TextField("Insert Title", text: $titleInput) // 双向绑定，加上$前缀
//                .textFieldStyle(.roundedBorder)
//        }
//    }
// }

struct HeadView: View {
    @Binding var title: String
    @Binding var titleInput: String
    let counter: Int

    init(title: Binding<String>, titleInput: Binding<String>) {
        _title = title
        _titleInput = titleInput

        let sentence = _title.wrappedValue
        counter = sentence.count
    }

    var body: some View {
        VStack {
            Text("\(title) (\(counter))").padding()

            TextField("Insert Title", text: $titleInput) // 双向绑定，加上$前缀
                .textFieldStyle(.roundedBorder)
        }
    }
}

#Preview {
    StateDemoView()
}

#Preview("Header") {
//    let title = Binding<String>(
//        get: { "Preview Head" },
//        set: { value in
//            print(value)
//        }
//    )
//    let titleInput = Binding<String>(
//        get: { "" },
//        set: { value in
//            print(value)
//        }
//    )
//    return HeadView(title: title, titleInput: titleInput)

    HeadView(title: .constant("Preview Header"), titleInput: .constant(""))
}
