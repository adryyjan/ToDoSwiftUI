//
//  ListRowView.swift
//  ToDoSwiftUI
//
//  Created by Adrian Mazek on 19/07/2025.
//

import SwiftUI

struct ListRowView: View {
    let item: ItemModel
    
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundStyle(item.isCompleted ? .green : .red)
                .foregroundStyle(.primary)
            Text("\(item.title)")
            Spacer()
        }
        .font(.title2)
        .padding(.vertical,8)
    }
}
#Preview {
    ListRowView(item: ItemModel(title: "test", isCompleted: true))
}
