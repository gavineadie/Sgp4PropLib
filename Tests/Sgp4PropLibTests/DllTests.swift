//
//  DllTests.swift
//
//  Created by Gavin Eadie on 14 Jan 2023.
//

import XCTest

@testable import Sgp4PropLib

final class DllTests: XCTestCase {

    func testDllVersion() { XCTAssertEqual(dllVersion(), 9.0, "dllVersion failure") }

    func testLastErrMsg() {

        XCTAssertEqual(getLastErrMsg(), "")

    }

    func testGetLastInfoMsg() {

        XCTAssertEqual(GetLastInfoMsg(), "")

    }

}
