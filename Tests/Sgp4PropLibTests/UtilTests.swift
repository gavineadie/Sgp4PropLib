//
//  UtilTests.swift
//
//  Created by Gavin Eadie on 10/17/22.
//

import XCTest

@testable import Sgp4PropLib

final class UtilTests: XCTestCase {

    //
    //MARK: Other Tests
    //

    func testWarning() { printWarning("\"Swift Port of Sgp4Prop\"") }

    func testStringArrayConversion() {

        let arrayCount = Int32(24)
        XCTAssert(0 == stringFromCharacterArray(nullCharacterArray(size: arrayCount),
                                                size: arrayCount).count)

    }

}
