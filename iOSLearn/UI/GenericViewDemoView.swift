//
//  GenericViewDemoView.swift
//  iOSLearn
//
//  通用视图， 避免用AnyView包装，建议用 @ViewBuilder 属性器，避免包装
//
//  Created by kempluo on 2025/5/21.
//

import SwiftUI

struct GenericViewDemoView: View {
    var body: some View {
        getView().font(Font.system(size: 60))
    }

//    // 这样写， 视图会丢失类型，包装在AnyView中，会影响性能
//    func getView() -> AnyView {
//        let valid = true
//
//        var res: AnyView!
//        if valid {
//            res = AnyView(Image(systemName: "tray.circle"))
//        } else {
//            res = AnyView(Text("the state is invalid"))
//        }
//        return res
//    }

    // @ViewBuild属性包装器  作为内容闭包，不需要包装类型
    @ViewBuilder
    func getView() -> some View {
        let valid = true
        if valid {
            Image(systemName: "tray.circle")
        } else {
//            Text("the state is invalid")
            EmptyView() // 空视图
        }
    }
}

#Preview {
    GenericViewDemoView()
}
