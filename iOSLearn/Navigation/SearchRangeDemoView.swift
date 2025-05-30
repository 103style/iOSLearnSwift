//
//  SearchRangeDemoView.swift
//  iOSLearn
//
//  教程：https://www.bilibili.com/video/BV187E3zLEbi?p=19
//
//  Created by kempluo on 2025/5/30.
//

import SwiftUI

enum Scopes {
    case title, authoor
}

struct SearchRangeDemoView: View {
    @Environment(GroupApplicationData.self) private var shareData

    @State private var searchTerm: String = ""

    @State private var searchScope: Scopes = .title

    var body: some View {
        // 设置搜索范围示例
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
        .searchScopes($searchScope, scopes: {
            Text("title").tag(Scopes.title)
            Text("author").tag(Scopes.authoor)
        })
        // 监听搜索输入变化
        .onChange(of: searchTerm, initial: false) { _, _ in
            search()
        }
        // 搜索范围变化
        .onChange(of: searchScope, initial: false) {
            print("searchScope change")
            search()
        }
    }

    private func search() {
        let search = searchTerm.trimmingCharacters(in: .whitespaces)
        shareData.filter(keyword: search, scope: searchScope)
    }
}

#Preview {
    SearchRangeDemoView()
        .environment(GroupApplicationData.shared)
}
