//
//  TimeFuncDriver.swift
//
//  Created by Gavin Eadie on 12/4/22.
//

import Foundation

/// Initializes the TimeFunc DLL for use in the program.
///
/// If this function returns an error, it is recommended that you stop the
/// program immediately.
///
/// An error will occur if you forget to load and initialize all the
/// prerequisite DLLs, as listed in the DLL Prerequisites section of the
/// accompanying documentation, before using this DLL.

/// - Parameter dllHandle: The pointer that was returned from DllMain.DllMainInit
/// - Returns: zero indicating the TimeFunc DLL has been initialized successfully. Other values indicate an error.
@available(*, deprecated, message: "This function has been deprecated since v9.0")
public func timeFuncInit(_ dllHandle: Int64) -> Int { Int(TimeFuncInit(dllHandle)) }

/// Returns the information about the TimeFunc DLL.
///
/// The information is placed in the string parameter you pass in. The returned string provides information
/// about the version number, build date, and the platform of the TimeFunc DLL.
/// - Returns: A string holding the information about TimeFunc.dll.
public func timeFuncGetInfo() -> String {

    var infoString = emptyCcharArray(size: GETSETSTRLEN)
    TimeFuncGetInfo(&infoString)
    return String(fromCcharArray: infoString, size: GETSETSTRLEN)

}

public func timeFuncLoadFile(_ filePath: String) -> Int {

    Int(TimeFuncLoadFile(filePath.cString))

}

/// Loads timing constants data from an input file.
///
/// Time constants can be included directly in the main input file or they can
/// be read from a separate file identified with "TIMFIL=[pathname/filename]".
///
/// The input file is read in two passes. The function first looks for "TIMFIL=" lines,
/// then it looks for timing constant data which was included directly. The result of
/// this is that data entered using both methods will be processed, but the "TIMFIL="
/// data will be processed first.
///
/// The time constants are also read in from each VCM. However, only the most recent
/// time constants among VCMs are stored in the memory, see VCM.dll documentation.
/// See the "Time Constants Data Description" section in the accompanying TimeFunc
/// documentation file for supported formats.
/// - Parameter filePath: The name of the file from which to read timing constants data.
/// - Returns: 0 if the input file has been loaded successfully, non-0 if error
public func tConLoadFile(_ filePath: String) -> Int {

    Int(TConLoadFile(filePath.cString))

}

/// Saves currently loaded timing constants data to a file.
///
/// The data will be saved in the format specified by the form parameter, regardless of the format
/// or method originally used to load it.
/// - Parameters:
///   - envFilePath: The name of the file in which to save the timing constants data.
///   - saveMode: Specifies whether to create a new file or append to an existing one. (0 = create, 1= append)
///   - saveForm: Specifies the mode in which to save the file. (0 = SPECTER Print Record format, 1 = XML format (future implementation))
/// - Returns: zero indicating the GEO and FK settings have been successfully saved to the file. Other values indicate an error.
public func tConSaveFile(_ tleFile: String, _ saveMode: Int, _ xf_tleForm: Int) -> Int {

    Int(TConSaveFile(tleFile.cString, Int32(saveMode), Int32(xf_tleForm)))

}

/// Removes all the timing constants records in memory.
/// - Returns: 0 if all timing constants records are successfully removed from memory,
/// non-0 if there is an error.
public func tConRemoveAll() -> Int { Int(TConRemoveAll()) }

/// Returns current prediction control parameters in form of a 6P-Card string.
/// - Parameter card6PLine: The resulting 6P-Card string.
public func get6PCardLine() -> String {

    var string512 = emptyCcharArray(size: GETSETSTRLEN)
    Get6PCardLine(&string512)
    return String(fromCcharArray: string512, size: GETSETSTRLEN)

}

/// This function supports DTG19 inputs in both "YY DDD HH MM SS.SSS" and
/// "YYYYMonDDHHMMSS.SSS" formats.
///
/// The function can process dates from 1950 to 2049.
/// Any input outside this range will yield "0.0" .. actually, Double(0.0).
/// - Parameter time: The string to convert. Can be any of the DTG formats
/// previously documented.
/// - Returns: The number of days since 1950 UTC
public func dtgToUTC(_ DTG19: String) -> Double {

    DTGToUTC(DTG19.cString)

}

/// Converts a time in ds50UTC to a time in ds50TAI using timing constants records in memory.
///
/// If no timing constants records were loaded, ds50UTC and ds50TAI are the same.
/// - Parameter ds50UTC: Days since 1950, UTC to be converted.
/// - Returns: The number of days since 1950, TAI. Partial days may be returned.
public func utcToTAI(_ ds50UTC: Double) -> Double { UTCToTAI(ds50UTC) }

/// Converts a time in ds50UTC to a time in ds50UT1 using timing constants records in memory.
///
/// If no timing constants records were loaded, `ds50UTC` and `ds50UT1` are the same.
/// - Parameter ds50UTC: Days since 1950, UTC to be converted.
/// - Returns: The number of days since 1950, TAI. Partial days may be returned.
public func utcToUT1(_ ds50UTC: Double) -> Double { UTCToUT1(ds50UTC) }

/// Converts a time in ds50UTC to a time in ds50ET using timing constants records in memory.
///
/// If no timing constants records were loaded, ds50UTC and ds50UT1 are the same.
///
/// - Parameter ds50UTC: Days since 1950, UTC to be converted.
/// - Returns: The number of days since 1950, ET. Partial days may be returned.
public func utcToET(_ ds50UTC: Double) -> Double { UTCToET(ds50UTC) }

/// Converts a year and a number of days to a time in ds50UTC.
///
/// - Parameters:
///   - year: Two or four digit years are accepted.
///   - dayOfYear: The day of year. Partial days can be specified.
/// - Returns: returns The number of days since 1950, UTC. Partial days may be returned.
public func yrDaysToUTC(_ year: Int, _ dayOfYear: Double) -> Double {

    YrDaysToUTC(Int32(year), dayOfYear)

}

/// Converts a set of time components (year, day of year, hour, minute, second) to a time in ds50UTC.
///
/// See `TimeComps2ToUTC` for a function which takes a month and day
/// instead of a day of year value.
/// - Parameters:
///   - year: Two or four digit years are accepted.
///   - dayOfYear: The day of year, expressed as a whole number.
///   - hh: The hour.
///   - mm: The minute.
///   - sss: The second, including partial seconds if desired.
/// - Returns: The number of Days since 1950, UTC. Partial days may be returned.
public func timeComps1ToUTC(_ year: Int, _ dayOfYear: Int,
                            _ hh: Int, _ mm: Int, _ sss: Double) -> Double {

    TimeComps1ToUTC(Int32(year), Int32(dayOfYear), Int32(hh), Int32(mm), sss)

}


/// Converts a time in ds50UTC to its individual components (year, day of year, hour, minute, second).
///
/// The input ds50UTC must be greater than 2192.0, which corresponds to a time later
/// than 1st Jan 1956. Any input value less than or equal to 2192.0 will be reset to that value.
/// - Parameters:
///   - ds50UTC: Days since 1950, UTC to be converted.
///   - year: A reference to a variable in which to store the 4-digit year. (out-Integer)
///   - dayOfYear: A reference to a variable in which to store the day of year. (out-Integer)
///   - hh: A reference to a variable in which to store the hour. (out-Integer)
///   - mm: A reference to a variable in which to store the minute. (out-Integer)
///   - sss: A reference to a variable in which to store the second.
///   Partial seconds may be expressed if necessary. (out-Double)
public func utcToTimeComps1(_ ds50UTC: Double,
                            _ year: inout Int32, _ dayOfYear: inout Int32,
                            _ hh: inout Int32, _ mm: inout Int32, _ sss: inout Double) {
    precondition(ds50UTC >= 2192.0, "utcToTimeComps1 failure: ds50UTC < 2192.0")

    UTCToTimeComps1(ds50UTC, &year, &dayOfYear, &hh, &mm, &sss)

}

public func timeComps2ToUTC(_ year: Int, _ month: Int, _ dayOfMonth: Int,
                            _ hh: Int, _ mm: Int, _ sss: Double) -> Double {

    TimeComps2ToUTC(Int32(year), Int32(month), Int32(dayOfMonth), Int32(hh), Int32(mm), sss)

}

/// Converts a time in ds50UTC to its individual components (year, day of year, hour, minute, second).
///
/// The input ds50UTC must be greater than 2192.0, which corresponds to a time later
/// than 1st Jan 1956. Any input value less than or equal to 2192.0 will be reset to that value.
/// - Parameters:
///   - ds50UTC: Days since 1950, UTC to be converted.
///   - year: A reference to a variable in which to store the 4-digit year. (out-Integer)
///   - dayOfYear: A reference to a variable in which to store the day of year. (out-Integer)
///   - hh: A reference to a variable in which to store the hour. (out-Integer)
///   - mm: A reference to a variable in which to store the minute. (out-Integer)
///   - sss: A reference to a variable in which to store the second.
///   Partial seconds may be expressed if necessary. (out-Double)
public func utcToTimeComps2(_ ds50UTC: Double,
                            _ year: inout Int32, _ month: inout Int32, _ dayofMonth: inout Int32,
                            _ hh: inout Int32, _ mm: inout Int32, _ sss: inout Double) {
    precondition(ds50UTC >= 2192.0, "utcToTimeComps2 failure: ds50UTC < 2192.0")

    UTCToTimeComps2(ds50UTC, &year, &month, &dayofMonth, &hh, &mm, &sss)

}

/// Converts a time in ds50UTC to a year and day of year.
///
/// The input ds50UTC must be greater than 2192.0, which corresponds to a time later
/// than 1st Jan 1956. Any input value less than or equal to 2192.0 will yield Year=1956, Day=1.0.
/// - Parameters:
///   - ds50UTC: Days since 1950, UTC to be converted.
///   - year: A reference to a variable in which to place the 4-digit year. (out-Integer)
///   - dayOfYear: A reference to a variable in which to place the day of year.
///   Partial days may be expressed in this variable. (out-Double)
public func utcToYrDays(_ ds50UTC: Double,
                        _ year: inout Int32, _ dayOfYear: inout Double) {
    precondition(ds50UTC >= 2192.0, "utcToYrDays failure: ds50UTC < 2192.0")

    UTCToYrDays(ds50UTC, &year, &dayOfYear)

}

/// Converts an internal time in ds50UTC to a string in DTG20 format.
/// The resulting string takes the form "YYYY/DDD HHMM SS.SSS".
///
/// The input `ds50UTC` must be greater than 2192.0, which corresponds to a time
/// later than 1st Jan 1956. Any input value less than or equal to 2192.0 will yield
/// "1956/001 0000 00.000".
/// - Parameter ds50UTC: Days since 1950, UTC to be converted.
/// - Returns: A string to hold the result of the conversion.
public func utcToDTG20(_ ds50UTC: Double) -> String {

    var string24 = emptyCcharArray(size: 24)
    UTCToDTG20(ds50UTC, &string24)
    return String(fromCcharArray: string24, size: 24)

}

/// Converts an internal time in ds50UTC to a string in DTG19 format.
/// The resulting string takes the form "YYYYMonDDHHMMSS.SSS".
///
/// The input `ds50UTC` must be greater than 2192.0, which corresponds to a time
/// later than 1st Jan 1956. Any input value less than or equal to 2192.0 will yield
/// "1956Jan01000000.000".
/// - Parameter ds50UTC: Days since 1950, UTC to be converted.
/// - Returns: A string to hold the result of the conversion.
public func utcToDTG19(_ ds50UTC: Double) -> String {

    var string24 = emptyCcharArray(size: 24)
    UTCToDTG19(ds50UTC, &string24)
    return String(fromCcharArray: string24, size: 24)

}

/// Converts an internal time in ds50UTC to a string in DTG17 format.
/// The resulting string takes the form "YYYY/DDD.DDDDDDDD".
///
/// The input `ds50UTC` must be greater than 2192.0, which corresponds to a time
/// later than 1st Jan 1956. Any input value less than or equal to 2192.0 will yield
/// "1956/001.00000000".
/// - Parameter ds50UTC: Days since 1950, UTC to be converted.
/// - Returns: A string to hold the result of the conversion. (out-Character[19])
public func utcToDTG17(_ ds50UTC: Double) -> String {

    print("              utcToDTG17| .. loadAllDlls")
    loadAllDlls()                       // test run before libraries loaded (ouch!)

    var string24 = emptyCcharArray(size: 24)
    UTCToDTG17(ds50UTC, &string24)
    return String(fromCcharArray: string24, size: 24)

}

/// Converts an internal time in ds50UTC to a string in DTG15 format.
/// The resulting string takes the form "YYDDDHHMMSS.SSS".
///
/// The input `ds50UTC` must be greater than 2192.0, which corresponds to a time
/// later than 1st Jan 1956. Any input value less than or equal to 2192.0 will yield
/// "56001000000.000".
/// - Parameter ds50UTC: Days since 1950, UTC to be converted.
/// - Returns: A string to hold the result of the conversion. (out-Character[19])
public func utcToDTG15(_ ds50UTC: Double) -> String {

    var string24 = emptyCcharArray(size: 24)
    UTCToDTG15(ds50UTC, &string24)
    return String(fromCcharArray: string24, size: 24)

}
