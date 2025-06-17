//
//  TextApplication.swift
//  iOSLearn
//
//  Created by kempluo on 2025/6/17.
//

import Observation
import SwiftUI

@Observable class TextApplicationData: @unchecked Sendable {
    @ObservationIgnored private var manager: FileManager
    @ObservationIgnored private var directories: [URL]?

    static let shared: TextApplicationData = .init()

    var textInFile: String = "" {
        didSet {
            if let docURL = directories?.first {
                let fileURL = docURL.appendingPathComponent("textData.bat")
                let filePath = fileURL.path
                if let textData = textInFile.data(using: .utf8, allowLossyConversion: true) {
                    manager.createFile(atPath: filePath, contents: textData, attributes: nil)
                }
            }
        }
    }

    private init() {
        manager = FileManager.default
        directories = manager.urls(for: .documentDirectory, in: .userDomainMask)

        if let docURL = directories?.first {
            let fileURL = docURL.appendingPathComponent("textdata.dat")
            let filePath = fileURL.path

            if manager.fileExists(atPath: filePath) {
                if let content = manager.contents(atPath: filePath) {
                    if let text = String(data: content, encoding: .utf8) {
                        textInFile = text
                    }
                }
            }
        }
    }
}
