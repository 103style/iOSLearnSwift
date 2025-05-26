//
//  PickerDemoView.swift
//  iOSLearn
//
//  教程： https://www.bilibili.com/video/BV187E3zLEbi?p=12
//  doc:  https://developer.apple.com/documentation/swiftui/picker
//
//  Created by kempluo on 2025/5/26.
//

import SwiftUI

struct PickerDemoView: View {
    @State private var selectedValue: String = ""

    let cityies: [String] = ["Shenzhen", "Shanghai", "Beijing"]

    var body: some View {
        VStack {
            Picker("Cities automatic or menu", selection: $selectedValue) {
                ForEach(cityies, id: \.self) { item in
                    Text(item)
                }
            }
            .pickerStyle(.automatic)
//            .pickerStyle(.menu) // same
            .padding()

            Picker("Cities segmented or palette", selection: $selectedValue) {
                ForEach(cityies, id: \.self) { item in
                    Text(item)
                }
            }
            .pickerStyle(.segmented)
//            .pickerStyle(.palette) // same
            .padding()

            Picker("Cities wheel or inline", selection: $selectedValue) {
                ForEach(cityies, id: \.self) { item in
                    Text(item)
                }
            }
            .pickerStyle(.wheel)
//            .pickerStyle(.inline) // same
            .padding()

            Picker("Cities navigationLink", selection: $selectedValue) {
                ForEach(cityies, id: \.self) { item in
                    Text(item)
                }
            }
            .pickerStyle(.navigationLink)
            .padding()

        }.onAppear {
            selectedValue = cityies[0]
        }
    }
}

#Preview {
    PickerDemoView()
}
