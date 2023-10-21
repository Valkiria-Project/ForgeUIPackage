//
//  CrewMemberSignature.swift
//  
//
//  Created by Diego Alejandro Villa Cardenas on 21/10/23.
//

import Foundation

public class CrewMemberSignatureComponent: Component {
    public let name: Component.Content
    public let identification: Component.Content
    public let signature: String

    private enum CodingKeys: String, CodingKey {
        case name
        case identification
        case signature
    }

    public init(
        id: String,
        name: Component.Content,
        identification: Component.Content,
        signature: String,
        margins: Component.Margin
    ) {
        self.name = name
        self.identification = identification
        self.signature = signature
        super.init(id: id, margins: margins, type: .crewMemberSignature, arrangement: .center)
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(Component.Content.self, forKey: .name)
        self.identification = try container.decode(Component.Content.self, forKey: .identification)
        self.signature = try container.decode(String.self, forKey: .signature)
        try super.init(from: decoder)
    }
}
