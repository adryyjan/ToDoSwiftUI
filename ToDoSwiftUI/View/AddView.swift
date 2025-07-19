//
//  AddView.swift
//  ToDoSwiftUI
//
//  Created by Adrian Mazek on 19/07/2025.
//

import SwiftUI
import Observation

struct AddView: View {
    @State private var newTask: String = ""
    @Bindable var viewModel: ListVM
    @Environment(\.presentationMode) var presentationMode
    
    @State var allertTitle: String = ""
    @State var isAllertShowing: Bool = false
    
    
    var body: some View {
        ScrollView {
            TextField("Add task here...", text: $newTask)
                .padding()
                .frame(height: 55)
                .background(.tertiary.opacity(0.5))
                .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                .padding(.all, 8)
            
            Button {
                if textIsGood() {
                    saveButtonPredded()
                }
                
            } label: {
                Text("Save".uppercased())
                    .foregroundStyle(.white)
                    .font(.headline)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    
                    .background(Color.accentColor)
                    .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                    .padding(.all, 8)
                
            }
            
                
        }
        .navigationTitle("Add an Item 🖊️ ")
        .alert(isPresented: $isAllertShowing) {
            showAlert()
        }
        .navigationBarTitleDisplayMode(.large)

    }
    
    private func saveButtonPredded() {
        viewModel.addItem(title: newTask)
        presentationMode.wrappedValue.dismiss()
    }
    
    private func textIsGood() -> Bool {
        if newTask.count < 3 {
            allertTitle = "Task must be at least 3 characters long"
            isAllertShowing.toggle()
            return false
        }
        return true
    }
    private func showAlert() -> Alert {
        return Alert(title: Text(allertTitle))
    }
}


