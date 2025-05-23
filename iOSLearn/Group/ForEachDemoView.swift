//
//  ListDemoView.swift
//  iOSLearn
//
//  教程： https://www.bilibili.com/video/BV187E3zLEbi/?spm_id_from=333.788.comment.all.click&vd_source=2134ba8bdd139f2fa3bce12adb23e884
//
//  doc: https://developer.apple.com/documentation/swiftui/foreach
//
//  Created by kempluo on 2025/5/23.
//

import SwiftUI

struct ForEachDemoView: View {
    let list: [String] = ["A", "B", "C", "D"]

    @Environment(GroupApplicationData.self) private var listData

    var body: some View {
        VStack(spacing: 10) {
            ForEach(1 ... 3, id: \.self) { value in
                Text("Value \(value)")
            }

            // 添加分割线
            ForEach(list, id: \.self) { value in
                Text("Value \(value)")

                Divider() // 分割线
            }

            // 使用实现Identifiable协议的数据
            ForEach(listData.books) { book in
                HStack(alignment: .center, spacing: 10) {
                    Image(systemName: book.cover)
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.accentColor)
                        .frame(width: 56, height: 56)

                    VStack(alignment: .leading) {
                        Text(book.title)
                            .font(.title)
                            .bold()
                            .foregroundColor(.primary)

                        Text(book.author)

                        Text(book.displayYear)
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }

                    Spacer()
                }

                Divider()
            }

            Spacer()
        }.padding()
    }
}

#Preview {
    ForEachDemoView()
        .environment(GroupApplicationData.shared)
}
