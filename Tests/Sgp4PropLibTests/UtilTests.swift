//
//  UtilTests.swift
//
//  Created by Gavin Eadie on 10/17/22.
//

import XCTest

@testable import Sgp4PropLib
@testable import AstroStds_c             // for "GETSETSTRLEN"

final class UtilTests: XCTestCase {

    func testWarning() { printWarning("\"Swift Port of Sgp4Prop\"") }

    func testStringArrayConversion() {

        let arrayCount = Int32(24)
        XCTAssert(0 == stringFromCharacterArray(nullCharacterArray(size: arrayCount),
                                                size: arrayCount).count)

    }

    func testStringToLongArray() {

        let charArray = stringToLongArray("123456789")
        XCTAssertEqual(charArray.count, Int(GETSETSTRLEN)+1)    // room for a null-termination

    }

}
