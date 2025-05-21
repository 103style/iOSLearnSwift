//
//  CustomItemView.swift
//  iOSLearn
//
//  Created by kempluo on 2025/5/20.
//

import SwiftUI

struct CustomItemView: View {
    let iconName: String
    let name: String
    let des: String

    var body: some View {
        HStack(alignment: .center) {
            Image(systemName: iconName)
                .font(Font.system(size: 48))
                .foregroundColor(.blue)

            VStack(alignment: .leading, spacing: 4) {
                Text(name).font(.title)
                Text(des).font(Font.system(size: 14)).foregroundColor(.gray)
            }

            Spacer()
        }
        .padding()
    }

    init(iconName: String, name: String, des: String) {
        self.iconName = iconName
        self.name = name
        self.des = des
    }
}

#Preview {
    CustomItemView(iconName: "mappin.square", name: "QQ飞车", des: "小明：你在做什么")
}
