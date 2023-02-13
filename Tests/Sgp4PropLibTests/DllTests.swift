//
//  DllTests.swift
//
//  Created by Gavin Eadie on 14 Jan 2023.
//

import XCTest

@testable import Sgp4PropLib

final class DllTests: XCTestCase {

    func testLoader() {

        let handle1 = Loader.load(getDylibPath() + "libtle.dylib", mode: RTLD_LAZY)
        XCTAssert(handle1 != nil)

        let handle2 = Loader.load(getDylibPath() + "xxxxxx.dylib", mode: RTLD_LAZY)
        XCTAssert(handle2 == nil)

    }

#if os(macOS)
    func testDllVersion() { XCTAssertEqual(dllVersion(), 9.0, "dllVersion failure") }
#endif

    func testLastErrMsg() {

        XCTAssertEqual(getLastErrMsg(), "")

    }

    func testGetLastInfoMsg() {

        XCTAssertEqual(GetLastInfoMsg(), "")

    }

}
