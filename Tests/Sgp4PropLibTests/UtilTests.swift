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
        XCTAssert(0 == String(fromCcharArray: emptyCcharArray(size: arrayCount),
                              size: arrayCount).count)
        
    }
    
    func testToLongArray() {
        
        let arrayCount = 24
        let charArray = "123456789".toCcharArray(size: arrayCount)
        XCTAssertEqual(charArray.count, Int(arrayCount)+1)    // room for a null-termination
        
    }

}
