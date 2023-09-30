import Foundation
import SwiftUI

extension View {
    // MARK: frameGetter
    
    func frameGetter(_ frame: Binding<CGRect>) -> some View {
        modifier(FrameGetter(frame: frame))
    }
}
