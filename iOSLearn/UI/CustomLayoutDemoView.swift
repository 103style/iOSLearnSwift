//
//  CustomLayoutDemoView.swift
//  iOSLearn
//
//  自定义布局
//
//  Created by kempluo on 2025/5/20.
//

import SwiftUI

struct CustomLayoutDemoView: View {
    @State private var selected: Bool = true

    var body: some View {
        let selectedLayout = selected ? AnyLayout(FileStructLayout()) : AnyLayout(VStackLayout(alignment: .leading))
        VStack(alignment: .leading) {
            Toggle(isOn: $selected, label: {
                Text(selected ? "Custom" : "Starand")
            }).padding(.bottom)

            selectedLayout {
                Group {
                    Text("First").padding(10).background(.red).cornerRadius(10)
                    Text("Second").padding(10).background(.red).cornerRadius(10)
                    Text("Third").padding(10).background(.red).cornerRadius(10)
                }.foregroundColor(.white)
            }
            Spacer()
        }
        .padding()
        .font(.title)
    }
}

struct FileStructLayout: Layout {
    let horSpace: CGFloat = 30
    let verSpace: CGFloat = 10

    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        let spaceWidthCount: CGFloat = if subviews.count > 0 {
            CGFloat(subviews.count - 1) * horSpace
        } else {
            0
        }
        var totalWitdth: CGFloat = 0
        var totalHeight: CGFloat = if subviews.count > 0 {
            CGFloat(subviews.count - 1) * verSpace
        } else {
            0
        }
        for view in subviews {
            let viewSize = view.sizeThatFits(.unspecified)
            totalWitdth = CGFloat.maximum(totalWitdth, viewSize.width)
            totalHeight += viewSize.height
        }
        return CGSize(width: totalWitdth + spaceWidthCount, height: totalHeight)
    }

    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        var posX: CGFloat = bounds.origin.x
        var posY: CGFloat = bounds.origin.y
        for (index, view) in subviews.enumerated() {
            if index > 0 {
                posX += horSpace
                posY += verSpace
            }
            view.place(at: CGPoint(x: posX, y: posY), proposal: .unspecified)
            posY += view.sizeThatFits(.unspecified).height
        }
    }
}

#Preview {
    CustomLayoutDemoView()
}
