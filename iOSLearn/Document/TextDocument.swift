//
//  TextDocument.swift
//  iOSLearn
//
//  教程：https://www.bilibili.com/video/BV187E3zLEbi?p=75
//
//  Created by kempluo on 2025/6/17.
//

import SwiftUI
import UniformTypeIdentifiers

struct TextDocument: FileDocument {
    static let readableContentTypes: [UTType] = [.plainText]
    
    var documentText: String
    
    init() {
        documentText = ""
    }
    
    init(configuration: ReadConfiguration) throws {
        if let data = configuration.file.regularFileContents {
            if let text = String(data: data, encoding: .utf8) {
                documentText = text
            } else {
                throw CocoaError(.fileReadCorruptFile)
            }
        } else {
            throw CocoaError(.fileReadCorruptFile)
        }
    }
    
    
    func fileWrapper(configuration: WriteConfiguration) throws -> FileWrapper {
        let data = documentText.data(using: .utf8)
        let wrapper = FileWrapper(regularFileWithContents: data!)
        return wrapper
    }
}
