//
//  CardComponent.swift
//  
//
//  Created by Diego Alejandro Villa Cardenas on 3/08/23.
//

import Foundation

public class CardComponent: Component {
    public struct Pill: Codable {
        let title: Content
        let color: String

        public init(title: Content, color: String) {
            self.title = title
            self.color = color
        }
    }

    public struct CardChipSection: Codable {

        public struct List: Codable {
            let text: [String]
            let textStyle: Component.TextStyle

            private enum CodingKeys: String, CodingKey {
                case text
                case textStyle = "text_style"
            }
        }

        public let title: Content
        public let listText: List

        private enum CodingKeys: String, CodingKey {
            case title
            case listText = "list_text"
        }

        public init(title: Content, listText: List) {
            self.title = title
            self.listText = listText
        }
    }

    public let icon: String
    public let title: Content
    public let pill: Pill
    public let date: Content
    public let chipSection: CardChipSection?
    public let reportsDetail: DetailScreen?

    private enum CodingKeys: String, CodingKey {
        case icon, title, pill, date
        case chipSection = "chip_section"
        case reportsDetail = "reports_detail"
    }

    public init(
        identifier: Component.Identifier? = nil,
        icon: String,
        title: Component.Content,
        pill: Pill,
        date: Component.Content,
        chipSection: CardChipSection?,
        reportsDetail: DetailScreen?,
        margins: Component.Margin
    ) {
        self.icon = icon
        self.title = title
        self.pill = pill
        self.date = date
        self.chipSection = chipSection
        self.reportsDetail = reportsDetail
        super.init(identifier:identifier, margins: margins, type: .card)
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.icon = try container.decode(String.self, forKey: .icon)
        self.title = try container.decode(Component.Content.self, forKey: .title)
        self.pill = try container.decode(Pill.self, forKey: .pill)
        self.date = try container.decode(Component.Content.self, forKey: .date)
        self.chipSection = try container.decodeIfPresent(CardChipSection.self, forKey: .chipSection)
        self.reportsDetail = try container.decodeIfPresent(DetailScreen.self, forKey: .reportsDetail)
        try super.init(from: decoder)
    }
}

extension CardComponent {
    static func example() throws -> CardComponent {
        let component: CardComponent = try fromJsonResource(named: "CardComponent")
        return component
    }
}
