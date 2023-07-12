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

        // Quiet
        XCTAssertNoThrow(try ButtonComponent.quietTextAndIconButtonExample())

        // Secondary
        XCTAssertNoThrow(try ButtonComponent.secondaryTextAndIconButtonExample())

        //Transparent
        XCTAssertNoThrow(try ButtonComponent.transparentButtonExample())
    }

    func testTextFieldCodableComponent() throws {
        XCTAssertNoThrow(try TextFieldComponent.numericTextField())
        XCTAssertNoThrow(try TextFieldComponent.emailTextField())
        XCTAssertNoThrow(try TextFieldComponent.nameTextField())
        XCTAssertNoThrow(try TextFieldComponent.phoneTextField())
    }

    func testChipCodableComponent() throws {
        XCTAssertNoThrow(try ChipComponent.example())
    }
}
