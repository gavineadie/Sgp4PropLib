//
//  env.swift
//  Sgp4Swift
//
//  Created by Gavin Eadie on 10/17/22.
//

import Foundation
import obj_c

fileprivate let libenvconstHandle = loadDll("libenvconst.dylib")

/// Initializes the EnvInit DLL for use in the program. If this function returns an error,
/// it is recommended that you stop the program immediately.
///
/// An error will occur if you forget to load and initialize all the prerequisite DLLs,
/// as listed in the DLL Prerequisites section of the accompanying documentation,
/// before using this DLL.
///
/// When the function is called, the GEO model is set to WGS-72 and the FK
/// model is set to FK5. If the user plans to use the SGP4 propagator, do NOT
/// change this default setting. Otherwise, SGP4 won't work
///
/// - Parameter dllHandle: The handle that was returned from `DllMainInit`,
/// see the documentation for DllMain.dll for details.
/// - Returns: zero indicating the EnvConst DLL has been initialized successfully. Other values indicate an error.

public func envInit(_ dllHandle: Int64) -> Int32 {

    guard let envInitPointer = dlsym(libenvconstHandle, "EnvInit") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    typealias EnvInitFunction = fnPtrEnvInit
    let envInit = unsafeBitCast(envInitPointer, to: EnvInitFunction.self)
    return envInit(dllHandle)

}

public func envGetInfo() -> String {

    guard let envGetInfoPointer = dlsym(libenvconstHandle, "EnvGetInfo") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    var info128 = Array(repeating: Int8(0), count: 128)

    typealias EnvGetInfoFunction = fnPtrEnvGetInfo
    let envGetInfo = unsafeBitCast(envGetInfoPointer, to: EnvGetInfoFunction.self)
    envGetInfo(&info128); info128[127] = 0
    return String(cString: info128).trimRight()

}

// ---------------- AUTO GENERATED ----------------

public func envSetFkIdx(_ xf_FkMod: Int32) {

    guard let EnvSetFkIdxPointer = dlsym(libenvconstHandle, "EnvSetFkIdx") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    typealias EnvSetFkIdxFunction = fnPtrEnvSetFkIdx
    let EnvSetFkIdx = unsafeBitCast(EnvSetFkIdxPointer, to: EnvSetFkIdxFunction.self)

    return EnvSetFkIdx(xf_FkMod)

}

public func envSetGeoIdx(_ xf_GeoMod: Int32) {

    guard let EnvSetGeoIdxPointer = dlsym(libenvconstHandle, "EnvSetGeoIdx") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    typealias EnvSetGeoIdxFunction = fnPtrEnvSetGeoIdx
    let EnvSetGeoIdx = unsafeBitCast(EnvSetGeoIdxPointer, to: EnvSetGeoIdxFunction.self)

    return EnvSetGeoIdx(xf_GeoMod)

}

public func envGetGeoConst(_ xf_GeoCon: Int32) -> Double {

    guard let EnvGetGeoConstPointer = dlsym(libenvconstHandle, "EnvGetGeoConst") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    typealias EnvGetGeoConstFunction = fnPtrEnvGetGeoConst
    let EnvGetGeoConst = unsafeBitCast(EnvGetGeoConstPointer, to: EnvGetGeoConstFunction.self)

    return EnvGetGeoConst(xf_GeoCon)

}

public func envGetFkConst(_ xf_FkCon: Int32) -> Double {

    guard let EnvGetFkConstPointer = dlsym(libenvconstHandle, "EnvGetFkConst") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    typealias EnvGetFkConstFunction = fnPtrEnvGetFkConst
    let EnvGetFkConst = unsafeBitCast(EnvGetFkConstPointer, to: EnvGetFkConstFunction.self)

    return EnvGetFkConst(xf_FkCon)

}

public func envSetEarthShape(_ earthShape: Int32) {

    guard let EnvSetEarthShapePointer = dlsym(libenvconstHandle, "EnvSetEarthShape") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    typealias EnvSetEarthShapeFunction = fnPtrEnvSetEarthShape
    let EnvSetEarthShape = unsafeBitCast(EnvSetEarthShapePointer, to: EnvSetEarthShapeFunction.self)

    return EnvSetEarthShape(earthShape)

}
