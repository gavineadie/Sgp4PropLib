//
//  Drivers.swift
//  
//
//  Created by Gavin Eadie on 12/4/22.
//

import Foundation
import obj_c

// ================================================ MAIN ================================================

/// This is the most important function call of the *Standardized Astrodynamic Algorithms library*.
/// It returns a handle which can be used to access the static global data set needed by the
/// Standardized Astrodynamic Algorithms dynamic libraries to communicate among themselves.
///
/// All other function calls within the API will use this handle, so make sure you save this
/// function's return value. This function must be called before any other functions in the
/// library can be called. This applies to the functions in this dynamic library, and in all
/// other dynamic libraries in the library.
///
/// When passing the return value from this function to an initialization routine for another
/// dynamic library (`AstroFunc.AstroFuncInit`, `TimeFunc.TimeFuncInit...`),
/// the initialization routine will check to see if the passed in handle refers to a valid global data set.
/// If you forget to call this function first, the `GetLastErrMsg()` function won't return a
/// correct value.
/// - Returns: A handle to the global data set. You will pass this handle to other
/// initialization functions within other DLLs in the API.
@available(*, deprecated, message: "This function has been deprecated since v9.0")
public func dllMainInit() -> Int64 { DllMainInit() }

/// Returns information about the DllMain DLL.
///
/// - Returns: A `String` of information about the DLL version number, build date, and platform.
public func dllMainGetInfo() -> String {

    var infoString = Array(repeating: Int8(0), count: Int(INFOSTRLEN+1))
    DllMainGetInfo(&infoString)
    infoString[Int(INFOSTRLEN)] = 0
    return String(cString: infoString).trimRight()

}

/// Loads DllMain-related parameters (AS_MOIC) from a text file
///
/// Whenever the user wants to enter and later retrieve his own input data in an input text file,
/// he can use the predefined input card “AS_MOIC” format to fulfil that. This input card allows
/// up to 128 numeric data fields. It’s a free format and the only requirement is that data fields
/// are separated by commas or white spaces.
///
/// - Parameter filePath: The name of the input file.
/// - Returns: zero indicating the input file has been loaded successfully. Other values indicate an error.
public func dllMainLoadFile(_ filePath: String) -> Int {

    Int(DllMainLoadFile(makeCString(from: filePath)))

}

/// Returns a list of names of the Standardized Astrodynamic Algorithms dynamic
/// libraries that were initialized successfully.
/// - Returns: A string with the names of the dynamic libraries that were initialized
/// successfully. (out-Character[512])
@available(*, deprecated, message: "This function has been deprecated since v9.0")
public func getInitDllNames() -> String {

    var getNamesString = Array(repeating: Int8(0), count: Int(GETSETSTRLEN+1))
    GetInitDllNames(&getNamesString)
    getNamesString[Int(GETSETSTRLEN)] = 0
    return String(cString: getNamesString).trimRight()

}

/// Returns a character string describing the last error that occurred. As a common practice,
/// this function is called to retrieve the error message when an error occurs.
///
/// This function works with or without an opened log file.
///
/// If you call this function before you have called DllMainInit(), the function will
/// return an invalid string. This could result in undefined behavior.
/// - Returns: A string that stores the last logged error message.
public func getLastErrMsg() -> String {

    var messageString = Array(repeating: Int8(0), count: Int(LOGMSGLEN+1))
    GetLastErrMsg(&messageString)
    messageString[Int(LOGMSGLEN)] = 0
    return String(cString: messageString).trimRight()

}

/// Returns a character string describing the last informational message that was recorded.
///
/// This function is usually called right after space objects (TLEs, VCMs, sensors,
/// observations, etc.) in an input text file were loaded. It gives information about how
/// many records were successfully loaded, how many were bad, and how many were
/// duplicated.
///
/// This function works with or without an opened log file.
/// If you call this function before you have called `DllMainInit()`, the function will
/// return an invalid string. This could result in undefined behavior.
///
/// (This function provides a quick way to check whether all of the prerequisite
/// dynamic libraries have been loaded and initialized correctly. Improper initialization of the
/// Standardized Astrodynamic Algorithms dynamic libraries is one of the most common
/// causes of program crashes.)
/// - Returns: A string that stores the last logged informational message.
public func GetLastInfoMsg() -> String {

    var messageString = Array(repeating: Int8(0), count: Int(LOGMSGLEN+1))
    GetLastInfoMsg(&messageString)
    messageString[Int(LOGMSGLEN)] = 0
    return String(cString: messageString).trimRight()

}

/// Opens a log file and enables the writing of diagnostic information into it.
///
/// All of the DLLs in the library will write diagnostic information into the log file once
/// this function has been called.  If the file specified by logFileName already exists,
/// its contents are erased.
///
/// Enabling logging can potentially result in large amounts of diagnostic information being
/// generated, which can lead to large amounts of storage being consumed as well as
/// performance decreases. For this reason, it is recommended that this function only
/// be used for debugging purposes.
/// - Parameter fileName: The name of the log file to use.
/// - Returns: 0 if the file was opened successfully. Other values indicate an error.
public func openLogFile(_ filePath: String) -> Int {

    Int(OpenLogFile(makeCString(from: filePath)))

}

/// Writes a message into the log file.
///
/// Make sure the log file is open by calling OpenLogFile before using this function.
///
/// - Parameter message: A message to be written into the log file, limited to 128 characters.
/// If the message is longer than this, it will be truncated.
public func logMessage(_ message: String) {

    LogMessage(makeCString(from: message))

}

/// Closes the currently open log file and reset the last logged error message to null.
///
/// Remember to close the log file before exiting the program.
public func closeLogFile() { CloseLogFile() }

// ================================================ ENV ================================================

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
@available(*, deprecated, message: "This function has been deprecated since v9.0")
public func envInit(_ dllHandle: Int64) -> Int { Int(EnvInit(dllHandle)) }

/// Returns information about the EnvConst DLL.
///
/// - Returns: A `String` of information about the DLL version number, build date, and platform.
public func envGetInfo() -> String {

    var infoString = Array(repeating: Int8(0), count: Int(GETSETSTRLEN+1))
    EnvGetInfo(&infoString)
    infoString[Int(GETSETSTRLEN)] = 0
    return String(cString: infoString).trimRight()

}

/// Reads Earth constants (GEO) model and fundamental catalogue (FK) model settings from a file.
///
/// The users can use NAME=VALUE pair to setup the GEO and FK models in the input file.
///
/// For GEO model, the valid names are GEOCONST, BCONST and the valid values are WGS-72, WGS72,
/// 72, WGS-84, WGS84, 84, EGM-96, EGM96, 96, EGM-08, EGM08, 08, JGM-2, JGM2, 2, SEM68R, 68, GEM5,
/// 5, GEM9, and 9.
///
/// For FK model, the valid name is FKCONST and the valid values are: FK4, 4, FK5, 5.
///
/// All the string literals are case-insensitive.
/// - Parameter filePath: The name of the input file.
/// - Returns: zero indicating the input file has been loaded successfully. Other values indicate an error.
public func envLoadFile(_ filePath: String) -> Int {

    Int(EnvLoadFile(makeCString(from: filePath)))

}

/// Saves the current Earth constants (GEO) model and fundamental catalogue (FK) model settings to a file.
/// - Parameters:
///   - envFilePath: The name of the file in which to save the settings.
///   - saveMode: Specifies whether to create a new file or append to an existing one. (0 = create, 1= append)
///   - saveForm: Specifies the mode in which to save the file. (0 = text format, 1 = xml (not yet implemented, reserved for future))
/// - Returns: zero indicating the GEO and FK settings have been successfully saved to the file. Other values indicate an error.
public func envSaveFile(_ envFilePath: String, _ saveMode: Int, _ saveForm: Int) -> Int {

    Int(EnvSaveFile(makeCString(from: envFilePath), Int32(saveMode), Int32(saveForm)))

}

/// Returns the name of the current Earth constants (GEO) model.
///
/// The geoStr parameter may contain one of the following values:
///
///     WGS-84
///     EGM-96
///     EGM-08
///     WGS-72
///     JGM2
///     SEM68R
///     GEM5
///     GEM9
/// - Returns: Returns the name of the current Earth constants (GEO) model.
public func envGetGeoStr() -> String {

    var geoString = Array(repeating: Int8(0), count: Int(10))
    EnvGetGeoStr(&geoString)
    geoString[9] = 0
    return String(cString: geoString).trimRight()

}

/// Changes the Earth constants (GEO) setting to the model specified
/// by a string literal.
///
/// If you specify an invalid value for geoStr, the program will continue
/// to use the current setting.
///
/// The GEO model is globally shared among the Standardized Astrodynamic
/// Algorithms DLLs. If its setting is changed, the new setting takes
/// effect immediately.
///
/// The following table lists possible values of the parameter value GEO setting:
///
/// geoStr (any string in the row)
///
///                        Interpretation
///
///     'WGS-84', 'WGS84', '84' -> WGS-84
///     'EGM-96', 'EGM96', '96' -> EGM-96
///     'EGM-08', 'EGM08', '8' -> EGM-08
///     'WGS-72', 'WGS72', '72' -> WGS-72 (default)
///     'JGM-2, 'JGM2', '2' -> JGM-2
///     'SEM68R', '68' -> STEM68R, SEM68R
///     'GEM5', '5' -> GEM5
///     'GEM9', '9' -> GEM9
///
/// The GEO model must be set to WGS-72 to use the SGP4 propagator.
/// - Parameter geoStr: The GEO model to use, expressed as a string.
public func envSetGeoStr(_ geoStr: String) { EnvSetGeoStr(makeCString(from: geoStr)) }

// ================================================ TIME ================================================

public func timeFuncLoadFile(_ filePath: String) -> Int {

    Int(TimeFuncLoadFile(makeCString(from: filePath)))

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

    Int(TConLoadFile(makeCString(from: filePath)))

}

/// Removes all the timing constants records in memory.
/// - Returns: 0 if all timing constants records are successfully removed from memory,
/// non-0 if there is an error.
public func tConRemoveAll() -> Int { Int(TConRemoveAll()) }

/// // Returns current prediction control parameters in form of a 6P-Card string.
// card6PLine          (out-Character[512])

/// - Parameter card6PLine: The resulting 6P-Card string.
public func get6PCardLine() -> String {

    var string512 = Array(repeating: Int8(0), count: Int(GETSETSTRLEN+1))
    Get6PCardLine(&string512)
    string512[Int(GETSETSTRLEN)] = 0
    return String(cString: string512).trimRight()

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
public func tConSaveFile(_ tleFile: String, _ saveMode:Int, _ xf_tleForm:Int) -> Int {

    Int(TConSaveFile(makeCString(from: tleFile), Int32(saveMode), Int32(xf_tleForm)))

}

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

    var infoString = Array(repeating: Int8(0), count: Int(GETSETSTRLEN+1))
    TimeFuncGetInfo(&infoString)
    infoString[Int(GETSETSTRLEN)] = 0
    return String(cString: infoString).trimRight()

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

    DTGToUTC(makeCString(from: DTG19))

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
public func yrDaysToUTC(_ year:Int, _ dayOfYear: Double) -> Double {

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
public func timeComps1ToUTC(_ year:Int, _ dayOfYear:Int,
                            _ hh:Int, _ mm:Int, _ sss: Double) -> Double {

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

public func timeComps2ToUTC(_ year:Int, _ month:Int, _ dayOfMonth:Int,
                            _ hh:Int, _ mm:Int, _ sss: Double) -> Double {
    
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

    var string24 = Array(repeating: Int8(0), count: Int(24))
    UTCToDTG20(ds50UTC, &string24)
    string24[23] = 0
    return String(cString: string24).trimRight()

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

    var string24 = Array(repeating: Int8(0), count: Int(24))
    UTCToDTG19(ds50UTC, &string24)
    string24[23] = 0
    return String(cString: string24).trimRight()

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

    loadAllDlls()                       // test run before libraries loaded (ouch!)

    var string24 = Array(repeating: Int8(0), count: Int(24))
    UTCToDTG17(ds50UTC, &string24)
    string24[23] = 0
    return String(cString: string24).trimRight()

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

    var string24 = Array(repeating: Int8(0), count: Int(24))
    UTCToDTG15(ds50UTC, &string24)
    string24[23] = 0
    return String(cString: string24).trimRight()

}

// ================================================ ASTRO ================================================

/// Initializes AstroFunc DLL for use in the program.
///
/// If this function returns an error, it is recommended that you stop the program immediately.
///
/// An error will occur if you forget to load and initialize all the prerequisite DLLs, as listed in
/// the DLL Prerequisites section of the accompanying documentation, before using this DLL.
/// - Parameter dllHandle: The handle that was returned from DllMainInit(). See the documentation for DllMain.dll for details.
/// - Returns: 0 if AstroFunc.dll is initialized successfully, non-0 if there is an error.
@available(*, deprecated, message: "This function has been deprecated since v9.0")
public func astroFuncInit(_ dllHandle: Int64) -> Int { Int(AstroFuncInit(dllHandle)) }

/// Retrieves information about the current version of AstroFunc.dll.
///
/// - Returns: A `String` of information about the DLL version number, build date, and platform.
public func astroFuncGetInfo() -> String {

    var infoString = Array(repeating: Int8(0), count: Int(GETSETSTRLEN+1))
    AstroFuncGetInfo(&infoString)
    infoString[Int(GETSETSTRLEN)] = 0
    return String(cString: infoString).trimRight()

}

public func isPointSunlit(_ ds50ET: Double, _ ptECI: UnsafeMutablePointer<Double> ) -> Bool {

    (IsPointSunlit(ds50ET, ptECI) != 0)

}

// ================================================ TLE ================================================

public func tleSetField(_ satKey: Int64, _ xf_Tle:Int) -> String? {

    var infoString = Array(repeating: Int8(0), count: Int(GETSETSTRLEN+1))
    guard 0 == TleSetField(satKey, Int32(xf_Tle), &infoString) else { return nil }

    infoString[Int(GETSETSTRLEN)] = 0
    return String(cString: infoString).trimRight()

}

/// Parses GP data from the input first and second lines of a two line element set or a
/// CSV tle and store that data back into the output parameters.
///
/// This function only parses data from the input TLE but DOES NOT load/add the input TLE to memory.
/// - Parameters:
///   - line1: The first line of the two line element set or a CSV tle
///   - line2: The second line of the two line element set or an empty string for a CVS tle
///   - xa_tle: Array containing TLE's numerical fields, see XA_TLE_? for array arrangement
/// - Returns: Output string that contains all TLE's text fields, see XS_TLE_? for column arrangement
public func tleLinesToArray(_ line1: String, _ line2: String, _ xa_tle: inout Double) -> String? {

    var returnString = Array(repeating: CChar(0), count: Int(GETSETSTRLEN+1))
    guard 0 == Int(TleLinesToArray(makeCString(from: line1), makeCString(from: line2), &xa_tle, &returnString)) else { return nil }
    returnString[Int(GETSETSTRLEN)] = 0
    return String(cString: returnString).trimRight()

}

/// Returns the CSV string representation of a TLE of a satellite.
/// - Parameters:
///   - satKey: The satellite's unique key.
///   - csvLine: A string to hold the TLE in csv format.
/// - Returns: 0 if successful, non-0 on error.
public func tleGetCsv(_ satKey: Int64, _ csvLine: inout String) -> Int {

    var _infoArray = Array(repeating: CChar(0), count: Int(GETSETSTRLEN)+1)
    let errorCode = Int(TleGetCsv(satKey, &_infoArray))
    _infoArray[Int(GETSETSTRLEN)] = 0
    csvLine = String(cString: _infoArray).trimRight()

    return errorCode

}

 /// Constructs a TLE from individually provided GP data fields.
/// - Parameters:
///   - satNum: Satellite number
///   - secClass: Security classification
///   - satName: Satellite international designator
///   - epochYr: Element epoch time - year,, [YY]YY
///   - epochDays: Element epoch time - day of year, DDD.DDDDDDDD
///   - nDotO2: N Dot/2 (rev/day /2)
///   - n2DotO6: N Double Dot/6 (rev/day**2 /6) or agom (ephType = 4, XP) (m2/kg)
///   - bstar: B* drag term (1/er) (ephType = 0, 2) or BTerm - ballistic coefficient (m2/kg) (ephType = 4, XP)
///   - ephType: Satellite ephemeris type (0: SGP, 2: SGP4)
///   - elsetNum: Element set number
///   - incli: Orbit inclination (degrees)
///   - node: Right ascension of ascending node (degrees)
///   - eccen: Eccentricity
///   - omega: Argument of perigee (degrees)
///   - mnAnomaly: Mean anomaly (degrees)
///   - mnMotion: Mean motion (rev/day) (ephType = 0: Kozai mean motion, ephType = 2 or 4: Brouwer mean motion)
///   - revNum: Revolution number at epoch
/// - Returns: A string to hold the TLE in csv format.
public func tleGPFieldsToCsv(_ satNum: Int, _ secClass: String, _ satName: String, _ epochYr: Int, _ epochDays: Double, _ nDotO2: Double, _ n2DotO6: Double, _ bstar: Double, _ ephType: Int, _ elsetNum: Int, _ incli: Double, _ node: Double, _ eccen: Double, _ omega: Double, _ mnAnomaly: Double, _ mnMotion: Double, _ revNum: Int) -> String {

    var returnString = Array(repeating: CChar(0), count: Int(GETSETSTRLEN)+1)

         TleGPFieldsToCsv(Int32(satNum), secClass.utf8CString[0], makeCString(from: satName),
                          Int32(epochYr), epochDays, nDotO2, n2DotO6, bstar, Int32(ephType),
                          Int32(elsetNum), incli, node, eccen, omega, mnMotion, mnMotion, Int32(revNum), &returnString)

    return String(cString: returnString).trimRight()

}

// Constructs a TLE from GP data stored in the input parameters.
// This function only parses data from the input data but DOES NOT load/add the TLE to memory.
// Returned line1 and line2 will be empty if the function fails to construct the lines as requested.
// xa_tle             Array containing TLE's numerical fields, see XA_TLE_? for array arrangement (in-Double[64])
// xs_tle             Input string that contains all TLE's text fields, see XS_TLE_? for column arrangement (in-Character[512])
// line1              Returned first line of a TLE (out-Character[512])
// line2              Returned second line of a TLE (out-Character[512])
public func tleGPArrayToLines(_ xa_tle: UnsafeMutablePointer<Double>, _ xs_tle: String, _ line1: inout String, _ line2: inout String) {

    var _line1 = Array(repeating: CChar(0), count: Int(INPUTCARDLEN)+1)          //[INPUTCARDLEN]
    var _line2 = Array(repeating: CChar(0), count: Int(INPUTCARDLEN)+1)          //[INPUTCARDLEN]

    TleGPArrayToLines(xa_tle, makeCString(from: xs_tle), &_line1, &_line2)

    _line1[Int(INPUTCARDLEN)] = 0
    _line2[Int(INPUTCARDLEN)] = 0

    line1 = String(cString: _line1).trimRight()
    line2 = String(cString: _line2).trimRight()

}

// Constructs a TLE from GP data stored in the input parameters.
// This function only parses data from the input data but DOES NOT load/add the TLE to memory.
// Returned line1 and line2 will be empty if the function fails to construct the lines as requested.
// xa_tle             Array containing TLE's numerical fields, see XA_TLE_? for array arrangement (in-Double[64])
// xs_tle             Input string that contains all TLE's text fields, see XS_TLE_? for column arrangement (in-Character[512])
// csvline            Returned csv format elements. (out-Character[512])
public func tleGPArrayToCsv(_ xa_tle: UnsafeMutablePointer<Double>, _ xs_tle: String) -> String? {

    var _csvString = Array(repeating: CChar(0), count: Int(INPUTCARDLEN)+1)
    TleGPArrayToCsv(xa_tle, makeCString(from: xs_tle), &_csvString)
    _csvString[Int(INPUTCARDLEN)] = 0
    return String(cString: _csvString)

}

// Constructs a TLE from individually provided SP data fields.
// Only applies to SP propagator.
// This function only parses data from the input fields but DOES NOT load/add the TLE to memory.
// Returned line1 and line2 will be empty if the function fails to construct the lines as requested.
// satNum             Satellite number (in-Integer)
// secClass           Security classification (in-Character)
// satName            Satellite international designator (in-Character[8])
// epochYr            Element epoch time - year, [YY]YY (in-Integer)
// epochDays          Element epoch time - day of year, DDD.DDDDDDDD (in-Double)
// bTerm              Ballistic coefficient (m^2/kg) (in-Double)
// ogParm             Outgassing parameter/Thrust Acceleration (km/s^2) (in-Double)
// agom               Agom (m^2/kg) (in-Double)
// elsetNum           Element set number (in-Integer)
// incli              Orbit inclination (degrees) (in-Double)
// node               Right ascension of ascending node (degrees) (in-Double)
// eccen              Eccentricity (in-Double)
// omega              Argument of perigee (degrees) (in-Double)
// mnAnomaly          Mean anomaly (degrees) (in-Double)
// mnMotion           Mean motion (rev/day) (in-Double)
// revNum             Revolution number at epoch (in-Integer)
// line1              Returned first line of a TLE. (out-Character[512])
// line2              Returned second line of a TLE. (out-Character[512])
public func tleSPFieldsToLines(_ satNum: Int32, _ secClass: String, _ satName: String, _ epochYr: Int32, _ epochDays: Double, _ bterm: Double, _ ogParm: Double, _ agom: Double, _ elsetNum: Int32, _ incli: Double, _ node: Double, _ eccen: Double, _ omega: Double, _ mnAnomaly: Double, _ mnMotion: Double, _ revNum: Int32, _ line1: inout String, _ line2: inout String) {

    var _line1 = Array(repeating: CChar(0), count: Int(INPUTCARDLEN)+1)          //[INPUTCARDLEN]
    var _line2 = Array(repeating: CChar(0), count: Int(INPUTCARDLEN)+1)          //[INPUTCARDLEN]

    TleSPFieldsToLines(satNum, secClass.utf8CString[0], makeCString(from: satName), epochYr, epochDays, bterm, ogParm, agom, elsetNum, incli, node, eccen, omega, mnAnomaly, mnMotion, revNum, &_line1, &_line2)

    _line1[Int(INPUTCARDLEN)] = 0
    _line2[Int(INPUTCARDLEN)] = 0

    line1 = String(cString: _line1).trimRight()
    line2 = String(cString: _line2).trimRight()

}

// Adds a TLE (satellite), using its data stored in the input parameters.
// xa_tle             Array containing TLE's numerical fields, see XA_TLE_? for array arrangement (in-Double[64])
// xs_tle             Input string that contains all TLE's text fields, see XS_TLE_? for column arrangement (in-Character[512])
// returns The satKey of the newly added TLE on success, a negative value on error.
public func tleAddSatFrArray(_ xa_tle: UnsafeMutablePointer<Double>, _ xs_tle: String) -> Int64 {

    TleAddSatFrArray(xa_tle, makeCString(from: xs_tle))

}

// Updates existing TLE data with the provided new data stored in the input parameters. Note: satNum, year, day, and ephtype can't be updated.
// nDotO2 and n2DotO6 values are not used in the SGP4 propagator. However, some users still want to preserve the integrity of all input data.
// satKey             The satellite's unique key (in-Long)
// xa_tle             Array containing TLE's numerical fields, see XA_TLE_? for array arrangement (in-Double[64])
// xs_tle             Input string that contains all TLE's text fields, see XS_TLE_? for column arrangement (in-Character[512])
// returns 0 if the TLE is successfully updated, non-0 if there is an error.
public func tleUpdateSatFrArray(_ satKey: Int64, _ xa_tle: UnsafeMutablePointer<Double>, _ xs_tle: String) -> Int {

    Int(TleUpdateSatFrArray(satKey, xa_tle, makeCString(from: xs_tle)))

}

// Retrieves TLE data and stored it in the passing parameters
//
// The following table lists the values for the XA_TLE array:
//
//
// name
// index
// index Interpretation
//
// XA_TLE_SATNUM          0Satellite number
// XA_TLE_EPOCH           1Satellite's epoch time in DS50UTC
// XA_TLE_NDOT            2GP Mean motion derivative (rev/day /2)
// XA_TLE_NDOTDOT         3GP Mean motion second derivative (rev/day**2 /6)
// XA_TLE_BSTAR           4GP B* drag term (1/er)
// XA_TLE_EPHTYPE         5Satellite ephemeris type: 0=SGP, 2=SGP4, 6=SP
// XA_TLE_OBJTYPE         6Object type; 0=unknown, 1=payload, 2=rocket body, 3=platform, 4=debris,
// 5=manned
// XA_TLE_EXTRPLTNTYPE    7Extrapolation theory used to generate element set: 0=no extrapolation DC
//
// XA_TLE_RCSBIN          8RCS size bin
// XA_TLE_INCLI          20Orbit inclination (deg)
// XA_TLE_NODE           21Right ascension of ascending node (deg)
// XA_TLE_ECCEN          22Eccentricity
// XA_TLE_OMEGA          23Argument of perigee (deg)
// XA_TLE_MNANOM         24Mean anomaly (deg)
// XA_TLE_MNMOTN         25Mean motion (rev/day) (ephType=0: Kozai, ephType=2: Brouwer)
// XA_TLE_REVNUM         26Revolution number at epoch
// XA_TLE_ELSETNUM       30Element set number
// XA_TLE_ERRGRWRATE     31Error growth rate km/day
// XA_TLE_LSTOBSTIME     32+/- time of last observation offset relative to epoch (+/- ddd.ddddd
// fractional days)
// XA_TLE_RADARXSECT     33Radar cross section (in meters squared, followed by character designating
// radar frequency type used)
// XA_TLE_VISMAG         34Median visual magnitude of object scaled to 36000km
// XA_TLE_DRAGCOEFF      35Drag coefficient
// XA_TLE_AGOMGP         38Radiation Pressure Coefficient GP
// XA_TLE_SP_BTERM        2SP ballistic coefficient (m2/kg)
// XA_TLE_SP_OGPARM       3SP outgassing parameter (km/s2)
// XA_TLE_SP_AGOM         4SP Radiation Pressure Coefficient
// XA_TLE_SIZE           64
//
//
// The following table lists the values for the XS_TLE array:
//
//
// name
// index
// index Interpretation
//
// XS_TLE_SECCLASS_1     0Security classification of line 1 and line 2
// XS_TLE_SATNAME_12     1Satellite name
// XS_TLE_SECCLASSL3_1  13Security classification of line 3
// XS_TLE_DISTMARKING_4 14Distribution marking
// XS_TLE_OBJSTAT_1     18Object status: 'A'=Active, 'D'=Dead, 'U'=Unknown
// XS_TLE_MSSNCODE_2    19Primary payload mission code
// XS_TLE_MSSNSTAT_1    21Primary mission status (table lookup)
// XS_TLE_MANEUV_1      22Maneuverability 'Y'=Yes, 'N'=No, 'U'=Unknown
// XS_TLE_OOCNTRY_4     23Payload Owner/Operator
// XS_TLE_FREQBAND_1    27Frequency Band of the RCS: U=UHF, C=C-Band, L=L-Band, S=S-Band, X=X-Band
//
// XS_TLE_TBLERATE_1    28Tumble rate
// XS_TLE_SIZE          512
//
// satKey             The satellite's unique key (in-Long)
// xa_tle             Array containing TLE's numerical fields, see XA_TLE_? for array arrangement (out-Double[64])
// xs_tle             Output string that contains all TLE's text fields, see XS_TLE_? for column arrangement (out-Character[512])
// returns 0 if all values are retrieved successfully, non-0 if there is an error
public func tleDataToArray(_ satKey: Int64, _ xa_tle: inout Double) -> String? {

    var _info = Array(repeating: CChar(0), count: Int(INPUTCARDLEN)+1)
    guard 0 == TleDataToArray(satKey, &xa_tle, &_info) else { return nil }
    _info[Int(INPUTCARDLEN)] = 0
    return String(cString: _info).trimRight()

}

// Converts TLE two line format to CSV format
// line1              The first line of a two line element set (in-Character[512])
// line2              The second line of a two line element set (in-Character[512])
// csvline            A string to hold the TLE in csv format. (out-Character[512])
// returns 0 if the conversion is successful, non-0 if there is an error.
public func tleLinesToCsv(_ line1: String, _ line2: String) -> String? {

    var _info = Array(repeating: CChar(0), count: Int(INPUTCARDLEN)+1)
    guard 0 == TleLinesToCsv(makeCString(from: line1), makeCString(from: line2), &_info) else { return nil }
    _info[Int(INPUTCARDLEN)] = 0
    return String(cString: _info).trimRight()

}

// Converts TLE CSV format to two line format
// csvLine            The input TLE in CSV format (in-Character[512])
// newSatno           New satellite number to replace what's in CSV obs if desired (won't use/renumber if it's zero) (in-Integer)
// line1              The output first line of the two line element set (out-Character[512])
// line2              The output second line of the two line element set (out-Character[512])
// returns 0 if the conversion is successful, non-0 if there is an error.
public func tleCsvToLines(_ csvLine: String, _ newSatno: Int32, _ line1: inout String, _ line2: inout String) -> Int {

    var _line1 = Array(repeating: CChar(0), count: Int(INPUTCARDLEN)+1)          //[INPUTCARDLEN]
    var _line2 = Array(repeating: CChar(0), count: Int(INPUTCARDLEN)+1)          //[INPUTCARDLEN]

    let errorCode = Int(TleCsvToLines(makeCString(from: csvLine), newSatno, &_line1, &_line2))

    _line1[Int(INPUTCARDLEN)] = 0
    _line2[Int(INPUTCARDLEN)] = 0

    line1 = String(cString: _line1).trimRight()
    line2 = String(cString: _line2).trimRight()

    return errorCode

}

/// Initializes Tle DLL for use in the program. If this function returns an error, it is recommended that you stop the program immediately.
///
/// - Parameter dllHandle: The handle that was returned from DllMainInit
/// - Returns: 0 if Tle.dll is initialized successfully, non-0 if there is an error.
@available(*, deprecated, message: "This function has been deprecated since v9.0")
public func tleInit(_ dllHandle: Int64) -> Int { Int(TleInit(dllHandle)) }

/// Returns the information about the Tle DLL.
///
/// - Returns: A `String` of information about the DLL version number, build date, and platform.
public func tleGetInfo() -> String {

    var infoString = Array(repeating: Int8(0), count: Int(GETSETSTRLEN+1))
    TleGetInfo(&infoString)
    infoString[Int(GETSETSTRLEN)] = 0
    return String(cString: infoString).trimRight()

}

public func tleAddSatFrLines (_ line1: String, _ line2: String) -> Int64 {

    TleAddSatFrLines(makeCString(from: line1), makeCString(from: line2))

}

public func tleAddSatFrCsv (_ csvLine: String) -> Int64 {

    TleAddSatFrCsv(makeCString(from: csvLine))

}

/// Loads TLEs (satellites) contained in a text file into the TLE DLL's binary tree.
///
/// You may use this function repeatedly to load TLEs from different input files.
/// However, only unique satKeys are loaded. Duplicated TLEs won't be stored.
///
/// TLEs can be included directly in the specified file, or they can be read from a
/// separate file identified with "ELTFIL=[path/filename]" or "VECFIL=[path/filename]".
///
/// The input file is read in two passes. The function first looks for "ELTFIL=" and
/// "VECFIL=" lines, then it looks for TLEs which were included directly. The result
/// of this is that data entered using both methods will be processed, but the
/// "ELTFIL=" and "VECFIL=" data will be processed first.
///
/// - Parameter tleFileName: The name of the file containing two line element sets to be loaded.
/// - Returns: 0 if the two line element sets in the file are successfully loaded, non-0 if there is an error.
public func tleLoadFile(_ tleFileName: String) -> Int {

    Int(TleLoadFile(makeCString(from: tleFileName)))

}

/// Returns the number of TLEs currently loaded.
///
/// See `TleGetLoaded` for an example.
/// This function is useful for dynamically allocating memory for the array that is passed to the function `TleGetLoaded()`.
///
/// - Returns: The number of TLEs currently loaded.
public func tleGetCount() -> Int { Int(TleGetCount()) }

/// Saves currently loaded TLEs to a file.
///
/// The purpose of this function is to save the current
/// state of the loaded TLE's, usually used in GUI applications, for future use.
///
/// In append mode, if the specified file does not exist it will be created. If you call this
/// routine immediately after TleLoadFile(), the TLE contents in the two files should be the
/// same (minus duplicated TLE's or bad TLE's).
///
/// - Parameters:
///   - tleFile: The name of the file in which to save the TLE's.
///   - saveMode: Specifies whether to create a new file or append to an existing file. (0 = create new file, 1= append to existing file)
///   - xf_tleForm: Specifies the format in which to save the file. (0 = two-line element set format, 1 =  CSV, others = future implementation)
/// - Returns: 0 if the data is successfully saved to the file, non-0 if there is an error.
public func tleSaveFile(_ tleFile: String, _ saveMode:Int, _ xf_tleForm:Int) -> Int {

    Int(TleSaveFile(makeCString(from: tleFile), Int32(saveMode), Int32(xf_tleForm)))

}

/// Retrieves all of the currently loaded satKeys. These satKeys can be used to access the internal data for the TLE's.
///
/// It is recommended that `TleGetCount()` be  used to determine how many satellites are currently loaded.
/// This value can then be used to dynamically allocate an array to hold the satKeys.
///
/// If you are going to pass a statically allocated array to this function, ensure it is large enough to hold all of the
/// returned satKeys.
///
/// - Parameters:
///   - order: Specifies the order in which the satKeys should be returned.
///     - 0 = sort in ascending order of satKeys,
///     - 1 = sort in descending order of satKeys,
///     - 2 = sort in the order in which the satKeys were loaded in memory,
///     - 9 = Quickest: sort in the order in which the satKeys were stored in the tree
///   - satKeys: The array in which to store the satKeys.
public func tleGetLoaded(_ order:Int, _ satKeys: UnsafeMutablePointer<Int64> ) {

    TleGetLoaded(Int32(order), satKeys)

}

///Returns the first and second lines representation of a TLE of a satellite.
/// - Parameters:
///   - satKey: The satellite's unique key.
///   - line1: A string to hold the first line of the TLE
///   - line2: A string to hold the second line of the TLE
/// - Returns: 0 if successful, non-0 on error.
public func tleGetLines(_ satKey: Int64, _ line1: inout String, _ line2: inout String) -> Int {

    var _line1 = Array(repeating: CChar(0), count: Int(INPUTCARDLEN)+1)          //[INPUTCARDLEN]
    var _line2 = Array(repeating: CChar(0), count: Int(INPUTCARDLEN)+1)          //[INPUTCARDLEN]

    let errorCode = TleGetLines(satKey, &_line1, &_line2)

    _line1[Int(INPUTCARDLEN)] = 0
    _line2[Int(INPUTCARDLEN)] = 0

    line1 = String(cString: _line1).trimRight()
    line2 = String(cString: _line2).trimRight()

    return Int(errorCode)
}

/// Constructs a TLE from individually provided GP data fields.
///
/// This function only parses data from the input fields but DOES NOT load/add the TLE to memory.
///
/// - Parameters:
///   - satNum: Satellite number
///   - secClass: Security classification
///   - satName: Satellite international designator
///   - epochYr: Element epoch time - year,, [YY]YY
///   - epochDays: Element epoch time - day of year, DDD.DDDDDDDD
///   - nDotO2: N Dot/2 (rev/day /2)
///   - n2DotO6: N Double Dot/6 (rev/day**2 /6) or agom (ephType = 4, XP) (m2/kg)
///   - bstar: B* drag term (1/er) (ephType = 0, 2) or BTerm - ballistic coefficient (m2/kg) (ephType = 4, XP)
///   - ephType: Satellite ephemeris type (0: SGP, 2: SGP4)
///   - elsetNum: Element set number
///   - incli: Orbit inclination (degrees)
///   - node: Right ascension of ascending node (degrees)
///   - eccen: Eccentricity
///   - omega: Argument of perigee (degrees)
///   - mnAnomaly: Mean anomaly (degrees)
///   - mnMotion: Mean motion (rev/day) (ephType = 0: Kozai mean motion, ephType = 2 or 4: Brouwer mean motion)
///   - revNum: Revolution number at epoch
///   - line1: Returned first line of a TLE
///   - line2: Returned second line of a TLE
/// - Returns: line1 and line2 will be empty if the function fails to construct the lines as requested.
public func tleGPFieldsToLines(_ satNum:Int, _ secClass: String, _ satName: String, _ epochYr:Int,
                               _ epochDays: Double, _ nDotO2: Double, _ n2DotO6: Double, _ bstar: Double,
                               _ ephType:Int, _ elsetNum:Int, _ incli: Double, _ node: Double,
                               _ eccen: Double, _ omega: Double, _ mnAnomaly: Double, _ mnMotion: Double, _ revNum:Int,
                               _ line1: inout String, _ line2: inout String) {

    var _line1 = Array(repeating: CChar(0), count: Int(INPUTCARDLEN)+1)          //[INPUTCARDLEN]
    var _line2 = Array(repeating: CChar(0), count: Int(INPUTCARDLEN)+1)          //[INPUTCARDLEN]

    TleGPFieldsToLines(Int32(satNum), secClass.utf8CString[0], makeCString(from: satName), Int32(epochYr), epochDays, nDotO2, n2DotO6,
                       bstar, Int32(ephType), Int32(elsetNum), incli, node, eccen, omega, mnMotion, mnMotion, Int32(revNum), &_line1, &_line2)

    _line1[Int(INPUTCARDLEN)] = 0
    _line2[Int(INPUTCARDLEN)] = 0

    line1 = String(cString: _line1).trimRight()
    line2 = String(cString: _line2).trimRight()

}

/// // Adds a GP TLE using its individually provided field values.
/// The function will indicate an error if the specified two line element set corresponds to a satellite that is already in memory.
///
/// This function can be called repeatedly to add many satellites (one satellite at a time).
///
/// SGP satellites (ephType = 0) use Kozai mean motion. SGP4 satellites (ephType = 2) use Brouwer mean motion.
// returns The satKey of the newly added TLE on success, a negative value on error.

/// - Parameters:
///   - satNum: Satellite number
///   - secClass: Security classification
///   - satName: Satellite international designator
///   - epochYr: Element epoch time - year, [YY]YY
///   - epochDays: Element epoch time - day of year, DDD.DDDDDDDD
///   - bstar: B* drag term (1/er) (ephType = 0, 2) or BTerm - ballistic coefficient (m2/kg) (ephType = 4, XP)
///   - ephType: Satellite ephemeris type (0: SGP, 2: SGP4)
///   - elsetNum: Element set number
///   - incli: Orbit inclination (degrees)
///   - node: Right ascension of ascending node (degrees)
///   - eccen: Eccentricity
///   - omega: Argument of perigee (degrees)
///   - mnAnomaly: Mean anomaly (degrees)
///   - mnMotion: Mean motion (rev/day) (ephType = 0: Kozai mean motion, ephType = 2 or 4: Brouwer mean motion)
///   - revNum: Revolution number at epoch
/// - Returns: returns The satKey of the newly added TLE on success, a negative value on error.
public func tleAddSatFrFieldsGP(_ satNum:Int, _ secClass: String, _ satName: String,
                                _ epochYr:Int, _ epochDays: Double, _ bstar: Double,
                                _ ephType:Int, _ elsetNum:Int, _ incli: Double,
                                _ node: Double, _ eccen: Double, _ omega: Double,
                                _ mnAnomaly: Double, _ mnMotion: Double, _ revNum:Int) -> Int64 {

    TleAddSatFrFieldsGP(Int32(satNum), secClass.utf8CString[0], makeCString(from: satName),
                        Int32(epochYr), epochDays, bstar, Int32(ephType),
                        Int32(elsetNum), incli, node, eccen, omega, mnAnomaly, mnMotion, Int32(revNum))

}

public func tleAddSatFrFieldsGP2(_ satNum:Int, _ secClass: String, _ satName: String,
                                 _ epochYr:Int, _ epochDays: Double, _ bstar: Double,
                                 _ ephType:Int, _ elsetNum:Int, _ incli: Double,
                                 _ node: Double, _ eccen: Double, _ omega: Double,
                                 _ mnAnomaly: Double, _ mnMotion: Double, _ revNum:Int,
                                 _ nDotO2: Double, _ n2DotO6: Double) -> Int64 {

    TleAddSatFrFieldsGP2(Int32(satNum), secClass.utf8CString[0], makeCString(from: satName),
                         Int32(epochYr), epochDays, bstar, Int32(ephType),
                         Int32(elsetNum), incli, node, eccen, omega, mnAnomaly, mnMotion, Int32(revNum),
                         nDotO2, n2DotO6)

}

public func tleAddSatFrFieldsSP(_ satNum:Int, _ secClass: String, _ satName: String,
                                _ epochYr:Int, _ epochDays: Double, _ bterm: Double,
                                _ ogParm: Double, _ agom: Double,
                                _ elsetNum:Int, _ incli: Double,
                                _ node: Double, _ eccen: Double, _ omega: Double,
                                _ mnAnomaly: Double, _ mnMotion: Double, _ revNum:Int) -> Int64 {

    TleAddSatFrFieldsSP(Int32(satNum), secClass.utf8CString[0], makeCString(from: satName),
                        Int32(epochYr), epochDays, bterm, ogParm, agom,
                        Int32(elsetNum), incli, node, eccen, omega, mnAnomaly, mnMotion, Int32(revNum))

}

public func tleUpdateSatFrFieldsGP(_ satKey: Int64, _ secClass: String, _ satName: String,
                                   _ bstar: Double, _ elsetNum:Int, _ incli: Double,
                                   _ node: Double, _ eccen: Double, _ omega: Double,
                                   _ mnAnomaly: Double, _ mnMotion: Double, _ revNum:Int) -> Int {

    Int(TleUpdateSatFrFieldsGP(satKey, secClass.utf8CString[0], makeCString(from: satName),
                               bstar,
                               Int32(elsetNum), incli, node, eccen, omega, mnAnomaly, mnMotion, Int32(revNum)))

}

public func tleUpdateSatFrFieldsGP2(_ satKey: Int64, _ secClass: String, _ satName: String,
                                    _ bstar: Double, _ elsetNum:Int, _ incli: Double,
                                    _ node: Double, _ eccen: Double, _ omega: Double,
                                    _ mnAnomaly: Double, _ mnMotion: Double, _ revNum:Int,
                                    _ nDotO2: Double, _ n2DotO6: Double) -> Int {

    Int(TleUpdateSatFrFieldsGP2(satKey, secClass.utf8CString[0], makeCString(from: satName),
                                bstar,
                                Int32(elsetNum), incli, node, eccen, omega, mnAnomaly, mnMotion, Int32(revNum),
                                nDotO2, n2DotO6))
}

public func tleUpdateSatFrFieldsSP(_ satKey: Int64, _ secClass: String, _ satName: String,
                                   _ bterm: Double, _ ogParm: Double,
                                   _ agom: Double, _ elsetNum:Int, _ incli: Double,
                                   _ node: Double, _ eccen: Double, _ omega: Double,
                                   _ mnAnomaly: Double, _ mnMotion: Double, _ revNum:Int) -> Int {

    Int(TleUpdateSatFrFieldsSP(satKey, secClass.utf8CString[0], makeCString(from: satName),
                               bterm, ogParm, agom,
                               Int32(elsetNum), incli, node, eccen, omega, mnAnomaly, mnMotion, Int32(revNum)))

}

/// Retrieves all of the data for a GP satellite in a single function call.
///
/// This function only works for GP satellites. The field values are
/// placed in the corresponding parameters of the function.
/// - Parameters:
///   - satKey: The satellite's unique key <-
///   - satNum: Satellite number
///   - secClass: Security classification
///   - satName: Satellite international designator
///   - epochYr: Element epoch time - year, [YY]YY
///   - epochDays: Element epoch time - day of year, DDD.DDDDDDDD
///   - bstar: B* drag term (1/er) (ephType = 0, 2) or BTerm - ballistic coefficient (m2/kg) (ephType = 4, XP)
///   - ephType: Satellite ephemeris type (0: SGP, 2: SGP4, 6: SP)
///   - elsetNum: Element set number
///   - incli: Orbit inclination (degrees)
///   - node: Right ascension of ascending node (degrees)
///   - eccen: Eccentricity
///   - omega: Argument of perigee (degrees)
///   - mnAnomaly: Mean anomaly (degrees)
///   - mnMotion: Mean motion (rev/day) (ephType = 0: Kozai mean motion, ephType = 2 or 4: Brouwer mean motion)
///   - revNum: Revolution number at epoch
/// - Returns: 0 if all values are retrieved successfully, non-0 if there is an error.
public func  tleGetAllFieldsGP(_ satKey: Int64,
                               _ satNum: inout Int32, _ secClass: inout String, _ satName: inout String,
                               _ epochYr: inout Int32, _ epochDays: inout Double,
                               _ bStar: inout Double, _ ephType: inout Int32,
                               _ elsetNum: inout Int32, _ incli: inout Double,
                               _ node: inout Double, _ eccen: inout Double,
                               _ omega: inout Double, _ mnAnomaly: inout Double,
                               _ mnMotion: inout Double, _ revNum: inout Int32) -> Int {

    var _secClass = CChar(0)

    var _satName = Array(repeating: CChar(0), count: 10)                // satName is 8 characters

    let errorCode = TleGetAllFieldsGP(satKey, &satNum, &_secClass, &_satName,
                                      &epochYr, &epochDays, &bStar, &ephType,
                                      &elsetNum, &incli, &node, &eccen, &omega, &mnAnomaly, &mnMotion, &revNum)

    secClass = String(_secClass)

    _satName[9] = 0
    satName = String(cString: _satName).trimRight()

    return Int(errorCode)

}

/// Retrieves all of the data (including nDotO2 and n2DotO6) for a GP satellite in a single function call.
///
/// This function is similar to TleGetAllFieldsGP but also includes nDotO2 and n2DotO6.
/// This function only works for GP satellites. The field values are placed in the corresponding parameters of the function.
/// - Parameters:
///   - satKey: The satellite's unique key <-
///   - satNum: Satellite number
///   - secClass: Security classification
///   - satName: Satellite international designator
///   - epochYr: Element epoch time - year, [YY]YY
///   - epochDays: Element epoch time - day of year, DDD.DDDDDDDD
///   - bstar: B* drag term (1/er) (ephType = 0, 2) or BTerm - ballistic coefficient (m2/kg) (ephType = 4, XP)
///   - ephType: Satellite ephemeris type (0: SGP, 2: SGP4, 6: SP)
///   - elsetNum: Element set number
///   - incli: Orbit inclination (degrees)
///   - node: Right ascension of ascending node (degrees)
///   - eccen: Eccentricity
///   - omega: Argument of perigee (degrees)
///   - mnAnomaly: Mean anomaly (degrees)
///   - mnMotion: Mean motion (rev/day) (ephType = 0: Kozai mean motion, ephType = 2 or 4: Brouwer mean motion)
///   - revNum: Revolution number at epoch
///   - nDotO2: Mean motion derivative (rev/day /2)
///   - n2DotO6: Mean motion second derivative (rev/day**2 /6) or agom (ephType = 4, XP) (m2/kg)
/// - Returns: 0 if all values are retrieved successfully, non-0 if there is an error.
public func tleGetAllFieldsGP2(_ satKey: Int64,
                               _ satNum: inout Int32, _ secClass: inout String, _ satName: inout String,
                               _ epochYr: inout Int32, _ epochDays: inout Double,
                               _ bstar: inout Double, _ ephType: inout Int32,
                               _ elsetNum: inout Int32, _ incli: inout Double,
                               _ node: inout Double, _ eccen: inout Double,
                               _ omega: inout Double, _ mnAnomaly: inout Double,
                               _ mnMotion: inout Double, _ revNum: inout Int32,
                               _ nDotO2: inout Double, _ n2DotO6: inout Double) -> Int {

    var _secClass = CChar(0)
    var _satName = Array(repeating: CChar(0), count: 10)                // satName is 8 characters

    let errorCode = TleGetAllFieldsGP2(satKey, &satNum, &_secClass, &_satName,
                                       &epochYr, &epochDays, &bstar, &ephType,
                                       &elsetNum, &incli, &node, &eccen, &omega, &mnAnomaly, &mnMotion, &revNum, &nDotO2, &n2DotO6)

    secClass = String(_secClass)
    _satName[9] = 0
    satName = String(cString: _satName).trimRight()

    return Int(errorCode)

}

/// Retrieves all of the data for an SP satellite in a single function call.
///
/// This function only works for SP satellites. The field values are
/// placed in the corresponding parameters of the function.
///   - satKey: The satellite's unique key <-
///   - satNum: Satellite number
///   - secClass: Security classification
///   - satName: Satellite international designator
///   - epochYr: Element epoch time - year, [YY]YY
///   - epochDays: Element epoch time - day of year, DDD.DDDDDDDD
///   - bTerm: Ballistic coefficient (m^2/kg)
///   - ogParm: Outgassing parameter/Thrust Acceleration (km/s^2)
///   - agom: Agom (m^2/kg)
///   - elsetNum: Element set number
///   - incli: Orbit inclination (degrees)
///   - node: Right ascension of ascending node (degrees)
///   - eccen: Eccentricity
///   - omega: Argument of perigee (degrees)
///   - mnAnomaly: Mean anomaly (degrees)
///   - mnMotion: Mean motion (rev/day) (ephType = 0: Kozai mean motion, ephType = 2 or 4: Brouwer mean motion)
///   - revNum: Revolution number at epoch
/// - Returns: 0 if all values are retrieved successfully, non-0 if there is an error.
public func  tleGetAllFieldsSP(_ satKey: Int64,
                               _ satNum: inout Int32, _ secClass: inout String, _ satName: inout String,
                               _ epochYr: inout Int32, _ epochDays: inout Double,
                               _ bterm: inout Double, _ ogParm: inout Double, _ agom: inout Double,
                               _ elsetNum: inout Int32, _ incli: inout Double,
                               _ node: inout Double, _ eccen: inout Double,
                               _ omega: inout Double, _ mnAnomaly: inout Double,
                               _ mnMotion: inout Double, _ revNum: inout Int32) -> Int {

    var _secClass = CChar(0)
    var _satName = Array(repeating: CChar(0), count: 10)                // satName is 8 characters

    let errorCode = TleGetAllFieldsSP(satKey, &satNum, &_secClass, &_satName,
                                      &epochYr, &epochDays, &bterm, &ogParm, &agom,
                                      &elsetNum, &incli, &node, &eccen, &omega, &mnAnomaly, &mnMotion, &revNum)

    secClass = String(_secClass)
    _satName[9] = 0
    satName = String(cString: _satName).trimRight()

    return Int(errorCode)

}


/// Parses GP data from the input first and second lines of a two line element set or a CSV Tle.
/// This function only parses data from the input TLE but DOES NOT load/add the input TLE to memory.
///   - line1: The first line of the two line element set or a CSV tle
///   - line2: The second line of the two line element set or an empty string for a CVS tle
///   - satNum: Satellite number
///   - secClass: Security classification
///   - satName: Satellite international designator
///   - epochYr: Element epoch time - year, [YY]YY
///   - epochDays: Element epoch time - day of year, DDD.DDDDDDDD
///   - nDotO2: n-dot/2 (for SGP, ephType = 0)
///   - n2DotO6: n-double-dot/6 (for SGP, ephType = 0) or agom (ephType = 4, XP) (m2/kg)
///   - bstar: B* drag term (1/er) (ephType = 0, 2) or BTerm - ballistic coefficient (m2/kg) (ephType = 4, XP)
///   - ephType: Satellite ephemeris type (0: SGP, 2: SGP4, 6: SP)
///   - elsetNum: Element set number
///   - incli: Orbit inclination (degrees)
///   - node: Right ascension of ascending node (degrees)
///   - eccen: Eccentricity
///   - omega: Argument of perigee (degrees)
///   - mnAnomaly: Mean anomaly (degrees)
///   - mnMotion: Mean motion (rev/day) (ephType = 0: Kozai mean motion, ephType = 2 or 4: Brouwer mean motion)
///   - revNum: Revolution number at epoch
/// - Returns: 0 if the TLE is parsed successfully, non-0 if there is an error.
public func tleParseGP(_ line1: String, _ line2: String,
                       _ satNum: inout Int32, _ secClass: inout String, _ satName: inout String,
                       _ epochYr: inout Int32, _ epochDays: inout Double,
                       _ nDotO2: inout Double, _ n2DotO6: inout Double,
                       _ bstar: inout Double, _ ephType: inout Int32,
                       _ elsetNum: inout Int32, _ incli: inout Double,
                       _ node: inout Double, _ eccen: inout Double,
                       _ omega: inout Double, _ mnAnomaly: inout Double,
                       _ mnMotion: inout Double, _ revNum: inout Int32) -> Int {

    var _secClass = CChar(0)
    var _satName = Array(repeating: CChar(0), count: 10)                // satName is 8 characters

    let errorCode = TleParseGP(makeCString(from: line1), makeCString(from: line2), &satNum, &_secClass, &_satName,
                               &epochYr, &epochDays, &nDotO2, &n2DotO6, &bstar, &ephType,
                               &elsetNum, &incli, &node, &eccen, &omega, &mnAnomaly, &mnMotion, &revNum)

    secClass = String(_secClass)
    _satName[9] = 0
    satName = String(cString: _satName).trimRight()

    return Int(errorCode)

}

/// Parses SP data from the input first and second lines of a two line element set.
///
/// Only applies to SP propagator. This function only parses data from the input
/// TLE but DOES NOT load/add the input TLE to memory.
///   - line1: The first line of the two line element set
///   - line2: The second line of the two line element set
///   - satNum: Satellite number
///   - secClass: Security classification
///   - satName: Satellite international designator
///   - epochYr: Element epoch time - year, [YY]YY
///   - epochDays: Element epoch time - day of year, DDD.DDDDDDDD
///   - bTerm: Ballistic coefficient (m^2/kg)
///   - ogParm: Outgassing parameter/Thrust Acceleration (km/s^2)
///   - agom: Agom (m^2/kg)
///   - elsetNum: Element set number
///   - incli: Orbit inclination (degrees)
///   - node: Right ascension of ascending node (degrees)
///   - eccen: Eccentricity
///   - omega: Argument of perigee (degrees)
///   - mnAnomaly: Mean anomaly (degrees)
///   - mnMotion: Mean motion (rev/day) (ephType = 0: Kozai mean motion, ephType = 2 or 4: Brouwer mean motion)
///   - revNum: Revolution number at epoch
/// - Returns: 0 if the TLE is parsed successfully, non-0 if there is an error.
public func tleParseSP(_ line1: String, _ line2: String,
                       _ satNum: inout Int32, _ secClass: inout String, _ satName: inout String,
                       _ epochYr: inout Int32, _ epochDays: inout Double,
                       _ bterm: inout Double, _ ogParm: inout Double, _ agom: inout Double,
                       _ elsetNum: inout Int32, _ incli: inout Double,
                       _ node: inout Double, _ eccen: inout Double,
                       _ omega: inout Double, _ mnAnomaly: inout Double,
                       _ mnMotion: inout Double, _ revNum: inout Int32) -> Int {

    var _secClass = CChar(0)
    var _satName = Array(repeating: CChar(0), count: 10)                // satName is 8 characters

    let errorCode = TleParseSP(makeCString(from: line1), makeCString(from: line2), &satNum, &_secClass, &_satName,
                               &epochYr, &epochDays, &bterm, &ogParm, &agom,
                               &elsetNum, &incli, &node, &eccen, &omega, &mnAnomaly, &mnMotion, &revNum)

    secClass = String(_secClass)
    _satName[9] = 0
    satName = String(cString: _satName).trimRight()

    return Int(errorCode)

}

public func tleRemoveSat(_ satKey: Int64) -> Int { Int(TleRemoveSat(satKey)) }

/// Retrieves the value of a specific field of a TLE.
///
/// The table below indicates which index values correspond to which fields. Make sure to use the
/// appropriate field index for GP TLEs and SP TLEs.  For indexes 5, 15 and 16, the interpretation
/// depends on the ephemeris type of the TLE.
///
///  | index | index Interpretation |
///  |  ---  |  ---  |
///  |   1  |  Satellite number  |
///  |   2  |  Security classification  |
///  |   3  |  Satellite international designator  |
///  |   4  |  Epoch  |
///  |   5  |  Ephemeris type: 0,2→B* drag term (1/er); 6→SP radiation pressure coefficient agom (m2/kg)  |
///  |   6  |  Ephemeris type  |
///  |   7  |  Element set number  |
///  |   8  |  Orbit inclination (degrees)  |
///  |   9  |  Right ascension of ascending node (degrees)  |
///  |   10  |  Eccentricity  |
///  |   11  |  Argument of perigee (degrees)  |
///  |   12  |  Mean anomaly (degrees)  |
///  |   13  |  Mean motion (rev/day)  |
///  |   14  |  Revolution number at epoch  |
///  |   15  |  Ephemeris type: 0→SGP mean motion derivative (rev/day÷2); 6→SP ballistic coefficient (m2/kg)   |
///  |   16  |  Ephemeris type: 0→SGP mean motion second derivative (rev/day²÷6); 6→SP Outgassing parameter/Thrust Acceleration (km/s2)  |
/// - Parameters:
///   - satKey: The satellite's unique key.
///   - xf_Tle: Predefined number specifying which field to retrieve.
/// - Returns: A string to contain the value of the requested field (null if failure).
public func tleGetField(_ satKey: Int64, _ xf_Tle: Int32) -> String? {

    var valueStr = Array(repeating: CChar(0), count: Int(GETSETSTRLEN)+1)
    guard 0  == TleGetField(satKey, xf_Tle, &valueStr) else { return nil }

    valueStr[Int(GETSETSTRLEN)] = 0
    return String(cString: valueStr).trimRight()

}

// ================================================ SGP4 ================================================

/// Initializes the Sgp4 DLL for use in the program.
///
/// If this function returns an error, it is recommended that you stop the program immediately.
///
/// An error will occur if you forget to load and initialize all the prerequisite DLLs,
/// as listed in the DLL Prerequisites section of the accompanying documentation,
/// before using this DLL.
/// - Parameter dllHandle: The handle that was returned from `DllMainInit()`
/// - Returns: 0 if Sgp4Prop.dll is initialized successfully, non-0 if there is an error.
@available(*, deprecated, message: "This function has been deprecated since v9.0")
public func sgp4Init(_ dllHandle: Int64) -> Int { Int(Sgp4Init(dllHandle)) }

/// Returns information about the current version of Sgp4Prop.dll.
/// 
/// - Returns: A `String` of information about the DLL version number, build date, and platform.
public func sgp4GetInfo() -> String {

    var infoString = Array(repeating: Int8(0), count: Int(GETSETSTRLEN+1))
    Sgp4GetInfo(&infoString)
    infoString[Int(GETSETSTRLEN)] = 0
    return String(cString: infoString).trimRight()

}

/// Note: The only requirement now is that "SGP4_Open_License.txt" file needs to
/// be in those folders specified in PATH/LD_LIBRARY_PATH environment or AstroStds DLLs/SOs'
/// - Returns: The file path to the Sgp4 Open License file
@available(*, deprecated, message: "This function has been deprecated since v8.2")
public func Sgp4GetLicFilePath() -> String {

    var licFilePath = Array(repeating: Int8(0), count: Int(GETSETSTRLEN+1))
    Sgp4GetLicFilePath(&licFilePath)
    licFilePath[Int(GETSETSTRLEN)] = 0
    return String(cString: licFilePath).trimRight()

}

/// Note: The only requirement now is that "SGP4_Open_License.txt" file needs to be
/// in those folders specified in PATH/LD_LIBRARY_PATH environment or AstroStds DLLs/SOs'
/// - Parameter licFilePath: The file path to the Sgp4 Open License file
@available(*, deprecated, message: "This function has been deprecated since v8.2")
public func sgp4SetLicFilePath(_ licFilePath: String) {

    Sgp4SetLicFilePath(makeCString(from: licFilePath))

}

/// Initializes an SGP4 satellite from an SGP or SGP4 TLE.
///
/// Internally, when this function is called, Tle.dll's set of TLEs is searched for the
/// provided satKey. If found, the associated TLE data will be used to create an
/// SGP4 satellite which then will be added to `Sgp4Prop.dll`'s set of satellites.
/// Subsequent calls to propagate this satellite will use the data in this set to compute
/// the satellite's new state.
///
/// This routine should be called once for each satellite you wish to propagate
/// before propagation begins, or any time the associated data that is stored
/// by `Tle.dll` is changed.
///
/// The call to this routine needs to be placed before any calls to the SGP4
/// propagator routines (`Sgp4PropMse()`, `Sgp4PropDs50UTC()`, etc.).
///
/// - Parameter satKey: The satellite's unique key.
/// This key will have been returned by one of the routines in Tle.dll.
/// - Returns: 0 if the satellite is successfully initialized and added to
/// Sgp4Prop.dll's set of satellites, non-0 if there is an error.
public func sgp4InitSat(_ satKey: Int64) -> Int { Int(Sgp4InitSat(satKey)) }

/// Removing a satellite from the propagator's set of satellites does not affect the
/// corresponding TLE data loaded by calls to routines in Tle.dll.
/// - Parameter satKey: The satellite's unique key.
/// - Returns: 0 if the satellite is removed successfully, non-0 if there is an error
public func sgp4RemoveSat(_ satKey: Int64) -> Int { Int(Sgp4RemoveSat(satKey)) }

/// Removes all currently loaded satellites from memory.
///
/// Calling this function removes all satellites from the set maintained by
/// Sgp4Prop.dll. However, the TLE data loaded by Tle.dll is unaffected by this function.
/// - Returns: 0 if all satellites are removed successfully from memory, non-0 if there is an error.
public func sgp4RemoveAllSats() -> Int { Int(Sgp4RemoveAllSats()) }

/// Propagates a satellite, represented by the satKey,
/// to the time expressed in minutes since the satellite's epoch time.
///
/// The resulting data about the satellite is placed in the various reference parameters.
///
/// It is the users' responsibility to decide what to do with the returned value.
/// For example, if the users want to check for decay or low altitude, they can
/// put that logic into their own code.
///
/// This function can be called in random time requests.
///
/// The following cases will result in an error:
///
/// * Semi major axis A 1.0D6
/// * Eccentricity E >= 1.0 or E
/// * Mean anomaly MA>=1.0D10
/// * Hyperbolic orbit E2>= 1.0
/// * satKey doesn't exist in the set of loaded satellites
/// * GEO model not set to WGS-72 and/or FK model not set to FK5
/// - Parameters:
///   - satKey: The satellite's unique key.
///   - ds50UTC: The time to propagate to, expressed in days since 1950, UTC.
///   - mse: Resulting time in minutes since the satellite's epoch time. (out-Double)
///   - pos: Resulting ECI position vector (km) in True Equator and Mean Equinox of Epoch.
///   - vel: Resulting ECI velocity vector (km/s) in True Equator and Mean Equinox of Epoch.
///   - llh: Resulting geodetic latitude (deg), longitude(deg), and height (km).
/// - Returns: 0 if the propagation is successful, non-0 if there is an error (see error decoder in GP_ERR_?).
public func sgp4PropMse(_ satKey: Int64, _ mse: Double, _ ds50UTC: UnsafeMutablePointer<Double>,
                        _ pos: UnsafeMutablePointer<Double>, _ vel: UnsafeMutablePointer<Double>,
                        _ llh: UnsafeMutablePointer<Double>) -> Int {

    Int(Sgp4PropMse(satKey, mse, ds50UTC, pos, vel, llh))
}

/// Propagates a satellite, represented by the satKey, to the time expressed in days since 1950, UTC.
/// The resulting data about the satellite is placed in the `pos` (position), `vel` (velocity),
/// and `llh` (Lat/Lon/Height) parameters.
///
/// The following cases will result in an error:
///
/// * Semi major axis A 1.0D6
/// * Eccentricity E >= 1.0 or E
/// * Mean anomaly MA>=1.0D10
/// * Hyperbolic orbit E2>= 1.0
/// * satKey doesn't exist in the set of loaded satellites
/// * GEO model not set to WGS-72 and/or FK model not set to FK5
///
/// - Parameters:
///   - satkey: The unique key of the satellite to propagate.
///   - time: The time to propagate to, expressed in days since 1950, UTC.
///   - minutesSinceEpoch: Resulting time in minutes since the satellite's
///   epoch time. (out-Double)
///   - pos: Resulting ECI position vector (km) in True Equator and Mean Equinox of Epoch.
///   - vel: Resulting ECI velocity vector (km/s) in True Equator and Mean Equinox of Epoch.
///   - llh: Resulting geodetic latitude (deg), longitude(deg), and height (km).
/// - Returns: returns 0 if the propagation is successful, non-0 if there is an error (see error decoder in GP_ERR_?).
public func sgp4PropDs50UTC(_ satKey: Int64, _ ds50UTC: Double, _ mse: UnsafeMutablePointer<Double>,
                            _ pos: UnsafeMutablePointer<Double>, _ vel: UnsafeMutablePointer<Double>,
                            _ llh: UnsafeMutablePointer<Double>) -> Int {

    Int(Sgp4PropDs50UTC(satKey, ds50UTC, mse, pos, vel, llh))

}

/// Propagates a satellite, represented by the satKey, to the time expressed in days since 1950, UTC.
///
/// Only the geodetic information is returned by this function.
/// It is the users' responsibility to decide what to do with the returned value.
/// For example, if the users want to check for decay or low altitude,
/// they can put that logic into their own code.
///
/// This function is similar to Sgp4PropDs50UTC but returns only LLH.
/// This function is designed especially for applications which plot ground traces.
///
/// The following cases will result in an error:
///
/// * Semi major axis A 1.0D6
/// * Eccentricity E >= 1.0 or E
/// * Mean anomaly MA>=1.0D10
/// * Hyperbolic orbit E2>= 1.0
/// * satKey doesn't exist in the set of loaded satellites
/// * GEO model not set to WGS-72 and/or FK model not set to FK5
///
/// - Parameters:
///   - satKey: The unique key of the satellite to propagate.
///   - ds50UTC: The time to propagate to, expressed in days since 1950, UTC.
///   - llh: Resulting geodetic latitude (deg), longitude(deg), and height (km).
/// - Returns: 0 if the propagation is successful, non-0 if there is an error (see error decoder in GP_ERR_?).
public func sgp4PropDs50UtcLLH(_ satKey: Int64,
                               _ ds50UTC: Double,
                               _ llh: UnsafeMutablePointer<Double>) -> Int { Int(Sgp4PropDs50UtcLLH(satKey, ds50UTC, llh)) }

/// Propagates a satellite, represented by the satKey, to the time expressed in days since 1950, UTC.
/// Only the ECI position vector is returned by this function. It is the users' responsibility to decide what
/// to do with the returned value. For example, if the users want to check for decay or low altitude, they
/// can put that logic into their own code.
///
/// This function is similar to Sgp4PropDs50UTC but returns only ECI position vector.  This function is
/// designed especially for applications which plot satellite position in 3D. The following cases will result in an error:
///
/// - Semi major axis A 1.0D6
/// - Eccentricity E >= 1.0 or E
/// - Mean anomaly MA>=1.0D10
/// - Hyperbolic orbit E2>= 1.0
/// - satKey doesn't exist in the set of loaded satellites
/// - GEO model not set to WGS-72 and/or FK model not set to FK5
///
/// - Parameters:
///   - satKey: The unique key of the satellite to propagate.
///   - ds50UTC: The time to propagate to, expressed in days since 1950, UTC.
///   - pos: Resulting ECI position vector (km) in True Equator and Mean Equinox of Epoch.
/// - Returns: 0 if the propagation is successful, non-0 if there is an error (see error decoder in GP_ERR_?).
public func sgp4PropDs50UtcPos(_ satKey: Int64,
                               _ ds50UTC: Double,
                               _ pos: UnsafeMutablePointer<Double>) -> Int { Int(Sgp4PropDs50UtcPos(satKey, ds50UTC, pos)) }

/// Retrieves propagator's precomputed results. This function can be used to obtain results from a
/// propagation which are not made available through calls to the propagation functions themselves.
///
/// See example in Sgp4PropMse or Sgp4PropDs50UTC.
///
/// This function should be called immediately after a successful call to `Sgp4PropMse()` or
/// `Sgp4PropDs50UTC()` to retrieve the desired values.
///
/// It is the caller's responsibility to ensure that the array passed in the destArray parameter is
/// large enough to hold the requested values. The required size can be found by looking at the
/// destArray size column of the table below describing valid index values.
///
/// The destArray Arrangement column lists the order of the elements in the array. It is not
/// necessarily the subscript of the element in the array since this is language-dependent.
/// For example, in C/C++ the first element in every array is the zero-subscripted element.
/// In other programming languages, the subscript of the first element is 1.
///
/// Note: This function is not thread safe, please use `Sgp4PropAll()` instead
///
/// The table below shows the values for the `xf_Sgp4Out` parameter:
///
/// | Index | Index Interpretation | DestArray size | DestArray Arrangement|
/// | :----: | :----: | :----: | :----: |
/// |1| Revolution number | 1 | Revolution number (based on the Osculating Keplerian Elements)|
/// |2| Nodal Apogee Perigee | 3 | nodal period (minutes)apogee (km)perigee (km)|
/// |3| Mean Keplerian Elements | 6 | semi-major axis (km), eccentricity (unitless), inclination (degree), mean anomaly (degree), right ascension of the ascending node(degree), argument of perigee (degree)|
/// |4| Osculating Keplerian Elements | 6 | Same as Mean Keplerian Elements|
/// - Parameters:
///   - satKey: The unique key of the satellite for which to retrieve results.
///   - xf_SgpOut: Specifies which propagator outputs to retrieve.
///   - destArr: Array to receive the resulting propagator outputs.
/// - Returns: 0 if the requested information is retrieved successfully, non-0 if there is an error
public func sgp4GetPropOut(_ satKey: Int64, _ xf_SgpOut:Int, _ destArr: UnsafeMutablePointer<Double>)  -> Int {

    Int(Sgp4GetPropOut(satKey, Int32(xf_SgpOut), destArr))

}

/// Reepochs a loaded TLE, represented by the satKey, to a new epoch.
///
/// - Parameters:
///   - satKey: The unique key of the satellite to reepoch.
///   - newEpoch: The new epoch, express in days since 1950, UTC.
///   - line1: A string to hold the first line of the reepoched TLE.
///   - line2: A string to hold the second line of the reepoched TLE.
/// - Returns: 0 if the reepoch is successful, non-0 if there is an error.
public func sgp4ReepochTLE(_ satKey: Int64, _ newEpoch: Double, _ line1: inout String, _ line2: inout String) -> Int {

    var _line1 = nullCharacterArray(size: INPUTCARDLEN)                             //[INPUTCARDLEN = 512]
    var _line2 = nullCharacterArray(size: INPUTCARDLEN)                             //[INPUTCARDLEN]

    let errorCode = Sgp4ReepochTLE(satKey, newEpoch, &_line1, &_line2)

    line1 = characterArrayToString(_line1, size: INPUTCARDLEN)
    line2 = characterArrayToString(_line2, size: INPUTCARDLEN)

//    _line1[Int(INPUTCARDLEN)] = 0
//    _line2[Int(INPUTCARDLEN)] = 0
//
//    line1 = String(cString: _line1).trimRight()
//    line2 = String(cString: _line2).trimRight()

    return Int(errorCode)
}

/// Reepochs a loaded TLE, represented by the satKey, to a new epoch in Csv format.
/// - Parameters:
///   - satKey: The unique key of the satellite to reepoch.
///   - reepochDs50UTC: A string to hold the reepoched CSV.
/// - Returns: A string to hold the reepoched CSV.
public func sgp4ReepochCsv(_ satKey: Int64, _ reepochDs50UTC: Double) -> String? {

    var _csvLine = Array(repeating: CChar(0), count: Int(INPUTCARDLEN)+1)
    guard 0 == Sgp4ReepochCsv(satKey, reepochDs50UTC, &_csvLine) else { return nil }

    _csvLine[Int(INPUTCARDLEN)] = 0
    return String(cString: _csvLine).trimRight()

}
