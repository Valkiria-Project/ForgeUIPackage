//
//  LabelComponentTests.swift
//  
//
//  Created by Diego Alejandro Villa Cardenas on 26/06/23.
//

import XCTest
@testable import ForgeUIPackage

final class LabelComponentTests: XCTestCase {

    func testComponentIsDecodable() throws {
        _ = try LabelComponent.titleExample()
    }

    func testDecode() throws {
        let labelComponent: Component = try SerializationHelper.fromJsonResource(named: "TitleLabelComponent")
        XCTAssertNoThrow(labelComponent as! LabelComponent)
    }
}

