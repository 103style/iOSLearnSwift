//
//  FileDemoView.swift
//  iOSLearn
//
//  教程： https://www.bilibili.com/video/BV187E3zLEbi/?p=73
//
//  Created by kempluo on 2025/6/17.
//

import SwiftUI

struct FileDemoView: View {
    @Environment(FileApplicationData.self) private var fileData
    @State private var openSheet: Bool = false

    var body: some View {
        NavigationStack {
            VStack {
                if fileData.listOfFiles.isEmpty {
                    Text("No Files")
                    Spacer()
                } else {
                    List {
                        ForEach(fileData.listOfFiles) { file in
                            NavigationLink(value: file, label: {
                                Text(file.name)
                            })
                        }
                        .onDelete { indexSet in
                            for index in indexSet {
                                fileData.deleteFile(index: index)
                            }
                        }
                    }
                }
            }
            .padding()
            .navigationTitle("Files")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Add file") {
                        openSheet = true
                    }
                }
            }
            .navigationDestination(for: File.self, destination: { file in
                ShowFile(file: file)
            })
            .sheet(isPresented: $openSheet) {
                AddFileView()
            }
        }
    }
}

private struct AddFileView: View {
    @Environment(FileApplicationData.self) private var fileData

    @Environment(\.dismiss) private var dismiss

    @State private var nameInput: String = ""

    var body: some View {
        VStack {
            HStack {
                Text("Name:")
                TextField("Insert File Name", text: $nameInput)
                    .textFieldStyle(.roundedBorder)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
            }.padding(.top, 25)

            HStack {
                Spacer()
                Button("Create") {
                    var fileName = nameInput.trimmingCharacters(in: .whitespaces)
                    if !fileName.isEmpty {
                        fileName += ".dat"
                        fileData.saveFile(name: fileName)
                        dismiss()
                    }
                }
            }
            Spacer()
        }.padding()
    }
}

private struct ShowFile: View {
    @Environment(FileApplicationData.self) private var fileData

    @State private var imageContent: UIImage?

    let file: File

    var body: some View {
        VStack {
            Text(file.name)
                .font(.title)
            if imageContent != nil {
                Image(uiImage: imageContent!)
                    .resizable()
                    .scaledToFit()
            } else {
                ProgressView()
            }
            Spacer()
        }
        .padding()
        .navigationTitle("File Detail")
        .navigationBarTitleDisplayMode(.inline)
        .toolbarTitleDisplayMode(.inline)
        .task {
            imageContent = fileData.loadFile(name: file.name)
        }
    }
}

#Preview {
    FileDemoView()
        .environment(FileApplicationData.shared)
}
