//
//  AstroTests.swift
//
//  Created by Gavin Eadie on 1/14/23.
//

import XCTest

@testable import Sgp4PropLib

final class AstroTests: XCTestCase {

    func testKepler() {

        loadAllDlls()

        _ = Sgp4RemoveAllSats()
        _ = TleRemoveAllSats()

        let satKey = tleAddSatFrLines(testLine1, testLine2)
        XCTAssertEqual(0, sgp4InitSat(satKey))

        var pos = [0.0, 0.0, 0.0]
        var vel = [0.0, 0.0, 0.0]
        var llh = [0.0, 0.0, 0.0]
        var ds1950 = 0.0

        XCTAssertEqual(0, sgp4PropMse(satKey, 0.0, &ds1950, &pos, &vel, &llh))

        var kep = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0]
        
        PosVelToKep(&pos, &vel, &kep)
        print("Sem: \(kep[XA_KEP_A]),\nEcc: \(kep[XA_KEP_E]),\nInc: \(kep[XA_KEP_INCLI]),\nMAn: \(kep[XA_KEP_MA]),\nRAN: \(kep[XA_KEP_NODE]),\nPer: \(kep[XA_KEP_OMEGA])")

    }

}
