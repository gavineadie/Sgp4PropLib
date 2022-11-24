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
private func TleLoadFile(_ tleFileName: String) -> Int32 {

    guard let TleLoadFilePointer = dlsym(libHandle, "TleLoadFile") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    typealias TleLoadFileFunction = fnPtrTleLoadFile
    let TleLoadFile = unsafeBitCast(TleLoadFilePointer, to: TleLoadFileFunction.self)

    return tleFileName.withCString {
        TleLoadFile(UnsafeMutablePointer(mutating: $0))
    }

}

// ---------------- AUTO GENERATED ----------------

