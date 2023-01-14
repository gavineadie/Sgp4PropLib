//
//  Sgp4Tests.swift
//
//  Created by Gavin Eadie on 1/14/23.
//

import XCTest

@testable import Sgp4PropLib

final class Sgp4Tests: XCTestCase {

    func testInitSat() {

        _ = Sgp4RemoveAllSats()                         // clear the satellite store

        let satKey = tleAddSatFrLines("1 00694U 63047A   22346.21636301 +.00001226  00000 0  14598-3 0 0999",
                                      "2 00694  30.3563 289.0742 0579612 154.2031 208.8696 14.0412882996468")

        XCTAssertEqual(0, sgp4InitSat(satKey))

        XCTAssertEqual(0, sgp4RemoveSat(satKey))

        XCTAssertNotEqual(0, sgp4RemoveSat(satKey))     // remove same satellite twice fails

        XCTAssert(getLastErrMsg().hasPrefix("RemoveNode: Unable to locate this key "))

    }

    func testDuplicates() {

        loadAllDlls()

        let _ = tleAddSatFrLines("1 90021U RELEAS14 00051.47568104 +.00000184 +00000+0 +00000-4 0 0814",
                                 "2 90021   0.0222 182.4923 0000720  45.6036 131.8822  1.00271328 1199")

        let _ = tleAddSatFrLines("1 90021U RELEAS14 00051.47568104 +.00000184 +00000+0 +00000-4 0 0814",
                                 "2 90021   0.0222 182.4923 0000720  45.6036 131.8822  1.00271328 1199")

        XCTAssert(getLastErrMsg().hasPrefix("AddRecToMem: Duplicated record/key "))

    }

}
