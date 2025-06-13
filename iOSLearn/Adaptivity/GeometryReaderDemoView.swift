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
    @State private var size: CGSize = .zero

    var body: some View {
        GeometryReader { geometry in
            let isPortrait = geometry.size.height > geometry.size.width

            let msg = isPortrait ? "Portrait" : "LandScape"

            let globalX = Int(geometry.frame(in: .global).origin.x)
            let globalY = Int(geometry.frame(in: .global).origin.y)

            HStack {
                VStack {
                    Text(msg)

                    Text("\(globalX) - \(globalY)")

                    Text("\(Int(size.width)) - \(Int(size.height))")
                }

                Image(systemName: "macbook.gen1")
                    .resizable()
                    .scaledToFit()
                    .frame(width: geometry.size.width/2, height: geometry.size.height/4)
                    .background(GeometryReader { geo in
                        Color.clear
                            .onAppear {
                                size = geo.size
                            }

                    })

            }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
        }
        .frame(width: 200, height: 250)
        .ignoresSafeArea()
        .background(.red)
    }
}

#Preview {
    GeometryReaderDemoView()
}
