//
//  StaleContactNavStack.swift
//  BindedNavDestinationDemo
//
//  Created by Nikolai Nobadi on 4/7/25.
//

import SwiftUI

struct StaleContactNavStack: View {
    @StateObject var viewModel: ContactNavStackViewModel

    var body: some View {
        NavigationStack {
            ContactListWithNavBarView("Stale Contacts", contacts: viewModel.contacts, addNewContact: viewModel.addNewContact)
                .background(Color.red.opacity(0.15))
                .sheet(item: $viewModel.selectedContact) { contact in
                    EditContactNavStack(contact: contact, save: viewModel.saveContact(_:))
                }
                .navigationDestination(for: Contact.self) { contact in
                    ContactDetailView(contact: contact, onEdit: viewModel.showEditing(for:))
                }
        }
    }
}
