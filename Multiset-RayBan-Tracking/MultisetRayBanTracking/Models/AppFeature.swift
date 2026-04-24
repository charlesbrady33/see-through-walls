import SwiftUI

/// Represents the demo experiences in the app
enum AppFeature: String, CaseIterable, Identifiable {
    case localization = "Localization Demo"
    case navigation = "Navigation Demo"
    case multiplayer = "Multiplayer Demo"

    var id: String { rawValue }

    /// Display title for the feature
    var title: String {
        switch self {
        case .localization:
            return "Localization Demo"
        case .navigation:
            return "Navigation Demo"
        case .multiplayer:
            return "Multiplayer Demo"
        }
    }

    /// Short description of the feature
    var description: String {
        switch self {
        case .localization:
            return "Capture images and test positioning with real-time pose data"
        case .navigation:
            return "Full navigation with audio-guided turn-by-turn directions"
        case .multiplayer:
            return "Share your pose with a nearby host so others can see your position"
        }
    }

    /// SF Symbol icon name
    var iconName: String {
        switch self {
        case .localization:
            return "location.viewfinder"
        case .navigation:
            return "point.topleft.down.to.point.bottomright.curvepath.fill"
        case .multiplayer:
            return "person.2.fill"
        }
    }

    /// Accent color for the feature
    var accentColor: Color {
        switch self {
        case .localization:
            return AppColors.accentBlue
        case .navigation:
            return AppColors.accentGreen
        case .multiplayer:
            return AppColors.accentPurple
        }
    }
}
