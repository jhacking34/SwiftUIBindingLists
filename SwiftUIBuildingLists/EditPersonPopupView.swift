//
//  EditPersonPopupView.swift
//  SwiftUIBuildingLists
//
//  Created by Johnny Hacking on 5/24/21.
//

import SwiftUI

struct EditPersonPopupView: View {
    @Binding var person: Person
    @Binding var id: Int!
    
    var body: some View {
        VStack(spacing: 20){
            Text("Edit Name")
                .font(.largeTitle)
            
            TextField("First Name", text: $person.firstName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            TextField("Last Name", text: $person.lastName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button(action: {
                id = nil
            }, label: {
                Text("Close")
            })
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 20)
                        .fill(Color(.systemBackground))
                        .shadow(radius: 8))
        .padding(24)
    }
}

struct EditPersonPopupView_Previews: PreviewProvider {
    static var previews: some View {
        EditPersonPopupView(person: Binding.constant(MockData.person), id: Binding.constant(MockData.person.id))
    }
}
