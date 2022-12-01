//
//  tle.swift
//  Sgp4Swift
//
//  Created by Gavin Eadie on 10/17/22.
//

import Foundation
import obj_c

fileprivate let libHandle = loadDll("libtle.dylib")

/// Initializes Tle DLL for use in the program. If this function returns an error, it is recommended that you stop the program immediately.
///
/// - Parameter dllHandle: The handle that was returned from DllMainInit
/// - Returns: 0 if Tle.dll is initialized successfully, non-0 if there is an error.

public func tleInit(_ dllHandle: Int64) -> Int32 {

    guard let tleInitPointer = dlsym(libHandle, "TleInit") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    typealias TleInitFunction = fnPtrTleInit
    let tleInit = unsafeBitCast(tleInitPointer, to: TleInitFunction.self)
    return tleInit(dllHandle)

}

/// Returns the information about the Tle DLL.
///
/// The returned string provides information about the version number, build date, and the platform of the Tle DLL.
/// - Returns: A string to hold the information about the Tle DLL.

public func tleGetInfo() -> String {

    guard let tleGetInfoPointer = dlsym(libHandle, "TleGetInfo") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    var info128 = Array(repeating: Int8(0), count: 128)

    typealias TleGetInfoFunction = fnPtrTleGetInfo
    let tleGetInfo = unsafeBitCast(tleGetInfoPointer, to: TleGetInfoFunction.self)
    tleGetInfo(&info128); info128[127] = 0
    return String(cString: info128).trimRight()

}

/// Loads TLEs (satellites) contained in a text file into the TLE DLL's binary tree.
/// You may use this function repeatedly to load TLEs from different input files. However, only unique satKeys are loaded. Duplicated TLEs won't be stored.
///
/// TLEs can be included directly in the specified file, or they can be read from a separate file identified with "ELTFIL=[path\filename]" or "VECFIL=[path\filename]".
///
/// The input file is read in two passes. The function first looks for "ELTFIL=" and "VECFIL=" lines, then it looks for TLEs which were included directly. The result of this is that data entered using both methods will be processed, but the "ELTFIL=" and "VECFIL=" data will be processed first.

/// - Parameter tleFileName: The name of the file containing two line element sets to be loaded.
/// - Returns: 0 if the two line element sets in the file are successfully loaded, non-0 if there is an error.

public func TleLoadFile(_ tleFileName: String) -> Int32 {

    guard let TleLoadFilePointer = dlsym(libHandle, "TleLoadFile") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    typealias TleLoadFileFunction = fnPtrTleLoadFile
    let TleLoadFile = unsafeBitCast(TleLoadFilePointer, to: TleLoadFileFunction.self)

    return tleFileName.withCString {
        TleLoadFile(UnsafeMutablePointer(mutating: $0))
    }

}

//public func tleAddSatFrLines(_ line1: String, _ line2: String) -> Int64 {
//
//    guard let tleAddSatFrLinesPointer = dlsym(libHandle, "TleAddSatFrLines") else {
//        fatalError("dlsym failure: \(String(cString: dlerror()))")
//    }
//
//    typealias TleAddSatFrLinesFunction = fnPtrTleAddSatFrLines
//    let tleAddSatFrLines = unsafeBitCast(tleAddSatFrLinesPointer, to: TleAddSatFrLinesFunction.self)
//
//    return tleAddSatFrLines(line1.withCString { UnsafeMutablePointer(mutating: $0) },
//                            line2.withCString { UnsafeMutablePointer(mutating: $0) })
//
//}

// ---------------- AUTO GENERATED ----------------

//------------------------------------------------------------------
// ORIGINAL: Int64 TleAddSatFrLines((in-Character[512]) line1, (in-Character[512]) line2)

public func tleAddSatFrLines(_ line1: String, _ line2: String) -> Int64 {

    guard let tleAddSatFrLinesPointer = dlsym(libHandle, "TleAddSatFrLines") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    typealias TleAddSatFrLinesFunction = fnPtrTleAddSatFrLines
    let tleAddSatFrLines = unsafeBitCast(tleAddSatFrLinesPointer, to: TleAddSatFrLinesFunction.self)

    return tleAddSatFrLines(makeCString(from: line1), makeCString(from: line2))

}

//------------------------------------------------------------------
// ORIGINAL: Int32 TleGetField((in-Long) satKey, (in-Integer) xf_Tle, (out-Character[512]) valueStr)

public func tleGetField(_ satKey: Int64, _ xf_Tle: Int32) -> String? {

    guard let tleGetFieldPointer = dlsym(libHandle, "TleGetField") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    typealias TleGetFieldFunction = fnPtrTleGetField
    let tleGetField = unsafeBitCast(tleGetFieldPointer, to: TleGetFieldFunction.self)

    var string512 = Array(repeating: Int8(0), count: Int(512))
    if 0 == tleGetField(satKey, xf_Tle, &string512) {
        string512[511] = 0
        return String(cString: string512).trimRight()
    } else {
        return nil
    }

}
