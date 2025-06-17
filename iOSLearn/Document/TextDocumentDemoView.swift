//
//  DocumentDemoView.swift
//  iOSLearn
//
//  教程：https://www.bilibili.com/video/BV187E3zLEbi?p=73
//  doc: https://developer.apple.com/documentation/swiftui/documents
//
//  Created by kempluo on 2025/6/17.
//

import SwiftUI

struct TextDocumentDemoView: View {
    @Binding var document: TextDocument

    var body: some View {
        GroupBox("Editor") {
            TextEditor(text: $document.documentText)
        }
        .padding()
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    @Previewable @State var document = TextDocument()
    TextDocumentDemoView(document: $document)
}
