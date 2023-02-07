//
//  Sgp4Tests.swift
//
//  Created by Gavin Eadie on 1/14/23.
//

import XCTest

@testable import Sgp4PropLib

final class Sgp4Tests: XCTestCase {

    func testInitSat() {

        loadAllDlls()
        
        _ = Sgp4RemoveAllSats()                         // clear the satellite store
        _ = TleRemoveAllSats()

        let satKey = tleAddSatFrLines("1 00694U 63047A   22346.21636301 +.00001226  00000 0  14598-3 0 0999",
                                      "2 00694  30.3563 289.0742 0579612 154.2031 208.8696 14.0412882996468")

        XCTAssertEqual(0, sgp4InitSat(satKey))

        XCTAssertEqual(0, sgp4RemoveSat(satKey))

        XCTAssertNotEqual(0, sgp4RemoveSat(satKey))     // remove same satellite twice fails

        XCTAssert(getLastErrMsg().hasPrefix("RemoveNode: Unable to locate this key "))

    }

    func testDuplicates() {

        loadAllDlls()

        let _ = tleAddSatFrLines(testLine1, testLine2)

        let _ = tleAddSatFrLines(testLine1, testLine2)

        XCTAssert(getLastErrMsg().hasPrefix("AddRecToMem: Duplicated record/key "))

    }

    func testSgp4GenEphems() {

        loadAllDlls()

        _ = Sgp4RemoveAllSats()                         // clear the satellite store
        _ = TleRemoveAllSats()

        let satKey = tleAddSatFrLines("1 00694U 63047A   22346.21636301 +.00001226  00000 0  14598-3 0 0999",
                                      "2 00694  30.3563 289.0742 0579612 154.2031 208.8696 14.0412882996468")

        guard 0 == sgp4InitSat(satKey) else {
            fatalError("## \(getLastErrMsg()) (after sgp4InitSat)")
        }

        let startTime = dtgToUTC("22346.21636301")      // start at epoch ..
        let stopTime = startTime + 0.1                  // .. till 144 minutes later

//TODO: Driver version commented out ..
//        let arrayCount = Int32(60)
//        var ephemArray = Array(repeating: (0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0), count: arrayCount)
//        var resultCount: Int32 = 0
//
//        XCTAssertEqual(IDX_ERR_WARN, sgp4GenEphems(satKey,
//                                                   startTime, stopTime, 1.0, 1,
//                                                   60, &ephemArray, &resultCount))
        let arrayCount = Int32(60)
        var ephemArray = Array(repeating: (0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0), count: Int(arrayCount))
        var resultCount: Int32 = 0

        XCTAssertEqual(Int32(IDX_ERR_WARN), Sgp4GenEphems(satKey,
                                                   startTime, stopTime, 1.0, 1,
                                                   60, &ephemArray, &resultCount))
        XCTAssertEqual(arrayCount, resultCount, "resultCount <= arrSize: contradicted")

    }

}
