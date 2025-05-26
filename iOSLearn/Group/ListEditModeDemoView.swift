//
//  ListEditModeDemoView.swift
//  iOSLearn
//
//  教程: https://www.bilibili.com/video/BV187E3zLEbi?p=6
//  doc: https://developer.apple.com/documentation/swiftui/list
//
//  Created by kempluo on 2025/5/26.
//

import SwiftUI

struct ListEditModeDemoView: View {
    @Environment(GroupApplicationData.self) private var shareData

    @State private var selcetedRow: Book.ID? = nil

    @State private var selcetedRows: Set<Book.ID> = []

    @State private var editActive: Bool = false

    var body: some View {
        VStack {
            // 1.侧滑、移动位置
            EditButton() // 点击会激活编辑模式

            List {
                ForEach(shareData.books) { book in
                    CellBook(book: book)
                }
                // 左滑删除
                .onDelete { indexes in
                    print("\(indexes.startIndex) - \(indexes.endIndex)")
                    shareData.books.remove(atOffsets: indexes)
                }
                // 移动位置
                .onMove { source, target in
                    print("source:\(source) - target:\(target)")
                    shareData.books.move(fromOffsets: source, toOffset: target)
                }
            }
            .listStyle(.inset)

            // 2. 单选删除， 监听List单选选中的内容
//            HStack {
//                Spacer()
//                Button(action: {
//                    removeSelected()
//                }, label: {
//                    Image(systemName: "trash")
//                })
//                .disabled(selcetedRow == nil ? true : false)
//                .padding()
//            }
//            List(selection: $selcetedRow) {
//                ForEach(shareData.books) { book in
//                    CellBook(book: book)
//                }
//            }
//            .listStyle(.plain)

            // 3.多选 删除
//            HStack {
//                EditButton()
//                Spacer()
//                Button(action: {
//                    removeSelectedList()
//                }, label: {
//                    Image(systemName: "trash")
//                })
//                .disabled(selcetedRows.isEmpty ? true : false)
//            }.padding()
//            List(selection: $selcetedRows) {
//                ForEach(shareData.books) { book in
//                    CellBook(book: book)
//                }
//            }
//            .listStyle(.plain)

            // 4.自定义编辑模式
//            HStack {
//                Button(editActive ? "Done" : "Edit") {
//                    editActive.toggle()
//                }
//                Spacer()
//                Button(action: {
//                    removeSelectedList()
//                }, label: {
//                    Image(systemName: "trash")
//                })
//                .disabled(selcetedRows.isEmpty ? true : false)
//            }.padding()
//            List(selection: $selcetedRows) {
//                ForEach(shareData.books) { book in
//                    CellBook(book: book)
//                }
//            }
//            .listStyle(.plain)
//            .environment(\.editMode, .constant(editActive ? EditMode.active : EditMode.inactive))
        }
    }

    private func removeSelected() {
        if let index = shareData.books.firstIndex(where: { $0.id == selcetedRow }) {
            shareData.books.remove(at: index)
            selcetedRow = nil
        }
    }

    private func removeSelectedList() {
        var indexes = IndexSet()
        for item in selcetedRows {
            if let index = shareData.books.firstIndex(where: { $0.id == item }) {
                indexes.insert(index)
            }
        }
        shareData.books.remove(atOffsets: indexes)
        selcetedRows = []
    }
}

#Preview {
    ListEditModeDemoView()
        .environment(GroupApplicationData.shared)
}
