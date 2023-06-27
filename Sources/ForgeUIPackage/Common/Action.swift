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
}

public struct Action: Codable {
    let type: ActionType
}
