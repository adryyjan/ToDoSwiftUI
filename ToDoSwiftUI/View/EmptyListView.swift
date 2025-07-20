//
//  EmptyListView.swift
//  ToDoSwiftUI
//
//  Created by Adrian Mazek on 20/07/2025.
//

import SwiftUI

struct EmptyListView: View {
    @State var isAnimating: Bool = false
    let secoundaryColor = Color("SecondaryAccentColor")
    var body: some View {
        
            VStack {
                Text("No tasks to show")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Add your first task to get started")
                    .padding(.bottom, 100)
             
                NavigationLink(destination: AddView()) {
                    Text("Add Task 🥳")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(isAnimating ? secoundaryColor : Color.accentColor)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                .padding(.horizontal, isAnimating ? 30 : 50)
                .shadow(
                    color: isAnimating ? secoundaryColor.opacity(0.7) : Color.accentColor.opacity(0.7),
                    radius: isAnimating ? 30: 10,
                    x:0,
                    y: isAnimating ? 50 : 30
                    
                )
                .scaleEffect(isAnimating ? 1.1 : 1.0)
                .offset(y: isAnimating ? -7 : 0)
                
                
            }
            .padding(40)
            .onAppear(perform: addAnimation)
        
//        .frame(maxWidth: .infinity, maxHeight: .infinity)
            .frame(maxWidth: 400)
    }
    
    func addAnimation() {
        guard !isAnimating else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            withAnimation(
                Animation.easeInOut(duration: 1.5)
                    .repeatForever()
            ){
                isAnimating.toggle()
            }
        }
    }
}

#Preview {
    EmptyListView()
}
