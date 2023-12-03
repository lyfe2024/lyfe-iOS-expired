import SwiftUI
import Foundation
import DesignSystem

struct BottomTabBar: View {
    @Binding var selectedTab: Constant.Tab
    
    var body: some View {
        HStack {
            ForEach(Constant.Tab.allCases, id: \.self) { item in
                let isActive = item == self.selectedTab
                
                Button{
                    self.selectedTab = item
                } label: {
                    BottomTabItem(
                        tab: item,
                        isActive: isActive
                    )
                }
            }
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 8)
        .frame(maxWidth: .infinity)
        .background(R.Color.grey900)
        .cornerRadius(20)
    }
}

struct BottomTabItem: View {
    var tab: Constant.Tab
    var isActive: Bool
    
    var icon: Image {
        self.isActive ? self.tab.activeIcon : self.tab.icon
    }
    
    var body: some View {
        HStack(spacing: 4){
            self.icon
                .resizable()
                .renderingMode(.template)
                .foregroundColor(.white)
                .frame(width: 24, height: 24)
            
            if self.isActive {
                Text(self.tab.title)
                    .font(.system(size: 12, weight: .bold))
                    .foregroundColor(.white)
            }
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 6)
        .background(self.isActive ? R.Color.mainOrange500 : .clear)
        .cornerRadius(12)
    }
}
