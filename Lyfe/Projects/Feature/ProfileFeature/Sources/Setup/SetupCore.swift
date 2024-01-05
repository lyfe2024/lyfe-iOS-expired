import ComposableArchitecture
import Foundation

public struct SetupCore: Reducer {
    public init() {}
    
    public struct State: Equatable {
        public let id: UUID = .init()
        
        public init() {}
    }
    
    public enum Action: Equatable {
        case onAppear
        case setNotification
        case moveToScrap
        case moveToUseExperience
        case moveToInfo
        case withdraw
        case dismiss
    }
    
    public var body: some ReducerOf<Self> {
        Reduce<State, Action> { state, action in
            switch action {
            case .onAppear:
                return .none
            case .setNotification:
                return .none
            case .moveToScrap:
                return .none
            case .moveToUseExperience:
                return .none
            case .moveToInfo:
                return .none
            case .withdraw:
                return .none
            case .dismiss:
                return .none
            }
        }
    }
}
