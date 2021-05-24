//
//  Person.swift
//  SwiftUIBuildingLists
//
//  Created by Johnny Hacking on 5/24/21.
//

import Foundation

struct Person: Identifiable {
    var id : Int
    var firstName : String
    var lastName : String
}

struct MockData {
    static let person = Person(id: 1, firstName: "Chuck", lastName: "Norris")
}
