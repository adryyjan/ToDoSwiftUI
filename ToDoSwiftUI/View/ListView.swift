//
//  ListView.swift
//  ToDoSwiftUI
//
//  Created by Adrian Mazek on 19/07/2025.
//

import SwiftUI
import Observation

struct ListView: View {
    @Bindable var viewModel = ListVM()
    
    var body: some View {
        List {
            ForEach(viewModel.items) { item in
                ListRowView(item: item)
                    .onTapGesture {
                        withAnimation(.easeOut .speed(3.0)) {
                            viewModel.updateItem(item: item)
                        }
                    }
                    
            }
            .onDelete { index in
                viewModel.deleteItems(at: index)
            }
            .onMove { IndexSet, Int in
                viewModel.move(from: IndexSet, to: Int)
            }
            
            
            
        }
        .navigationTitle(Text("ToDo list 📝"))
        .navigationBarTitleDisplayMode(.inline)
        .listStyle(.sidebar)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                EditButton()
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink("Add") {
                    AddView(viewModel: viewModel)
                }}
        }
    }
    

}

#Preview {
    NavigationView {
        ListView()
    }
}


