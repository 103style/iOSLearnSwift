//
//  GroupBoxDemoView.swift
//  iOSLearn
//
//  https://developer.apple.com/documentation/swiftui/groupbox
//
//  Created by kempluo on 2025/5/22.
//

import SwiftUI

struct GroupBoxDemoView: View {
    @State private var setting1: Bool = true
    @State private var setting2: Bool = true
    @State private var setting3: Bool = true

    var body: some View {
        GroupBox("Settings") {
            VStack(spacing: 10) {
                Toggle("Autocorrection", isOn: $setting1)
                Toggle("Capitalization", isOn: $setting2)
                Toggle("Editable", isOn: $setting3)
            }
        }.padding()

        GroupBox(label:
            Label("End-User Agreement", systemImage: "building.columns")
        ) {
            ScrollView(.vertical, showsIndicators: true) {
                Text("哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈\n"
                    + "呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵\n"
                    + "嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻\n"
                    + "嘿嘿嘿嘿嘿嘿嘿嘿嘿嘿嘿嘿嘿嘿嘿嘿嘿嘿嘿嘿嘿嘿嘿嘿嘿嘿嘿嘿嘿嘿嘿嘿嘿嘿嘿嘿嘿嘿嘿嘿嘿嘿\n"
                )
                .font(.footnote)
                .frame(
                    maxWidth: .infinity, // 横向占满可用空间
                    alignment: .leading // 左对齐
                )
            }
            .frame(height: 100)
            Toggle(isOn: $setting2) {
                Text("I agree to the above terms")
            }
        }.padding()
    }
}

#Preview {
    GroupBoxDemoView()
}
