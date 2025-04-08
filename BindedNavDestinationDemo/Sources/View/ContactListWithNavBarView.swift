//
//  ContactListWithNavBarView.swift
//  BindedNavDestinationDemo
//
//  Created by Nikolai Nobadi on 4/7/25.
//

import SwiftUI

struct ContactListWithNavBarView: View {
    let navTitle: String
    let contacts: [Contact]
    let addNewContact: () -> Void
    
    init(_ navTitle: String, contacts: [Contact], addNewContact: @escaping () -> Void) {
        self.navTitle = navTitle
        self.contacts = contacts
        self.addNewContact = addNewContact
    }
    
    var body: some View {
        List {
            ForEach(contacts) { contact in
                NavigationLink(contact.name, value: contact)
            }
        }
        .scrollContentBackground(.hidden)
        .navigationTitle(navTitle)
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button(action: addNewContact) {
                    Image(systemName: "plus")
                }
            }
        }
    }
}
