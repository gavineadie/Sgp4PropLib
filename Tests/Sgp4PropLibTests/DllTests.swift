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
    
    func testVersion() {
        
        let dllVersion = dllMainGetInfo()
        
        if dllVersion.contains("Version: v9.0") {
            print("!!! DLL V9.0 is not a current version .. update to V9.2 !!!")
        } else if dllVersion.contains("Version: v9.1") {
            print("!!! DLL V9.1 is not a current version .. update to V9.2 !!!")
        } else if dllVersion.contains("Version: v9.2") {
            print("DLL V9.2 is the current version .. ")
        } else {
            print("!!! DLL version is unknown !!!")
        }

    }

    func testLastErrMsg() {

        XCTAssertEqual(getLastErrMsg(), "")

    }

    func testGetLastInfoMsg() {

        XCTAssertEqual(GetLastInfoMsg(), "")

    }

    func testEnvironment() {
        print("##                       PATH: " + (getEnVariable("PATH") ?? "missing"))
        print("##            LD_LIBRARY_PATH: " + (getEnVariable("LD_LIBRARY_PATH") ?? "missing"))
        print("##          DYLD_LIBRARY_PATH: " + (getEnVariable("DYLD_LIBRARY_PATH") ?? "missing"))
        print("## DYLD_FALLBACK_LIBRARY_PATH: " + (getEnVariable("DYLD_FALLBACK_LIBRARY_PATH") ?? "missing"))
    }

}
