//
//  TextFileDemoView.swift
//  iOSLearn
//
//  教程： https://www.bilibili.com/video/BV187E3zLEbi/?p=73
//  文件读取
//
//  Created by kempluo on 2025/6/17.
//

import SwiftUI

struct TextFileDemoView: View {
    @Environment(TextApplicationData.self) private var appData

    var body: some View {
        @Bindable var appData = appData

        GroupBox("Editor") {
            TextEditor(text: $appData.textInFile)
        }.padding()
    }
}

#Preview {
    TextFileDemoView()
        .environment(TextApplicationData.shared)
}
