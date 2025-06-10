//
//  CellBookDetailView.swift
//  iOSLearn
//
//  Created by kempluo on 2025/6/10.
//

import SwiftUI

struct CellBookDetailView: View {
    @Environment(GroupApplicationData.self) private var shareData

//    @Environment(\.dismiss) private var dismiss

//    @Binding var viewPath: NavigationPath

    let book: Book

    var body: some View {
        VStack(spacing: 20) {
            Text(book.title)
                .font(.title)
            Text(book.author)
            Image(systemName: book.cover)
                .resizable()
                .scaledToFit()
        }
        .padding()
        .navigationTitle("Book Detail")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    // 1.利用系统属性
                    // dismiss()

                    // 2.传入viewPath移除导航栈最后一个
//                    viewPath.removeLast()

                    // 3.统一的viewPath
                    shareData.viewPath.removeLast()
                }, label: {
                    Image(systemName: "chevron.left")
                })
            }
        }
    }
}

#Preview {
    @Previewable @State var navigation = NavigationPath()

    NavigationStack {
//        CellBookDetailView(book: GroupApplicationData.shared.books[0])
//        CellBookDetailView(viewPath: $navigation, book: GroupApplicationData.shared.books[0])
        CellBookDetailView(book: GroupApplicationData.shared.books[0])
            .environment(GroupApplicationData.shared)
    }
}
