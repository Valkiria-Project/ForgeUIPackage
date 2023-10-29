//
//  TimePickerComponent.swift
//  
//
//  Created by Diego Alejandro Villa Cardenas on 13/10/23.
//

import Foundation

public class TimePickerComponent: Component {

    public let title: Component.Content
    public let hour: Component.Content
    public let minute: Component.Content

    private enum CodingKeys: String, CodingKey {
        case title, hour, minute
    }

    public init(
        id: String,
        margins: Component.Margin,
        arrangement: Component.Arrangement,
        section: String? = nil,
        title: Component.Content,
        hour: Component.Content,
        minute: Component.Content
    ) {
        self.title = title
        self.hour = hour
        self.minute = minute
        super.init(id: id, margins: margins, type: .timePicker, arrangement: arrangement)
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.title = try container.decode(Component.Content.self, forKey: .title)
        self.hour = try container.decode(Component.Content.self, forKey: .hour)
        self.minute = try container.decode(Component.Content.self, forKey: .minute)
        try super.init(from: decoder)
    }
}
