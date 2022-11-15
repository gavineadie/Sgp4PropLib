//
//  sgp4.swift
//  Sgp4Swift
//
//  Created by Gavin Eadie on 10/17/22.
//

import Foundation
import obj_c

fileprivate let libSgp4Handle = loadDll("libsgp4prop.dylib")

public func sgp4Init(_ dllHandle: Int64) -> Int32 {

    guard let sgp4InitPointer = dlsym(libSgp4Handle, "Sgp4Init") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    typealias Sgp4InitFunction = fnPtrSgp4Init
    let dll_Sgp4Init = unsafeBitCast(sgp4InitPointer, to: Sgp4InitFunction.self)
    return dll_Sgp4Init(dllHandle)

}

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

public func sgp4InitSat(_ satKey: Int64) -> Int32 {

    guard let sgp4InitSatPointer = dlsym(libSgp4Handle, "Sgp4InitSat") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    typealias Sgp4InitSatFunction = fnPtrSgp4InitSat
    let dll_Sgp4InitSat = unsafeBitCast(sgp4InitSatPointer, to: Sgp4InitSatFunction.self)
    return dll_Sgp4InitSat(satKey)

}

/// Propagates a satellite, represented by the satKey, to the time expressed in days since 1950, UTC.
/// The resulting data about the satellite is placed in the pos (position), vel (velocity), and llh (Lat/Lon/Height) parameters.
/// - Parameters:
///   - satkey: The unique key of the satellite to propagate. (in-Long)
///   - time: The time to propagate to, expressed in days since 1950, UTC. (in-Double)
///   - minutesSinceEpoch: Resulting time in minutes since the satellite's epoch time. (out-Double)
///   - pos: Resulting ECI position vector (km) in True Equator and Mean Equinox of Epoch. (out-Double[3])
///   - vel: Resulting ECI velocity vector (km/s) in True Equator and Mean Equinox of Epoch. (out-Double[3])
///   - llh: Resulting geodetic latitude (deg), longitude(deg), and height (km). (out-Double[3])
/// - Returns: returns 0 if the propagation is successful, non-0 if there is an error (see error decoder in GP_ERR_?).
public func sgp4PropDs50UTC(_ satKey: Int64, _ time: Double, _ epo: inout Double,
                            _ pos: inout Real1D, _ vel: inout Real1D, _ llh: inout Real1D) -> Int32 {

    return objcSgp4PropDs50UTC(satKey, time, &epo, &pos, &vel, &llh)
}



// The following cases will result in an error:
//
// Semi major axis A 1.0D6
// Eccentricity E >= 1.0 or E
// Mean anomaly MA>=1.0D10
// Hyperbolic orbit E2>= 1.0
// satKey doesn't exist in the set of loaded satellites
// GEO model not set to WGS-72 and/or FK model not set to FK5

// typedef int (STDCALL *fnPtrSgp4PropDs50UTC)(__int64 satKey, double ds50UTC, double* mse, double pos[3], double vel[3], double llh[3]);
