import Foundation

struct Opportunity: Identifiable, Hashable {
    let id: Int
    let title: String
    let description: String
    let organization: String
    let city: String
    let distance: String
    let duration: String
    let deadline: String
    let goal: String
    let contributors: String
    let category: String
    let imageName: String?
    let symbol: String

    static let examples: [Opportunity] = [
        .init(id: 1, title: "Help 85 students start school prepared.",
              description: "These backpacks will help students begin the school year with the supplies they need.",
              organization: "Misr El Kheir", city: "Cairo", distance: "2.1 km away", duration: "45 min",
              deadline: "July 30", goal: "85 backpacks", contributors: "62 contributors",
              category: "Give items", imageName: "SchoolSupplies", symbol: "backpack"),
        .init(id: 2, title: "Share warm meals with neighbors.",
              description: "Give a little time to help prepare meals for families in the community.",
              organization: "Community Kitchen", city: "Giza", distance: "5.4 km away", duration: "1 hour",
              deadline: "August 12", goal: "200 meals", contributors: "38 contributors",
              category: "Give time", imageName: nil, symbol: "fork.knife")
    ]
}
