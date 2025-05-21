//
//  GroupDemoView.swift
//  iOSLearn
//
//  Group
//  1.以前Swift限制了子视图不能超过10个，可以用Grouo等来解决这个问题，不过现在不需要手动分组了
//    隐式优化​​：从 Swift 5.3 开始，编译器对超过 10 个的显式子视图自动分组，开发者无需手动处理。
//  2.设置统一的样式
//  3.通过条件判断返回对应的视图
//
//  Created by kempluo on 2025/5/20.
//

import SwiftUI

struct GroupDemoView: View {
    let show = false

    var body: some View {
        VStack(spacing: 8) {
            Group {
                Text("111")
                Text("222")
                Text("333")
                Text("444")
            }.foregroundColor(Color.gray)
            Group {
                if show { // 如果需要条件判断， 则需要用Group
                    Text("555")
                    Text("666")
                    Text("777")
                } else {
                    Text("...")
                    Text("...")
                    Text("...")
                }
            }
            .foregroundColor(Color.black)
            .font(.title)
            Group {
                Text("888")
                Text("900")
                Text("000")
                Text("111")
            }.foregroundColor(Color.gray)
        }
    }
}

#Preview {
    GroupDemoView()
}
