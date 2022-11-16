//
//  sgp4.swift
//  Sgp4Swift
//
//  Created by Gavin Eadie on 10/17/22.
//

import Foundation
import obj_c

fileprivate let libSgp4Handle = loadDll("libsgp4prop.dylib")

/// Initializes the Sgp4 DLL for use in the program.
///
/// If this function returns an error, it is recommended that you stop the program immediately.
///
/// An error will occur if you forget to load and initialize all the prerequisite DLLs,
/// as listed in the DLL Prerequisites section of the accompanying documentation,
/// before using this DLL.
/// - Parameter dllHandle: The handle that was returned from `DllMainInit()`
/// - Returns: 0 if Sgp4Prop.dll is initialized successfully, non-0 if there is an error.
public func sgp4Init(_ dllHandle: Int64) -> Int32 {

    guard let sgp4InitPointer = dlsym(libSgp4Handle, "Sgp4Init") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    typealias Sgp4InitFunction = fnPtrSgp4Init
    let dll_Sgp4Init = unsafeBitCast(sgp4InitPointer, to: Sgp4InitFunction.self)
    return dll_Sgp4Init(dllHandle)

}

/// Returns information about the current version of Sgp4Prop.dll.
///
/// - Returns: The returned string provides information about the version number, build date, and platform.
public func sgp4GetInfo() -> String {

    guard let sgp4GetInfoPointer = dlsym(libSgp4Handle, "Sgp4GetInfo") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    var info128 = Array(repeating: Int8(0), count: 128)

    typealias Sgp4GetInfoFunction = fnPtrSgp4GetInfo
    let dll_Sgp4GetInfo = unsafeBitCast(sgp4GetInfoPointer, to: Sgp4GetInfoFunction.self)
    dll_Sgp4GetInfo(&info128); info128[127] = 0
    return String(cString: info128).trimRight()

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
/// This key will have been returned by one of the routines in Tle.dll. (in-Long)
/// - Returns: 0 if the satellite is successfully initialized and added to
/// Sgp4Prop.dll's set of satellites, non-0 if there is an error.
public func sgp4InitSat(_ satKey: Int64) -> Int32 {

    guard let sgp4InitSatPointer = dlsym(libSgp4Handle, "Sgp4InitSat") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    typealias Sgp4InitSatFunction = fnPtrSgp4InitSat
    let dll_Sgp4InitSat = unsafeBitCast(sgp4InitSatPointer, to: Sgp4InitSatFunction.self)
    return dll_Sgp4InitSat(satKey)

}

/// Removing a satellite from the propagator's set of satellites does not affect the
/// corresponding TLE data loaded by calls to routines in Tle.dll.
/// - Parameter satKey: The satellite's unique key. (in-Long)
/// - Returns: 0 if the satellite is removed successfully, non-0 if there is an error
public func sgp4RemoveSat(_ satKey: Int64) -> Int32 {
    
    guard let sgp4RemoveSatPointer = dlsym(libSgp4Handle, "Sgp4RemoveSat") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }
    
    typealias Sgp4RemoveSatFunction = fnPtrSgp4RemoveSat
    let dll_Sgp4RemoveSat = unsafeBitCast(sgp4RemoveSatPointer, to: Sgp4RemoveSatFunction.self)

    return dll_Sgp4RemoveSat(satKey)
}

/// Removes all currently loaded satellites from memory.
///
/// Calling this function removes all satellites from the set maintained by
/// Sgp4Prop.dll. However, the TLE data loaded by Tle.dll is unaffected by this function.
/// - Returns: 0 if all satellites are removed successfully from memory, non-0 if there is an error.
public func sgp4RemoveAllSats() -> Int32 {
    
    guard let sgp4RemoveAllSatsPointer = dlsym(libSgp4Handle, "Sgp4RemoveAllSats") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }
    
    typealias Sgp4RemoveAllSatsFunction = fnPtrSgp4RemoveAllSats
    let dll_Sgp4RemoveAllSats = unsafeBitCast(sgp4RemoveAllSatsPointer, to: Sgp4RemoveAllSatsFunction.self)
    
    return dll_Sgp4RemoveAllSats()
}

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
///   - satKey: The satellite's unique key. (in-Long)
///   - ds50UTC: The time to propagate to, expressed in days since 1950, UTC. (in-Double)
///   - mse: Resulting time in minutes since the satellite's epoch time. (out-Double)
///   - pos: Resulting ECI position vector (km) in True Equator and Mean Equinox of Epoch. (out-Double[3])
///   - vel: Resulting ECI velocity vector (km/s) in True Equator and Mean Equinox of Epoch. (out-Double[3])
///   - llh: Resulting geodetic latitude (deg), longitude(deg), and height (km). (out-Double[3])
/// - Returns: 0 if the propagation is successful, non-0 if there is an error (see error decoder in GP_ERR_?).
public func sgp4PropMse(_ satKey: Int64, _ ds50UTC: Double, _ mse: inout Double,
                            _ pos: inout Real1D, _ vel: inout Real1D, _ llh: inout Real1D) -> Int32 {

    return objcSgp4PropMsePointer(libSgp4Handle, satKey, ds50UTC, &mse, &pos, &vel, &llh)
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
///   - satkey: The unique key of the satellite to propagate. (in-Long)
///   - time: The time to propagate to, expressed in days since 1950, UTC. (in-Double)
///   - minutesSinceEpoch: Resulting time in minutes since the satellite's
///   epoch time. (out-Double)
///   - pos: Resulting ECI position vector (km) in True Equator and Mean Equinox of Epoch. (out-Double[3])
///   - vel: Resulting ECI velocity vector (km/s) in True Equator and Mean Equinox of Epoch. (out-Double[3])
///   - llh: Resulting geodetic latitude (deg), longitude(deg), and height (km). (out-Double[3])
/// - Returns: returns 0 if the propagation is successful, non-0 if there is an error (see error decoder in GP_ERR_?).
public func sgp4PropDs50UTC(_ satKey: Int64, _ ds50UTC: Double, _ mse: inout Double,
                            _ pos: inout Real1D, _ vel: inout Real1D, _ llh: inout Real1D) -> Int32 {

    return objcSgp4PropDs50UTC(libSgp4Handle, satKey, ds50UTC, &mse, &pos, &vel, &llh)
}

/// Propagates a satellite, represented by the satKey, to the time expressed in days since 1950, UTC.
///
/// The resulting data about the satellite is placed in the pos (position), vel (velocity) parameters.
/// - Parameters:
///   - satKey: The unique key of the satellite to propagate. (in-Long)
///   - ds50UTC: The time to propagate to, expressed in days since 1950, UTC. (in-Double)
///   - pos: Resulting ECI position vector (km) in True Equator and Mean Equinox of Epoch. (out-Double[3])
///   - vel: Resulting ECI velocity vector (km/s) in True Equator and Mean Equinox of Epoch. (out-Double[3])
/// - Returns: 0 if the propagation is successful, non-0 if there is an error (see error decoder in GP_ERR_?).
public func sgp4PropDs50UtcPosVel(_ satKey: Int64, _ ds50UTC: Double,
                                  _ pos: inout Real1D, _ vel: inout Real1D) -> Int32 {
    
    return objcSgp4PropDs50UtcPosVel(libSgp4Handle, satKey, ds50UTC, &pos, &vel)
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
///   - satKey: The unique key of the satellite to propagate. (in-Long)
///   - ds50UTC: The time to propagate to, expressed in days since 1950, UTC. (in-Double)
///   - pos: ###. (out-Double[3])
/// - Returns: 0 if the propagation is successful, non-0 if there is an error (see error decoder in GP_ERR_?).
public func sgp4PropDs50UtcPos(_ satKey: Int64, _ ds50UTC: Double,  _ pos: inout Real1D) -> Int32 {
    
    return objcSgp4PropDs50UtcPos(libSgp4Handle, satKey, ds50UTC, &pos)
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
///   - satKey: The unique key of the satellite to propagate. (in-Long)
///   - ds50UTC: The time to propagate to, expressed in days since 1950, UTC. (in-Double)
///   - llh: Resulting geodetic latitude (deg), longitude(deg), and height (km). (out-Double[3])
/// - Returns: 0 if the propagation is successful, non-0 if there is an error (see error decoder in GP_ERR_?).
public func sgp4PropDs50UtcLLH(_ satKey: Int64, _ ds50UTC: Double,  _ llh: inout Real1D) -> Int32 {
    
    return objcSgp4PropDs50UtcLLH(libSgp4Handle, satKey, ds50UTC, &llh)
}
