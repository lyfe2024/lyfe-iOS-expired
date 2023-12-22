import SwiftUI
import ComposableArchitecture
import DesignSystem


enum ProfileTap: String, CaseIterable {
    case photo = "신청 사진"
    case text = "고민 글"
}


struct ProfileView: View {
    let store: StoreOf<ProfileCore>
    
    init(store: StoreOf<ProfileCore>) {
        self.store = store
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack(spacing: 16) {
                R.Common.avatar
                    .resizable()
                    .frame(width: 48, height: 48)
                
                VStack(alignment: .leading) {
                    Text("익명의 쿼카")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.black)
                    
                    Button {
                        
                    } label: {
                        Text("프로필 수정")
                            .font(.system(size: 12, weight: .semibold))
                            .foregroundColor(R.Color.grey300)
                    }
                }
                
            }
            
            ProfileTabView(store: self.store)
        }
        .padding(.horizontal, 20)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button(action: {
                    
                }, label: {
                    R.Common.arrowBack
                })
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                Button(action: {
                    
                }, label: {
                    Text("설정")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(R.Color.black)
                })
            }
        }
        .background(Color.white)
        .ignoresSafeArea(edges: .bottom)
    }
}


struct detailView: View {
    
    let store: StoreOf<ProfileCore>
    var feedTabs: ProfileTap
    
    var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    
    var body: some View {
        //비로그인
//        switch feedTabs {
//        case .photo:
//            nonLoginView()
//        case .text:
//            nonLoginView()
//        }
        //로그인
        
        switch feedTabs {
        case .photo:
            ScrollView(.vertical, showsIndicators: false) {
                LazyVGrid(columns: columns, spacing: 12) {
                        ForEach((0...19), id: \.self) { _ in
                            DefaultFeed()
                        }
                    }
            }
        case .text:
            List {
                TextFeed()
                    .listRowSeparator(.visible)
                    .listRowSeparatorTint(R.Color.grey100)
                TextFeed()
                    .listRowSeparator(.visible)
                    .listRowSeparatorTint(R.Color.grey100)
                TextFeed()
                    .listRowSeparator(.visible)
                    .listRowSeparatorTint(R.Color.grey100)
                TextFeed()
                    .listRowSeparator(.visible)
                    .listRowSeparatorTint(R.Color.grey100)
                TextFeed()
                    .listRowSeparator(.visible)
                    .listRowSeparatorTint(R.Color.grey100)
                TextFeed()
                    .listRowSeparator(.visible)
                    .listRowSeparatorTint(R.Color.grey100)
                TextFeed()
                    .listRowSeparator(.visible)
                    .listRowSeparatorTint(R.Color.grey100)
            }
            .listStyle(.plain)
        }
      
    }
}

struct nonLoginView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 40) {
            Spacer()
            
            Text("로그인 하시면 신청한 사진, \n작성한 고민글을 모아 볼 수 있어요")
                .font(.system(size: 18, weight: .bold))
                .multilineTextAlignment(.center)
                .foregroundColor(R.Color.grey900)
                .frame(alignment: .center)
            
            Button {
                
            } label: {
                Text("로그인 하러 가기")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.white)
                    .frame(height: 48)
                    .padding(.horizontal, 24)
                    .background(R.Color.mainOrange500)
                    .cornerRadius(8)
            }
            
           
            Text("아직 회원이 아니신가요?")
                .font(.system(size: 14))
                .multilineTextAlignment(.center)
                .foregroundColor(R.Color.grey500)
                .padding(.horizontal, 100)
                .padding(.top, -32)
                     
            Spacer()
        }
    }
}



struct ProfileTabView: View {
    let store: StoreOf<ProfileCore>
    
    @State private var selectedPicker: ProfileTap = .photo
    @Namespace private var animation
    
    var body: some View {
        VStack {
            animate()
            detailView(store: self.store, feedTabs: selectedPicker)
        }
    }
    
    @ViewBuilder
    private func animate() -> some View {
        HStack {
            ForEach(ProfileTap.allCases, id: \.self) { item in
                VStack {
                    Text(item.rawValue)
                        .frame(maxWidth: .infinity/4, minHeight: 32)
                        .font(selectedPicker == item ? .system(size: 18, weight: .bold): .system(size: 18, weight: .medium) )
                        .foregroundColor(selectedPicker == item ? R.Color.mainOrange500: R.Color.grey200)
                    
                    if selectedPicker == item {
                        Capsule()
                            .foregroundColor(R.Color.mainOrange500)
                            .frame(height: 2)
                            .font(.title3)
                            .matchedGeometryEffect(id: "info", in: animation)
                    }
                }
                .onTapGesture {
                    withAnimation(.easeInOut) {
                        self.selectedPicker = item
                    }
                }
            }
        }
    }
}
