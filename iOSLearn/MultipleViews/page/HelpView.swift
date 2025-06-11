//
//  HelpView.swift
//  iOSLearn
//
//  Created by kempluo on 2025/6/11.
//

import SwiftUI

struct HelpView: View {
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        HStack(spacing: 10) {
            Text("Hello, World!")

            Button(action: {
                dismiss()
            }, label: {
                Text("X")
            })
        }
        .frame(width: 300, height: 300)
        .background(Color.gray)
    }
}

#Preview {
    HelpView()
}
