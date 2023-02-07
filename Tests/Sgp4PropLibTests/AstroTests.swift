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

        var kepArray = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0]
        
        PosVelToKep(&pos, &vel, &kepArray)
        print("Sem: \(kepArray[XA_KEP_A]),\nEcc: \(kepArray[XA_KEP_E]),\nInc: \(kepArray[XA_KEP_INCLI])")
        print("MAn: \(kepArray[XA_KEP_MA]),\nRAN: \(kepArray[XA_KEP_NODE]),\nPer: \(kepArray[XA_KEP_OMEGA])")

        var posK = [0.0, 0.0, 0.0]
        var velK = [0.0, 0.0, 0.0]
        KepToPosVel(&kepArray, &posK, &velK)

        XCTAssertEqual(pos[0], posK[0], accuracy: 0.0000000001)         // 1 µm
        XCTAssertEqual(pos[1], posK[1], accuracy: 0.0000000001)
        XCTAssertEqual(pos[2], posK[2], accuracy: 0.0000000001)

        XCTAssertEqual(vel[0], velK[0], accuracy: 0.00000000000001)     // .0001 µm/s
        XCTAssertEqual(vel[1], velK[1], accuracy: 0.00000000000001)
        XCTAssertEqual(vel[2], velK[2], accuracy: 0.00000000000001)

    }

    

}
