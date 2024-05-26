//
//  Sgp4PropDriver.swift
//
//  Created by Gavin Eadie on 12/4/22.
//

import Foundation

/// Initializes the Sgp4 DLL for use in the program.
///
/// If this function returns an error, it is recommended that you stop the program immediately.
///
/// An error will occur if you forget to load and initialize all the prerequisite DLLs,
/// as listed in the DLL Prerequisites section of the accompanying documentation,
/// before using this DLL.
/// - Parameter dllHandle: The handle that was returned from `DllMainInit()`
/// - Returns: 0 if Sgp4Prop.dll is initialized successfully, non-0 if there is an error.
@available(*, deprecated, message: "This function has been deprecated since v9.0")
public func sgp4Init(_ dllHandle: Int64) -> Int { Int(Sgp4Init(dllHandle)) }

/// Returns information about the current version of Sgp4Prop.dll.
///
/// - Returns: A `String` of information about the DLL version number, build date, and platform.
public func sgp4GetInfo() -> String {

    var infoString = emptyCcharArray(size: GETSETSTRLEN)
    Sgp4GetInfo(&infoString)
    return String(fromCcharArray: infoString, size: GETSETSTRLEN)

}

/// Note: The only requirement now is that "SGP4_Open_License.txt" file needs to
/// be in those folders specified in PATH/LD_LIBRARY_PATH environment or AstroStds DLLs/SOs'
/// - Returns: The file path to the Sgp4 Open License file
@available(*, deprecated, message: "This function has been deprecated since v8.2")
public func Sgp4GetLicFilePath() -> String {

    var licFilePath = emptyCcharArray(size: GETSETSTRLEN)
    Sgp4GetLicFilePath(&licFilePath)
    return String(fromCcharArray: licFilePath, size: GETSETSTRLEN)

}

/// Note: The only requirement now is that "SGP4_Open_License.txt" file needs to be
/// in those folders specified in PATH/LD_LIBRARY_PATH environment or AstroStds DLLs/SOs'
/// - Parameter licFilePath: The file path to the Sgp4 Open License file
@available(*, deprecated, message: "This function has been deprecated since v8.2")
public func sgp4SetLicFilePath(_ licFilePath: String) {

    Sgp4SetLicFilePath(licFilePath.cString)

}

/// Initializes an SGP4 satellite from an SGP or SGP4 TLE.
///
/// Internally, when this function is called, Tle.dll's set of TLEs is searched for the
/// provided satKey. If found, the associated TLE data will be used to create an
/// SGP4 satellite which then will be added to `Sgp4Prop.dll`'s set of satellites.
/// Subsequent calls to propagate this satellite will use the data in this set to compute
/// the satellite's new state.
///
/// This routine should be called once for each satellite you wish to propagate
/// before propagation begins, or any time the associated data that is stored
/// by `Tle.dll` is changed.
///
/// The call to this routine needs to be placed before any calls to the SGP4
/// propagator routines (`Sgp4PropMse()`, `Sgp4PropDs50UTC()`, etc.).
///
/// - Parameter satKey: The satellite's unique key.
/// This key will have been returned by one of the routines in Tle.dll.
/// - Returns: 0 if the satellite is successfully initialized and added to
/// Sgp4Prop.dll's set of satellites, non-0 if there is an error.
public func sgp4InitSat(_ satKey: SatKey) -> Int { Int(Sgp4InitSat(satKey)) }

/// Removing a satellite from the propagator's set of satellites does not affect the
/// corresponding TLE data loaded by calls to routines in Tle.dll.
/// - Parameter satKey: The satellite's unique key.
/// - Returns: 0 if the satellite is removed successfully, non-0 if there is an error
public func sgp4RemoveSat(_ satKey: SatKey) -> Int { Int(Sgp4RemoveSat(satKey)) }

/// Removes all currently loaded satellites from memory.
///
/// Calling this function removes all satellites from the set maintained by
/// Sgp4Prop.dll. However, the TLE data loaded by Tle.dll is unaffected by this function.
/// - Returns: 0 if all satellites are removed successfully from memory, non-0 if there is an error.
public func sgp4RemoveAllSats() -> Int { Int(Sgp4RemoveAllSats()) }

/// Propagates a satellite, represented by the satKey,
/// to the time expressed in minutes since the satellite's epoch time.
///
/// The resulting data about the satellite is placed in the various reference parameters.
///
/// It is the users' responsibility to decide what to do with the returned value.
/// For example, if the users want to check for decay or low altitude, they can
/// put that logic into their own code.
///
/// This function can be called in random time requests.
///
/// The following cases will result in an error:
///
/// * Semi major axis A 1.0D6
/// * Eccentricity E >= 1.0 or E
/// * Mean anomaly MA>=1.0D10
/// * Hyperbolic orbit E2>= 1.0
/// * satKey doesn't exist in the set of loaded satellites
/// * GEO model not set to WGS-72 and/or FK model not set to FK5
/// - Parameters:
///   - satKey: The satellite's unique key.
///   - ds50UTC: The time to propagate to, expressed in days since 1950, UTC.
///   - mse: Resulting time in minutes since the satellite's epoch time. (out-Double)
///   - pos: Resulting ECI position vector (km) in True Equator and Mean Equinox of Epoch.
///   - vel: Resulting ECI velocity vector (km/s) in True Equator and Mean Equinox of Epoch.
///   - llh: Resulting geodetic latitude (deg), longitude(deg), and height (km).
/// - Returns: 0 if the propagation is successful, non-0 if there is an error (see error decoder in GP_ERR_?).
public func sgp4PropMse(_ satKey: SatKey, _ mse: Double, _ ds50UTC: UnsafeMutablePointer<Double>,
                        _ pos: UnsafeMutablePointer<Double>, _ vel: UnsafeMutablePointer<Double>,
                        _ llh: UnsafeMutablePointer<Double>) -> Int {

    Int(Sgp4PropMse(satKey, mse, ds50UTC, pos, vel, llh))

}

/// Propagates a satellite, represented by the satKey, to the time expressed in days since 1950, UTC.
/// The resulting data about the satellite is placed in the `pos` (position), `vel` (velocity),
/// and `llh` (Lat/Lon/Height) parameters.
///
/// The following cases will result in an error:
///
/// * Semi major axis A 1.0D6
/// * Eccentricity E >= 1.0 or E
/// * Mean anomaly MA>=1.0D10
/// * Hyperbolic orbit E2>= 1.0
/// * satKey doesn't exist in the set of loaded satellites
/// * GEO model not set to WGS-72 and/or FK model not set to FK5
///
/// - Parameters:
///   - satkey: The unique key of the satellite to propagate.
///   - time: The time to propagate to, expressed in days since 1950, UTC.
///   - minutesSinceEpoch: Resulting time in minutes since the satellite's epoch time. (out-Double)
///   - pos: Resulting ECI position vector (km) in True Equator and Mean Equinox of Epoch.
///   - vel: Resulting ECI velocity vector (km/s) in True Equator and Mean Equinox of Epoch.
///   - llh: Resulting geodetic latitude (deg), longitude(deg), and height (km).
/// - Returns: returns 0 if the propagation is successful, non-0 if there is an error (see error decoder in GP_ERR_?).
public func sgp4PropDs50UTC(_ satKey: SatKey, _ ds50UTC: Double, _ mse: UnsafeMutablePointer<Double>,
                            _ pos: UnsafeMutablePointer<Double>, _ vel: UnsafeMutablePointer<Double>,
                            _ llh: UnsafeMutablePointer<Double>) -> Int {

    Int(Sgp4PropDs50UTC(satKey, ds50UTC, mse, pos, vel, llh))

}

/// Propagates a satellite, represented by the satKey, to the time expressed in days since 1950, UTC.
///
/// Only the geodetic information is returned by this function.
/// It is the users' responsibility to decide what to do with the returned value.
/// For example, if the users want to check for decay or low altitude,
/// they can put that logic into their own code.
///
/// This function is similar to Sgp4PropDs50UTC but returns only LLH.
/// This function is designed especially for applications which plot ground traces.
///
/// The following cases will result in an error:
///
/// * Semi major axis A 1.0D6
/// * Eccentricity E >= 1.0 or E
/// * Mean anomaly MA>=1.0D10
/// * Hyperbolic orbit E2>= 1.0
/// * satKey doesn't exist in the set of loaded satellites
/// * GEO model not set to WGS-72 and/or FK model not set to FK5
///
/// - Parameters:
///   - satKey: The unique key of the satellite to propagate.
///   - ds50UTC: The time to propagate to, expressed in days since 1950, UTC.
///   - llh: Resulting geodetic latitude (deg), longitude(deg), and height (km).
/// - Returns: 0 if the propagation is successful, non-0 if there is an error (see error decoder in GP_ERR_?).
public func sgp4PropDs50UtcLLH(_ satKey: SatKey,
                               _ ds50UTC: Double,
                               _ llh: UnsafeMutablePointer<Double>) -> Int {

    Int(Sgp4PropDs50UtcLLH(satKey, ds50UTC, llh))

}

/// Propagates a satellite, represented by the satKey, to the time expressed in days since 1950, UTC.
/// Only the ECI position vector is returned by this function. It is the users' responsibility to decide what
/// to do with the returned value. For example, if the users want to check for decay or low altitude, they
/// can put that logic into their own code.
///
/// This function is similar to Sgp4PropDs50UTC but returns only ECI position vector.  This function is
/// designed especially for applications which plot satellite position in 3D. The following cases will result in an error:
///
/// - Semi major axis A 1.0D6
/// - Eccentricity E >= 1.0 or E
/// - Mean anomaly MA>=1.0D10
/// - Hyperbolic orbit E2>= 1.0
/// - satKey doesn't exist in the set of loaded satellites
/// - GEO model not set to WGS-72 and/or FK model not set to FK5
///
/// - Parameters:
///   - satKey: The unique key of the satellite to propagate.
///   - ds50UTC: The time to propagate to, expressed in days since 1950, UTC.
///   - pos: Resulting ECI position vector (km) in True Equator and Mean Equinox of Epoch.
/// - Returns: 0 if the propagation is successful, non-0 if there is an error (see error decoder in GP_ERR_?).
public func sgp4PropDs50UtcPos(_ satKey: SatKey,
                               _ ds50UTC: Double,
                               _ pos: UnsafeMutablePointer<Double>) -> Int {

    Int(Sgp4PropDs50UtcPos(satKey, ds50UTC, pos))

}

/// Retrieves propagator's precomputed results. This function can be used to obtain results from a
/// propagation which are not made available through calls to the propagation functions themselves.
///
/// See example in Sgp4PropMse or Sgp4PropDs50UTC.
///
/// This function should be called immediately after a successful call to `Sgp4PropMse()` or
/// `Sgp4PropDs50UTC()` to retrieve the desired values.
///
/// It is the caller's responsibility to ensure that the array passed in the destArray parameter is
/// large enough to hold the requested values. The required size can be found by looking at the
/// destArray size column of the table below describing valid index values.
///
/// The destArray Arrangement column lists the order of the elements in the array. It is not
/// necessarily the subscript of the element in the array since this is language-dependent.
/// For example, in C/C++ the first element in every array is the zero-subscripted element.
/// In other programming languages, the subscript of the first element is 1.
///
/// Note: This function is not thread safe, please use `Sgp4PropAll()` instead
///
/// The table below shows the values for the `xf_Sgp4Out` parameter:
///
/// | Index | Index Interpretation | DestArray size | DestArray Arrangement|
/// | :----: | :----: | :----: | :----: |
/// |1| Revolution number | 1 | Revolution number (based on the Osculating Keplerian Elements)|
/// |2| Nodal Apogee Perigee | 3 | nodal period (minutes)apogee (km)perigee (km)|
/// |3| Mean Keplerian Elements | 6 | semi-major axis (km), eccentricity (unitless), inclination (degree), mean anomaly (degree), right ascension of the ascending node(degree), argument of perigee (degree)|
/// |4| Osculating Keplerian Elements | 6 | Same as Mean Keplerian Elements|
/// - Parameters:
///   - satKey: The unique key of the satellite for which to retrieve results.
///   - xf_SgpOut: Specifies which propagator outputs to retrieve.
///   - destArr: Array to receive the resulting propagator outputs.
/// - Returns: 0 if the requested information is retrieved successfully, non-0 if there is an error
public func sgp4GetPropOut(_ satKey: SatKey, _ xf_SgpOut: Int, _ destArr: UnsafeMutablePointer<Double>)  -> Int {

    Int(Sgp4GetPropOut(satKey, Int32(xf_SgpOut), destArr))

}

/// Reepochs a loaded TLE, represented by the satKey, to a new epoch.
///
/// - Parameters:
///   - satKey: The unique key of the satellite to reepoch.
///   - newEpoch: The new epoch, express in days since 1950, UTC.
///   - line1: A string to hold the first line of the reepoched TLE.
///   - line2: A string to hold the second line of the reepoched TLE.
/// - Returns: 0 if the reepoch is successful, non-0 if there is an error.
public func sgp4ReepochTLE(_ satKey: SatKey, _ newEpoch: Double, _ line1: inout String, _ line2: inout String) -> Int {

    var _line1 = emptyCcharArray(size: INPUTCARDLEN)                             //[INPUTCARDLEN = 512]
    var _line2 = emptyCcharArray(size: INPUTCARDLEN)                             //[INPUTCARDLEN]

    let errorCode = Sgp4ReepochTLE(satKey, newEpoch, &_line1, &_line2)

    line1 = String(fromCcharArray: _line1, size: INPUTCARDLEN)
    line2 = String(fromCcharArray: _line2, size: INPUTCARDLEN)

    return Int(errorCode)
}

/// Reepochs a loaded TLE, represented by the satKey, to a new epoch.
///
/// - Parameters:
///   - satKey: The unique key of the satellite to reepoch.
///   - newEpoch: The new epoch, express in days since 1950, UTC.
///   - line1: A string to hold the first line of the reepoched TLE.
///   - line2: A string to hold the second line of the reepoched TLE.
/// - Returns: tuple (line1, line2) or nil if failure
public func sgp4ReepochTLE(_ satKey: SatKey, _ newEpoch: Double) -> (String, String)! {

    var _line1 = emptyCcharArray(size: INPUTCARDLEN)                             //[INPUTCARDLEN = 512]
    var _line2 = emptyCcharArray(size: INPUTCARDLEN)                             //[INPUTCARDLEN]

    guard 0 == Sgp4ReepochTLE(satKey, newEpoch, &_line1, &_line2) else { return nil }

    return (String(fromCcharArray: _line1, size: INPUTCARDLEN),
            String(fromCcharArray: _line2, size: INPUTCARDLEN))
}
/// Reepochs a loaded TLE, represented by the satKey, to a new epoch in Csv format.
/// - Parameters:
///   - satKey: The unique key of the satellite to reepoch.
///   - reepochDs50UTC: A string to hold the reepoched CSV.
/// - Returns: A string to hold the reepoched CSV.
public func sgp4ReepochCsv(_ satKey: SatKey, _ reepochDs50UTC: Double) -> String? {

    var _csvLine = emptyCcharArray(size: INPUTCARDLEN)
    guard 0 == Sgp4ReepochCsv(satKey, reepochDs50UTC, &_csvLine) else { return nil }
    return String(fromCcharArray: _csvLine, size: INPUTCARDLEN)

}
