//
//  ItemModel.swift
//  ToDoSwiftUI
//
//  Created by Adrian Mazek on 19/07/2025.
//

import Foundation

struct ItemModel: Identifiable{
    let id : UUID
    let title: String
    let isCompleted: Bool
    
    init(id: UUID = UUID(), title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func updateCompletin() -> ItemModel{
        return ItemModel(id: id, title: title, isCompleted: !isCompleted)
    }
}
