//
//  ExpandListDemoView.swift
//  iOSLearn
//
//  教程：https://www.bilibili.com/video/BV187E3zLEbi?p=10
//
//  Created by kempluo on 2025/5/26.
//

import SwiftUI

struct ExpandListDemoView: View {
    @Environment(GroupApplicationData.self) private var shareData

    var body: some View {
        List(shareData.expandDatas, children: \.childs) { item in
            Text(item.title)
        }
        .listStyle(.automatic)
    }
}

#Preview {
    ExpandListDemoView()
        .environment(GroupApplicationData.shared)
}
