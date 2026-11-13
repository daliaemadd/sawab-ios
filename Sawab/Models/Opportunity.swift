import Foundation

struct Opportunity: Identifiable, Hashable, Sendable {
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

    /// Search and category selection are combined, including descriptions and organizers.
    static func matching(query: String, category: String) -> [Opportunity] {
        let query = query.trimmingCharacters(in: .whitespacesAndNewlines)
        return examples.filter { opportunity in
            (category == "All" || opportunity.category == category) &&
            (query.isEmpty || [opportunity.title, opportunity.description,
                              opportunity.city, opportunity.organization, opportunity.category]
                .contains { $0.localizedCaseInsensitiveContains(query) })
        }
    }

    static let categories = ["All", "Give items", "Give time", "Share skills"]
}
