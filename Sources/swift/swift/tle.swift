//
//  tle.swift
//  Sgp4Swift
//
//  Created by Gavin Eadie on 10/17/22.
//

import Foundation

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

    typealias TleInitFunction = @convention(c) (Int64) -> Int32
    let tleInit = unsafeBitCast(tleInitPointer, to: TleInitFunction.self)
    return tleInit(dllHandle)

}

public func tleGetInfo() -> String {

    guard let tleGetInfoPointer = dlsym(libtleHandle, "TleGetInfo") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    var info128 = Array(repeating: Int8(0), count: 128)

    typealias TleGetInfoFunction = @convention(c) (UnsafeMutablePointer<Int8>) -> Void      // void TleGetInfo((out-Character[128]) infoStr);
    let tleGetInfo = unsafeBitCast(tleGetInfoPointer, to: TleGetInfoFunction.self)
    tleGetInfo(&info128); info128[127] = 0
    return String(cString: info128).trimRight()

}

public func tleAddSatFrLines(_ line1: String, _ line2: String) -> Int64 {

    guard let tleAddSatFrLinesInfoPointer = dlsym(libtleHandle, "TleAddSatFrLines") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    typealias TleAddSatFrLinesFunction = @convention(c) (UnsafePointer<UInt8>,              // __int64 TleAddSatFrLines((in-Character[512]) line1,
                                                         UnsafePointer<UInt8>) -> Int64     //                          (in-Character[512]) line2));
    let tleAddSatFrLines = unsafeBitCast(tleAddSatFrLinesInfoPointer,
                                         to: TleAddSatFrLinesFunction.self)
    return tleAddSatFrLines(Array(line1.utf8), Array(line2.utf8))

}
