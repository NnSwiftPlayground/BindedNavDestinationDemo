//
//  EditContactNavStack.swift
//  BindedNavDestinationDemo
//
//  Created by Nikolai Nobadi on 4/7/25.
//

import SwiftUI

struct EditContactNavStack: View {
    @State var contact: Contact
    @Environment(\.dismiss) private var dismiss
    
    let save: (Contact) -> Void
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $contact.name)
                TextField("Phone", text: $contact.phone)
            }
            .navigationTitle("Edit Contact")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        save(contact)
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel", role: .cancel) {
                        dismiss()
                    }
                }
            }
        }
    }
}
