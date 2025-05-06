//
//  BindedContactNavStack.swift
//  BindedNavDestinationDemo
//
//  Created by Nikolai Nobadi on 4/7/25.
//

import SwiftUI

struct BindedContactNavStack: View {
    @StateObject var viewModel: ContactNavStackViewModel

    var body: some View {
        NavigationStack {
            ContactListWithNavBarView("Binded Contacts", contacts: viewModel.contacts, addNewContact: viewModel.addNewContact)
                .background(Color.green.opacity(0.15))
                .sheet(item: $viewModel.selectedContact) { contact in
                    EditContactNavStack(contact: contact, save: viewModel.saveContact(_:))
                }
                .bindedNavigationDestination(itemList: $viewModel.contacts) { $contact in
                    ContactDetailView(contact: contact, onEdit: viewModel.showEditing(for:))
                }
        }
    }
}


// MARK: - Preview
#Preview {
    BindedContactNavStack(viewModel: .init())
}
