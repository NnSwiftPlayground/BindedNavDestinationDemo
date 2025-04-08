//
//  Contact.swift
//  BindedNavDestinationDemo
//
//  Created by Nikolai Nobadi on 4/7/25.
//

import Foundation

struct Contact: Identifiable, Hashable {
    let id: UUID
    var name: String
    var phone: String
}


// MARK: - Sample Data
extension Contact {
    static var sampleList: [Contact] {
        return [
            .init(id: .init(), name: "Alice", phone: "123-456-7890"),
            .init(id: .init(), name: "Bob", phone: "987-654-3210")
        ]
    }
}
