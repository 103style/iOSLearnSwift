//
//  TabPageDemoView.swift
//  iOSLearn
//
//  教程： https://www.bilibili.com/video/BV187E3zLEbi?p=30
//
//  Created by kempluo on 2025/6/11.
//

import SwiftUI

struct TabPageDemoView: View {
    var body: some View {
        TabView {
            Tab(content: {
                Text("Screen One")
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                    .background(.orange)
            })

            Tab(content: {
                Text("Screen Two")
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                    .background(.blue)
            })
        }
        .tabViewStyle(.page)
        .indexViewStyle(.page(backgroundDisplayMode: .always))
        .ignoresSafeArea(.all)
    }
}

#Preview {
    TabPageDemoView()
}
