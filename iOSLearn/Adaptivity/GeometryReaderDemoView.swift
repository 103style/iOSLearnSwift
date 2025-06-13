//
//  GeometryReaderDemoView.swift
//  iOSLearn
//
//  教程：https://www.bilibili.com/video/BV187E3zLEbi/?p=34
//
//  Created by kempluo on 2025/6/13.
//

import SwiftUI

struct GeometryReaderDemoView: View {
    var body: some View {
        GeometryReader { geometry in
            let isPortrait = geometry.size.height > geometry.size.width

            let msg = isPortrait ? "Portrait" : "LandScape"

            HStack {
                Text(msg)
            }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)

        }.ignoresSafeArea()
    }
}

#Preview {
    GeometryReaderDemoView()
}
