//
//  AppleContactNavStack.swift
//  BindedNavDestinationDemo
//
//  Created by Nikolai Nobadi on 4/7/25.
//

import SwiftUI

struct AppleContactNavStack: View {
    @StateObject var viewModel: AppleContactNavStackViewModel

    var body: some View {
        NavigationStack {
            ContactListWithNavBarView("Apple Contacts", contacts: viewModel.contacts, addNewContact: viewModel.addNewContact)
                .background(Color.yellow.opacity(0.15))
                .sheet(item: $viewModel.selectedContact) { contact in
                    EditContactNavStack(contact: contact, save: viewModel.saveContact(_:))
                }
                .navigationDestination(for: Contact.self) { contact in
                    ContactDetailView(contact: viewModel.contactBinding(for: contact).wrappedValue, onEdit: viewModel.showEditing(for:))
                }
        }
    }
}


// MARK: - Preview
#Preview {
    AppleContactNavStack(viewModel: .init())
}
