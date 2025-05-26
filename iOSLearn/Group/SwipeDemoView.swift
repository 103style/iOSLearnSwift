//
//  SwipeDemoView.swift
//  iOSLearn
//
//  教程： https://www.bilibili.com/video/BV187E3zLEbi?p=7
//
//  Created by kempluo on 2025/5/26.
//

import SwiftUI

struct SwipeDemoView: View {
    @Environment(GroupApplicationData.self) private var shareData

    var body: some View {
        List(shareData.books) { book in
            CellBook(book: book)
                .swipeActions { // 设置侧滑的图标 和 点击相应
                    Button(role: .destructive, action: {
                        removeBook(book)
                    }, label: {
                        Image(systemName: "trash")
                    })
                }
        }
        .listStyle(.inset)
    }

    private func removeBook(_ book: Book) {
        if let index = shareData.books.firstIndex(where: { $0.id == book.id }) {
            print("\(book.title)")
            shareData.books.remove(at: index)
        }
    }
}

#Preview {
    SwipeDemoView()
        .environment(GroupApplicationData.shared)
}
