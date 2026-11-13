import SwiftUI

struct OpportunityDetailView: View {
    let opportunity: Opportunity
    @Binding var favorites: Set<Int>
    @State private var showDemoAlert = false

    private var saved: Bool { favorites.contains(opportunity.id) }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 18) {
                OpportunityPhoto(opportunity: opportunity, height: 250)
                    .clipShape(RoundedRectangle(cornerRadius: 12))

                HStack(spacing: 6) {
                    ForEach(0..<5, id: \.self) { index in
                        Circle()
                            .fill(index == 0 ? SawabTheme.olive : .clear)
                            .overlay(Circle().stroke(SawabTheme.olive, lineWidth: 1.5))
                            .frame(width: 7, height: 7)
                    }
                }
                .frame(maxWidth: .infinity)

                Text(opportunity.title)
                    .font(SawabTheme.editorial(37))
                    .tracking(-1.2)
                    .foregroundStyle(SawabTheme.ink)
                    .fixedSize(horizontal: false, vertical: true)

                Label("Sawab Verified · sample", systemImage: "checkmark")
                    .font(SawabTheme.body(14, weight: .semibold))
                    .foregroundStyle(SawabTheme.deepOlive)

                VStack(alignment: .leading, spacing: 4) {
                    Text("Organized by")
                        .font(SawabTheme.body(13))
                        .foregroundStyle(SawabTheme.muted)
                    Text(opportunity.organization + "  →")
                        .font(SawabTheme.body(18, weight: .medium))
                        .foregroundStyle(SawabTheme.deepOlive)
                }

                Text(opportunity.description)
                    .font(SawabTheme.body(15))
                    .foregroundStyle(SawabTheme.ink)

                VStack(alignment: .leading, spacing: 22) {
                    DetailRow(symbol: "mappin", title: "Location", value: opportunity.city)
                    DetailRow(symbol: "clock", title: "Ends", value: opportunity.deadline)
                    DetailRow(symbol: "scope", title: "Goal", value: opportunity.goal)
                    DetailRow(symbol: "person.2", title: "Donations", value: opportunity.contributors)
                }
                .padding(26)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(.white, in: RoundedRectangle(cornerRadius: 28))

                Button { showDemoAlert = true } label: {
                    Text("I'd like to help  ↗")
                        .font(SawabTheme.body(16, weight: .semibold))
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 17)
                }
                .foregroundStyle(.white)
                .background(SawabTheme.olive, in: RoundedRectangle(cornerRadius: 17))
                .padding(.bottom, 20)
            }
            .padding(.horizontal, 22)
            .padding(.top, 9)
        }
        .background(SawabTheme.cream.ignoresSafeArea())
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

private struct DetailRow: View {
    let symbol: String
    let title: String
    let value: String

    var body: some View {
        HStack(alignment: .top, spacing: 17) {
            Image(systemName: symbol)
                .font(.system(size: 23, weight: .light))
                .frame(width: 27)
                .foregroundStyle(SawabTheme.olive)
            VStack(alignment: .leading, spacing: 4) {
                Text(title).font(SawabTheme.body(14, weight: .semibold)).foregroundStyle(SawabTheme.olive)
                Text(value).font(SawabTheme.body(15)).foregroundStyle(SawabTheme.ink)
            }
        }
    }
}
