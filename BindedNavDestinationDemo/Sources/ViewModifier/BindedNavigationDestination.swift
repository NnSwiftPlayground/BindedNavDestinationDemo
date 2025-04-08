//
//  BindedNavigationDestination.swift
//  BindedNavDestinationDemo
//
//  Created by Nikolai Nobadi on 4/7/25.
//

import SwiftUI

struct BindedNavigationDestination<Item: Identifiable & Hashable, Destination: View>: ViewModifier {
    @Binding var itemList: [Item]
    @ViewBuilder var destination: (Binding<Item>) -> Destination

    func body(content: Content) -> some View {
        content
            .navigationDestination(for: Item.self) { item in
                if let index = itemList.firstIndex(where: { $0.id == item.id }) {
                    destination($itemList[index])
                }
            }
    }
}

extension View {
    /// Attaches a navigation destination that provides a **live Binding** to a matching item in the list.
    ///
    /// Unlike the standard `.navigationDestination`, which passes a **snapshot** of the value at the time of navigation,
    /// this modifier ensures that any updates to the item (such as edits in a sheet) are reflected in the destination view.
    ///
    /// This is particularly useful when:
    /// - You're using `struct`s for navigation data.
    /// - You allow editing the item while the detail view is active.
    /// - You want the detail view to always reflect the latest state.
    ///
    /// - Parameters:
    ///   - itemList: A binding to the list of items used for navigation. The view modifier uses this to locate the correct binding.
    ///   - destination: A closure that builds the destination view using a **binding** to the navigated item.
    ///
    /// - Returns: A view that presents the destination with a synced binding.
    ///
    /// ### Example
    /// ```swift
    /// .bindedNavigationDestination(itemList: $contacts) { $contact in
    ///     ContactDetailView(contact: contact)
    /// }
    /// ```
    func bindedNavigationDestination<Item: Identifiable & Hashable, Destination: View>(itemList: Binding<[Item]>, @ViewBuilder destination: @escaping (Binding<Item>) -> Destination) -> some View {
        modifier(BindedNavigationDestination(itemList: itemList, destination: destination))
    }
}
