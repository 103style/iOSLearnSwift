//
//  TextFieldView.swift
//  iOSLearn
//
//  输入框
//  https://developer.apple.com/documentation/swiftui/textfield
//
//  Created by kempluo on 2025/5/21.
//

import SwiftUI

enum FocusName: Hashable {
    case name
    case surname
}

struct TextFieldView: View {
    @State private var showText: String = "UnDefined"
    @State private var nameText: String = ""
    @State private var surNameText: String = ""
    @State private var phoneNumber: String = ""
    @State private var des: String = ""
    @FocusState var focusName: FocusName?
    
    @State private var text: String = ""
    @State private var selected: TextSelection? = nil
    
    @State private var password: String = ""
    
    var body: some View {
        VStack(spacing: 10) {
            Text(showText).font(Font.system(size: 16))
            
            // 配置输入框
            TextField("insert your accout name", text: $nameText)
                .textFieldStyle(.roundedBorder) // 配置样式
                .padding(2)
                .background(focusName == .name ? Color(white: 0.9) : .white) // 焦点状态改变修改背景色
                .focused($focusName, equals: .name) // 获取到焦点 focuname则会修改为 name
                .padding(.horizontal, 4)
                .submitLabel(.done) // 设置软键盘的提交文案
                .onSubmit { // 点击软键盘的提交按钮
                    onSubmit()
                }
                .onChange(of: nameText) { _, value in // 监听文本变化，修改显示的文本
                    if value.count > 10 {
                        nameText = String(value.prefix(10))
                    }
                }
            
            // 配置输入框
            TextField("insert your accout surname", text: $surNameText)
                .textFieldStyle(.roundedBorder)
                .padding(2)
                .background(focusName == .surname ? Color(white: 0.9) : .white)
                .focused($focusName, equals: .surname) // 获取到焦点 focuname则会修改为 surname
                .padding(.horizontal, 4)
                .onChange(of: surNameText) { _, value in
                    if value.count > 15 {
                        surNameText = String(value.prefix(15))
                    }
                }
            
            // 显示数字输入
            TextField("insert your phone number", text: $phoneNumber)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal, 6)
                .keyboardType(.numberPad) // 设置键盘的类型，这里是 数字键盘
                .onChange(of: phoneNumber) { old, value in
                    if !value.isEmpty && Int(value) == nil { // 限制只有数字才能更新
                        phoneNumber = old
                    }
                }
            
            // 可垂直滚动的多行输入 axis: .vertical
            TextField("insert your accout des", text: $des, axis: .vertical) // 内容垂直滚动
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal, 6)
                .lineLimit(5) // 设置输入框的行数
            
            // 获取选中的字符 selection
            TextField("insert text", text: $text, selection: $selected, axis: .vertical)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal, 6)
                .lineLimit(5) // 设置输入框的行数
            Text(getSelection() ?? "")
            
            // 安全文本， 密码输入
            SecureField("insert password", text: $password)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal, 6)
            
            Button("Submit", action: onSubmit)
                .buttonStyle(.borderedProminent)
                .disabled(nameText.isEmpty || surNameText.isEmpty)
            
            Spacer()
        }
    }
    
    // 获取选中的子串
    func getSelection() -> String? {
        if let indices = selected?.indices {
            if case .selection(let range) = indices {
                let subString = text[range]
                return String(subString)
            }
        }
        return nil
    }

    func onSubmit() {
        if !nameText.isEmpty && !surNameText.isEmpty {
            showText = "\(nameText.trimmingCharacters(in: .whitespaces)) \(surNameText.trimmingCharacters(in: .whitespaces)) \(phoneNumber)"
            nameText = ""
            surNameText = ""
            phoneNumber = ""
            des = ""
            focusName = nil // 输入框有焦点的时候 软键盘会一直打开， 所以点击提交的时候将其置为nil
        }
    }
}

#Preview {
    TextFieldView()
}
