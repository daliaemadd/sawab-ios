import SwiftUI

struct OpportunityPhoto: View {
    let opportunity: Opportunity
    var height: CGFloat = 225

    var body: some View {
        // Constrain image width to its container so intrinsic image dimensions
        // cannot push card content beyond the scroll view's available width.
        GeometryReader { geometry in
            ZStack {
                if let name = opportunity.imageName, UIImage(named: name) != nil {
                    Image(name)
                        .resizable()
                        .scaledToFill()
                        .frame(width: geometry.size.width, height: height)
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
        }
        .frame(height: height)
        .frame(maxWidth: .infinity)
        .clipped()
        .accessibilityLabel("Illustration for \(opportunity.title)")
    }
}
