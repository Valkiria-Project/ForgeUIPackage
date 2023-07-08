//
//  ComponentsTests.swift
//  
//
//  Created by Diego Alejandro Villa Cardenas on 8/07/23.
//

import XCTest
@testable import ForgeUIPackage

final class ComponentsTests: XCTestCase {

    func testLabelCodableComponent() throws {
        XCTAssertNoThrow(try LabelComponent.titleExample())
        XCTAssertNoThrow(try LabelComponent.headingExample())
        XCTAssertNoThrow(try LabelComponent.bodyExample())
    }

    func testButtonCodableComponent() throws {
        // Loud
        XCTAssertNoThrow(try ButtonComponent.loudTextAndIconButtonExample())
        XCTAssertNoThrow(try ButtonComponent.loudIconOnlyButtonExample())
        XCTAssertNoThrow(try ButtonComponent.loudTextOnlyButtonExample())

        // Quiet
        XCTAssertNoThrow(try ButtonComponent.quietIconOnlyButtonExample())
        XCTAssertNoThrow(try ButtonComponent.quietTextOnlyButtonExample())
        XCTAssertNoThrow(try ButtonComponent.quietTextAndIconButtonExample())

        // Secondary
        XCTAssertNoThrow(try ButtonComponent.secondaryIconOnlyButtonExample())
        XCTAssertNoThrow(try ButtonComponent.secondaryTextOnlyButtonExample())
        XCTAssertNoThrow(try ButtonComponent.secondaryTextAndIconButtonExample())
    }

    func testTextFieldCodableComponent() throws {
        _ = try TextFieldComponent.numericTextField()
        _ = try TextFieldComponent.emailTextField()
        _ = try TextFieldComponent.nameTextField()
        _ = try TextFieldComponent.phoneTextField()
    }
}
