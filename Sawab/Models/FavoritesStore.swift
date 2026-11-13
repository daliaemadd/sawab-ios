import Foundation
import Observation

/// Stores only stable sample IDs; no personal data or network access.
@MainActor
@Observable
final class FavoritesStore {
    private let defaults: UserDefaults
    private let key = "sawab.savedOpportunityIDs"

    var ids: Set<Int> {
        didSet {
            defaults.set(ids.sorted(), forKey: key)
        }
    }

    init(defaults: UserDefaults = .standard) {
        self.defaults = defaults
        ids = Set(defaults.array(forKey: key) as? [Int] ?? [])
    }
}
