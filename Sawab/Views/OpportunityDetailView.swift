import SwiftUI

struct OpportunityDetailView: View {
    let opportunity: Opportunity
    @Binding var favorites: Set<Int>
    @State private var showDemoAlert = false

    private var saved: Bool { favorites.contains(opportunity.id) }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 18) {
                OpportunityPhoto(opportunity: opportunity, height: 285)
                    .clipShape(RoundedRectangle(cornerRadius: 24))

                Text(opportunity.title)
                    .font(SawabTheme.editorial(37))
                    .tracking(-1.2)
                    .foregroundStyle(SawabTheme.ink)
                    .fixedSize(horizontal: false, vertical: true)

                Label("Sawab Verified · demo", systemImage: "checkmark")
                    .font(SawabTheme.body(14, weight: .semibold))
                    .foregroundStyle(SawabTheme.deepOlive)

                VStack(alignment: .leading, spacing: 4) {
                    Text("Demo organization")
                        .font(SawabTheme.body(13))
                        .foregroundStyle(SawabTheme.muted)
                    Text(opportunity.organization)
                        .font(SawabTheme.body(18, weight: .medium))
                        .foregroundStyle(SawabTheme.deepOlive)
                }

                Text(opportunity.description)
                    .font(SawabTheme.body(15))
                    .foregroundStyle(SawabTheme.ink)

                OpportunityFacts(opportunity: opportunity)

                Text("Fictional opportunity and organization. Dates, goals, and participation counts are sample data.")
                    .font(SawabTheme.body(12))
                    .foregroundStyle(SawabTheme.muted)

                Button { showDemoAlert = true } label: {
                    Text("I'd like to help  ↗")
                        .font(SawabTheme.body(16, weight: .semibold))
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 17)
                }
                .foregroundStyle(.white)
                .background(SawabTheme.deepOlive, in: RoundedRectangle(cornerRadius: 20))
                .padding(.bottom, 20)
            }
            .padding(.horizontal, 22)
            .padding(.top, 9)
        }
        .background(SawabTheme.cream.ignoresSafeArea())
        .toolbar(.visible, for: .navigationBar)
        .toolbarBackground(SawabTheme.cream, for: .navigationBar)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) { Text("THE DETAILS").font(SawabTheme.body(10, weight: .semibold)).tracking(2) }
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    if saved { favorites.remove(opportunity.id) }
                    else { favorites.insert(opportunity.id) }
                } label: {
                    Image(systemName: saved ? "heart.fill" : "heart")
                        .foregroundStyle(SawabTheme.deepOlive)
                }
                .buttonStyle(.plain)
                .accessibilityLabel(saved ? "Remove saved opportunity" : "Save opportunity")
            }
        }
        .alert("Demo only", isPresented: $showDemoAlert) {
            Button("OK", role: .cancel) { }
        } message: {
            Text("Sawab is a portfolio prototype. No real donations or messages are sent.")
        }
    }
}

private struct OpportunityFacts: View {
    let opportunity: Opportunity

    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            DetailRow(symbol: "mappin", title: "Location", value: opportunity.city)
            DetailRow(symbol: "clock", title: "Deadline", value: opportunity.deadline)
            DetailRow(symbol: "scope", title: "Donation / participation goal", value: opportunity.goal)
            DetailRow(symbol: "person.2", title: "Contributors", value: opportunity.contributors)
        }
        .padding(26)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(SawabTheme.paper, in: RoundedRectangle(cornerRadius: 28))
        .overlay(RoundedRectangle(cornerRadius: 28).stroke(SawabTheme.line.opacity(0.5)))
    }
}

private struct DetailRow: View {
    let symbol: String
    let title: String
    let value: String

    var body: some View {
        HStack(alignment: .top, spacing: 17) {
            Image(systemName: symbol)
                .font(.system(size: 23, weight: .light))
                .frame(width: 44, height: 44)
                .background(SawabTheme.paleGreen, in: RoundedRectangle(cornerRadius: 14))
                .foregroundStyle(SawabTheme.olive)
            VStack(alignment: .leading, spacing: 4) {
                Text(title).font(SawabTheme.body(14, weight: .semibold)).foregroundStyle(SawabTheme.olive)
                Text(value).font(SawabTheme.body(15)).foregroundStyle(SawabTheme.ink)
            }
        }
    }
}
