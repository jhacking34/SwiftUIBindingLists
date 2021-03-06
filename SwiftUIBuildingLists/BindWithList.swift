//
//  ContentView.swift
//  SwiftUIBuildingLists
//
//  Created by Johnny Hacking on 5/24/21.
//

import SwiftUI

struct BindWithList: View {
    @State private var people = [
        Person(id: 10, firstName: "Johnny", lastName: "Hacking"),
        Person(id: 15, firstName: "Shaylee", lastName:"Hacking")]
    @State private var selectedPersonId: Int?
    
    var body: some View {
        NavigationView{
            ZStack{
                ScrollView{
                    LazyVStack{
                        Text("Binding With Lists")
                            .font(.title2)
                            .fontWeight(.semibold)
                        Text("You want to bind the array and an index for a two-way bind.")
                            .font(.body)
                            .fontWeight(.semibold)
                            .modifier(DescLabel())
                        
                        ForEach(people){ person in
                            HStack{
                                Text("\(person.firstName + " " + person.lastName)")
                                    .fontWeight(.semibold)
                                    .foregroundColor(.white)
                                    .italic()
                                Spacer()
                                Image(systemName: "pencil.circle")
                                    .foregroundColor(.blue)
                            }
                            .padding()
                            .background(Color.black)
                            .cornerRadius(10)
                            .onTapGesture {
                                selectedPersonId = person.id
                            }
                        }
                    }
                }
                
                if let id = selectedPersonId {
                    EditPersonPopupView(person: $people[people.firstIndex(where: { $0.id == id})!], id: $selectedPersonId)
                }
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        BindWithList()
    }
}

struct DescLabel: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.body)
            .padding()
            .background(Color.yellow)
            .cornerRadius(10)
    }
}
