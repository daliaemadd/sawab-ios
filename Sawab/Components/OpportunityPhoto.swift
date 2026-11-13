import SwiftUI

struct OpportunityPhoto: View {
    let opportunity: Opportunity
    var height: CGFloat = 225

    var body: some View {
        ZStack {
            if let name = opportunity.imageName, UIImage(named: name) != nil {
                Image(name)
                    .resizable()
                    .scaledToFill()
                    .frame(height: height)
                    .frame(maxWidth: .infinity)
                    .clipped()
            } else {
                Rectangle().fill(SawabTheme.paleGreen)
                Circle().fill(SawabTheme.peach.opacity(0.6))
                    .frame(width: 190, height: 190)
                    .offset(x: -115, y: 70)
                Image(systemName: opportunity.symbol)
                    .font(.system(size: 76, weight: .ultraLight))
                    .foregroundStyle(SawabTheme.deepOlive.opacity(0.75))
            }
        }
        .frame(height: height)
        .frame(maxWidth: .infinity)
        .clipped()
        .accessibilityLabel("Illustration for \(opportunity.title)")
    }
}
