import SwiftUI

struct SavedView: View {
    @Binding var favorites: Set<Int>
    private var saved: [Opportunity] { Opportunity.examples.filter { favorites.contains($0.id) } }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 17) {
                Text("Close to your heart.")
                    .font(SawabTheme.editorial(37))
                    .tracking(-1)
                    .foregroundStyle(SawabTheme.ink)
                    .padding(.top, 24)
                Text("A little collection of ways to give back.")
                    .font(SawabTheme.body(15))
                    .foregroundStyle(SawabTheme.muted)

                if saved.isEmpty {
                    VStack(spacing: 15) {
                        Image(systemName: "heart")
                            .font(.system(size: 47, weight: .ultraLight))
                            .foregroundStyle(SawabTheme.olive)
                        Text("Something will find its way here.")
                            .font(SawabTheme.editorial(25))
                            .multilineTextAlignment(.center)
                        Text("Tap the heart on a cause you care about.")
                            .font(SawabTheme.body(14))
                            .foregroundStyle(SawabTheme.muted)
                            .multilineTextAlignment(.center)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 70)
                    .background(.white, in: RoundedRectangle(cornerRadius: 24))
                    .padding(.top, 19)
                } else {
                    ForEach(saved) { opportunity in
                        NavigationLink(value: opportunity) {
                            OpportunityCard(opportunity: opportunity)
                        }
                        .buttonStyle(.plain)
                    }
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
