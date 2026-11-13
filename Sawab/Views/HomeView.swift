import SwiftUI

struct HomeView: View {
    @Binding var favorites: Set<Int>

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                BrandMark()
                    .frame(maxWidth: .infinity)
                    .padding(.top, 7)
                    .padding(.bottom, 44)

                Text("Good evening,")
                    .font(SawabTheme.body(21))
                    .foregroundStyle(SawabTheme.muted)
                Text("friend.")
                    .font(SawabTheme.editorial(49))
                    .tracking(-1.6)
                    .foregroundStyle(SawabTheme.ink)
                    .padding(.top, 1)
                Text("Start making a difference.")
                    .font(SawabTheme.body(15))
                    .foregroundStyle(SawabTheme.muted)
                    .padding(.top, 3)
                    .padding(.bottom, 27)

                HStack(spacing: 7) {
                    Circle().fill(SawabTheme.olive).frame(width: 6, height: 6)
                    Text("A LITTLE GOOD, CLOSE TO HOME")
                        .tracking(1.7)
                        .font(SawabTheme.body(10, weight: .semibold))
                        .foregroundStyle(SawabTheme.deepOlive)
                }
                .padding(.bottom, 12)

                ForEach(Opportunity.examples) { opportunity in
                    NavigationLink(value: opportunity) {
                        OpportunityCard(opportunity: opportunity)
                    }
                    .buttonStyle(.plain)
                    .padding(.bottom, 19)
                }
                Text("Every little act counts.  ♡")
                    .font(SawabTheme.editorial(19))
                    .italic()
                    .foregroundStyle(SawabTheme.olive)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 15)
            }
            .padding(.horizontal, 22)
            .padding(.bottom, 26)
        }
        .background(SawabTheme.cream.ignoresSafeArea())
        .toolbar(.hidden, for: .navigationBar)
        .navigationDestination(for: Opportunity.self) { opportunity in
            OpportunityDetailView(opportunity: opportunity, favorites: $favorites)
        }
    }
}
