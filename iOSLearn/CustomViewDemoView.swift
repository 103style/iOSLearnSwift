//
//  CustomViewDemoView.swift
//  iOSLearn
//
//  自定义View
//
//  Created by kempluo on 2025/5/20.
//

import SwiftUI

struct CustomViewDemoView: View {
    var body: some View {
        CustomItemView(iconName: "bicycle.circle.fill", name: "公路车骑行", des: "nice to meet you")
    }
}

#Preview {
    CustomViewDemoView()
}
