import SwiftUI

struct RootView: View {
    @State private var selection: AppTab = .home
    @State private var favorites = FavoritesStore()

    var body: some View {
        @Bindable var favorites = favorites

        VStack(spacing: 0) {
            switch selection {
            case .home:
                NavigationStack { HomeView(favorites: $favorites.ids) }
            case .explore:
                NavigationStack { ExploreView(favorites: $favorites.ids) }
            case .saved:
                NavigationStack { SavedView(favorites: $favorites.ids) }
            case .profile:
                NavigationStack { ProfileView() }
            }

            SawabTabBar(selection: $selection)
        }
        .tint(SawabTheme.deepOlive)
        .background(SawabTheme.cream.ignoresSafeArea())
    }
}

#Preview {
    RootView()
}
