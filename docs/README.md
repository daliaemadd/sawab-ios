# Sawab (ثواب) — editorial SwiftUI prototype

A native iOS prototype of Sawab, a community-help app concept. This version introduces a warmer editorial aesthetic based on the original Figma screens: cream canvas, muted olive accents, serif headlines, subtle details, and custom navigation.

![Original Sawab Figma reference](docs/figma-reference.png)

## Current features

- Scrollable home feed with opportunity cards and artwork
- Detail screens with a save/unsave button
- Search and category filters in Explore
- Saved opportunities (in-memory during the current run)
- Profile concept screen
- An explicitly demo-only help interaction (no real donations)

**All organizations, verification labels, community needs, distances, dates, and counts in the prototype are illustrative sample data.** No real donation transactions, account creation, or backend calls are included.

## Open it in Xcode

This download contains source files, **not** an `.xcodeproj` package. Create your own project:

1. Open Xcode → File → New → Project → iOS → App.
2. Product name: `Sawab`; Interface: SwiftUI; Language: Swift; deployment target: iOS 16 or later.
3. Remove the two *generated* Swift files, `ContentView.swift` and `SawabApp.swift`, from the Xcode project (choose Move to Trash). This avoids duplicate `@main` declarations.
4. Drag all **five folders of Swift files** from `Sawab/` (`App`, `Models`, `Theme`, `Components`, `Views` — five folders) into the Xcode navigator; choose **Copy items if needed** and ensure your Sawab app target is checked. Xcode may offer Create Groups or Create Folder References; choose groups or Xcode synchronized folders for Swift source. Check Build Phases → Compile Sources if files are missing from the target.
5. Import the `school-supplies.jpg` image into `Assets.xcassets` as an image set named **SchoolSupplies** (or merge the included `Assets.xcassets` into your project's asset catalog). Do not delete Xcode's existing accent color or app icon unless you want to replace them.
6. Run in an iPhone Simulator (⌘R).

There should be exactly **one** `@main` declaration: `App/SawabApp.swift`.

## Source structure

```
Sawab/
  App/         SawabApp.swift, RootView.swift
  Models/      Opportunity.swift
  Theme/       SawabTheme.swift
  Components/  BrandMark.swift, OpportunityPhoto.swift, OpportunityCard.swift
  Views/       HomeView.swift, OpportunityDetailView.swift, ExploreView.swift,
               SavedView.swift, ProfileView.swift
  Assets.xcassets/SchoolSupplies.imageset/
```

## Typography and photography

The large editorial headings use Apple's **built-in New York serif** (SwiftUI `.serif`), so you don't need to install or license a font. This is a closer *feel* to the Figma typography, not an exact font match. You can change typography globally in `Theme/SawabTheme.swift`.

The school supplies image is an original illustrative placeholder included in the project. Replace it with your own or properly licensed photography in the `SchoolSupplies` asset for a photo-forward result closer to Figma. Keep the image set name the same.

## Screenshots for GitHub

From the iPhone Simulator choose **File → Save Screenshot** on the Home, Explore, and detail screens. Put them in `docs/` as `home.png`, `explore.png`, and `detail.png`. Then add to the README:

```md
| Home | Explore | Opportunity |
|---|---|---|
| ![Home](docs/home.png) | ![Explore](docs/explore.png) | ![Details](docs/detail.png) |
```

## Next steps

- Replace placeholders with authorized photos and real content
- Add persistence for saved opportunities
- Improve dynamic type and VoiceOver support, test on smaller devices
- Build a backend with verified records and appropriate safety/privacy safeguards before handling real requests

Design concept: Dalia Mahmoud. Implementation: SwiftUI prototype.
