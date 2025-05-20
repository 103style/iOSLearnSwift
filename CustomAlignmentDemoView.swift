//
//  CustomAlignmentDemoView.swift
//  iOSLearn
//
//  自定义对齐方式
//
//  Created by kempluo on 2025/5/20.
//

import SwiftUI

extension VerticalAlignment {
    enum CustomAlignment: AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            return context[VerticalAlignment.center]
        }
    }

    static let alignCustom = VerticalAlignment(CustomAlignment.self)
}

struct CustomAlignmentDemoView: View {
    var body: some View {
        HStack(alignment: .alignCustom) {
            VStack {
                Image(systemName: "figure.walk.arrival").font(Font.system(size: 100))
                    .frame(height: 200)
//                    .alignmentGuide(.alignCustom) { dimension in
//                        dimension[VerticalAlignment.center] - 35
//                    }
            }
            VStack(alignment: .leading) {
                Text("Custom")
                    .font(.title)
                Text("Alignment")
            }
            .alignmentGuide(.alignCustom) { dimension in
                dimension[VerticalAlignment.center] + 35 // 上移让文字和图表顶部对齐
            }
        }
        .padding()
        .border(Color.gray, width: 2)
    }
}

#Preview {
    CustomAlignmentDemoView()
}
