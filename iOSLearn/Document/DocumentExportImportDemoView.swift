//
//  DocumentExportDemoView.swift
//  iOSLearn
//
//  教程：https://www.bilibili.com/video/BV187E3zLEbi?p=73
//  doc: https://developer.apple.com/documentation/swiftui/documents
//  文档的导入导出示例
//
//  Created by kempluo on 2025/6/17.
//

import SwiftUI

struct DocumentExportImportDemoView: View {
    @State private var document = TextDocument()
    @State private var openExport: Bool = false
    @State private var openImport: Bool = false

    var body: some View {
        NavigationStack {
            GroupBox("Editor") {
                TextEditor(text: $document.documentText)
            }
            .padding()
            .navigationTitle("Document")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        openImport = true
                    }, label: {
                        Image(systemName: "square.and.arrow.down")
                    })
                }

                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        openExport = true
                    }, label: {
                        Image(systemName: "square.and.arrow.up")
                    })
                }
            }
            // 导出
            .fileExporter(isPresented: $openExport, document: document, contentType: .plainText, defaultFilename: "text document", onCompletion: { _ in
                print("document exported")
            })
            // 导入
            .fileImporter(isPresented: $openImport, allowedContentTypes: [.plainText]) { result in
                if let fileURL = try? result.get() {
                    if fileURL.startAccessingSecurityScopedResource() {
                        if let data = try? Data(contentsOf: fileURL) {
                            if let text = String(data: data, encoding: .utf8) {
                                document.documentText = text
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    DocumentExportImportDemoView()
}
