//
//  AsyncImageDemoView.swift
//  iOSLearn
//
//  教程：https://www.bilibili.com/video/BV187E3zLEbi/?p=48
//  doc：https://developer.apple.com/documentation/swiftui/AsyncImage
//
//  Created by kempluo on 2025/6/16.
//

import SwiftUI

struct AsyncImageDemoView: View {
    let imageUrl = URL(string: "http://gips1.baidu.com/it/u=3874647369,3220417986&fm=3028&app=3028&f=JPEG&fmt=auto?w=720&h=1280")

    var body: some View {
        VStack {
            AsyncImage(url: imageUrl, content: { image in
                image
                    .resizable()
                    .scaledToFit()
            }, placeholder: {
                ProgressView()
                
            })
        }.padding()
    }
}

#Preview {
    AsyncImageDemoView()
}
