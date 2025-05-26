//
//  SectionDemoView.swift
//  iOSLearn
//
//  教程: https://www.bilibili.com/video/BV187E3zLEbi?p=5
//  doc: https://developer.apple.com/documentation/swiftui/section
//
//  Created by kempluo on 2025/5/26.
//

import SwiftUI

struct SectionDemoView: View {
    var body: some View {
        VStack {
            Section("Title") {
                HStack {
                    Text("Left")

                    Spacer()

                    Text("Right")
                }
            }
            .headerProminence(.increased)
            .font(.largeTitle)

            Divider()

            Section(header: Text("Header")) {
                HStack {
                    Text("Left")

                    Spacer()

                    Text("Right")
                }
            }
            .headerProminence(.increased)
            .font(.largeTitle)

            Divider()

            Section(content: {
                Text("content")
            }, header: {
                Text("header")
            }, footer: {
                Text("footer")
            })
            .headerProminence(.increased)
            .font(.largeTitle)

            Spacer()
        }
    }
}

#Preview {
    SectionDemoView()
}
