//
//  TipsDemoView.swift
//  iOSLearn
//
//  教程：https://www.bilibili.com/video/BV187E3zLEbi?p=27
//
//  Created by kempluo on 2025/6/11.
//

import SwiftUI
import TipKit // 提示框架

struct TipButton: Tip {
    var title: Text {
        Text("Press to save")
    }

    var message: Text? {
        Text("Press this button to save your progress.")
    }

    var actions: [Action] {
        [Action(id: "tipButton", title: "More Into")]
    }
}

struct TipsDemoView: View {
    let btn = TipButton()

    var body: some View {
        VStack {
            Button("Save") {
                print("Action performed")
                btn.invalidate(reason: .actionPerformed)
            }
            .popoverTip(btn, action: { action in
                if action.id == "tipButton" {
                    print("help")
                }
            })
        }
        .padding()
        .task {
            try? Tips.configure([
                .displayFrequency(.immediate),
//                .datastoreLocation(.applicationDefault)
            ])
        }

        Spacer()
    }
}

#Preview {
    TipsDemoView()
}
