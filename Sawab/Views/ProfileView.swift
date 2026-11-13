import SwiftUI

struct ProfileView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 22) {
                BrandMark().padding(.top, 75)
                Text("A kinder world starts somewhere.")
                    .font(SawabTheme.editorial(36))
                    .tracking(-1)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(SawabTheme.ink)
                Text("Maybe it starts with you.")
                    .font(SawabTheme.body(16))
                    .foregroundStyle(SawabTheme.olive)
                Rectangle()
                    .fill(SawabTheme.line)
                    .frame(height: 1)
                    .padding(.vertical, 16)
                Text("We're still growing.")
                    .font(SawabTheme.editorial(24))
                    .foregroundStyle(SawabTheme.ink)
                Text("Profiles and sign-in are coming later. For now, this is a demo with sample community needs, not a live donation service.")
                    .font(SawabTheme.body(15))
                    .foregroundStyle(SawabTheme.muted)
                    .multilineTextAlignment(.center)
                Text("MADE WITH CARE  ·  ثواب")
                    .font(SawabTheme.body(10, weight: .semibold))
                    .tracking(1.2)
                    .foregroundStyle(SawabTheme.olive)
                    .padding(.top, 45)
            }
            .frame(maxWidth: .infinity)
            .padding(.horizontal, 34)
        }
        .background(SawabTheme.cream.ignoresSafeArea())
        .toolbar(.hidden, for: .navigationBar)
    }
}
