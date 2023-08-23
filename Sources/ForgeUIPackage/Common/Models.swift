//
//  Models.swift
//  
//
//  Created by Diego Alejandro Villa Cardenas on 26/06/23.
//

import Foundation

extension Component {
    public enum Identifier: Codable, RawRepresentable, Equatable {
        case custom(String)

        public var rawValue: String {
            switch self {
            case .custom(let rawValue): return rawValue
            }
        }

        public init?(rawValue: String) {
            switch CodingKeys(rawValue: rawValue.uppercased()) {
            default: self = .custom(rawValue)
            }
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            let rawValue = try container.decode(String.self)
            self = .init(rawValue: rawValue) ?? .custom(rawValue)
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public enum ComponentType: String, Codable {
        case label = "LABEL"
        case textField = "TEXT_FIELD"
        case button = "BUTTON"
        case chip = "CHIP"
        case termsAndConditions = "TERMS_AND_CONDITIONS"
        case richLabel = "RICH_LABEL"
        case passwordTextField = "PASSWORD_TEXT_FIELD"
        case segmentedSwitch = "SEGMENTED_SWITCH"
        case card = "CREW_MEMBER_CARD"
        case reportDetail = "BODY_REPORT_DETAIL"
        case fingerprint = "FINGERPRINT" //Type required to decode SISEM Login screen
        case contentHeader = "CONTENT_HEADER"
        case filters = "FILTERS"
        case chipOptions = "CHIP_OPTIONS"
        case finding = "FINDING"
        case detailedInfoList = "DETAILED_INFO_LIST"
    }

    public enum TextStyle: String, Codable {
        case headline1 = "HEADLINE_1"
        case headline2 = "HEADLINE_2"
        case headline3 = "HEADLINE_3"
        case headline4 = "HEADLINE_4"
        case headline5 = "HEADLINE_5"
        case headline6 = "HEADLINE_6"
        case headline7 = "HEADLINE_7"
        case headline8 = "HEADLINE_8"
        case body1 = "BODY_1"
        case button1 = "BUTTON_1"
        case button2 = "BUTTON_2"
    }

    public struct Margin: Codable {
        public let top: CGFloat
        public let left: CGFloat
        public let right: CGFloat
        public let bottom: CGFloat

        init() {
            top = 0
            left = 0
            right = 0
            bottom = 0
        }

        public init(top: CGFloat, left: CGFloat, right: CGFloat, bottom: CGFloat) {
            self.top = top
            self.left = left
            self.right = right
            self.bottom = bottom
        }
    }

    public enum Arrangement: String, Codable {
        case start = "START"
        case center = "CENTER"
        case end = "END"
    }
}

