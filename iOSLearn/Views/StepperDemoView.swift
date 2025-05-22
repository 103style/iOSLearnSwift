//
//  StepperDemoView.swift
//  iOSLearn
//
//  https://developer.apple.com/documentation/swiftui/stepper
//
//  Created by kempluo on 2025/5/22.
//

import SwiftUI

struct StepperDemoView: View {
    @State private var curValue: Float = 0

    @State private var goingUp: Bool = false

    var body: some View {
        VStack(spacing: 10) {
            Text("Current Value: \(curValue.formatted(.number.precision(.fractionLength(0))))")

            Stepper("Counter step 1", value: $curValue, in: 0 ... 100)

            Stepper("Counter step 5", value: $curValue, in: 0 ... 100, step: 5)

            // 自定义样式
            HStack {
                Text("Current Value: \(curValue.formatted(.number.precision(.fractionLength(0))))")

                Image(systemName: goingUp ? "arrow.up" : "arrow.down").foregroundColor(goingUp ? .green : .red)

                Stepper("", onIncrement: {
                    curValue += 5
                    goingUp = true
                }, onDecrement: {
                    curValue -= 5
                    goingUp = false
                }).labelsHidden() // 去掉默认的试图
            }

            Spacer()
        }.padding()
    }
}

#Preview {
    StepperDemoView()
}
