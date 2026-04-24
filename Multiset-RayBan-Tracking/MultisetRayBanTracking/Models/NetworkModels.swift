import Foundation

// MARK: - Network Message Types

/// Shared protocol with iOS SDK multiplayer — must match exactly
enum MessageType: UInt8, Codable {
    case poseUpdate = 1
    case playerInfo = 2
}

struct PlayerInfo: Codable {
    let playerName: String
    let colorR: Float
    let colorG: Float
    let colorB: Float
}

struct PoseUpdate: Codable {
    let positionX: Float
    let positionY: Float
    let positionZ: Float
    let rotationX: Float
    let rotationY: Float
    let rotationZ: Float
    let rotationW: Float
    let isLocalized: Bool
}

struct NetworkMessage: Codable {
    let type: MessageType
    let senderID: String
    let payload: Data
}
