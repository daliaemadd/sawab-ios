import SwiftUI

struct OpportunityCard: View {
    let opportunity: Opportunity

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            OpportunityPhoto(opportunity: opportunity, height: 208)
                .overlay(alignment: .topLeading) {
                    Text(opportunity.category)
                        .font(SawabTheme.body(11, weight: .semibold))
                        .foregroundStyle(SawabTheme.deepOlive)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 7)
                        .background(SawabTheme.peach, in: Capsule())
                        .padding(15)
                }

            VStack(alignment: .leading, spacing: 12) {
                HStack(alignment: .top, spacing: 8) {
                    Text(opportunity.title)
                        .font(SawabTheme.editorial(27))
                        .tracking(-0.7)
                        .foregroundStyle(SawabTheme.ink)
                        .fixedSize(horizontal: false, vertical: true)
                    Spacer(minLength: 2)
                }

                HStack(spacing: 5) {
                    Image(systemName: "checkmark.seal")
                    Text("Sawab Verified")
                    Text("· demo")
                        .foregroundStyle(SawabTheme.muted)
                }
                .font(SawabTheme.body(12, weight: .semibold))
                .foregroundStyle(SawabTheme.deepOlive)

                Text(opportunity.description)
                    .font(SawabTheme.body(14))
                    .foregroundStyle(SawabTheme.ink)
                    .fixedSize(horizontal: false, vertical: true)

                HStack(spacing: 16) {
                    Label(opportunity.distance, systemImage: "mappin")
                    Label(opportunity.duration, systemImage: "clock")
                }
                .font(SawabTheme.body(12))
                .foregroundStyle(SawabTheme.muted)

                Text("Help now  ↗")
                    .font(SawabTheme.body(15, weight: .semibold))
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 14)
                    .background(SawabTheme.deepOlive, in: RoundedRectangle(cornerRadius: 18))
            }
            .padding(20)
        }
        .background(SawabTheme.paper, in: RoundedRectangle(cornerRadius: 24))
        .shadow(color: SawabTheme.deepOlive.opacity(0.06), radius: 16, x: 0, y: 6)
        .clipShape(RoundedRectangle(cornerRadius: 24))
        .overlay(RoundedRectangle(cornerRadius: 24).stroke(SawabTheme.line.opacity(0.5), lineWidth: 0.6))
    }
}
