import Foundation
import SwiftUI

public enum ToastStyle {
    case error
    case warning
    case success
    case info
}

extension ToastStyle {
    var themeColor: Color {
        switch self {
        case .error: return Color.red
        case .warning: return Color.orange
        case .info: return Color.blue
        case .success: return Color.green
        }
    }
    
    var iconName: String {
        switch self {
        case .info: return "info.circle.fill"
        case .warning: return "exclamationmark.triangle.fill"
        case .success: return "checkmark.circle.fill"
        case .error: return "xmark.circle.fill"
        }
    }
}

public enum ToastDirection {
    case top
    case bottom
}

public struct Toast: Equatable {
    var type: ToastStyle
    var title: String
    var message: String
    var duration: Double
    var direction: ToastDirection
    
    public init(
        type: ToastStyle,
        title: String,
        message: String,
        duration: Double = 1.5,
        direction: ToastDirection = .top
    ) {
        self.type = type
        self.title = title
        self.message = message
        self.duration = duration
        self.direction = direction
    }
}

struct ToastView: View {
    var type: ToastStyle
    var title: String
    var message: String
    var onTapped: (() -> Void)
    
    private var screenWidth: CGFloat {
        UIScreen.main.bounds.size.width
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack(alignment: .center) {
                Image(systemName: self.type.iconName)
                    .renderingMode(.template)
                    .foregroundColor(self.type.themeColor)
                    .frame(width: 16, height: 16)
                
                VStack(alignment: .leading) {
                    Text(self.title)
                        .font(.system(size: 14, weight: .semibold))
                    
                    Text(self.message)
                        .font(.system(size: 12))
                        .foregroundColor(Color.black.opacity(0.6))
                }
                
                Spacer()
            }
            .padding()
        }
        .frame(maxWidth: self.screenWidth)
        .background(Color.white)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(self.type.themeColor)
        )
        .cornerRadius(8)
        .shadow(color: Color.black.opacity(0.25), radius: 4, x: 0, y: 1)
        .padding(.horizontal, 20)
        .onTapGesture {
            self.onTapped()
        }
    }
}

struct ToastModifier: ViewModifier {
    @Binding var toast: Toast?
    @State private var task: Task<Void, Never>?
    
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .overlay(
                ZStack {
                    self.mainToastView()
                        
                }.animation(.spring(), value: self.toast)
                
            )
            .onChange(of: self.toast) { old, prev in
                if let prev {
                    self.showToast()
                }
            }
    }
    
    @ViewBuilder func mainToastView() -> some View {
        if let toast {
            VStack {
                if toast.direction == .bottom { Spacer() }
                
                ToastView(
                    type: toast.type,
                    title: toast.title,
                    message: toast.message
                ) {
                    dismissToast()
                }
                .offset(y: toast.direction == .top ? 0 : -30)
                
                if toast.direction == .top { Spacer() }
            }
            .transition(toast.direction == .top ? .move(edge: .top) : .move(edge: .bottom))
        }
    }
    
    private func showToast() {
        guard let toast else { return }
        
        UIImpactFeedbackGenerator(style: .light).impactOccurred()
        
        if toast.duration > 0 {
            self.task?.cancel()
            
            let task = Task { @MainActor in
                do {
                    try await Task.sleep(nanoseconds: UInt64(toast.duration) * 1_000_000_000)
                    self.dismissToast()
                } catch is CancellationError {
#if DEBUG
                    let fileName = #file
                    let className = (fileName as NSString).lastPathComponent
                    print("\(className): \(#function): \(#line) Task was cancelled")
#endif
                } catch {
#if DEBUG
                    print("Error: \(#function) Task was cancelled")
#endif
                }
            }
            self.task = task
        }
    }
    
    private func dismissToast() {
        withAnimation {
            self.toast = nil
        }
        
        self.task?.cancel()
        self.task = nil
    }
}

