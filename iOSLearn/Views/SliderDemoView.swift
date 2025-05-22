//
//  SliderDemoView.swift
//  iOSLearn
//
//  https://developer.apple.com/documentation/swiftui/slider
//  类似Android的 SeekBar
//
//  Created by kempluo on 2025/5/22.
//

import SwiftUI

struct SliderDemoView: View {
    @State private var curValue: Float = 5

    @State private var textActive: Bool = false

    var body: some View {
        VStack(spacing: 10) {
            Text("Current value: \(curValue.formatted(.number.precision(.fractionLength(0))))")
                .padding()
                .background(Color(textActive ? .blue : .red))
                .padding(.top, 4)
                .foregroundColor(.white)

            // in : 范围 只能是闭区间
            // step 变化的最小值
            Slider(value: $curValue, in: 0 ... 10, step: 1.0)

            Slider(value: $curValue, in: 0 ... 10, step: 1.0, onEditingChanged: {
                // onEditingChanged 滑动滑动的监听 滑动时 $0:true  停止时 $0:false
                print("onEditingChanged \($0)")
                self.textActive = $0
            })

            Spacer()
        }
    }
}

#Preview {
    SliderDemoView()
}
