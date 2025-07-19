//
//  ListVM.swift
//  ToDoSwiftUI
//
//  Created by Adrian Mazek on 19/07/2025.
//

import Foundation
import Observation

@Observable
final class ListVM {
    var items: [ItemModel] = []
    
    func getItems(){
        let newItems = [
            ItemModel(title: "test", isCompleted: true),
            ItemModel(title: "test", isCompleted: true),
            ItemModel(title: "test", isCompleted: false),
            ItemModel(title: "test", isCompleted: false),
            ItemModel(title: "test", isCompleted: true)
        ]
        self.items = newItems
    }
    
    func deleteItems(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }
    
    func move(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String) {
        items.append(ItemModel(title: title, isCompleted: false))
        print("dodano")
        print(items)
    }
    
    func updateItem(item: ItemModel){
        if let index = items.firstIndex(where: {$0.id == item.id}){
            items[index] = item.updateCompletin()
        }
            
    }
}
