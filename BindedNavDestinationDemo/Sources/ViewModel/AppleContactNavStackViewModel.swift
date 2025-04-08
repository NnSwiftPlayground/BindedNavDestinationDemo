//
//  AppleContactNavStackViewModel.swift
//  BindedNavDestinationDemo
//
//  Created by Nikolai Nobadi on 4/7/25.
//

import SwiftUI 

final class AppleContactNavStackViewModel: ObservableObject {
    @Published var contacts: [Contact]
    @Published var selectedContact: Contact?
    
    init(contacts: [Contact] = Contact.sampleList) {
        self.contacts = contacts
    }
}


// MARK: - Actions
extension AppleContactNavStackViewModel {
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

    func contactBinding(for contact: Contact) -> Binding<Contact> {
        guard let index = contacts.firstIndex(where: { $0.id == contact.id }) else {
            fatalError("Contact not found")
        }
        
        return Binding(
            get: { self.contacts[index] },
            set: { self.contacts[index] = $0 }
        )
    }
}
