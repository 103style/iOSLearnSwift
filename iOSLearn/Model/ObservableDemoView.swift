//
//  ObservableDemoView.swift
//  iOSLearn
//
// https://www.bilibili.com/video/BV1hLE3z2EAy?spm_id_from=333.788.videopod.episodes&vd_source=2134ba8bdd139f2fa3bce12adb23e884&p=97
//
//  Created by kempluo on 2025/5/22.
//

import SwiftUI

@Observable class ViewData {
    var titleInput: String = ""

    // 对当个变量忽略观察
    @ObservationIgnored var counter: Int = 0
}

struct ObservableDemoView: View {
//    @Bindable var appData = ApplicationData.shared

    @Bindable private var viewData = ViewData()
    var appData = ApplicationData.shared

    @State private var textId: UUID = .init()

    // 1
    // init 方法或者 onAppear回调
//    init() {
//        // 每次进页面显示上次的值
//        viewData.titleInput = appData.title
//    }

    var body: some View {
        VStack(spacing: 10) {
//            Text(appData.title).padding()
//            Text("\(appData.title)-\(viewData.counter)").padding()

            Text("\(appData.title)-\(viewData.counter)")
                .padding()
                .id(textId)

//            TextField("Insert title", text: $appData.titleInput)
//                .textFieldStyle(.roundedBorder)
//
            TextField("Insert title", text: $viewData.titleInput)
                .textFieldStyle(.roundedBorder)

            Button(action: {
//                appData.title = appData.titleInput
//                appData.titleInput = ""

                appData.title = viewData.titleInput
                viewData.titleInput = ""
            }, label: {
                Text("Save")
            })

//            Button(action: {
//                viewData.counter += 1
//            }, label: {
//                Text("ObservationIgnored counter")
//            })

            // 通过改变id 让忽略观察的变量也触发刷新视图
            Button(action: {
                viewData.counter += 1
                textId = UUID()
            }, label: {
                Text("ObservationIgnored counter")
            })

            Spacer()
        }
        .padding()
        // 2
        // init 方法或者 onAppear回调
        .onAppear {
            // 显示上次的值
            viewData.titleInput = appData.title
        }
    }
}

#Preview {
    ObservableDemoView()
}
