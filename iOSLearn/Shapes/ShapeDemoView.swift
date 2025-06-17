//
//  ShapeDemoView.swift
//  iOSLearn
//
//  教程：https://www.bilibili.com/video/BV187E3zLEbi?p=76
//
//  Created by kempluo on 2025/6/17.
//

import SwiftUI

struct ShapeDemoView: View {
    var body: some View {
        VStack {
            Rectangle()
                .fill(.blue)
                .frame(width: 100, height: 100)
                    
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .stroke(lineWidth: 5)
                .frame(width: 100, height: 100)
                
            Circle()
                .frame(width: 100, height: 100)
                    
            Ellipse()
                .frame(width: 100, height: 50)
                    
            Capsule()
                .frame(width: 100, height: 50)

            Spacer()
        }
    }
}

#Preview {
    ShapeDemoView()
}
