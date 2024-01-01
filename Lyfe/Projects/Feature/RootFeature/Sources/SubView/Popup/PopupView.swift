import SwiftUI
import ComposableArchitecture
import DesignSystem

public struct PopupView: View {
    var store: StoreOf<PopupCore>
    var viewStore: ViewStoreOf<PopupCore>
    
    public init(store: StoreOf<PopupCore>) {
        self.store = store
        self.viewStore = ViewStore(store, observe: { $0 })
    }
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            TitleLabel(text: self.viewStore.text)
            
            if let content = self.viewStore.content {
                ContentView(content: content)
            }
            
            HStack(alignment: .top, spacing: 16) {
                if let cancel = self.viewStore.cancel {
                    CancelButton(
                        text: cancel.text,
                        tapAction: { self.viewStore.send(.cancel(self.viewStore.id)) }
                    )
                }
                
                OKButton(
                    text: self.viewStore.ok.text,
                    tapAction: { self.viewStore.send(.ok(self.viewStore.id)) }
                )
            }
        }
        .padding(16)
        .frame(width: 300, alignment: .topLeading)
        .background(.white)
        .cornerRadius(20)
        .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 2)
    }
}

extension PopupView {
    private struct TitleLabel: View {
        var text: String
        
        var body: some View {
            Text(self.text)
              .font(.system(size: 18, weight: .bold))
              .foregroundColor(.black)
        }
    }
    
    private struct ContentView: View {
        var content: String
        
        var body: some View {
            Text(self.content)
              .font(.system(size: 16, weight: .medium))
              .multilineTextAlignment(.leading)
              .foregroundColor(.black)
              .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
    
    private struct CancelButton: View {
        var text: String
        var tapAction: () -> Void
        
        var body: some View {
            Button {
                self.tapAction()
            } label: {
                Text(self.text)
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(R.Color.grey500)
                    .padding(.horizontal, 24)
                    .padding(.vertical, 12)
                    .frame(maxWidth: .infinity)
            }
            .background(R.Color.grey50)
            .cornerRadius(10)
        }
    }
    
    private struct OKButton: View {
        var text: String
        var tapAction: () -> Void
        
        var body: some View {
            Button {
                self.tapAction()
            } label: {
                Text(self.text)
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.white)
                    .padding(.horizontal, 24)
                    .padding(.vertical, 12)
                    .frame(maxWidth: .infinity)
            }
            .background(R.Color.mainPrimary500)
            .cornerRadius(10)
        }
    }
}
