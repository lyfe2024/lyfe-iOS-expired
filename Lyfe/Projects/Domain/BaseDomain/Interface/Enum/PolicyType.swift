import Foundation

public enum PolicyType: String, Codable {
    /// 이용약관조회
    case term = "TERM"
    /// 개인정보수집동의
    case personalInfoAgreement = "PERSONAL_INFO_AGREEMENT"
}
