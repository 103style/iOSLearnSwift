//
//  EventModifiersDemoView.swift
//  iOSLearn
//
//  事件操作符
//
//  Created by kempluo on 2025/5/20.
//

import SwiftUI

struct EventModifiersDemoView: View {
    let mfont = Font.system(size: 60)

    var body: some View {
        Image(systemName: "bell.and.waves.left.and.right")
            .font(mfont)
            .onAppear(perform: {
                print("onAppear") // ​​首次出现​​ 或 ​​重新出现在屏幕上​​ 时触发。
            })
            .onDisappear(perform: {
                print("onDisappear") // 从屏幕上消失​​ 时触发
            })
            .onTapGesture(perform: {
                print("onTapGesture") // ​​点击手势
            })
            .onLongPressGesture(perform: {
                print("onLongPressGesture") // ​​监听长按手势
            })
//            .gesture(<#T##gesture: Gesture##Gesture#>) // 自定义复杂手势（如拖拽、缩放）
//            .onSubmit { print("提交") } // 提交表单或搜索时触发（如键盘回车）
//            .onChange(of: value) { _ in } // 监听状态变化并触发动作
//            .focused // 绑定输入框焦点状态
//            .onReceive(timer) { _ in } // 监听外部事件（如通知、定时器）
//            .animation(.easeInOut, value: isActive) // 为状态变化添加动画
//            .transition(.slide) // 控制视图插入/移除的过渡效果
    }
}

#Preview {
    EventModifiersDemoView()
}
