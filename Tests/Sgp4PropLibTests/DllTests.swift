//
//  DllTests.swift
//
//  Created by Gavin Eadie on 1/14/23.
//

import XCTest

@testable import Sgp4PropLib

final class DllTests: XCTestCase {

    func testDllVersion() { XCTAssert(dllVersion() == 9.0, "dllVersion failure") }

    func testLastErrMsg() {

        XCTAssertEqual(getLastErrMsg(), "")

    }

    func testGetLastInfoMsg() {

        XCTAssertEqual(GetLastInfoMsg(), "")

    }

}
