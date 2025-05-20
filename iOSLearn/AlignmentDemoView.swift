//
//  AlignmentDemoView.swift
//  iOSLearn
//
//  对齐方式 alignment、alignmentGuide
//
//  Created by kempluo on 2025/5/20.
//

import SwiftUI

struct AlignmentDemoView: View {
    var body: some View {
        ZStack {
            HStack(alignment: .center) {
                Image(systemName: "arrowshape.left")
                    .font(Font.system(size: 30))
                    .background(Color.blue)
                    // 手动调整居中位置 让其底部刚好在中线上
                    .alignmentGuide(VerticalAlignment.center) { dimensions in
                        dimensions[VerticalAlignment.center] + 15
                    }
                Image(systemName: "widget.extralarge.badge.plus")
                    .font(Font.system(size: 80))
                    .background(Color.green)

                Image(systemName: "arrowshape.right")
                    .font(Font.system(size: 30))
                    .background(Color.blue)
                    // 手动调整居中位置 让其顶部刚好在中线上
                    .alignmentGuide(VerticalAlignment.center) { dimensions in
                        dimensions[VerticalAlignment.center] - 15
                    }
            }
            .padding()
            .border(Color.gray, width: 2)

            Divider() // 默认灰色水平线
                .frame(height: 2)
                .background(.red) // 修改颜色
        }
    }
}

#Preview {
    AlignmentDemoView()
}
