//
//  Supplemental.swift
//
//
//  Created by Gavin Eadie on 02/14/23.
//

import Foundation

// MARK: ASTRO

/// returns the Sun's lat/lon for the time (days after 1950)
/// - Parameter ds1950: days after 1950
/// - Returns: a tuple carrying (solarLat, solarLon)
public func solarLLH(_ ds1950: Double) -> (Double, Double) {

    var solarPos = [0.0, 0.0, 0.0]
    var solarMag = 0.0

    CompSunPos(ds1950, &solarPos, &solarMag)

    solarPos[0] = solarPos[0] * solarMag
    solarPos[1] = solarPos[1] * solarMag
    solarPos[2] = solarPos[2] * solarMag

    var earthLLH = [0.0, 0.0, 0.0]

    XYZToLLHTime(ds1950, &solarPos, &earthLLH)

    return (earthLLH[0], earthLLH[1])

}

/// returns the Moon's lat/lon for the time (days after 1950)
/// - Parameter ds1950: days after 1950
/// - Returns: a tuple carrying (lunarLat, lunarLon)
public func lunarLLH(_ ds1950: Double) -> (Double, Double) {

    var lunarPos = [0.0, 0.0, 0.0]
    var lunarMag = 0.0

    CompMoonPos(ds1950, &lunarPos, &lunarMag)

    lunarPos[0] = lunarPos[0] * lunarMag
    lunarPos[1] = lunarPos[1] * lunarMag
    lunarPos[2] = lunarPos[2] * lunarMag

    var earthLLH = [0.0, 0.0, 0.0]

    XYZToLLHTime(ds1950, &lunarPos, &earthLLH)

    return (earthLLH[0], earthLLH[1])

}

// MARK: SGP4

//TODO: <Int> to <Int32>
/// Generates ephemerides for the input satellite, represented by its **satKey**, for the specified time span and step size.
///
/// Notes:
/// - if `arrSize` isn't big enough to store all the ephemeris points, the function will exit when the `ephemArr` reaches
/// that many points and the `errCode` is set to `IDX_ERR_WARN`
/// - Parameters:
///   - satKey:     The unique key of the satellite to generate ephemerides.
///   - startTime:  Start time expressed in days since 1950, UTC.
///   - endTime:    End time expressed in days since 1950, UTC.
///   - stepSize:   Step size in minutes (static); enter predefine negative values (DYN_SS_?) to request dynamic step size.
///   - sgp4_ephem: Output ephemeris type 1=ECI, 2=J2K.
///   - arrSize:    Size of input ephemArr
///   - ephemArr:   Output ephemerides
///     - 0: time in days since 1950 UTC,
///     - 1-3: pos (km),
///     - 4-6: vel (km/sec)
///   - genEphemPts:Actual number of ephemeris points generated (always <= arrSize)
/// - Returns: 0 if the propagation is successful, non-0 if there is an error (see error decoder in GP_ERR_?)
public func sgp4GenEphems(_ satKey: Int64, _ startTime: Double, _ endTime: Double, _ stepSize: Double,
                          _ sgp4_ephem: Int, _ arrSize: Int,
                          _ ephemArr: UnsafeMutablePointer<(Double, Double, Double, Double, Double, Double, Double)>,
                          _ genEphemPts: UnsafeMutablePointer<Int>) -> Int {

    var int32: Int32 = 0
    let errorCode = Int(Sgp4GenEphems(satKey, startTime, endTime, stepSize,
                                      Int32(sgp4_ephem), Int32(arrSize), ephemArr, &int32))
    var int64 = Int(int32)
    genEphemPts.update(from: &int64, count: 1)

    return errorCode
}

// MARK: TLE

/// Gets the `satKey` from 2LE and catches errors ..
/// - Parameters:
///   - line: 2LE line one
///   - line2: 2LE line two
/// - Returns: the `satKey`, or zero if failure
func satKeyFromLines(_ line1: String, _ line2: String) -> Int64 {

    let satKey = tleAddSatFrLines(line1, line2)
    guard 0 == sgp4InitSat(satKey) else { fatalError("## \(getLastErrMsg()) (after sgp4InitSat)") }
    return satKey

}
