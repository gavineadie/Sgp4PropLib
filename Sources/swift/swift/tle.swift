//
//  tle.swift
//  Sgp4Swift
//
//  Created by Gavin Eadie on 10/17/22.
//

import Foundation
import obj_c

fileprivate let libtleHandle = loadDll("libtle.dylib")

/// Initializes Tle DLL for use in the program. If this function returns an error, it is recommended that you stop the program immediately.
///
/// - Parameter dllHandle: The handle that was returned from DllMainInit
/// - Returns: 0 if Tle.dll is initialized successfully, non-0 if there is an error.
///
/// `int TleInit((in-Long) apPtr)`

public func tleInit(_ dllHandle: Int64) -> Int32 {
 
    guard let tleInitPointer = dlsym(libtleHandle, "TleInit") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    typealias TleInitFunction = fnPtrTleInit
    let tleInit = unsafeBitCast(tleInitPointer, to: TleInitFunction.self)
    return tleInit(dllHandle)

}

public func tleGetInfo() -> String {

    guard let tleGetInfoPointer = dlsym(libtleHandle, "TleGetInfo") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    var info128 = Array(repeating: Int8(0), count: 128)

    typealias TleGetInfoFunction = fnPtrTleGetInfo
    let tleGetInfo = unsafeBitCast(tleGetInfoPointer, to: TleGetInfoFunction.self)
    tleGetInfo(&info128); info128[127] = 0
    return String(cString: info128).trimRight()

}

public func tleAddSatFrLines(_ line1: String, _ line2: String) -> Int64 {

    guard let tleAddSatFrLinesInfoPointer = dlsym(libtleHandle, "TleAddSatFrLines") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    typealias TleAddSatFrLinesFunction = fnPtrTleAddSatFrLines
    let tleAddSatFrLines = unsafeBitCast(tleAddSatFrLinesInfoPointer, to: TleAddSatFrLinesFunction.self)
    return tleAddSatFrLines(line1.withCString { UnsafeMutablePointer(mutating: $0) },
                            line2.withCString { UnsafeMutablePointer(mutating: $0) })

}

// ---------------- AUTO GENERATED ----------------

public func tleRemoveSat(_ satKey: Int64) -> Int32 {

    guard let TleRemoveSatPointer = dlsym(libtleHandle, "TleRemoveSat") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    typealias TleRemoveSatFunction = fnPtrTleRemoveSat
    let TleRemoveSat = unsafeBitCast(TleRemoveSatPointer, to: TleRemoveSatFunction.self)

    return TleRemoveSat(satKey)

}

public func tleGetSatKey(_ satNum: Int32) -> Int64 {

    guard let TleGetSatKeyPointer = dlsym(libtleHandle, "TleGetSatKey") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    typealias TleGetSatKeyFunction = fnPtrTleGetSatKey
    let TleGetSatKey = unsafeBitCast(TleGetSatKeyPointer, to: TleGetSatKeyFunction.self)

    return TleGetSatKey(satNum)

}

public func setTleKeyMode(_ tle_keyMode: Int32) -> Int32 {

    guard let SetTleKeyModePointer = dlsym(libtleHandle, "SetTleKeyMode") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    typealias SetTleKeyModeFunction = fnPtrSetTleKeyMode
    let SetTleKeyMode = unsafeBitCast(SetTleKeyModePointer, to: SetTleKeyModeFunction.self)

    return SetTleKeyMode(tle_keyMode)

}

