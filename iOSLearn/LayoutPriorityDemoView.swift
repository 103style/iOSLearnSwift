//
//  LayoutPriorityDemoView.swift
//  iOSLearn
//
//  布局优先级
//
//  Created by kempluo on 2025/5/20.
//

import SwiftUI

struct LayoutPriorityDemoView: View {
    var body: some View {
        // 默认情况下所有的布局优先级都是0
        // 可以通过 layoutPriority 修改，  感觉类似Android里面的layout_weight
        // 布局时，系统会先给优先级低的空间的最小的空间，然后把剩余空间分给优先级更高的视图
        // 如果内容还是不够显示时，内容就会被裁剪
        HStack {
            Text("LayoutPriorityDemoView")
                .lineLimit(1)

            Image(systemName: "arrowshape.turn.up.left.circle")
                .font(Font.system(size: 60))

            Text("LayoutPriorityDemoView")
                .lineLimit(1)
                .layoutPriority(1) // 调高优先级，能保证当前布局完整显示
        }

        // 如果要设置强制大小，就得用固定大小的修饰符
        HStack {
            Text("LayoutPriorityDemoView FixedSize")
                .lineLimit(1)
                .fixedSize() // 固定大小的修饰符

            Image(systemName: "arrowshape.turn.up.left.circle")
                .font(Font.system(size: 60))

            Text("LayoutPriorityDemoView")
                .lineLimit(1)
//                .layoutPriority(1) // 调高优先级，能保证当前布局完整显示
        }
    }
}

#Preview {
    LayoutPriorityDemoView()
}
