# BindedNavDestinationDemo

A SwiftUI project demonstrating a safer, more composable way to keep detail views in sync with list data using `NavigationStack`.

## The Problem

When using `.navigationDestination(for:)` with a struct, the view receives a copy of the item at the time of navigation. If the backing data changes later (e.g., after editing), the destination does not reflect those changes.

This can lead to stale data in views like:

```swift
.navigationDestination(for: Contact.self) { contact in
    ContactDetailView(contact: contact)
}
```

## Common Scenario

- A user taps a contact in a list and navigates to a detail view.
- They edit the contact via a sheet and save changes.
- The sheet dismisses, but the detail view still shows the old contact info.

## Apple’s Solution

Apple addresses this in [FoodTruck](https://developer.apple.com/documentation/swiftui/food_truck_building_a_swiftui_multiplatform_app), using a binding method in the view model:

```swift
public func orderBinding(for id: Order.ID) -> Binding<Order> {
    Binding<Order> {
        guard let index = self.orders.firstIndex(where: { $0.id == id }) else {
            fatalError()
        }
        return self.orders[index]
    } set: { newValue in
        guard let index = self.orders.firstIndex(where: { $0.id == id }) else {
            fatalError()
        }
        self.orders[index] = newValue
    }
}
```

This avoids stale data by binding directly to the data source, but it introduces runtime risk via `fatalError()`.

## This Project’s Solution

This demo introduces a reusable, safer approach:

### The Modifier

```swift
struct BindedNavigationDestination<Item: Identifiable & Hashable, Destination: View>: ViewModifier {
    @Binding var itemList: [Item]
    v@ViewBuilder var destination: (Binding<Item>) -> Destination

    func body(content: Content) -> some View {
        content
            .navigationDestination(for: Item.self) { item in
                if let index = itemList.firstIndex(where: { $0.id == item.id }) {
                    destination($itemList[index])
                }
            }
    }
}
```

### Advantages

- No `fatalError`
- Safer and more declarative
- Easily reused across projects

## Demo Project Includes

Three tabs showing:

- The stale behavior (`.navigationDestination`)
- Example of Apple's workaround (`contactBinding(for:)`)
- This modifier’s fix (`bindedNavigationDestination`)

This modifier is part of [NnSwiftUIKit](https://github.com/nikolainobadi/NnSwiftUIKit), a collection of custom SwiftUI view modifiers and utilities.