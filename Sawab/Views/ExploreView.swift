import SwiftUI

struct ExploreView: View {
    @Binding var favorites: Set<Int>
    @State private var category = "All"
    @State private var searchText = ""
    private let categories = ["All", "Give items", "Give time"]

    private var filtered: [Opportunity] {
        Opportunity.examples.filter { opportunity in
            (category == "All" || opportunity.category == category) &&
            (searchText.isEmpty || opportunity.title.localizedCaseInsensitiveContains(searchText) || opportunity.city.localizedCaseInsensitiveContains(searchText))
        }
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 19) {
                Text("Find your way to give.")
                    .font(SawabTheme.editorial(37))
                    .tracking(-1)
                    .foregroundStyle(SawabTheme.ink)
                    .padding(.top, 24)
                Text("Small acts can go a long way.")
                    .font(SawabTheme.body(15))
                    .foregroundStyle(SawabTheme.muted)

                HStack(spacing: 10) {
                    Image(systemName: "magnifyingglass").foregroundStyle(SawabTheme.olive)
                    TextField("Search needs or places", text: $searchText)
                        .font(SawabTheme.body(15))
                }
                .padding(15)
                .background(.white, in: RoundedRectangle(cornerRadius: 17))

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 8) {
                        ForEach(categories, id: \.self) { item in
                            Button { category = item } label: {
                                Text(item)
                                    .font(SawabTheme.body(13, weight: .medium))
                                    .padding(.horizontal, 17)
                                    .padding(.vertical, 10)
                                    .background(category == item ? SawabTheme.olive : .white, in: Capsule())
                                    .foregroundStyle(category == item ? .white : SawabTheme.deepOlive)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                }

                Text("OPEN OPPORTUNITIES")
                    .tracking(1.5)
                    .font(SawabTheme.body(10, weight: .semibold))
                    .foregroundStyle(SawabTheme.deepOlive)
                    .padding(.top, 5)

                ForEach(filtered) { opportunity in
                    NavigationLink(value: opportunity) {
                        HStack(alignment: .top, spacing: 13) {
                            Image(systemName: opportunity.symbol)
                                .font(.system(size: 22, weight: .light))
                                .foregroundStyle(SawabTheme.olive)
                                .frame(width: 45, height: 45)
                                .background(SawabTheme.paleGreen, in: RoundedRectangle(cornerRadius: 13))
                            VStack(alignment: .leading, spacing: 7) {
                                Text(opportunity.title)
                                    .font(SawabTheme.editorial(22))
                                    .foregroundStyle(SawabTheme.ink)
                                Text(opportunity.category + "  ·  " + opportunity.city)
                                    .font(SawabTheme.body(12))
                                    .foregroundStyle(SawabTheme.muted)
                            }
                            Spacer(minLength: 0)
                            Image(systemName: "arrow.up.right")
                                .font(.system(size: 13))
                                .foregroundStyle(SawabTheme.olive)
                        }
                        .padding(17)
                        .background(.white, in: RoundedRectangle(cornerRadius: 20))
                    }
                    .buttonStyle(.plain)
                }
                if filtered.isEmpty {
                    Text("No needs match your search.")
                        .font(SawabTheme.body(15))
                        .foregroundStyle(SawabTheme.muted)
                }
            }
            .padding(.horizontal, 22)
            .padding(.bottom, 25)
        }
        .background(SawabTheme.cream.ignoresSafeArea())
        .toolbar(.hidden, for: .navigationBar)
        .navigationDestination(for: Opportunity.self) { opportunity in
            OpportunityDetailView(opportunity: opportunity, favorites: $favorites)
        }
    }
}
