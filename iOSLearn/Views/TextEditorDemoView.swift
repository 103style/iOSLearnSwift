//
//  TextEditorDemoView.swift
//  iOSLearn
//
//  文本编辑器
//  https://developer.apple.com/documentation/swiftui/TextEditor
//
//  Created by kempluo on 2025/5/21.
//

import SwiftUI

struct TextEditorDemoView: View {
    @State private var text: String = "i am new swift ui developer"

    var body: some View {
        // 文本编辑器
        TextEditor(text: $text)
//        TextEditor(text: $text, selection: <#T##Binding<TextSelection?>#>) // 也允许用户选择文本
            .multilineTextAlignment(.leading)
            .lineSpacing(10) // 行间距
            .autocorrectionDisabled(true)
            .padding(8)
            .background(Color.gray.opacity(0.3))
    }
}

#Preview {
    TextEditorDemoView()
}
