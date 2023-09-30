import Foundation
import SwiftUI

extension View {
    // MARK: Toast
    
    public func toast(config toast: Binding<Toast?>) -> some View {
        self.modifier(ToastModifier(toast: toast))
    }
}
