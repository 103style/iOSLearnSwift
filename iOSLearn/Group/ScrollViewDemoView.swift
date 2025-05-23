//
//  ScrollViewDemoView.swift
//  iOSLearn
//
//  教程： https://www.bilibili.com/video/BV187E3zLEbi?spm_id_from=333.788.player.switch&vd_source=2134ba8bdd139f2fa3bce12adb23e884&p=2
//  doc: https://developer.apple.com/documentation/swiftui/scrollview
//
//  1. ScrollView 滚动视图，默认垂直方向；ScrollView(.horizontal)：水平滚动
//     // .scrollTargetBehavior(.paging) // 逐页滚动, 不管每页有多少子视图
//     // .scrollTargetBehavior(.viewAligned) // 根据子视图进行滚动，最小滑动1个子视图
//
//  2. LazyHStack、LazyVStack 水平、垂直懒加载,
//      .containerRelativeFrame(.horizontal) // 每个子view撑满容器宽度
//      .containerRelativeFrame(.vertical)   // 每个子view撑满容器高度
//      .containerRelativeFrame(.horizontal, count: 2, span: 1, spacing: 0)
//      //  count  父容器被划分的段数或单元数
//      //  span   视图需要占据多少个由count划分的单元
//      // spacing 控制视图之间的间距
//
//  Created by kempluo on 2025/5/23.
//

import SwiftUI

struct ScrollViewDemoView: View {
    @Environment(GroupApplicationData.self) private var shareData

    @State private var inputText: String = ""

    var body: some View {
        ScrollView { // 滚动视图, 默认垂直滚动
            LazyVStack(spacing: 10) { // 懒加载
                TextField("insert something", text: $inputText).textFieldStyle(.roundedBorder)

                // 水平滚动
                Text("1.水平滚动").frame(maxWidth: .infinity, alignment: .leading)
                ScrollView(.horizontal) {
                    LazyHStack(spacing: 0) {
                        ForEach(shareData.books) { book in
                            CellBook(book: book)
                                // 占满容器水平方向
                                .containerRelativeFrame(.horizontal)
                        }
                    }
                }

                // ------------------------------------------------------------

                // 水平滚动 每次滑动滑动2个子视图
                Text("2.水平滚动，每次滚动一页").frame(maxWidth: .infinity, alignment: .leading)
                ScrollView(.horizontal) {
                    LazyHStack(spacing: 0) {
                        ForEach(shareData.books) { book in
                            CellBook(book: book)
                                // 占满容器水平方向
//                                .containerRelativeFrame(.horizontal)
                                // 占满容器水平方向, 每页显示2列, 每次滑动滑动2个子视图
                                .containerRelativeFrame(.horizontal, count: 2, span: 1, spacing: 0)
                        }
                    }
                }
                .scrollTargetBehavior(.paging) // 逐页滚动

                // ------------------------------------------------------------

                // 水平滚动 最小滑动1个子视图
                Text("3.水平滚动，每次最小滚动一个视图").frame(maxWidth: .infinity, alignment: .leading)
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(spacing: 0) {
                        ForEach(shareData.books) { book in
                            CellBook(book: book)
                                // 占满容器水平方向, 每页显示2列
                                .containerRelativeFrame(.horizontal, count: 2, span: 1, spacing: 0)
                        }
                    }
                    .scrollTargetLayout() // 根据子视图进行滚动，最小滑动1个子视图
                }
                .scrollTargetBehavior(.viewAligned) // 根据子视图进行滚动，最小滑动1个子视图

                Text("4.垂直滚动").frame(maxWidth: .infinity, alignment: .leading)
                // 垂直滚动
                ForEach(shareData.books) { book in
                    CellBook(book: book)
//                        .containerRelativeFrame(.vertical) // 占满屏幕
//                        .containerRelativeFrame(.vertical, count: 4, spacing: 0)
                }

            }.padding()
        }
        .scrollDismissesKeyboard(.immediately) // 滚动视图 立即关闭软键盘
        .scrollIndicatorsFlash(onAppear: true)
    }

    private func getView() -> some View {
        ForEach(shareData.books) { book in
            CellBook(book: book)

            Divider()
        }
    }
}

struct CellBook: View {
    let book: Book

    var body: some View {
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
    }
}

#Preview {
    ScrollViewDemoView()
        .environment(GroupApplicationData.shared)
}
