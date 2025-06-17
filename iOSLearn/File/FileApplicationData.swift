//
//  FileApplicationData.swift
//  iOSLearn
//
//  Created by kempluo on 2025/6/17.
//

import Observation
import SwiftUI

struct File: Identifiable, Hashable {
    let id: UUID = .init()
    var name: String
}

@Observable class FileApplicationData: @unchecked Sendable {
    var listOfFiles: [File] = []
    @ObservationIgnored let manager: FileManager
    @ObservationIgnored let directories: [URL]?

    static let shared: FileApplicationData = .init()

    private init() {
        manager = FileManager.default
        directories = manager.urls(for: .documentDirectory, in: .userDomainMask)

        if let docURL = directories?.first {
            if let list = try? manager.contentsOfDirectory(atPath: docURL.path) {
                for name in list {
                    let newFile = File(name: name)
                    listOfFiles.append(newFile)
                }
            }
        }
    }

    func saveFile(name: String) {
        if let docURL = directories?.first {
            let newFileURL = docURL.appendingPathComponent(name)
            let path = newFileURL.path

            // 新添加的文件 默认保存 资源图片 Toronto
            if let contentData = UIImage(named: "Toronto")?.pngData() {
                if manager.createFile(atPath: path, contents: contentData, attributes: nil) {
                    let newFile = File(name: name)
                    listOfFiles.append(newFile)
                }
            }
        }
    }

    func loadFile(name: String) -> UIImage? {
        if let docURL = directories?.first {
            let fileURL = docURL.appendingPathComponent(name)
            let filePath = fileURL.path

            if manager.fileExists(atPath: filePath) {
                if let content = manager.contents(atPath: filePath) {
                    return UIImage(data: content)
                }
            }
        }
        return nil
    }

    func deleteFile(index: Int) {
        let file = listOfFiles[index]

        let name = file.name

        if let docURL = directories?.first {
            let fileURL = docURL.appendingPathComponent(name)
            do {
                try manager.removeItem(atPath: fileURL.path)
                listOfFiles.remove(at: index)
            } catch {
                print("File was not removed")
            }
        }
    }
}
