//
//  ToggleViewDemoView.swift
//  iOSLearn
//
//  类似Android的Switch开关
//  https://developer.apple.com/documentation/swiftui/toggle
//
//  Created by kempluo on 2025/5/22.
//

import SwiftUI

struct ToggleDemoView: View {
    @State private var curState: Bool = true

    var body: some View {
        VStack(spacing: 10) {
            Toggle(isOn: $curState, label: {
                Text(curState ? "On" : "Off")
                Text("Enable or Disable")
            })
            .padding(8)
            .background(Color(curState ? .yellow : .gray))
            .padding(.top, 4)

            // 自定义标签
            HStack {
                Toggle("", isOn: $curState)
                    .labelsHidden()
                Text(curState ? "On" : "Off").padding()
            }
            .padding(.horizontal, 8)
            .background(Color(curState ? .yellow : .gray))

            // 修改为按钮样式
            Toggle(isOn: $curState, label: {
                Label("Send", systemImage: "mail")
            })
            .toggleStyle(.button) // 按钮样式 点击会切换背景

            // 创建自己的样式
            Toggle(curState ? "On" : "Off", isOn: $curState)
                .toggleStyle(CustomToggleStyle()) // 按钮样式 点击会切换背景

            Spacer()
        }
    }
}

// 自定义样式
struct CustomToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack(alignment: .center) {
            Image(systemName: "flag.pattern.checkered.circle.fill")
                .font(.largeTitle)
                .foregroundColor(configuration.isOn ? Color.green : Color.gray)

            configuration.label // 配置的视图
        }.onTapGesture { // 点击操作
            configuration.$isOn.wrappedValue.toggle()
        }
    }
}

#Preview {
    ToggleDemoView()
}
