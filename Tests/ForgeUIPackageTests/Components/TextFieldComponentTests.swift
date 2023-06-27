//
//  TextFieldComponentTests.swift
//  
//
//  Created by Diego Alejandro Villa Cardenas on 27/06/23.
//

import XCTest
@testable import ForgeUIPackage

final class TextFieldComponentTests: XCTestCase {
    func testComponentIsDecodable() throws {
        _ = try TextFieldComponent.numericTextField()
        _ = try TextFieldComponent.emailTextField()
        _ = try TextFieldComponent.nameTextField()
        _ = try TextFieldComponent.phoneTextField()
    }
}
