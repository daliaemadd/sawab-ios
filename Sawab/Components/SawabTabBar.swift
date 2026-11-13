import SwiftUI

enum AppTab: Int, CaseIterable {
    case home, explore, saved, profile

    var title: String {
        switch self {
        case .home: return "Home"
        case .explore: return "Explore"
        case .saved: return "Saved"
        case .profile: return "Profile"
        }
    }
    var icon: String {
        switch self {
        case .home: return "house"
        case .explore: return "magnifyingglass"
        case .saved: return "heart"
        case .profile: return "person.crop.circle"
        }
    }

    var selectedIcon: String {
        switch self {
        case .home: return "house.fill"
        case .explore: return "magnifyingglass"
        case .saved: return "heart.fill"
        case .profile: return "person.crop.circle.fill"
        }
    }
}

struct SawabTabBar: View {
    @Binding var selection: AppTab

    var body: some View {
        HStack(spacing: 4) {
            ForEach(AppTab.allCases, id: \.rawValue) { tab in
                Button {
                    selection = tab
                } label: {
                    VStack(spacing: 5) {
                        Image(systemName: selection == tab ? tab.selectedIcon : tab.icon)
                            .font(.system(size: 21, weight: .light))
                            .frame(height: 23)
                        Text(tab.title)
                            .font(SawabTheme.body(10, weight: selection == tab ? .semibold : .medium))
                    }
                    .foregroundStyle(selection == tab ? SawabTheme.deepOlive : SawabTheme.muted)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 10)
                    .background {
                        if selection == tab {
                            RoundedRectangle(cornerRadius: 23)
                                .fill(SawabTheme.paleGreen)
                        }
                    }
                }
                .buttonStyle(.plain)
                .accessibilityAddTraits(selection == tab ? [.isSelected] : [])
            }
        }
        .padding(5)
        .background(SawabTheme.cream, in: RoundedRectangle(cornerRadius: 29))
        .overlay(RoundedRectangle(cornerRadius: 29).stroke(SawabTheme.line.opacity(0.6), lineWidth: 0.6))
        .padding(.horizontal, 22)
        .padding(.bottom, 4)
        .padding(.top, 7)
        .background(SawabTheme.cream.opacity(0.97))
    }
}
