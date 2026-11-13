import SwiftUI

private enum Tab: Int, CaseIterable {
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
}

struct RootView: View {
    @State private var selection: Tab = .home
    @State private var favorites: Set<Int> = []

    var body: some View {
        Group {
            switch selection {
            case .home:
                NavigationStack { HomeView(favorites: $favorites) }
            case .explore:
                NavigationStack { ExploreView(favorites: $favorites) }
            case .saved:
                NavigationStack { SavedView(favorites: $favorites) }
            case .profile:
                NavigationStack { ProfileView() }
            }
        }
        .safeAreaInset(edge: .bottom, spacing: 0) {
            HStack(spacing: 4) {
                ForEach(Tab.allCases, id: \.rawValue) { tab in
                    Button {
                        selection = tab
                    } label: {
                        VStack(spacing: 5) {
                            Image(systemName: selection == tab ? tab.icon + ".fill" : tab.icon)
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
        .background(SawabTheme.cream.ignoresSafeArea())
    }
}
