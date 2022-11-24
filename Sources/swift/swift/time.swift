//
//  time.swift
//  Sgp4Swift
//
//  Created by Gavin Eadie on 10/17/22.
//

import Foundation
import obj_c

fileprivate let libHandle = loadDll("libtimefunc.dylib")

/// Initializes the TimeFunc DLL for use in the program. If this function returns an error, it is recommended that you stop the program immediately.
///
/// An error will occur if you forget to load and initialize all the prerequisite DLLs,
/// as listed in the DLL Prerequisites section of the accompanying documentation,
/// before using this DLL.
/// - Parameter dllHandle: The pointer that was returned from DllMain.DllMainInit (in-Long)
/// - Returns: zero indicating the TimeFunc DLL has been initialized successfully. Other values indicate an error
public func timeFuncInit(_ dllHandle: Int64) -> Int32 {

    guard let timeFuncInitPointer = dlsym(libHandle, "TimeFuncInit") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    typealias TimeFuncInitFunction = fnPtrTimeFuncInit
    let timeFuncInit = unsafeBitCast(timeFuncInitPointer, to: TimeFuncInitFunction.self)
    return timeFuncInit(dllHandle)

}

/// Returns information about the TimeFunc DLL. The returned string provides information
/// about the version number, build date, and the platform of the TimeFunc DLL.
/// - Returns: A string to hold the information about TimeFunc.dll. (out-Character[128])
public func timeFuncGetInfo() -> String {

    guard let timeFuncGetInfoPointer = dlsym(libHandle, "TimeFuncGetInfo") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    var info128 = Array(repeating: Int8(0), count: 128)

    typealias TimeFuncGetInfoFunction = fnPtrTimeFuncGetInfo
    let timeFuncGetInfo = unsafeBitCast(timeFuncGetInfoPointer, to: TimeFuncGetInfoFunction.self)
    timeFuncGetInfo(&info128); info128[127] = 0
    return String(cString: info128).trimRight()

}

/// This function supports DTG19 inputs in both "YY DDD HH MM SS.SSS" and
/// "YYYYMonDDHHMMSS.SSS" formats.
///
/// The function can process dates from 1950 to 2049.
/// Any input outside this range will yield "0.0" .. actually, Double(0.0).
/// - Parameter time: The string to convert. Can be any of the DTG formats
/// previously documented. (in-Character[20])
/// - Returns: The number of days since 1950 UTC
public func dtgToUTC(_ DTG19: String?) -> Double {

    guard let timeString = DTG19 else {
        fatalError("dtgToUTC failure: NULL string")
    }
<<<<<<< HEAD

=======

>>>>>>> autogen
    guard let DTGToUTCPointer = dlsym(libHandle, "DTGToUTC") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    typealias DTGToUTCFunction = fnPtrDTGToUTC
    let DTGToUTC = unsafeBitCast(DTGToUTCPointer, to: DTGToUTCFunction.self)

    return timeString.withCString {
        DTGToUTC(UnsafeMutablePointer(mutating: $0))
    }
}

/// Converts a time in ds50UTC to a time in ds50TAI using timing constants records in memory.
///
/// If no timing constants records were loaded, ds50UTC and ds50TAI are the same.
/// - Parameter ds50UTC: Days since 1950, UTC to be converted.
/// - Returns: The number of days since 1950, TAI. Partial days may be returned.
public func UTCToTAI(_ ds50UTC: Double) -> Double {

    guard let UTCToTAIPointer = dlsym(libHandle, "UTCToTAI") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    typealias UTCToTAIFunction = fnPtrUTCToTAI
    let UTCToTAI = unsafeBitCast(UTCToTAIPointer, to: UTCToTAIFunction.self)

    return UTCToTAI(ds50UTC)

}

/// Converts a time in ds50UTC to a time in ds50UT1 using timing constants records in memory.
///
/// If no timing constants records were loaded, `ds50UTC` and `ds50UT1` are the same.
/// - Parameter ds50UTC: Days since 1950, UTC to be converted. (in-Double)
/// - Returns: The number of days since 1950, TAI. Partial days may be returned.
public func UTCToUT1(_ ds50UTC: Double) -> Double {

    guard let UTCToUT1Pointer = dlsym(libHandle, "UTCToUT1") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    typealias UTCToUT1Function = fnPtrUTCToUT1
    let UTCToUT1 = unsafeBitCast(UTCToUT1Pointer, to: UTCToUT1Function.self)

    return UTCToUT1(ds50UTC)

}

/// Converts a time in ds50UTC to a time in ds50ET using timing constants records in memory.
///
/// If no timing constants records were loaded, ds50UTC and ds50UT1 are the same.
///
/// - Parameter ds50UTC: Days since 1950, UTC to be converted. (in-Double)
/// - Returns: The number of days since 1950, ET. Partial days may be returned.
public func UTCToET(_ ds50UTC: Double) -> Double {

    guard let UTCToETPointer = dlsym(libHandle, "UTCToET") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    typealias UTCToETFunction = fnPtrUTCToET
    let UTCToET = unsafeBitCast(UTCToETPointer, to: UTCToETFunction.self)

    return UTCToET(ds50UTC)

}

/// Converts a year and a number of days to a time in ds50UTC.
///
/// - Parameters:
///   - year: Two or four digit years are accepted. (in-Integer)
///   - dayOfYear: The day of year. Partial days can be specified. (in-Double)
/// - Returns: returns The number of days since 1950, UTC. Partial days may be returned.
func YrDaysToUTC(_ year: Int32, _ dayOfYear: Double) -> Double {

    guard let YrDaysToUTCPointer = dlsym(libHandle, "YrDaysToUTC") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    typealias YrDaysToUTCFunction = fnPtrYrDaysToUTC
    let YrDaysToUTC = unsafeBitCast(YrDaysToUTCPointer, to: YrDaysToUTCFunction.self)

    return YrDaysToUTC(year, dayOfYear)

}

/// Converts a time in ds50UTC to a year and day of year.
///
/// The input ds50UTC must be greater than 2192.0, which corresponds to a time later
/// than 1st Jan 1956. Any input value less than or equal to 2192.0 will yield Year=1956, Day=1.0.
/// - Parameters:
///   - ds50UTC: Days since 1950, UTC to be converted. (in-Double)
///   - year: A reference to a variable in which to place the 4-digit year. (out-Integer)
///   - dayOfYear: A reference to a variable in which to place the day of year.
///   Partial days may be expressed in this variable. (out-Double)
func UTCToYrDays(_ ds50UTC: Double,
                 _ year: inout Int32, _ dayOfYear: inout Double) {

    guard let UTCToYrDaysPointer = dlsym(libHandle, "UTCToYrDays") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    typealias UTCToYrDaysFunction = fnPtrUTCToYrDays
    let UTCToYrDays = unsafeBitCast(UTCToYrDaysPointer, to: UTCToYrDaysFunction.self)

    UTCToYrDays(ds50UTC, &year, &dayOfYear)

}

/// Converts a set of time components (year, day of year, hour, minute, second) to a time in ds50UTC.
///
/// See `TimeComps2ToUTC` for a function which takes a month and day
/// instead of a day of year value.
/// - Parameters:
///   - year: Two or four digit years are accepted. (in-Integer)
///   - dayOfYear: The day of year, expressed as a whole number. (in-Integer)
///   - hh: The hour. (in-Integer)
///   - mm: The minute. (in-Integer)
///   - sss: The second, including partial seconds if desired. (in-Double)
/// - Returns: The number of Days since 1950, UTC. Partial days may be returned.
func TimeComps1ToUTC(_ year: Int32, _ dayOfYear: Int32,
                     _ hh: Int32, _ mm: Int32, _ sss: Double) -> Double {

    guard let TimeComps1ToUTCPointer = dlsym(libHandle, "TimeComps1ToUTC") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    typealias TimeComps1ToUTCFunction = fnPtrTimeComps1ToUTC
    let TimeComps1ToUTC = unsafeBitCast(TimeComps1ToUTCPointer, to: TimeComps1ToUTCFunction.self)

    return TimeComps1ToUTC(year, dayOfYear, hh, mm, sss)

}

/// Converts a time in ds50UTC to its individual components (year, day of year, hour, minute, second).
///
/// The input ds50UTC must be greater than 2192.0, which corresponds to a time later
/// than 1st Jan 1956. Any input value less than or equal to 2192.0 will be reset to that value.
/// - Parameters:
///   - ds50UTC: Days since 1950, UTC to be converted. (in-Double)
///   - year: A reference to a variable in which to store the 4-digit year. (out-Integer)
///   - dayOfYear: A reference to a variable in which to store the day of year. (out-Integer)
///   - hh: A reference to a variable in which to store the hour. (out-Integer)
///   - mm: A reference to a variable in which to store the minute. (out-Integer)
///   - sss: A reference to a variable in which to store the second.
///   Partial seconds may be expressed if necessary. (out-Double)
func UTCToTimeComps1(_ ds50UTC: Double,
                     _ year: inout Int32, _ dayOfYear: inout Int32,
                     _ hh: inout Int32, _ mm: inout Int32, _ sss: inout Double) {

    precondition(ds50UTC >= 2192.0, "UTCToTimeComps1 failure: ds50UTC < 2192.0")

    guard let UTCToTimeComps1Pointer = dlsym(libHandle, "UTCToTimeComps1") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    typealias UTCToTimeComps1Function = fnPtrUTCToTimeComps1
    let UTCToTimeComps1 = unsafeBitCast(UTCToTimeComps1Pointer, to: UTCToTimeComps1Function.self)

    UTCToTimeComps1(ds50UTC, &year, &dayOfYear, &hh, &mm, &sss)

}

func TimeComps2ToUTC(_ year: Int32, _ month: Int32, _ dayOfMonth: Int32,
                     _ hh: Int32, _ mm: Int32, _ sss: Double) -> Double {

    guard let TimeComps2ToUTCPointer = dlsym(libHandle, "TimeComps1ToUTC") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    typealias TimeComps2ToUTCFunction = fnPtrTimeComps2ToUTC
    let TimeComps2ToUTC = unsafeBitCast(TimeComps2ToUTCPointer, to: TimeComps2ToUTCFunction.self)

    return TimeComps2ToUTC(year, month, dayOfMonth, hh, mm, sss)

}

/// Converts a time in ds50UTC to its individual components (year, day of year, hour, minute, second).
///
/// The input ds50UTC must be greater than 2192.0, which corresponds to a time later
/// than 1st Jan 1956. Any input value less than or equal to 2192.0 will be reset to that value.
/// - Parameters:
///   - ds50UTC: Days since 1950, UTC to be converted. (in-Double)
///   - year: A reference to a variable in which to store the 4-digit year. (out-Integer)
///   - dayOfYear: A reference to a variable in which to store the day of year. (out-Integer)
///   - hh: A reference to a variable in which to store the hour. (out-Integer)
///   - mm: A reference to a variable in which to store the minute. (out-Integer)
///   - sss: A reference to a variable in which to store the second.
///   Partial seconds may be expressed if necessary. (out-Double)
func UTCToTimeComps2(_ ds50UTC: Double,
                     _ year: inout Int32, _ month: inout Int32, _ dayofMonth: inout Int32,
                     _ hh: inout Int32, _ mm: inout Int32, _ sss: inout Double) {

    precondition(ds50UTC >= 2192.0, "UTCToTimeComps2 failure: ds50UTC < 2192.0")

    guard let UTCToTimeComps2Pointer = dlsym(libHandle, "UTCToTimeComps2") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    typealias UTCToTimeComps2Function = fnPtrUTCToTimeComps2
    let UTCToTimeComps2 = unsafeBitCast(UTCToTimeComps2Pointer, to: UTCToTimeComps2Function.self)

    UTCToTimeComps2(ds50UTC, &year, &month, &dayofMonth, &hh, &mm, &sss)

}

/// Converts an internal time in ds50UTC to a string in DTG20 format.
/// The resulting string takes the form "YYYY/DDD HHMM SS.SSS".
///
/// The input `ds50UTC` must be greater than 2192.0, which corresponds to a time
/// later than 1st Jan 1956. Any input value less than or equal to 2192.0 will yield
/// "1956/001 0000 00.000".
/// - Parameter ds50UTC: Days since 1950, UTC to be converted. (in-Double)
/// - Returns: A string to hold the result of the conversion. (out-Character[20])
public func utcToDTG20(_ ds50UTC: Double) -> String {

    guard let UTCToDTG20Pointer = dlsym(libHandle, "UTCToDTG20") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    typealias UTCToDTG20Function = fnPtrUTCToDTG20
    let utcToDTG20 = unsafeBitCast(UTCToDTG20Pointer, to: UTCToDTG20Function.self)

    var info24 = Array(repeating: Int8(0), count: 24)
    utcToDTG20(ds50UTC, &info24); info24[20] = 0
    return String(cString: info24).trimRight()
}

/// Converts an internal time in ds50UTC to a string in DTG19 format.
/// The resulting string takes the form "YYYYMonDDHHMMSS.SSS".
///
/// The input `ds50UTC` must be greater than 2192.0, which corresponds to a time
/// later than 1st Jan 1956. Any input value less than or equal to 2192.0 will yield
/// "1956Jan01000000.000".
/// - Parameter ds50UTC: Days since 1950, UTC to be converted. (in-Double)
/// - Returns: A string to hold the result of the conversion. (out-Character[19])
public func utcToDTG19(_ ds50UTC: Double) -> String {

    guard let UTCToDTG19Pointer = dlsym(libHandle, "UTCToDTG19") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    typealias UTCToDTG19Function = fnPtrUTCToDTG19
    let utcToDTG19 = unsafeBitCast(UTCToDTG19Pointer, to: UTCToDTG19Function.self)

    var info24 = Array(repeating: Int8(0), count: 24)
    utcToDTG19(ds50UTC, &info24); info24[19] = 0
    return String(cString: info24).trimRight()
}

/// Converts an internal time in ds50UTC to a string in DTG17 format.
/// The resulting string takes the form "YYYY/DDD.DDDDDDDD".
///
/// The input `ds50UTC` must be greater than 2192.0, which corresponds to a time
/// later than 1st Jan 1956. Any input value less than or equal to 2192.0 will yield
/// "1956/001.00000000".
/// - Parameter ds50UTC: Days since 1950, UTC to be converted. (in-Double)
/// - Returns: A string to hold the result of the conversion. (out-Character[19])
public func utcToDTG17(_ ds50UTC: Double) -> String {

    guard let UTCToDTG17Pointer = dlsym(libHandle, "UTCToDTG17") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    typealias UTCToDTG17Function = fnPtrUTCToDTG17
    let utcToDTG17 = unsafeBitCast(UTCToDTG17Pointer, to: UTCToDTG17Function.self)

    var info24 = Array(repeating: Int8(0), count: 24)
    utcToDTG17(ds50UTC, &info24); info24[17] = 0
    return String(cString: info24).trimRight()
}

/// Converts an internal time in ds50UTC to a string in DTG15 format.
/// The resulting string takes the form "YYDDDHHMMSS.SSS".
///
/// The input `ds50UTC` must be greater than 2192.0, which corresponds to a time
/// later than 1st Jan 1956. Any input value less than or equal to 2192.0 will yield
/// "56001000000.000".
/// - Parameter ds50UTC: Days since 1950, UTC to be converted. (in-Double)
/// - Returns: A string to hold the result of the conversion. (out-Character[19])
public func utcToDTG15(_ ds50UTC: Double) -> String {

    guard let UTCToDTG15Pointer = dlsym(libHandle, "UTCToDTG15") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    typealias UTCToDTG15Function = fnPtrUTCToDTG15
    let utcToDTG15 = unsafeBitCast(UTCToDTG15Pointer, to: UTCToDTG15Function.self)

    var info24 = Array(repeating: Int8(0), count: 24)
    utcToDTG15(ds50UTC, &info24); info24[15] = 0
    return String(cString: info24).trimRight()
}

/// Removes all the timing constants records in memory.
/// - Returns: 0 if all timing constants records are successfully removed from memory,
/// non-0 if there is an error.
public func TConRemoveAll() -> Int32 {

    guard let TConRemoveAllPointer = dlsym(libHandle, "TConRemoveAll") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    typealias TConRemoveAllFunction = fnPtrTConRemoveAll
    let TConRemoveAll = unsafeBitCast(TConRemoveAllPointer, to: TConRemoveAllFunction.self)

    return TConRemoveAll()

}

// ---------------- AUTO GENERATED ----------------

