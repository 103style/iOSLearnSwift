//
//  SearchSuggestDemoView.swift
//  iOSLearn
//
//  教程：https://www.bilibili.com/video/BV187E3zLEbi?p=19
//
//  Created by kempluo on 2025/5/30.
//

import SwiftUI

struct SearchSuggestDemoView: View {
    @Environment(GroupApplicationData.self) private var shareData

    @State private var searchTerm: String = ""

    var body: some View {
        // 搜索建议示例
        NavigationStack {
            List(shareData.filterBooks) { book in
                CellBook(book: book)
            }
            .listStyle(.inset)
            .navigationTitle(Text("Books"))
            .navigationBarTitleDisplayMode(.inline)
        }
        // 显示搜索框
        .searchable(text: $searchTerm, prompt: Text("Insert title"))
        .searchSuggestions {
            // 显示建议视图
            ForEach(shareData.filterBooks) { item in
                Text("\(item.title) - \(item.author)")
                    .searchCompletion(item.title)
            }
        }
        // 监听搜索输入变化
        .onChange(of: searchTerm, initial: false) { _, value in
            let search = value.trimmingCharacters(in: .whitespaces)
            shareData.filter(keyword: search)
        }
    }
}

#Preview {
    SearchSuggestDemoView()
        .environment(GroupApplicationData.shared)
}
