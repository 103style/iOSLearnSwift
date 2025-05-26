//
//  ListDemoView.swift
//  iOSLearn
//
//  教程: https://www.bilibili.com/video/BV187E3zLEbi?p=4
//  doc: https://developer.apple.com/documentation/swiftui/list
//
//  Created by kempluo on 2025/5/26.
//

import SwiftUI

struct ListDemoView: View {
    @Environment(GroupApplicationData.self) private var shareData

    let bgColors = [.white, Color(white: 0.95)]

    var body: some View {
        // list 相关与 ScrollView + ForEach
        List(shareData.books) { book in
            let index = shareData.books.firstIndex(where: { $0.id == book.id }) ?? 0

            CellBook(book: book)
                .listRowInsets(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)) // 改变布局位置
                .listRowBackground(index % 2 == 0 ? bgColors[0] : bgColors[1]) // 背景
                .listRowSeparator(.hidden) // 隐藏分割线
        }
//        .listStyle(.automatic)
//        .listStyle(.grouped)
//        .listStyle(.sidebar)
        .listStyle(.inset)
//        .listStyle(.insetGrouped)
//        .listStyle(.plain)

        // ----------------------------------------------------------------------
//        List {
//            // 添加一起滑动的header
//            HStack {
//                Image(systemName: "fan.oscillation")
//                Spacer()
//                Text("fan.oscillation")
//            }.font(.largeTitle)
//
//            ForEach(shareData.books) { book in
//                CellBook(book: book)
//            }
//        }.listStyle(.plain)
    }
}

#Preview {
    ListDemoView()
        .environment(GroupApplicationData.shared)
}
