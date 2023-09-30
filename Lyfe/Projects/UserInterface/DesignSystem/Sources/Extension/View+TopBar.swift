import SwiftUI

extension View {
    // MARK: TopBar
    
    public func topBar<C, L, R>(
        centerView: @escaping (() -> C),
        leftView: @escaping (() -> L),
        rightView: @escaping (() -> R)
    ) -> some View where C: View, L: View, R: View {
        modifier(
            TopBarModifier(
                centerView: centerView,
                leftView: leftView,
                rightView: rightView
            )
        )
    }
    
    public func topBar<C, L>(
        centerView: @escaping (() -> C),
        leftView: @escaping (() -> L)
    ) -> some View where C: View, L: View {
        modifier(
            TopBarModifier(
                centerView: centerView,
                leftView: leftView,
                rightView: { EmptyView()}
            )
        )
    }
    
    public func topBar<L>(
        leftView: @escaping (() -> L)
    ) -> some View where L: View {
        modifier(
            TopBarModifier(
                centerView: { EmptyView() },
                leftView: leftView,
                rightView: { EmptyView() }
            )
        )
    }
    
    
    
    public func topBar<C>(
        centerView: @escaping (() -> C)
    ) -> some View where C: View {
        modifier(
            TopBarModifier(
                centerView: centerView,
                leftView: { EmptyView() },
                rightView: { EmptyView() }
            )
        )
    }
}

