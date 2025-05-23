//
//  EnvironmentDemoView.swift
//  iOSLearn
//
//  https://www.bilibili.com/video/BV1hLE3z2EAy?spm_id_from=333.788.player.switch&vd_source=2134ba8bdd139f2fa3bce12adb23e884&p=98
//
//  Created by kempluo on 2025/5/23.
//

import SwiftUI

@Observable class ViewData2 {
    var titleInput: String = ""
}

// struct EnvironmentDemoView: View {
//    @Bindable var viewData = ViewData2()
//
//    @Environment(ApplicationData.self) private var appData
//
//    var body: some View {
//        VStack(spacing: 10) {
//            Text(appData.title)
//
//            TextField("Insert Title", text: $viewData.titleInput)
//                .textFieldStyle(.roundedBorder)
//
//            Button(action: {
//                appData.title = viewData.titleInput
//                viewData.titleInput = ""
//            }, label: {
//                Text("Save")
//            })
//
//            Spacer()
//        }.padding()
//    }
// }

struct EnvironmentDemoView: View {
    @Environment(ApplicationData.self) private var appData

    var body: some View {
        // 将environment属性转换为可绑定属性
        @Bindable var appData = appData

        VStack(spacing: 10) {
            Text(appData.title)

            TextField("Insert Title", text: $appData.titleInput)
                .textFieldStyle(.roundedBorder)

            Button(action: {
                appData.title = appData.titleInput
                appData.titleInput = ""
            }, label: {
                Text("Save")
            })

            Spacer()
        }.padding()
    }
}

#Preview {
    // 预览需要配置对应的环境
    EnvironmentDemoView()
        .environment(ApplicationData.shared)
}
