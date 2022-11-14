//
//  time.swift
//  Sgp4Swift
//
//  Created by Gavin Eadie on 10/17/22.
//

import Foundation
import obj_c

fileprivate let libTimeFuncHandle = loadDll("libtimefunc.dylib")

public func timeFuncInit(_ dllHandle: Int64) -> Int32 {

    guard let timeFuncInitPointer = dlsym(libTimeFuncHandle, "TimeFuncInit") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    typealias TimeFuncInitFunction = fnPtrTimeFuncInit
    let timeFuncInit = unsafeBitCast(timeFuncInitPointer, to: TimeFuncInitFunction.self)
    return timeFuncInit(dllHandle)

}

public func timeFuncGetInfo() -> String {

    guard let timeFuncGetInfoPointer = dlsym(libTimeFuncHandle, "TimeFuncGetInfo") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    var info128 = Array(repeating: Int8(0), count: 128)

    typealias TimeFuncGetInfoFunction = @convention(c) (UnsafeMutablePointer<Int8>) -> Void
    let timeFuncGetInfo = unsafeBitCast(timeFuncGetInfoPointer, to: TimeFuncGetInfoFunction.self)
    timeFuncGetInfo(&info128); info128[127] = 0
    return String(cString: info128).trimRight()

}

/// This function supports DTG19 inputs in both "YY DDD HH MM SS.SSS" and "YYYYMonDDHHMMSS.SSS" formats.
/// The function can process dates from 1950 to 2049. Any input outside this range will yield "0.0" .. actually, Double(0.0).
/// - Parameter time: The string to convert
/// - Returns: The number of days since 1950 UTC
public func DTGToUTC(_ DTG19: String?) -> Double {

    guard let timeString = DTG19 else {
        fatalError("DTGToUTC failure: NULL string")
    }
    
    guard let DTGToUTCPointer = dlsym(libTimeFuncHandle, "DTGToUTC") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    typealias DTGToUTCFunction = fnPtrDTGToUTC
    let DTGToUTC = unsafeBitCast(DTGToUTCPointer, to: DTGToUTCFunction.self)

    return timeString.withCString {
        DTGToUTC(UnsafeMutablePointer(mutating: $0))
    }

}

public func TConRemoveAll() -> Int32 {
    
    guard let TConRemoveAllPointer = dlsym(libTimeFuncHandle, "TConRemoveAll") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }
    
    typealias TConRemoveAllFunction = @convention(c) () -> Int32
    let TConRemoveAll = unsafeBitCast(TConRemoveAllPointer, to: TConRemoveAllFunction.self)

    return TConRemoveAll()

}
