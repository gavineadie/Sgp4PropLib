//
//  UtilTests.swift
//
//  Created by Gavin Eadie on 10/17/22.
//

import XCTest

@testable import Sgp4PropLib

final class UtilTests: XCTestCase {

    func testWarning() { printWarning("\"Swift Port of Sgp4Prop\"") }

    func testStringArrayConversion() {

        let arrayCount = 24
        XCTAssert(0 == stringFromCharacterArray(nullCharacterArray(size: arrayCount),
                                                size: arrayCount).count)

    }

    func testStringToLongArray() {

        let arrayCount = 24
        let charArray = stringToLongArray("123456789", size: arrayCount)
        XCTAssertEqual(charArray.count, Int(arrayCount)+1)    // room for a null-termination

    }

}
