//
//  sgp4.swift
//  Sgp4Swift
//
//  Created by Gavin Eadie on 10/17/22.
//

import Foundation

fileprivate let libSgp4Handle = loadDll("libsgp4prop.dylib")

public func sgp4Init(_ dllHandle: Int64) -> Int32 {

    guard let sgp4InitPointer = dlsym(libSgp4Handle, "Sgp4Init") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    typealias Sgp4InitFunction = @convention(c) (Int64) -> Int32
    let sgp4Init = unsafeBitCast(sgp4InitPointer, to: Sgp4InitFunction.self)
    return sgp4Init(dllHandle)

}

public func sgp4GetInfo() -> String {

    guard let sgp4GetInfoPointer = dlsym(libSgp4Handle, "Sgp4GetInfo") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    var info128 = Array(repeating: Int8(0), count: 128)

    typealias Sgp4GetInfoFunction = @convention(c) (UnsafeMutablePointer<Int8>) -> Void
    let sgp4GetInfo = unsafeBitCast(sgp4GetInfoPointer, to: Sgp4GetInfoFunction.self)
    sgp4GetInfo(&info128); info128[127] = 0
    return String(cString: info128).trimRight()

}

public func sgp4InitSat(_ satKey: Int64) -> Int32 {

    guard let sgp4InitSatPointer = dlsym(libSgp4Handle, "Sgp4InitSat") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    typealias Sgp4InitSatFunction = @convention(c) (Int64) -> Int32
    let sgp4InitSat = unsafeBitCast(sgp4InitSatPointer, to: Sgp4InitSatFunction.self)
    return sgp4InitSat(satKey)

}

/// Propagates a satellite, represented by the satKey, to the time expressed in days since 1950, UTC.
/// The resulting data about the satellite is placed in the pos (position), vel (velocity), and llh (Lat/Lon/Height) parameters.
/// - Parameters:
///   - satkey: The unique key of the satellite to propagate. (in-Long)
///   - time: The time to propagate to, expressed in days since 1950, UTC. (in-Double)
///   - minutesSinceEpoch: Resulting time in minutes since the satellite's epoch time. (out-Double)
///   - v1: Resulting ECI position vector (km) in True Equator and Mean Equinox of Epoch. (out-Double[3])
///   - v2: Resulting ECI velocity vector (km/s) in True Equator and Mean Equinox of Epoch. (out-Double[3])
///   - v3: Resulting geodetic latitude (deg), longitude(deg), and height (km). (out-Double[3])
/// - Returns: returns 0 if the propagation is successful, non-0 if there is an error (see error decoder in GP_ERR_?).
public func sgp4PropDs50UTC(satKey: Int64, time: Double, minutesSinceEpoch: inout Double,
                            pos: inout Int, vel: inout Int, llh: inout Int) -> Int32 {

    guard let sgp4PropDs50UTCPointer = dlsym(libSgp4Handle, "Sgp4PropDs50UTC") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    var epo = 0.0
    var v0 = Array<Double>()
    var v1 = Array<Double>()
    var v2 = Array<Double>()

    typealias Sgp4PropDs50UTCFunction = @convention(c) (Int64, Double, UnsafeMutablePointer<Double>,
                                                        UnsafeMutableRawPointer,
                                                        UnsafeMutableRawPointer,
                                                        UnsafeMutableRawPointer) -> Int32
    let sgp4PropDs50UTC = unsafeBitCast(sgp4PropDs50UTCPointer, to: Sgp4PropDs50UTCFunction.self)

    return sgp4PropDs50UTC(satKey, time, &epo, &v0, &v1, &v2)

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
