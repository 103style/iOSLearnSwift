//
//  AlertViewDemoView.swift
//  iOSLearn
//
//  教程：https://www.bilibili.com/video/BV187E3zLEbi?p=25
//  输入不合法 的 警告视图， 弹框
//
//  Created by kempluo on 2025/6/11.
//

import SwiftUI

struct AlertViewDemoView: View {
    @State private var name: String = ""
    @State private var openAlert: Bool = false
    @State private var openDialog: Bool = false

    var body: some View {
        VStack {
            TextField("insert you name", text: $name)
                .textFieldStyle(.roundedBorder)

            HStack {
                Spacer()
                Button("save") {
                    openAlert = name.isEmpty
                    openDialog = true && !name.isEmpty
                }
            }
            Spacer()
        }
        .padding()
        // 输入报错提示
        .alert("Error", isPresented: $openAlert, actions: {
            Button("Cancel", role: .cancel, action: {
                openAlert = false
            })
        }, message: {
            Text("Insert your name")
        })
        // 多个选项的弹框
        .confirmationDialog("Name", isPresented: $openDialog, actions: {
            Button("sure", role: .destructive, action: {})
            Button("cancel", role: .cancel, action: {})
        }, message: {
            Text("are you sure to use this name?")
        })
    }
}

#Preview {
    AlertViewDemoView()
}
