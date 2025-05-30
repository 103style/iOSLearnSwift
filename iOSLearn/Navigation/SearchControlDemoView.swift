//
//  SearchControlDemoView.swift
//  iOSLearn
//
//  Created by kempluo on 2025/5/30.
//

import SwiftUI

struct SearchControlDemoView: View {
    @Environment(GroupApplicationData.self) private var shareData

    @State private var searchTerm: String = ""

    var body: some View {
        // 搜索建议示例
        NavigationStack {
            SearchableView()
                .navigationTitle(Text("Books"))
                .navigationBarTitleDisplayMode(.inline)
        }
        // 显示搜索框
        .searchable(text: $searchTerm, prompt: Text("Insert title"))
        // 监听搜索输入变化
        .onChange(of: searchTerm, initial: false) { _, value in
            let search = value.trimmingCharacters(in: .whitespaces)
            shareData.filter(keyword: search)
        }
    }
}

private struct SearchableView: View {
    @Environment(GroupApplicationData.self) private var shareData

    // 搜索状态
    @Environment(\.isSearching) var isSearching
    // 隐藏方法
    @Environment(\.dismissSearch) var dismissSearch

    var body: some View {
        List {
            if isSearching {
                Button("dismiss") {
                    dismissSearch()
                }.foregroundColor(.red)
            }
            ForEach(shareData.filterBooks) { book in
                CellBook(book: book)
            }
        }
        .listStyle(.inset)
    }
}

#Preview {
    SearchControlDemoView()
        .environment(GroupApplicationData.shared)
}
