//
//  AstroFuncDriver.swift
//
//
//  Created by Gavin Eadie on 12/4/22.
//

import Foundation

/// Initializes AstroFunc DLL for use in the program.
///
/// If this function returns an error, it is recommended that you stop the program immediately.
///
/// An error will occur if you forget to load and initialize all the prerequisite DLLs, as listed in
/// the DLL Prerequisites section of the accompanying documentation, before using this DLL.
/// - Parameter dllHandle: The handle that was returned from DllMainInit(). See the documentation for DllMain.dll for details.
/// - Returns: 0 if AstroFunc.dll is initialized successfully, non-0 if there is an error.
@available(*, deprecated, message: "This function has been deprecated since v9.0")
public func astroFuncInit(_ dllHandle: Int64) -> Int { Int(AstroFuncInit(dllHandle)) }

/// Retrieves information about the current version of AstroFunc.dll.
///
/// - Returns: A `String` of information about the DLL version number, build date, and platform.
public func astroFuncGetInfo() -> String {

    var infoString = emptyCcharArray(size: GETSETSTRLEN)
    AstroFuncGetInfo(&infoString)
    return String(fromCcharArray: infoString, size: GETSETSTRLEN)

}

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

/// Determines if a point in space is sunlit at the input time ds50ET
/// - Parameters:
///   - ds50ET: The number of days since 1950, ET
///   - ptECI: a position in ECI (km)
/// - Returns: `false` if the specified point isn't sunlit, `true` if the specified point is sunlit
public func isPointSunlit(_ ds50ET: Double, _ ptECI: UnsafeMutablePointer<Double> ) -> Bool {

    IsPointSunlit(ds50ET, ptECI) == 1

}
