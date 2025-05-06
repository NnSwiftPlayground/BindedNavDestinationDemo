//
//  ContactDetailView.swift
//  BindedNavDestinationDemo
//
//  Created by Nikolai Nobadi on 4/7/25.
//

import SwiftUI

struct ContactDetailView: View {
    let contact: Contact
    let onEdit: (Contact) -> Void

    var body: some View {
        VStack(spacing: 16) {
            Text("Name: \(contact.name)")
            Text("Phone: \(contact.phone)")
            Button("Edit") {
                onEdit(contact)
            }
            .buttonStyle(.borderedProminent)
        }
        .navigationTitle("Contact Detail")
        .padding()
    }
}
