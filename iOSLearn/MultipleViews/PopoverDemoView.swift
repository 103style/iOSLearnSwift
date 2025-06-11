//
//  PopoverDemoView.swift
//  iOSLearn
//
//  教程：https://www.bilibili.com/video/BV187E3zLEbi?p=24
//
//  Created by kempluo on 2025/6/11.
//

import SwiftUI

struct PopoverDemoView: View {
    @State private var showPopover: Bool = false

    var body: some View {
        VStack {
            Button("Show popover") {
                showPopover = true
            }
            .popover(isPresented: $showPopover, arrowEdge: .bottom) {
                HelpView()
            }
            Spacer()
        }
        .font(.title)
    }
}

#Preview {
    PopoverDemoView()
}
