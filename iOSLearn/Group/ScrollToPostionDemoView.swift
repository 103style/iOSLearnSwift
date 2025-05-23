//
//  ScroolToPostionDemoView.swift
//  iOSLearn
//
//  教程： https://www.bilibili.com/video/BV187E3zLEbi?spm_id_from=333.788.player.switch&vd_source=2134ba8bdd139f2fa3bce12adb23e884&p=2
//  doc: https://developer.apple.com/documentation/swiftui/scrollview
//
//  滚动到指定位置
//
//  Created by kempluo on 2025/5/23.
//

import SwiftUI

struct ScrollToPostionDemoView: View {
    @Environment(GroupApplicationData.self) private var shareData

    @State private var position = ScrollPosition(idType: Book.ID.self)

    @State private var pageNumber: Int = 0

    var body: some View {
//        ScrollView(.horizontal, showsIndicators: false) {
//            LazyHStack(spacing: 0) {
//                ForEach(shareData.books) { book in
//                    CellBook(book: book)
//                        .containerRelativeFrame(.horizontal, count: 2, span: 1, spacing: 0)
//                    //                        .containerRelativeFrame(.horizontal)
//                    // 容器外的视图添加透明效果
//                        .scrollTransition(axis: .horizontal) { effect, phase in
//                            effect.opacity(phase.isIdentity ? 1 : 0) // 淡入淡出的过程
//                                .scaleEffect(phase.isIdentity ? 1 : 0.5) // 放大缩小的效果
//                        }.padding()
//                }
//
//                Button("< Back") {
//                    position.scrollTo(edge: .top)
//                }
//                .padding(.horizontal, 50)
//            }.scrollTargetLayout()
//        }
//        .scrollPosition($position)
//        .scrollTargetBehavior(.viewAligned)
//        .onChange(of: position, initial: true) {
//            if let selected = position.viewID as? UUID {
//                if let book = shareData.books.first(where: { $0.id == selected }) {
//                    print(book.title)
//                }
//            }
//        }
//

        ScrollViewReader { proxy in

            VStack {
                HStack {
                    Button("Scroll To First") {
                        if let first = shareData.books.first?.id {
                            proxy.scrollTo(first, anchor: .top)
                        }
                    }
                    .padding()
                    .background(.green)

                    Button("Scroll To End") {
                        if let last = shareData.books.last?.id {
                            proxy.scrollTo(last, anchor: .top)
                        }
                    }
                    .padding()
                    .background(.green)
                }
                .padding()
                .foregroundColor(.white)

                Text("pageNumber: \(pageNumber)")

                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(spacing: 0) {
                        ForEach(shareData.books) { book in
                            CellBook(book: book)
//                                .containerRelativeFrame(.horizontal, count: 1, span: 1, spacing: 0)
                                .containerRelativeFrame(.horizontal)
                                // 当View显示的部分超过threshold是，visible为true 否则为false
                                .onScrollVisibilityChange(threshold: 0.5) { visible in
                                    if visible {
                                        print("Visible! \(book.title)")
                                    } else {
                                        print("Gone!")
                                    }
                                }
                        }
                    }.scrollTargetLayout()
                }
                .scrollTargetBehavior(.viewAligned)
                // 计算当前位置
                .onScrollGeometryChange(for: Int.self, of: { geometry in
                    // geometry.contentOffset.x     当前内容的 x 坐标
                    // geometry.containerSize.width 容器宽度
                    let ave = geometry.contentOffset.x / geometry.containerSize.width
                    let pages = Int(ave.rounded()) + 1
                    return pages
                }, action: { _, new in
                    pageNumber = new
                })
            }
        }
    }
}

#Preview {
    ScrollToPostionDemoView()
        .environment(GroupApplicationData.shared)
}
