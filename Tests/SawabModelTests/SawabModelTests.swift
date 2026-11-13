import Foundation
import Testing
@testable import SawabModels

@MainActor
struct FavoritesTests {
    @Test func savedSelectionsSurviveStoreRecreation() throws {
        let suite = "SawabTests-" + UUID().uuidString
        let defaults = try #require(UserDefaults(suiteName: suite))
        defer { defaults.removePersistentDomain(forName: suite) }

        let original = FavoritesStore(defaults: defaults)
        #expect(original.ids.isEmpty)
        original.ids.insert(1)
        original.ids.insert(4)
        let restored = FavoritesStore(defaults: defaults)
        #expect(restored.ids == [1, 4])
        restored.ids.remove(1)
        #expect(FavoritesStore(defaults: defaults).ids == [4])
        restored.ids.remove(4)
        #expect(FavoritesStore(defaults: defaults).ids.isEmpty)
    }

    @Test func malformedStorageFallsBackToEmpty() throws {
        let suite = "SawabTests-" + UUID().uuidString
        let defaults = try #require(UserDefaults(suiteName: suite))
        defer { defaults.removePersistentDomain(forName: suite) }
        defaults.set("invalid", forKey: "sawab.savedOpportunityIDs")
        #expect(FavoritesStore(defaults: defaults).ids.isEmpty)
    }
}

struct OpportunityTests {
    @Test func sampleIdentityAndCategoriesAreConsistent() {
        #expect(Opportunity.examples.count == 4)
        #expect(Set(Opportunity.examples.map(\.id)).count == 4)
        #expect(Opportunity.examples.allSatisfy { Opportunity.categories.contains($0.category) })
    }

    @Test func searchCombinesWithCategoryAndNormalizesWhitespace() {
        #expect(Opportunity.matching(query: "  CAIRO  ", category: "All").map(\.id) == [1])
        #expect(Opportunity.matching(query: "Arabic", category: "Give items").map(\.id) == [3])
        #expect(Opportunity.matching(query: "Aswan Skills", category: "All").map(\.id) == [4])
        #expect(Opportunity.matching(query: "Cairo", category: "Share skills").isEmpty)
        #expect(Opportunity.matching(query: "", category: "Share skills").map(\.id) == [4])
        #expect(Opportunity.matching(query: "unmatched", category: "All").isEmpty)
        #expect(Opportunity.matching(query: "  ", category: "All").count == 4)
    }
}
