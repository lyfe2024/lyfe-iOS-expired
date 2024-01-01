import Foundation
import SwiftUI
import ComposableArchitecture

extension View {
    // MARK: Popup
    
    public func popup(
        isPresented: Binding<Bool>,
        fraction: CGFloat = 0.7,
        onDismiss: @escaping () -> Void,
        store: Store<PopupCore.State?, PopupCore.Action>
    ) -> some View {
        self.modifier(
            PopupModifier(
                isPresented: isPresented,
                fraction: fraction,
                onDismiss: onDismiss,
                store: store
            )
        )
    }
}
