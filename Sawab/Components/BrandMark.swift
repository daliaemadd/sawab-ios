import SwiftUI

struct BrandMark: View {
    var body: some View {
        VStack(spacing: -2) {
            Image(systemName: "heart.fill")
                .font(.system(size: 12))
                .foregroundStyle(SawabTheme.peach)
                .offset(y: 2)
            Text("sawab")
                .font(.system(size: 34, weight: .medium, design: .rounded))
                .tracking(-1.9)
                .foregroundStyle(SawabTheme.olive)
            Text("ثواب")
                .font(.system(size: 16))
                .foregroundStyle(SawabTheme.olive)
        }
        .accessibilityElement(children: .combine)
    }
}
