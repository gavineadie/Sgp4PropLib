//
//  AstroTests.swift
//
//  Created by Gavin Eadie on 1/14/23.
//

import XCTest

@testable import Sgp4PropLib
@testable import Sgp4Prop_c

final class AstroTests: XCTestCase {

    func testPV_Kep() {

        loadAllDlls()
        
        _ = Sgp4RemoveAllSats()                         // clear the satellite store

        let satKey = tleAddSatFrLines(testLine1, testLine2)

        assert(0 == sgp4InitSat(satKey))

        let epoch = tleGetField(satKey, XF_TLE_EPOCH)!
        let startTime = dtgToUTC(epoch)                 // convert date time to days since 1950
        var pos: [Double] = [0.0, 0.0, 0.0]             // prepare an array to catch position
        var vel: [Double] = [0.0, 0.0, 0.0]             // prepare an array to catch velocity
        assert (0 == Sgp4PropDs50UtcPosVel(satKey, startTime, &pos, &vel))
        print(pos)
        print(vel)
        //        [42166.3730064000_5, 16.334758410_782914, -9.580035336596_753]
        //        [-0.0010276592167125331, 3.07456355582746_4, -0.001737689224560596_4]

        var kepElements = Array(repeating: 0.0, count: 6)
        PosVelToKep(&pos, &vel, &kepElements)
        print(kepElements)

        print(KeplerElements(&pos, &vel).prettyPrint()) // init KeplerElements struct

        // ------ KepToPosVel (reverse to check)

        KepToPosVel(&kepElements, &pos, &vel)
        print(pos)
        print(vel)
        //        [42166.3730064000_4, 16.334758410_745035, -9.58003533659_673]
        //        [-0.0010276592167_09772, 3.07456355582746_35, -0.001737689224560596_8]

    }
}

// -------- NEW FUNCTION TESTS

public struct KeplerElements {

    let semiMajorAxis: Double           // (Km)
    let eccentricity: Double            // (unitless)
    let inclination: Double             // (Degrees)
    let meanAnomoly: Double             // (Degrees)
    let raAsendingNode: Double          // (Degrees)
    let ArgPerigee: Double              // (Degrees)

    init(smax: Double, eccn: Double, incl: Double,
         mAno: Double, raaN: Double, argP: Double) {

        self.semiMajorAxis = smax
        self.eccentricity = eccn
        self.inclination = incl
        self.meanAnomoly = mAno
        self.raAsendingNode = raaN
        self.ArgPerigee = argP

    }

    init(_ pos: UnsafeMutablePointer<Double>, _ vel: UnsafeMutablePointer<Double>) {

        self = posVelToKeps(pos, vel)

    }

    func prettyPrint() -> String {

        return String(format: "smax = %12.6fKm, eccn = %10.6f , incl = %10.6f\nmAno = %12.6f° , raaN = %10.6f°, argP = %10.6f°",
                      semiMajorAxis,
                      eccentricity,
                      inclination,
                      meanAnomoly,
                      raAsendingNode,
                      ArgPerigee)

    }

}

public func posVelToKeps(_ pos: UnsafeMutablePointer<Double>, _ vel: UnsafeMutablePointer<Double>) -> KeplerElements {

    var keps = Array(repeating: 0.0, count: 6)
    PosVelToKep(pos, vel, &keps)

    return KeplerElements(smax: keps[0], eccn: keps[1], incl: keps[2],
                          mAno: keps[3], raaN: keps[4], argP: keps[5])

}
