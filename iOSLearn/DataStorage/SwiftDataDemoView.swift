//
//  SwiftDataDemoView.swift
//  iOSLearn
//
//  Created by kempluo on 2025/6/16.
//

import SwiftData
import SwiftUI

struct SwiftDataDemoView: View {
    @Environment(FoodStorageManage.self) private var foots
    @Environment(\.modelContext) var dbContect
    @Query var listFood: [Food]

    private let addBtn = "Add"

    var body: some View {
        @Bindable var appdata = foots

        NavigationStack(path: $appdata.viewPath) {
            List(listFood) { food in
                FoodView(food: food)
                    .listRowSeparator(.hidden) // 隐藏分割线
            }
            .listStyle(.plain)
            .navigationTitle("Foods")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(value: addBtn, label: {
                        Image(systemName: "plus")
                    })
                }
            }
            .navigationDestination(for: String.self, destination: { viewID in
                if viewID == addBtn {
                    AddBook()
                }
            })
        }
    }
}

private struct FoodView: View {
    @Environment(\.modelContext) var dbContext

    let food: Food

    @State private var openDialog: Bool = false

    var body: some View {
        VStack(spacing: 10) {
            AsyncImage(url: food.coverUrl, content: { image in
                image
                    .resizable()
                    .scaledToFit()
            }, placeholder: {
                ProgressView()
            })
            Text(food.name)
                .bold()
            Text(food.displayPrice)

            Divider()
                .background(Color.gray.opacity(0.5))
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 200)
        .onTapGesture {
            openDialog = true
        }
        .confirmationDialog("Name", isPresented: $openDialog, actions: {
            Button("Delete", role: .destructive, action: {
                dbContext.delete(food)
                try? dbContext.save()
            })
            Button("Cancel", role: .cancel, action: {})
        }, message: {
            Text("Are you sure to delete the food form menu?")
                .bold()
        })
    }
}

private struct AddBook: View {
    @Environment(FoodStorageManage.self) private var footManage
    @Environment(\.modelContext) var dbContext

    @State private var nameInput: String = ""
    @State private var coverInput: String = ""
    @State private var priceInput: String = ""

    var body: some View {
        VStack(alignment: .trailing, spacing: 10) {
            TextField("Insert food name", text: $nameInput)
                .textFieldStyle(.roundedBorder)

            TextField("Insert food cover", text: $coverInput)
                .textFieldStyle(.roundedBorder)

            TextField("Insert food price", text: $priceInput)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.numbersAndPunctuation)

            Button("Save") {
                addFoodToMenu()
            }
            .buttonStyle(.borderedProminent)

            Spacer()
        }
    }

    private func addFoodToMenu() {
        let name = nameInput.trimmingCharacters(in: .whitespaces)
        let cover = coverInput.trimmingCharacters(in: .whitespaces)
        let priceValue = priceInput.trimmingCharacters(in: .whitespaces)
        var price = 0.0
        if let t = Double(priceValue) {
            price = t
        }
        let newFood = Food(name: name, price: price, cover: cover)
        dbContext.insert(newFood)
        try? dbContext.save()
        footManage.viewPath.removeLast()
    }
}

#Preview {
    SwiftDataDemoView()
        .environment(FoodStorageManage.shared)
        .modelContainer(for: [Food.self], inMemory: true)
}
