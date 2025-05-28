//
//  NavigationSearchDemoView.swift
//  iOSLearn
//
//  教程：https://www.bilibili.com/video/BV187E3zLEbi?p=19
//
//  Created by kempluo on 2025/5/27.
//

import SwiftUI

struct NavigationSearchDemoView: View {
    @Environment(GroupApplicationData.self) private var shareData

    @State private var searchTerm: String = ""

    @FocusState private var isFocused: Bool

    var body: some View {
//        NavigationStack {
//            List(shareData.filterBooks) { book in
//                CellBook(book: book)
//            }
//            .listStyle(.inset)
//            .navigationTitle(Text("Books"))
//            .navigationBarTitleDisplayMode(.inline)
//        }
//        // 显示搜索框
//        .searchable(text: $searchTerm, prompt: Text("Insert title"))
//        // 监听搜索输入变化
//        .onChange(of: searchTerm, initial: false) { _, value in
//            let search = value.trimmingCharacters(in: .whitespaces)
//            shareData.filter(keyword: search)
//        }

        // 点击搜索框的时候出发键盘弹出
//        NavigationStack {
//            List {
//                if !isFocused {
//                    Button("Search") {
//                        isFocused = true // 点击出发搜索框获取焦点
//                    }.padding()
//                }
//
//                ForEach(shareData.filterBooks) { book in
//                    CellBook(book: book)
//                }
//            }
//            .listStyle(.inset)
//            .navigationTitle(Text("Books"))
//            .navigationBarTitleDisplayMode(.inline)
//        }
//        // 显示搜索框
//        .searchable(text: $searchTerm, prompt: Text("Insert title"))
//        // 搜索焦点修饰符
//        .searchFocused($isFocused)
//        // 监听搜索输入变化
//        .onChange(of: searchTerm, initial: false) { _, value in
//            let search = value.trimmingCharacters(in: .whitespaces)
//            shareData.filter(keyword: search)
//        }
//        .onSubmit(of: .search){
//            doSearch()
//        }
//
//
        // 手动触发搜索
        NavigationStack {
            List {
                if !isFocused {
                    Button("Search") {
                        isFocused = true // 点击出发搜索框获取焦点
                    }.padding()
                }

                ForEach(shareData.filterBooks) { book in
                    CellBook(book: book)
                }
            }
            .listStyle(.inset)
            .navigationTitle(Text("Books"))
            .navigationBarTitleDisplayMode(.inline)
        }
        // 显示搜索框
        .searchable(text: $searchTerm, prompt: Text("Insert title"))
        // 搜索焦点修饰符
        .searchFocused($isFocused)
        // 监听搜索输入变化
        .onChange(of: searchTerm, initial: false) { _, value in
            // 为空的时候显示自动触发搜索
            if value.isEmpty {
                doSearch()
            }
        }
        // 点击键盘提交的时候才搜索
        .onSubmit(of: .search) {
            doSearch()
        }
    }

    private func doSearch() {
        shareData.filter(keyword: searchTerm)
    }
}

#Preview {
    NavigationSearchDemoView()
        .environment(GroupApplicationData.shared)
}
