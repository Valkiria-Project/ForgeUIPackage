//
//  Action.swift
//  
//
//  Created by Diego Alejandro Villa Cardenas on 27/06/23.
//

import Foundation

public enum ActionType: String, Codable {
    case dismiss = "DISMISS"
    case deviceAuth = "DEVICE_AUTH"
    case login = "LOGIN"
    case forgotPassword = "FORGOT_PASSWORD"
}

public struct Action: Codable {
    public let type: ActionType

    public init(type: ActionType) {
        self.type = type
    }
}
