//
//  ContactNavStackViewModel.swift
//  BindedNavDestinationDemo
//
//  Created by Nikolai Nobadi on 4/7/25.
//

import Foundation

final class ContactNavStackViewModel: ObservableObject {
    @Published var contacts: [Contact]
    @Published var selectedContact: Contact?
    
    init(contacts: [Contact] = Contact.sampleList) {
        self.contacts = contacts
    }
}


// MARK: - Actions
extension ContactNavStackViewModel {
    func addNewContact() {
        selectedContact = .init(id: .init(), name: "", phone: "")
    }
    
    func showEditing(for contact: Contact) {
        selectedContact = contact
    }
    
    func saveContact(_ contact: Contact) {
        if let index = contacts.firstIndex(where: { $0.id == contact.id }) {
            contacts[index] = contact
        } else {
            contacts.append(contact)
        }
    }
}
