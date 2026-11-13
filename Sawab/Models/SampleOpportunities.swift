import Foundation

extension Opportunity {
    /// Fictional scenarios and organizations, with stable IDs for local favorites.
    static let examples: [Opportunity] = [
        .init(id: 1, title: "Help 85 students start school prepared.",
              description: "Pack notebooks, pencils, and backpacks for children attending a community learning center in Cairo.",
              organization: "Nile Learning Circle", city: "Cairo", distance: "2.1 km away", duration: "45 min",
              deadline: "September 10", goal: "85 backpacks", contributors: "62 contributors",
              category: "Give items", imageName: "SchoolSupplies", symbol: "backpack"),
        .init(id: 2, title: "Share warm meals with neighbors.",
              description: "Join a morning cooking session to prepare and pack nourishing meals for families in Giza.",
              organization: "Giza Community Table", city: "Giza", distance: "5.4 km away", duration: "2 hours",
              deadline: "September 15", goal: "200 meals", contributors: "38 contributors",
              category: "Give time", imageName: nil, symbol: "fork.knife"),
        .init(id: 3, title: "Open a new chapter for young readers.",
              description: "Sort gently used Arabic storybooks and help a neighborhood reading room build its first children's library.",
              organization: "Alexandria Reading Room", city: "Alexandria", distance: "Alexandria", duration: "1 hour",
              deadline: "September 20", goal: "150 books", contributors: "24 contributors",
              category: "Give items", imageName: nil, symbol: "books.vertical"),
        .init(id: 4, title: "Share skills. Grow possibilities.",
              description: "Help young adults practice writing a CV, using email, and preparing for their first job interview at a local workshop.",
              organization: "Aswan Skills Collective", city: "Aswan", distance: "Aswan", duration: "90 min",
              deadline: "September 25", goal: "20 learners", contributors: "8 volunteers",
              category: "Share skills", imageName: nil, symbol: "laptopcomputer")
    ]
}
