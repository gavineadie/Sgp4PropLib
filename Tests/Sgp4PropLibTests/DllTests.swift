//
//  DllTests.swift
//
//  Created by Gavin Eadie on 14 Jan 2023.
//

import XCTest

@testable import Sgp4PropLib

final class DllTests: XCTestCase {

    func testLoader() {

        let handle1 = Loader.load(getDylibPath() + "libtle.dylib", mode: .lazy)
        XCTAssert(handle1 != nil)

        let handle2 = Loader.load(getDylibPath() + "xxxxxx.dylib", mode: .lazy)
        XCTAssert(handle2 == nil)

    }

    func testDllVersion() { XCTAssertEqual(dllVersion(), 9.0, "dllVersion failure") }

    func testLastErrMsg() {

        XCTAssertEqual(getLastErrMsg(), "")

    }

    func testGetLastInfoMsg() {

        XCTAssertEqual(GetLastInfoMsg(), "")

    }

}
