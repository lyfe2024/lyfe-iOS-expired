import SwiftUI
import ComposableArchitecture
import DesignSystem

public struct PopupModifier: ViewModifier {
    @Binding var isPresented: Bool
    var onDismiss: () -> Void
    var store: Store<PopupCore.State?, PopupCore.Action>
    var fraction: CGFloat
    
    public init(
        isPresented: Binding<Bool>,
        fraction: CGFloat = 0.7,
        onDismiss: @escaping () -> Void,
        store: Store<PopupCore.State?, PopupCore.Action>
    ) {
        self._isPresented = isPresented
        self.fraction = fraction
        self.onDismiss = onDismiss
        self.store = store
    }
    
    public func body(content: Content) -> some View {
        ZStack {
            GeometryReader { proxy in
                content
                    .overlay {
                        if self.isPresented {
                            GeometryReader { _ in
                                IfLetStore(self.store) { store in
                                    PopupView(store: store)
                                }
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                            }
                            .background(
                                Color.black.opacity(0.65)
                                    .edgesIgnoringSafeArea(.all)
                                    .onTapGesture {
                                        withAnimation {
                                            self.isPresented.toggle()
                                        }
                                    }
                            )
                        }
                    }
            }
        }
    }
}
