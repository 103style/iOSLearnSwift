//
//  ShapeAsBgDemoView.swift
//  iOSLearn
//
//  Created by kempluo on 2025/6/17.
//

import SwiftUI

struct ShapeAsBgDemoView: View {
    @State private var active: Bool = false
    var body: some View {
        VStack {
            Button(action: {
                active.toggle()
            }, label: {
                Text(active ? "Active" : "Inactive")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding(.horizontal, 30)
                    .padding(.vertical, 10)
            })
//            .background(active ? .blue : .gray)
            .background(
                Capsule()
                    .fill(active ? .blue : .gray)
            )
        }
    }
}

#Preview {
    ShapeAsBgDemoView()
}
