import SwiftUI

public struct DefaultButton: View {
    var text: String
    var isEnabled: Bool
    var tapAction: () -> Void
    
    public init(text: String, isEnabled: Bool, tapAction: @escaping () -> Void) {
        self.text = text
        self.isEnabled = isEnabled
        self.tapAction = tapAction
    }
    
    private var textColor: Color {
        self.isEnabled ? .white : R.Color.grey500
    }
    
    private var bgColor: Color {
        self.isEnabled ? R.Color.mainPrimary500 : R.Color.grey50
    }
    
    public var body: some View {
        Button {
            self.tapAction()
        } label: {
            Text("완료")
                .font(.system(size: 16, weight: .bold))
                .foregroundColor(self.textColor)
                .padding(.horizontal, 24)
                .padding(.vertical, 12)
                .frame(maxWidth: .infinity)
        }
        .background(self.bgColor)
        .cornerRadius(10)
        .disabled(!self.isEnabled)
    }
}
