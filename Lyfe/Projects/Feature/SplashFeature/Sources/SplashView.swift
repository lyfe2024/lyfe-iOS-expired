import SwiftUI
import Foundation
import BaseFeatureInterface
import ComposableArchitecture

public struct SplashView: View {
    let store: StoreOf<SplashCore>
    
    public init(store: StoreOf<SplashCore>) {
        self.store = store
    }
    
    public var body: some View {
        VStack {
            Text("Lyfe SplashView")
        }
        .background(Color.white)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
