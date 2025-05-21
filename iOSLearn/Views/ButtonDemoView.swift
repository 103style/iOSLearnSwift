//
//  ButtonDemoView.swift
//  iOSLearn
//
//  https://developer.apple.com/documentation/swiftui/button
//
//  Created by kempluo on 2025/5/21.
//

import SwiftUI

struct ButtonDemoView: View {
    @State private var isActive: Bool = false
    var body: some View {
        VStack(spacing: 10) {
            Text("ButtonDemoView")
                .frame(minWidth: 0, maxWidth: isActive ? .infinity : 150, maxHeight: 50)
                .padding()
                .background(isActive ? Color.blue : Color.clear)

            Button("Change") {
                changeColor()
            }.padding()

            // 设置 按钮禁用
            Button("Disable", action: changeColor)
                .disabled(isActive) // 禁用按钮点击

            Button(action: changeColor, label: {
                VStack(spacing: 10) {
                    Image(systemName: isActive ? "figure.roll.runningpace" : "figure.roll")
                        .renderingMode(.template) // // 允许图标颜色随环境色变化
                        .font(Font.system(size: 36))

                    Text(isActive ? "Active" : "Inactive")
                }
            })

            // 边框样式
            HStack {
                Button("Cancel", action: {})
                    .buttonStyle(.bordered) // 边框

                Button("Send", action: {})
                    .buttonStyle(.borderedProminent) // 边框
            }

            // 控制按钮大小
            Button(action: {}, label: {
                Image(systemName: "figure.roll")
                    .imageScale(.large)
                Text("figure.roll")
            })
            .buttonStyle(.borderedProminent)
            .font(.title)
            .controlSize(.large) // 控制按钮大小

            // 自定义样式
            Button(action: {}, label: {
                HStack {
                    Image(systemName: "figure.roll")
                        .imageScale(.large)
                    Text("figure.roll")
                }
            })
            .buttonStyle(CustonButtonStyle())

            // 条件语句控制视图显示隐藏
            if !isActive {
                Text("Not active").foregroundColor(.white).padding().background(Color.red)
            }

            Spacer()
        }
    }

    func changeColor() {
        isActive.toggle()
    }
}

struct CustonButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        let pressed = configuration.isPressed
        return configuration.label
            .padding()
            .border(Color.green, width: 3)
            .scaleEffect(pressed ? 1.2 : 1.0) // 按下时方法， SwiftUi会自动添加动画
    }
}

#Preview {
    ButtonDemoView()
}
