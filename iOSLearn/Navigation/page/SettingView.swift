//
//  SettingView.swift
//  iOSLearn
//
//  Created by kempluo on 2025/6/10.
//

import SwiftUI

struct SettingView: View {
    @Environment(GroupApplicationData.self) private var shareData

//    @Environment(\.dismiss) var dismiss

    // @Binding var viewPath: NavigationPath

    @State private var showPicture: Bool = true
    @State private var showYear: Bool = true

    var body: some View {
        Form {
            Toggle("Show Picture", isOn: $showPicture)
            Toggle("Show Year", isOn: $showYear)
        }
        .navigationTitle("Settings")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true) // 隐藏默认的返回导航
        .toolbar { // 自定义返回操作UI
            ToolbarItem(placement: .navigationBarLeading) {
                Button("back") {
                    // 1.利用系统属性
                    // dismiss()

                    // 2.传入viewPath移除导航栈最后一个
//                    viewPath.removeLast()

                    // 3.统一的viewPath
                    shareData.viewPath.removeLast()
                }
            }
        }
    }
}

#Preview {
    @Previewable @State var navigation = NavigationPath()

    NavigationStack {
//        SettingView(viewPath: $navigation)
        SettingView()
            .environment(GroupApplicationData.shared)
    }
}
