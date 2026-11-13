import SwiftUI

enum SawabTheme {
    static let cream = Color(red: 0.986, green: 0.972, blue: 0.951)
    static let paper = Color(red: 1.0, green: 0.992, blue: 0.978)
    static let olive = Color(red: 0.43, green: 0.51, blue: 0.35)
    static let deepOlive = Color(red: 0.33, green: 0.40, blue: 0.28)
    static let ink = Color(red: 0.17, green: 0.18, blue: 0.16)
    static let muted = Color(red: 0.45, green: 0.44, blue: 0.40)
    static let peach = Color(red: 0.97, green: 0.85, blue: 0.79)
    static let paleGreen = Color(red: 0.91, green: 0.93, blue: 0.87)
    static let line = Color(red: 0.88, green: 0.87, blue: 0.83)

    // Apple's New York serif is built in. Swap with a licensed custom font later.
    static func editorial(_ size: CGFloat) -> Font {
        .system(size: size, weight: .regular, design: .serif)
    }

    static func body(_ size: CGFloat = 16, weight: Font.Weight = .regular) -> Font {
        .system(size: size, weight: weight, design: .default)
    }
}
