//
//  Drivers.swift
//
//
//  Created by Gavin Eadie on 12/4/22.
//

import Foundation

//MARK: MAIN

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

    var infoString = emptyCcharArray(size: INFOSTRLEN)
    DllMainGetInfo(&infoString)
    return String(fromCcharArray: infoString, size: INFOSTRLEN)

}

/// Returns a list of names of the Standardized Astrodynamic Algorithms dynamic
/// libraries that were initialized successfully.
/// - Returns: A string with the names of the dynamic libraries that were initialized
/// successfully. (out-Character[512])
@available(*, deprecated, message: "This function has been deprecated since v9.0")
public func getInitDllNames() -> String {

    var getNamesString = emptyCcharArray(size: GETSETSTRLEN)
    GetInitDllNames(&getNamesString)
    return String(fromCcharArray: getNamesString, size: GETSETSTRLEN)

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

    var messageString = emptyCcharArray(size: LOGMSGLEN)
    GetLastErrMsg(&messageString)
    return String(fromCcharArray: messageString, size: LOGMSGLEN)

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

    var messageString = emptyCcharArray(size: LOGMSGLEN)
    GetLastInfoMsg(&messageString)
    return String(fromCcharArray: messageString, size: LOGMSGLEN)

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

    Int(OpenLogFile(filePath.cString))

}

/// Writes a message into the log file.
///
/// Make sure the log file is open by calling OpenLogFile before using this function.
///
/// - Parameter message: A message to be written into the log file, limited to 128 characters.
/// If the message is longer than this, it will be truncated.
public func logMessage(_ message: String) {

    LogMessage(message.cString)

}

/// Closes the currently open log file and reset the last logged error message to null.
///
/// Remember to close the log file before exiting the program.
public func closeLogFile() { CloseLogFile() }

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

    Int(DllMainLoadFile(filePath.cString))

}

//MARK: ASTRO

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

    var infoString = emptyCcharArray(size: GETSETSTRLEN)
    AstroFuncGetInfo(&infoString)
    return String(fromCcharArray: infoString, size: GETSETSTRLEN)

}

/// Determines if a point in space is sunlit at the input time ds50ET
/// - Parameters:
///   - ds50ET: The number of days since 1950, ET
///   - ptECI: a position in ECI (km)
/// - Returns: `false` if the specified point isn't sunlit, `true` if the specified point is sunlit
public func isPointSunlit(_ ds50ET: Double, _ ptECI: UnsafeMutablePointer<Double> ) -> Bool {

    IsPointSunlit(ds50ET, ptECI) == 1

}

//MARK: ENV

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

    var infoString = emptyCcharArray(size: GETSETSTRLEN)
    EnvGetInfo(&infoString)
    return String(fromCcharArray: infoString, size: GETSETSTRLEN)

}

/// Reads Earth constants (GEO) model and fundamental catalogue (FK) model settings from a file.
///
/// The users can use NAME=VALUE pair to setup the GEO and FK models in the input file.
///
/// For GEO model, the valid names are `GEOCONST`, `BCONST` and the valid values are
/// `WGS-72`, `WGS72`, `72`, `WGS-84`, `WGS84`, `84`, `EGM-96`, `EGM96`, `96`,
/// `EGM-08`, `EGM08`, `08`, `JGM-2`, `JGM2`, `2`, `SEM68R`, `68`, `GEM5`, `5`, `GEM9`, and `9`.
///
/// For FK model, the valid name is `FKCONST` and the valid values are: `FK4`, `4`, `FK5`, `5`.
///
/// All the string literals are case-insensitive.
/// - Parameters:
///   - filePath: The name of the input file.
/// - Returns: zero indicating the input file has been loaded successfully. Other values indicate an error.
public func envLoadFile(_ filePath: String) -> Int {

    Int(EnvLoadFile(filePath.cString))

}

/// Saves the current Earth constants (GEO) model and fundamental catalogue (FK) model settings to a file.
/// - Parameters:
///   - envFilePath: The name of the file in which to save the settings.
///   - saveMode: Specifies whether to create a new file or append to an existing one. (0 = create, 1= append)
///   - saveForm: Specifies the mode in which to save the file. (0 = text format, 1 = xml (not yet implemented, reserved for future))
/// - Returns: zero indicating the GEO and FK settings have been successfully saved to the file. Other values indicate an error.
public func envSaveFile(_ envFilePath: String, _ saveMode: Int, _ saveForm: Int) -> Int {

    Int(EnvSaveFile(envFilePath.cString, Int32(saveMode), Int32(saveForm)))

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

    var geoString = emptyCcharArray(size: 16)
    EnvGetGeoStr(&geoString)
    return String(fromCcharArray: geoString, size: 16)

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
public func envSetGeoStr(_ geoStr: String) { EnvSetGeoStr(geoStr.cString) }

//MARK: TIME

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

//MARK: TLE

public typealias SatNum = Int
public typealias SatKey = Int64

public struct satElements {
    var time: Double                // The number of days since 1950
    var incli: Double               // degrees
    var node: Double                // degrees
    var eccen: Double
    var omega: Double               // degrees
    var mnAnomaly: Double           // degrees
    var mnMotion: Double
}

public func tleGetSatKey(_ satNum: Int) -> Int64 {

    TleGetSatKey(Int32(satNum))

}

//TODO: when there's time .. this pair of UTILITY functions is NOT rigorous

/// Splits the output from `tleLinesToArray`
/// - Parameter text: a string of output from `tleLinesToArray`
/// - Returns: a dictionary with the keys `XS_TLE_SECCLASS` and `XS_TLE_SATNAME` and values from the input string
/// The following table lists the offsets of the individual strings in the XS_TLE string:
///
///  |  name  |  length | index |  index interpretation  |
///  |  ----  | ---- |  :----: | ---- |
///  |  XS_TLE_SECCLASS | 1     |  0 | Security classification of line 1 and line 2  |
///  |  XS_TLE_SATNAME | 12     |  1 | Satellite name  |
///  |  XS_TLE_SECCLASSL3 | 1   | 13 | Security classification of line 3  |
///  |  XS_TLE_DISTMARKING | 4  | 14 | Distribution marking  |
///  |  XS_TLE_OBJSTAT | 1      | 18 | Object status: 'A'=Active, 'D'=Dead, 'U'=Unknown  |
///  |  XS_TLE_MSSNCODE | 2     | 19 | Primary payload mission code  |
///  |  XS_TLE_MSSNSTAT | 1     | 21 | Primary mission status (table lookup)  |
///  |  XS_TLE_MANEUV | 1       | 22 | Maneuverability 'Y'=Yes, 'N'=No, 'U'=Unknown  |
///  |  XS_TLE_OOCNTRY | 4      | 23 | Payload Owner/Operator  |
///  |  XS_TLE_FREQBAND | 1     | 27 | Frequency Band of the RCS: U=UHF, C=C-Band, L=L-Band, S=S-Band, X=X-Band  |
///  |  XS_TLE_TBLERATE | 1     | 28 | Tumble rate  |
///  |  XS_TLE_SIZE          | 512 |  | |
public func xsTleDecode(_ text: String) -> [String:String] {
    assert(!text.isEmpty, "xsTleDecode: empty input")

    var result: [String:String] = [:]
    result["XS_TLE_SECCLASS"] = String(text.prefix(1))
    result["XS_TLE_SATNAME"] = String(text.dropFirst())

    return result
}

public func xsTleEncode(_ dict: [String:String]) -> String {
    precondition(!dict.isEmpty)

    return "\(dict["XS_TLE_SECCLASS"]!)\(dict["XS_TLE_SATNAME"]!)"
}

/// Initializes Tle DLL for use in the program. If this function returns an error,
/// it is recommended that you stop the program immediately.
///
/// - Parameter dllHandle: The handle that was returned from DllMainInit
/// - Returns: 0 if Tle.dll is initialized successfully, non-0 if there is an error.
@available(*, deprecated, message: "This function has been deprecated since v9.0")
public func tleInit(_ dllHandle: Int64) -> Int { Int(TleInit(dllHandle)) }

/// Returns the information about the Tle DLL.
///
/// - Returns: A `String` of information about the DLL version number, build date, and platform.
public func tleGetInfo() -> String {

    var infoString = emptyCcharArray(size: GETSETSTRLEN)
    TleGetInfo(&infoString)
    return String(fromCcharArray: infoString, size: GETSETSTRLEN)

}

/// Parses GP data from the input first and second lines of a two line element set or a
/// CSV tle and store that data back into the output parameters.
///
/// This function only parses data from the input TLE but DOES NOT load/add the
/// input TLE to memory. The following table lists the offsets of the individual
/// strings in the XS_TLE string:
///
///  |  name  |  index |  index interpretation  |
///  |  ----  |  :----: | ---- |
///  |  XS_TLE_SECCLASS_1     |  0 | Security classification of line 1 and line 2  |
///  |  XS_TLE_SATNAME_12     |  1 | Satellite name  |
///  |  XS_TLE_SECCLASSL3_1   | 13 | Security classification of line 3  |
///  |  XS_TLE_DISTMARKING_4  | 14 | Distribution marking  |
///  |  XS_TLE_OBJSTAT_1      | 18 | Object status: 'A'=Active, 'D'=Dead, 'U'=Unknown  |
///  |  XS_TLE_MSSNCODE_2     | 19 | Primary payload mission code  |
///  |  XS_TLE_MSSNSTAT_1     | 21 | Primary mission status (table lookup)  |
///  |  XS_TLE_MANEUV_1       | 22 | Maneuverability 'Y'=Yes, 'N'=No, 'U'=Unknown  |
///  |  XS_TLE_OOCNTRY_4      | 23 | Payload Owner/Operator  |
///  |  XS_TLE_FREQBAND_1     | 27 | Frequency Band of the RCS: U=UHF, C=C-Band, L=L-Band, S=S-Band, X=X-Band  |
///  |  XS_TLE_TBLERATE_1     | 28 | Tumble rate  |
///  |  XS_TLE_SIZE           | 512 |  |
/// - Parameters:
///   - line1: The first line of the two line element set or a CSV tle
///   - line2: The second line of the two line element set or an empty string for a CVS tle
///   - xa_tle: Array containing TLE's numerical fields, see XA_TLE_? for array arrangement
/// - Returns: Output string of all the TLE's text fields, with column arrangement as in above table
public func tleLinesToArray(_ line1: String, _ line2: String, _ xa_tle: UnsafeMutablePointer<Double>) -> String? {

    var infoString = emptyCcharArray(size: GETSETSTRLEN)
    guard 0 == Int(TleLinesToArray(line1.cString, line2.cString,
                                   xa_tle, &infoString)) else { return nil }
    return String(fromCcharArray: infoString, size: GETSETSTRLEN)

}

/// Returns the CSV string representation of a TLE of a satellite.
/// - Parameters:
///   - satKey: The satellite's unique key.
/// - Returns: A string to hold the TLE in csv format..
public func tleGetCsv(_ satKey: SatKey) -> String? {

    var infoArray = emptyCcharArray(size: GETSETSTRLEN)
    guard 0 == Int(TleGetCsv(satKey, &infoArray)) else { return nil }
    return String(fromCcharArray: infoArray, size: GETSETSTRLEN)

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
public func tleGPFieldsToCsv(_ satNum: SatNum, _ secClass: String, _ satName: String,
                             _ epochYr: Int, _ epochDays: Double,
                             _ nDotO2: Double, _ n2DotO6: Double, _ bstar: Double, _ ephType: Int,
                             _ elsetNum: Int, _ incli: Double, _ node: Double, _ eccen: Double,
                             _ omega: Double, _ mnAnomaly: Double, _ mnMotion: Double, _ revNum: Int) -> String {

    var returnString = emptyCcharArray(size: GETSETSTRLEN)

         TleGPFieldsToCsv(Int32(satNum), secClass.utf8CString[0], satName.cString,
                          Int32(epochYr), epochDays, nDotO2, n2DotO6, bstar, Int32(ephType),
                          Int32(elsetNum), incli, node, eccen, omega, mnMotion, mnMotion, Int32(revNum), &returnString)

    return String(fromCcharArray: returnString, size: GETSETSTRLEN)

}

/// Constructs a TLE from GP data stored in the input parameters.
/// - Parameters:
///   - xa_tle: Inout array containing TLE's numerical fields, see XA_TLE_? for array arrangement
///   - xs_tle: Input string that contains all TLE's text fields, see XS_TLE_? for column arrangement
///   - line1: Returned first line of a TLE
///   - line2: Returned second line of a TLE
public func tleGPArrayToLines(_ xa_tle: UnsafeMutablePointer<Double>, _ xs_tle: String,
                              _ line1: inout String, _ line2: inout String) {

    var _line1 = emptyCcharArray(size: INPUTCARDLEN)
    var _line2 = emptyCcharArray(size: INPUTCARDLEN)

    TleGPArrayToLines(xa_tle, xs_tle.cString, &_line1, &_line2)

    line1 = String(fromCcharArray: _line1, size: INPUTCARDLEN)
    line2 = String(fromCcharArray: _line2, size: INPUTCARDLEN)

}

/// Constructs a TLE from individually provided SP data fields. Only applies to SP propagator.
///
/// This function only parses data from the input fields but DOES NOT load/add the TLE to
/// memory. Returned line1 and line2 will be empty if the function fails to construct the
/// lines as requested.
///   - satNum: Satellite number
///   - secClass: Security classification
///   - satName: Satellite international designator
///   - epochYr: Element epoch time - year,, [YY]YY
///   - epochDays: Element epoch time - day of year, DDD.DDDDDDDD
///   - bTerm: Ballistic coefficient (m^2/kg) (in-Double)
///   - ogParm: Outgassing parameter/Thrust Acceleration (km/s^2) (in-Double)
///   - agom: Agom (m^2/kg) (in-Double)
///   - elsetNum: Element set number
///   - incli: Orbit inclination (degrees)
///   - node: Right ascension of ascending node (degrees)
///   - eccen: Eccentricity
///   - omega: Argument of perigee (degrees)
///   - mnAnomaly: Mean anomaly (degrees)
///   - mnMotion: Mean motion (rev/day) (ephType = 0: Kozai mean motion, ephType = 2 or 4: Brouwer mean motion)
///   - revNum: Revolution number at epoch
///   - line1: Returned first line of a TLE. (out-Character[512])
///   - line2: Returned second line of a TLE. (out-Character[512])
public func tleSPFieldsToLines(_ satNum: SatNum, _ secClass: String, _ satName: String,
                               _ epochYr: Int32, _ epochDays: Double,
                               _ bterm: Double, _ ogParm: Double, _ agom: Double,
                               _ elsetNum: Int32, _ incli: Double, _ node: Double, _ eccen: Double,
                               _ omega: Double, _ mnAnomaly: Double, _ mnMotion: Double, _ revNum: Int32,
                               _ line1: inout String, _ line2: inout String) {

    var _line1 = emptyCcharArray(size: INPUTCARDLEN)
    var _line2 = emptyCcharArray(size: INPUTCARDLEN)

    TleSPFieldsToLines(Int32(satNum), secClass.utf8CString[0], satName.cString,
                       epochYr, epochDays, bterm, ogParm, agom,
                       elsetNum, incli, node, eccen, omega, mnAnomaly, mnMotion, revNum, &_line1, &_line2)

    line1 = String(fromCcharArray: _line1, size: INPUTCARDLEN)
    line2 = String(fromCcharArray: _line2, size: INPUTCARDLEN)

}

// Constructs a TLE from GP data stored in the input parameters.
// This function only parses data from the input data but DOES NOT load/add the TLE to memory.
// Returned line1 and line2 will be empty if the function fails to construct the lines as requested.
// xa_tle             Array containing TLE's numerical fields, see XA_TLE_? for array arrangement
// xs_tle             Input string that contains all TLE's text fields, see XS_TLE_? for column arrangement
// csvline            Returned csv format elements.
public func tleGPArrayToCsv(_ xa_tle: UnsafeMutablePointer<Double>, _ xs_tle: String) -> String? {

    var csvString = emptyCcharArray(size: INPUTCARDLEN)
    TleGPArrayToCsv(xa_tle, xs_tle.cString, &csvString)
    return String(fromCcharArray: csvString, size: INPUTCARDLEN)

}

/// Adds a TLE (satellite), using its data stored in the input parameters.
/// - Parameters:
///   - xa_tle: Array containing TLE's numerical fields, see XA_TLE_? for array arrangement
///   - xs_tle: Input string that contains all TLE's text fields, see XS_TLE_? for column arrangement
/// - Returns: The satKey of the newly added TLE on success, a negative value on error.
public func tleAddSatFrArray(_ xa_tle: UnsafeMutablePointer<Double>, _ xs_tle: String) -> SatKey {

    TleAddSatFrArray(xa_tle, xs_tle.cString)

}

/// Updates existing TLE data with the provided new data stored in the input parameters.
/// Note: satNum, year, day, and ephtype can't be updated.
///
/// nDotO2 and n2DotO6 values are not used in the SGP4 propagator.
/// However, some users still want to preserve the integrity of all input data.
///
/// - Parameters:
///   - satKey: The satellite's unique key
///   - xa_tle: Array containing TLE's numerical fields, see XA_TLE_? for array arrangement
///   - xs_tle: Input string that contains all TLE's text fields, see XS_TLE_? for column arrangement
/// - Returns: 0 if the TLE is successfully updated, non-0 if there is an error
public func tleUpdateSatFrArray(_ satKey: SatKey, _ xa_tle: UnsafeMutablePointer<Double>, _ xs_tle: String) -> Int {

    Int(TleUpdateSatFrArray(satKey, xa_tle, xs_tle.cString))

}

/// Retrieves TLE data and stored it in the passing parameters
///
/// The following table lists the values for the XS_TLE array:
///
/// | name  |  index  |  index Interpretation  |
/// | :----: | :----: | :----: |
/// | XS_TLE_SECCLASS_1    |  0 | Security classification of line 1 and line 2  |
/// | XS_TLE_SATNAME_12    |  1 | Satellite name  |
/// | XS_TLE_SECCLASSL3_1  | 13 | Security classification of line 3  |
/// | XS_TLE_DISTMARKING_4 | 14 | Distribution marking  |
/// | XS_TLE_OBJSTAT_1     | 18 | Object status: 'A'=Active, 'D'=Dead, 'U'=Unknown  |
/// | XS_TLE_MSSNCODE_2    | 19 | Primary payload mission code  |
/// | XS_TLE_MSSNSTAT_1    | 21 | Primary mission status (table lookup)  |
/// | XS_TLE_MANEUV_1      | 22 | Maneuverability 'Y'=Yes, 'N'=No, 'U'=Unknown  |
/// | XS_TLE_OOCNTRY_4     | 23 | Payload Owner/Operator  |
/// | XS_TLE_FREQBAND_1    | 27 | Frequency Band of the RCS: U=UHF, C=C-Band, L=L-Band, S=S-Band, X=X-Band  |
/// | XS_TLE_TBLERATE_1    | 28 | Tumble rate  |
/// | XS_TLE_SIZE          | 512 |  |
///

///
/// The following table lists the values for the XA_TLE array:
///
/// | name  |  index  |  index Interpretation  |
/// | :----: | :----: | :----: |
/// | XA_TLE_SATNUM     |     0 | Satellite number  |
/// | XA_TLE_EPOCH      |     1 | Satellite's epoch time in DS50UTC  |
/// | XA_TLE_NDOT       |     2 | GP Mean motion derivative (rev/day /2)  |
/// | XA_TLE_NDOTDOT    |     3 | GP Mean motion second derivative (rev/day²/6)  |
/// | XA_TLE_BSTAR      |     4 | GP B* drag term (1/er)  |
/// | XA_TLE_EPHTYPE    |     5 | Satellite ephemeris type: 0=SGP, 2=SGP4, 6=SP  |
/// | XA_TLE_OBJTYPE    |     6 | Object type; 0=unknown, 1=payload, 2=rocket body, 3=platform, 4=debris, 5=manned  |
/// | XA_TLE_EXTRPLTNTYPE |   7 | Extrapolation theory used to generate element set: 0=no extrapolation DC  |
/// | XA_TLE_RCSBIN    |      8 | RCS size bin  |
/// | XA_TLE_INCLI     |     20 | Orbit inclination (deg)  |
/// | XA_TLE_NODE      |     21 | Right ascension of ascending node (deg)  |
/// | XA_TLE_ECCEN     |     22 | Eccentricity  |
/// | XA_TLE_OMEGA     |     23 | Argument of perigee (deg)  |
/// | XA_TLE_MNANOM    |     24 | Mean anomaly (deg)  |
/// | XA_TLE_MNMOTN    |     25 | Mean motion (rev/day) (ephType=0: Kozai, ephType=2: Brouwer)  |
/// | XA_TLE_REVNUM    |     26 | Revolution number at epoch  |
/// | XA_TLE_ELSETNUM  |     30 | Element set number  |
/// | XA_TLE_ERRGRWRATE |    31 | Error growth rate km/day  |
/// | XA_TLE_LSTOBSTIME |    32 | +/- time of last observation offset relative to epoch (+/- ddd.ddddd fractional days)  |
/// | XA_TLE_RADARXSECT |    33 | Radar cross section (in meters squared, followed by character designating radar frequency type used)  |
/// | XA_TLE_VISMAG    |     34 | Median visual magnitude of object scaled to 36000km  |
/// | XA_TLE_DRAGCOEFF |     35 | Drag coefficient  |
/// | XA_TLE_AGOMGP    |     38 | Radiation Pressure Coefficient GP  |
/// | XA_TLE_SP_BTERM  |     2 | SP ballistic coefficient (m2/kg)  |
/// | XA_TLE_SP_OGPARM |     3 | SP outgassing parameter (km/s2)  |
/// | XA_TLE_SP_AGOM   |     4 | SP Radiation Pressure Coefficient  |
/// | XA_TLE_SIZE      |     64 |  |

public enum XA_KEYS: Int {
    case xa_TLE_SATNUM = 0
    case xa_TLE_EPOCH
    case xa_TLE_NDOT
    case xa_TLE_NDOTDOT
    case xa_TLE_BSTAR
    case xa_TLE_EPHTYPE
    case xa_TLE_OBJTYPE
    case xa_TLE_EXTRPLTNTYPE
    case xa_TLE_RCSBIN
    case xa_TLE_INCLI = 20
    case xa_TLE_NODE
    case xa_TLE_ECCEN
    case xa_TLE_OMEGA
    case xa_TLE_MNANOM
    case xa_TLE_MNMOTN
    case xa_TLE_REVNUM
    case xa_TLE_ELSETNUM = 30
    case xa_TLE_ERRGRWRATE
    case xa_TLE_LSTOBSTIME
    case xa_TLE_RADARXSECT
    case xa_TLE_VISMAG
    case xa_TLE_DRAGCOEFF
    case xa_TLE_AGOMGP
    case xa_TLE_SP_BTERM
    case xa_TLE_SP_OGPARM
    case xa_TLE_SP_AGOM
    case xa_TLE_SIZE
}

///
/// - Parameters:
///   - satKey: The satellite's unique key
///   - xa_tle: Input array containing TLE's numerical fields, see XA_TLE_? for array arrangement
/// - Returns: Output string that contains all TLE's text fields, see XS_TLE_? for column arrangement
public func tleDataToArray(_ satKey: SatKey, _ xa_tle: inout Double) -> String? {

    var info = emptyCcharArray(size: INPUTCARDLEN)
    guard 0 == TleDataToArray(satKey, &xa_tle, &info) else { return nil }
    return String(fromCcharArray: info, size: INPUTCARDLEN)

}

/// Converts TLE two line format to CSV format
/// - Parameters:
///   - line1: The first line of a two line element set
///   - line2: The second line of a two line element set
/// - Returns: A string to hold the TLE in csv format
public func tleLinesToCsv(_ line1: String, _ line2: String) -> String? {

    var info = emptyCcharArray(size: INPUTCARDLEN)
    guard 0 == TleLinesToCsv(line1.cString, line2.cString, &info) else { return nil }
    return String(fromCcharArray: info, size: INPUTCARDLEN)

}

// Converts TLE CSV format to two line format
// csvLine            The input TLE in CSV format (in-Character[512])
// newSatno           New satellite number to replace what's in CSV obs if desired (won't use/renumber if it's zero) (in-Integer)
// line1              The output first line of the two line element set (out-Character[512])
// line2              The output second line of the two line element set (out-Character[512])
// returns 0 if the conversion is successful, non-0 if there is an error.
public func tleCsvToLines(_ csvLine: String, _ newSatno: Int32,
                          _ line1: inout String, _ line2: inout String) -> Int {

    var _line1 = emptyCcharArray(size: INPUTCARDLEN)                             //[INPUTCARDLEN = 512]
    var _line2 = emptyCcharArray(size: INPUTCARDLEN)                             //[INPUTCARDLEN]

    let errorCode = Int(TleCsvToLines(csvLine.cString, newSatno, &_line1, &_line2))

    line1 = String(fromCcharArray: _line1, size: INPUTCARDLEN)
    line2 = String(fromCcharArray: _line2, size: INPUTCARDLEN)

    return errorCode

}

public func tleAddSatFrLines (_ line1: String, _ line2: String) -> SatKey {

    TleAddSatFrLines(line1.cString, line2.cString)

}

public func tleAddSatFrCsv (_ csvLine: String) -> SatKey {

    TleAddSatFrCsv(csvLine.cString)

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

    Int(TleLoadFile(tleFileName.cString))

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
public func tleSaveFile(_ tleFile: String, _ saveMode: Int, _ xf_tleForm: Int) -> Int {

    Int(TleSaveFile(tleFile.cString, Int32(saveMode), Int32(xf_tleForm)))

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
///     - 9 = Quickest: sort in the order in which the satKeys were stored in the tree [default]
/// - Returns: an optional array of satKeys (nil if none).
public func tleGetLoaded(_ order: Int = 9) -> [SatKey]? {

    let satKeyCount = tleGetCount()
    if satKeyCount == 0 { return nil }
    var satKeyArray = Array(repeating: SatKey(), count: satKeyCount)
    TleGetLoaded(Int32(order), &satKeyArray)
    return satKeyArray

}

///Returns the first and second lines representation of a TLE of a satellite.
/// - Parameters:
///   - satKey: The satellite's unique key.
///   - line1: A string to hold the first line of the TLE
///   - line2: A string to hold the second line of the TLE
/// - Returns: 0 if successful, non-0 on error.
public func tleGetLines(_ satKey: SatKey, _ line1: inout String, _ line2: inout String) -> Int {

    var _line1 = emptyCcharArray(size: INPUTCARDLEN)                             //[INPUTCARDLEN = 512]
    var _line2 = emptyCcharArray(size: INPUTCARDLEN)                             //[INPUTCARDLEN]

    let errorCode = TleGetLines(satKey, &_line1, &_line2)

    line1 = String(fromCcharArray: _line1, size: INPUTCARDLEN)
    line2 = String(fromCcharArray: _line2, size: INPUTCARDLEN)

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
///   - line2: Returned second line of a TLE (`line1` and `line2` will be empty if the function fails to construct the lines as requested).
public func tleGPFieldsToLines(_ satNum: SatNum, _ secClass: String, _ satName: String, _ epochYr: Int,
                               _ epochDays: Double, _ nDotO2: Double, _ n2DotO6: Double, _ bstar: Double,
                               _ ephType: Int, _ elsetNum: Int, _ incli: Double, _ node: Double,
                               _ eccen: Double, _ omega: Double, _ mnAnomaly: Double, _ mnMotion: Double, _ revNum: Int,
                               _ line1: inout String, _ line2: inout String) {


    var _line1 = emptyCcharArray(size: INPUTCARDLEN)                             //[INPUTCARDLEN = 512]
    var _line2 = emptyCcharArray(size: INPUTCARDLEN)                             //[INPUTCARDLEN]

    TleGPFieldsToLines(Int32(satNum), secClass.utf8CString[0], satName.cString,
                       Int32(epochYr), epochDays, nDotO2, n2DotO6, bstar, Int32(ephType),
                       Int32(elsetNum), incli, node, eccen, omega, mnAnomaly, mnMotion, Int32(revNum),
                       &_line1, &_line2)

    line1 = String(fromCcharArray: _line1, size: INPUTCARDLEN)
    line2 = String(fromCcharArray: _line2, size: INPUTCARDLEN)

}

/// Adds a GP TLE using its individually provided field values.
/// The function will indicate an error if the specified two line element set corresponds
/// to a satellite that is already in memory.
///
/// This function can be called repeatedly to add many satellites (one satellite at a time).
///
/// SGP satellites (ephType = 0) use Kozai mean motion. SGP4 satellites (ephType = 2) use Brouwer mean motion.
/// returns The satKey of the newly added TLE on success, a negative value on error.

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
public func tleAddSatFrFieldsGP(_ satNum: SatNum, _ secClass: String, _ satName: String,
                                _ epochYr: Int, _ epochDays: Double, _ bstar: Double,
                                _ ephType: Int, _ elsetNum: Int, _ incli: Double,
                                _ node: Double, _ eccen: Double, _ omega: Double,
                                _ mnAnomaly: Double, _ mnMotion: Double, _ revNum: Int) -> SatKey {

    TleAddSatFrFieldsGP(Int32(satNum), secClass.utf8CString[0], satName.cString,
                        Int32(epochYr), epochDays, bstar, Int32(ephType),
                        Int32(elsetNum), incli, node, eccen, omega, mnAnomaly, mnMotion, Int32(revNum))

}

public func tleAddSatFrFieldsGP2(_ satNum: SatNum, _ secClass: String, _ satName: String,
                                 _ epochYr: Int, _ epochDays: Double, _ bstar: Double,
                                 _ ephType: Int, _ elsetNum: Int, _ incli: Double,
                                 _ node: Double, _ eccen: Double, _ omega: Double,
                                 _ mnAnomaly: Double, _ mnMotion: Double, _ revNum: Int,
                                 _ nDotO2: Double, _ n2DotO6: Double) -> Int64 {

    TleAddSatFrFieldsGP2(Int32(satNum), secClass.utf8CString[0], satName.cString,
                         Int32(epochYr), epochDays, bstar, Int32(ephType),
                         Int32(elsetNum), incli, node, eccen, omega, mnAnomaly, mnMotion, Int32(revNum),
                         nDotO2, n2DotO6)

}

public func tleAddSatFrFieldsSP(_ satNum: SatNum, _ secClass: String, _ satName: String,
                                _ epochYr: Int, _ epochDays: Double, _ bterm: Double,
                                _ ogParm: Double, _ agom: Double,
                                _ elsetNum: Int, _ incli: Double,
                                _ node: Double, _ eccen: Double, _ omega: Double,
                                _ mnAnomaly: Double, _ mnMotion: Double, _ revNum: Int) -> Int64 {

    TleAddSatFrFieldsSP(Int32(satNum), secClass.utf8CString[0], satName.cString,
                        Int32(epochYr), epochDays, bterm, ogParm, agom,
                        Int32(elsetNum), incli, node, eccen, omega, mnAnomaly, mnMotion, Int32(revNum))

}

public func tleUpdateSatFrFieldsGP(_ satKey: SatKey, _ secClass: String, _ satName: String,
                                   _ bstar: Double, _ elsetNum: Int, _ incli: Double,
                                   _ node: Double, _ eccen: Double, _ omega: Double,
                                   _ mnAnomaly: Double, _ mnMotion: Double, _ revNum: Int) -> Int {

    Int(TleUpdateSatFrFieldsGP(satKey, secClass.utf8CString[0], satName.cString,
                               bstar,
                               Int32(elsetNum), incli, node, eccen, omega, mnAnomaly, mnMotion, Int32(revNum)))

}

public func tleUpdateSatFrFieldsGP2(_ satKey: SatKey, _ secClass: String, _ satName: String,
                                    _ bstar: Double, _ elsetNum: Int, _ incli: Double,
                                    _ node: Double, _ eccen: Double, _ omega: Double,
                                    _ mnAnomaly: Double, _ mnMotion: Double, _ revNum: Int,
                                    _ nDotO2: Double, _ n2DotO6: Double) -> Int {

    Int(TleUpdateSatFrFieldsGP2(satKey, secClass.utf8CString[0], satName.cString,
                                bstar,
                                Int32(elsetNum), incli, node, eccen, omega, mnAnomaly, mnMotion, Int32(revNum),
                                nDotO2, n2DotO6))
}

public func tleUpdateSatFrFieldsSP(_ satKey: SatKey, _ secClass: String, _ satName: String,
                                   _ bterm: Double, _ ogParm: Double,
                                   _ agom: Double, _ elsetNum: Int, _ incli: Double,
                                   _ node: Double, _ eccen: Double, _ omega: Double,
                                   _ mnAnomaly: Double, _ mnMotion: Double, _ revNum: Int) -> Int {

    Int(TleUpdateSatFrFieldsSP(satKey, secClass.utf8CString[0], satName.cString,
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
public func  tleGetAllFieldsGP(_ satKey: SatKey,
                               _ satNum: inout Int32, _ secClass: inout String, _ satName: inout String,
                               _ epochYr: inout Int32, _ epochDays: inout Double,
                               _ bStar: inout Double, _ ephType: inout Int32,
                               _ elsetNum: inout Int32, _ incli: inout Double,
                               _ node: inout Double, _ eccen: inout Double,
                               _ omega: inout Double, _ mnAnomaly: inout Double,
                               _ mnMotion: inout Double, _ revNum: inout Int32) -> Int {

    var _secClass = CChar(0)
    var _satName = emptyCcharArray(size: 8)                // satName is 8 characters

    let errorCode = TleGetAllFieldsGP(satKey, &satNum, &_secClass, &_satName,
                                      &epochYr, &epochDays, &bStar, &ephType,
                                      &elsetNum, &incli, &node, &eccen, &omega, &mnAnomaly, &mnMotion, &revNum)

    secClass = String(UnicodeScalar(UInt8(bitPattern: _secClass)))
    satName = String(fromCcharArray: _satName, size: 8)

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
public func tleGetAllFieldsGP2(_ satKey: SatKey,
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

    secClass = String(UnicodeScalar(UInt8(bitPattern: _secClass)))
    satName = String(fromCcharArray: _satName, size: 8)

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
public func  tleGetAllFieldsSP(_ satKey: SatKey,
                               _ satNum: inout Int32, _ secClass: inout String, _ satName: inout String,
                               _ epochYr: inout Int32, _ epochDays: inout Double,
                               _ bterm: inout Double, _ ogParm: inout Double, _ agom: inout Double,
                               _ elsetNum: inout Int32, _ incli: inout Double,
                               _ node: inout Double, _ eccen: inout Double,
                               _ omega: inout Double, _ mnAnomaly: inout Double,
                               _ mnMotion: inout Double, _ revNum: inout Int32) -> Int {

    var _secClass = CChar(0)
    var _satName = emptyCcharArray(size: 8)                // satName is 8 characters

    let errorCode = TleGetAllFieldsSP(satKey, &satNum, &_secClass, &_satName,
                                      &epochYr, &epochDays, &bterm, &ogParm, &agom,
                                      &elsetNum, &incli, &node, &eccen, &omega, &mnAnomaly, &mnMotion, &revNum)

    secClass = String(UnicodeScalar(UInt8(bitPattern: _secClass)))
    satName = String(fromCcharArray: _satName, size: 8)

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
    var _satName = emptyCcharArray(size: 8)                // satName is 8 characters

    let errorCode = TleParseGP(line1.cString, line2.cString, &satNum, &_secClass, &_satName,
                               &epochYr, &epochDays, &nDotO2, &n2DotO6, &bstar, &ephType,
                               &elsetNum, &incli, &node, &eccen, &omega, &mnAnomaly, &mnMotion, &revNum)

    secClass = String(UnicodeScalar(UInt8(bitPattern: _secClass)))
    satName = String(fromCcharArray: _satName, size: 8)

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
    var _satName = emptyCcharArray(size: 8)                // satName is 8 characters

    let errorCode = TleParseSP(line1.cString, line2.cString, &satNum, &_secClass, &_satName,
                               &epochYr, &epochDays, &bterm, &ogParm, &agom,
                               &elsetNum, &incli, &node, &eccen, &omega, &mnAnomaly, &mnMotion, &revNum)

    secClass = String(UnicodeScalar(UInt8(bitPattern: _secClass)))
    satName = String(fromCcharArray: _satName, size: 8)

    return Int(errorCode)

}

public func tleRemoveSat(_ satKey: SatKey) -> Int { Int(TleRemoveSat(satKey)) }

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
///  |   5  |  Ephemeris type: 0,2 → B* drag term (1/er)
///  |      | Ephemeris type: 6 → SP radiation pressure coefficient agom (m²/kg)  |
///  |   6  |  Ephemeris type  |
///  |   7  |  Element set number  |
///  |   8  |  Orbit inclination (degrees)  |
///  |   9  |  Right ascension of ascending node (degrees)  |
///  |   10  |  Eccentricity  |
///  |   11  |  Argument of perigee (degrees)  |
///  |   12  |  Mean anomaly (degrees)  |
///  |   13  |  Mean motion (rev/day)  |
///  |   14  |  Revolution number at epoch  |
///  |   15  |  Ephemeris type: 0 → SGP mean motion derivative (rev/day÷2)
///  |       | Ephemeris type: 6 → SP ballistic coefficient (m²/kg)   |
///  |   16  |  Ephemeris type: 0 → SGP mean motion second derivative (rev/day²÷6)
///  |       | Ephemeris type: 6 → SP Outgassing parameter/Thrust Acceleration (km/s²)  |
/// - Parameters:
///   - satKey: The satellite's unique key.
///   - xf_Tle: Predefined number specifying which field to retrieve.
/// - Returns: A string to contain the value of the requested field (nil if failure).
public func tleGetField(_ satKey: SatKey, _ xf_Tle: Int) -> String? {

    var valueStr = emptyCcharArray(size: GETSETSTRLEN)
    guard 0  == TleGetField(satKey, Int32(xf_Tle), &valueStr) else { return nil }
    return String(fromCcharArray: valueStr, size: GETSETSTRLEN)

}

/// Updates the value of a field of a TLE. This function can be used for both GP and SP satellites.
///
/// The table below indicates which index values correspond to which fields.
/// Make sure to use the appropriate field index for GP TLEs and SP TLEs.
/// For indexes 5, 15 and 16, the interpretation depends on the ephemeris type of the TLE.
///
/// satNum (1), Epoch (4), and Ephemeris Type (5) cannot be altered.
///
/// |  index  |  index Interpretation  |
/// | :----: | :----: |
/// | 1 | Satellite number |
/// | 2 | Security classification |
/// | 3 | Satellite international designator |
/// | 4 | Epoch |
/// | 5 | B* drag term (1/er) for Ephemeris types = 0,2;
/// |   | SP radiation pressure coefficient agom (m2/kg) for Ephemeris type = 6
/// | 6 | Ephemeris type |
/// | 7 | Element set number |
/// | 8 | Orbit inclination (degrees) |
/// | 9 | Right ascension of ascending node (degrees) |
/// | 10 | Eccentricity |
/// | 11 | Argument of perigee (degrees) |
/// | 12 | Mean anomaly (degrees) |
/// | 13 | Mean motion (rev/day) |
/// | 14 | Revolution number at epoch |
/// | 15 | SGP mean motion derivative (rev/day÷2) for Ephemeris type = 0
/// |    | SP ballistic coefficient (m2/kg) for Ephemeris type = 6 |
/// | 16 | SGP mean motion second derivative (rev/day²÷6) for Ephemeris type = 0;
/// |   | SP outgassing parameter/Thrust Acceleration (km/s2) for Ephemeris type = 6 |
/// - Parameters:
///   - satKey: The satellite's unique key.
///   - xf_Tle: Predefined number specifying which field to set. See remarks.
///   - valueStr: The new value of the specified field, expressed as a string.
/// - Returns: 0 if the TLE is successfully updated, non-0 if there is an error
public func tleSetField(_ satKey: SatKey, _ xf_Tle: Int, _ valueStr: String) -> Int {

    Int(TleSetField(satKey, Int32(xf_Tle), valueStr.cString))

}

public func getCheckSums(_ line1: String, _ line2: String) -> (Int, Int, Int) {

    var check1: Int32 = 0
    var check2: Int32 = 0
    var errorCode: Int32 = 0

    GetCheckSums(line1.cString, line2.cString, &check1, &check2, &errorCode)

    return (Int(check1), Int(check2), Int(errorCode))

}

//MARK: SGP4

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

    var licFilePath = emptyCcharArray(size: GETSETSTRLEN)
    Sgp4GetLicFilePath(&licFilePath)
    return String(fromCcharArray: licFilePath, size: GETSETSTRLEN)

}

/// Note: The only requirement now is that "SGP4_Open_License.txt" file needs to be
/// in those folders specified in PATH/LD_LIBRARY_PATH environment or AstroStds DLLs/SOs'
/// - Parameter licFilePath: The file path to the Sgp4 Open License file
@available(*, deprecated, message: "This function has been deprecated since v8.2")
public func sgp4SetLicFilePath(_ licFilePath: String) {

    Sgp4SetLicFilePath(licFilePath.cString)

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
public func sgp4InitSat(_ satKey: SatKey) -> Int { Int(Sgp4InitSat(satKey)) }

/// Removing a satellite from the propagator's set of satellites does not affect the
/// corresponding TLE data loaded by calls to routines in Tle.dll.
/// - Parameter satKey: The satellite's unique key.
/// - Returns: 0 if the satellite is removed successfully, non-0 if there is an error
public func sgp4RemoveSat(_ satKey: SatKey) -> Int { Int(Sgp4RemoveSat(satKey)) }

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
public func sgp4PropMse(_ satKey: SatKey, _ mse: Double, _ ds50UTC: UnsafeMutablePointer<Double>,
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
///   - minutesSinceEpoch: Resulting time in minutes since the satellite's epoch time. (out-Double)
///   - pos: Resulting ECI position vector (km) in True Equator and Mean Equinox of Epoch.
///   - vel: Resulting ECI velocity vector (km/s) in True Equator and Mean Equinox of Epoch.
///   - llh: Resulting geodetic latitude (deg), longitude(deg), and height (km).
/// - Returns: returns 0 if the propagation is successful, non-0 if there is an error (see error decoder in GP_ERR_?).
public func sgp4PropDs50UTC(_ satKey: SatKey, _ ds50UTC: Double, _ mse: UnsafeMutablePointer<Double>,
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
public func sgp4PropDs50UtcLLH(_ satKey: SatKey,
                               _ ds50UTC: Double,
                               _ llh: UnsafeMutablePointer<Double>) -> Int {

    Int(Sgp4PropDs50UtcLLH(satKey, ds50UTC, llh))

}

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
public func sgp4PropDs50UtcPos(_ satKey: SatKey,
                               _ ds50UTC: Double,
                               _ pos: UnsafeMutablePointer<Double>) -> Int {

    Int(Sgp4PropDs50UtcPos(satKey, ds50UTC, pos))

}

//TODO: <Int> to <Int32>
/// Generates ephemerides for the input satellite, represented by its **satKey**, for the specified time span and step size.
///
/// Notes:
/// - if `arrSize` isn't big enough to store all the ephemeris points, the function will exit when the `ephemArr` reaches
/// that many points and the `errCode` is set to `IDX_ERR_WARN`
/// - Parameters:
///   - satKey:     The unique key of the satellite to generate ephemerides.
///   - startTime:  Start time expressed in days since 1950, UTC.
///   - endTime:    End time expressed in days since 1950, UTC.
///   - stepSize:   Step size in minutes (static); enter predefine negative values (DYN_SS_?) to request dynamic step size.
///   - sgp4_ephem: Output ephemeris type 1=ECI, 2=J2K.
///   - arrSize:    Size of input ephemArr
///   - ephemArr:   Output ephemerides
///     - 0: time in days since 1950 UTC,
///     - 1-3: pos (km),
///     - 4-6: vel (km/sec)
///   - genEphemPts:Actual number of ephemeris points generated (always <= arrSize)
/// - Returns: 0 if the propagation is successful, non-0 if there is an error (see error decoder in GP_ERR_?)
public func sgp4GenEphems(_ satKey: Int64, _ startTime: Double, _ endTime: Double, _ stepSize: Double,
                          _ sgp4_ephem: Int, _ arrSize: Int,
                          _ ephemArr: UnsafeMutablePointer<(Double, Double, Double, Double, Double, Double, Double)>,
                          _ genEphemPts: UnsafeMutablePointer<Int32>) -> Int {

    Int(Sgp4GenEphems(satKey, startTime, endTime, stepSize, Int32(sgp4_ephem), Int32(arrSize), ephemArr, genEphemPts))

}

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
public func sgp4GetPropOut(_ satKey: SatKey, _ xf_SgpOut: Int, _ destArr: UnsafeMutablePointer<Double>)  -> Int {

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
public func sgp4ReepochTLE(_ satKey: SatKey, _ newEpoch: Double, _ line1: inout String, _ line2: inout String) -> Int {

    var _line1 = emptyCcharArray(size: INPUTCARDLEN)                             //[INPUTCARDLEN = 512]
    var _line2 = emptyCcharArray(size: INPUTCARDLEN)                             //[INPUTCARDLEN]

    let errorCode = Sgp4ReepochTLE(satKey, newEpoch, &_line1, &_line2)

    line1 = String(fromCcharArray: _line1, size: INPUTCARDLEN)
    line2 = String(fromCcharArray: _line2, size: INPUTCARDLEN)

    return Int(errorCode)
}

/// Reepochs a loaded TLE, represented by the satKey, to a new epoch.
///
/// - Parameters:
///   - satKey: The unique key of the satellite to reepoch.
///   - newEpoch: The new epoch, express in days since 1950, UTC.
///   - line1: A string to hold the first line of the reepoched TLE.
///   - line2: A string to hold the second line of the reepoched TLE.
/// - Returns: tuple (line1, line2) or nil if failure
public func sgp4ReepochTLE(_ satKey: SatKey, _ newEpoch: Double) -> (String, String)! {

    var _line1 = emptyCcharArray(size: INPUTCARDLEN)                             //[INPUTCARDLEN = 512]
    var _line2 = emptyCcharArray(size: INPUTCARDLEN)                             //[INPUTCARDLEN]

    guard 0 == Sgp4ReepochTLE(satKey, newEpoch, &_line1, &_line2) else { return nil }

    return (String(fromCcharArray: _line1, size: INPUTCARDLEN),
            String(fromCcharArray: _line2, size: INPUTCARDLEN))
}
/// Reepochs a loaded TLE, represented by the satKey, to a new epoch in Csv format.
/// - Parameters:
///   - satKey: The unique key of the satellite to reepoch.
///   - reepochDs50UTC: A string to hold the reepoched CSV.
/// - Returns: A string to hold the reepoched CSV.
public func sgp4ReepochCsv(_ satKey: SatKey, _ reepochDs50UTC: Double) -> String? {

    var _csvLine = emptyCcharArray(size: INPUTCARDLEN)
    guard 0 == Sgp4ReepochCsv(satKey, reepochDs50UTC, &_csvLine) else { return nil }
    return String(fromCcharArray: _csvLine, size: INPUTCARDLEN)

}

//MARK: XTRA

/// returns the Sun's lat/lon for the time (days after 1950)
/// - Parameter ds1950: days after 1950
/// - Returns: a tuple carrying (solarLat, solarLon)
public func solarLLH(_ ds1950: Double) -> (Double, Double) {

    var solarPos = [0.0, 0.0, 0.0]
    var solarMag = 0.0

    CompSunPos(ds1950, &solarPos, &solarMag)

    solarPos[0] = solarPos[0] * solarMag
    solarPos[1] = solarPos[1] * solarMag
    solarPos[2] = solarPos[2] * solarMag

    var earthLLH = [0.0, 0.0, 0.0]

    XYZToLLHTime(ds1950, &solarPos, &earthLLH)

    return (earthLLH[0], earthLLH[1])

}

/// returns the Moon's lat/lon for the time (days after 1950)
/// - Parameter ds1950: days after 1950
/// - Returns: a tuple carrying (lunarLat, lunarLon)
public func lunarLLH(_ ds1950: Double) -> (Double, Double) {

    var lunarPos = [0.0, 0.0, 0.0]
    var lunarMag = 0.0

    CompMoonPos(ds1950, &lunarPos, &lunarMag)

    lunarPos[0] = lunarPos[0] * lunarMag
    lunarPos[1] = lunarPos[1] * lunarMag
    lunarPos[2] = lunarPos[2] * lunarMag

    var earthLLH = [0.0, 0.0, 0.0]

    XYZToLLHTime(ds1950, &lunarPos, &earthLLH)

    return (earthLLH[0], earthLLH[1])

}

//MARK: TESTS

/// Tests different input/output data types that are supported by the Astrodynamic Standards library.
/// - Parameters:
///   - cIn:       an input character (in-Character)
///   - cOut:      an output character - should return the same value as the input cIn (out-Character)
///   - intIn:     an input 32-bit integer (in-Integer)
///   - intOut:    an output 32-bit integer - should return the same value as the input intIn (out-Integer)
///   - longIn:    an input 64-bit integer (in-Long)
///   - longOut:   an output 64-bit integer - should return the same value as the input longIn (out-Long)
///   - realIn:    an input 64-bit real (in-Double)
///   - realOut:   an output 64-bit real - should return the same value as the input realIn (out-Double)
///   - strIn:     input string (in-Character[512])
///   - strOut:    output string - should return the same value as the input strIn (out-Character[512])
///   - int1DIn:   an input array of 32-bit integers (in-Integer[3])
///   - int1DOut:  an output array of 32-bit integers - should return the same values as the input int1DIn (out-Integer[3])
///   - long1DIn:  an input array of 64-bit integers (in-Long[3])
///   - long1DOut: an output array of 64-bit integers - should return the same values as the input long1DIn (out-Long[3])
///   - real1DIn:  an input array of 64-bit reals (in-Double[3])
///   - real1DOut: an output array of 64-bit reals - should return the same values as the input real1DIn (out-Double[3])
///   - int2DIn:   an input 2D-array of 32-bit integers (2 rows, 3 columns) - for column-major order language, reverse the order (in-Integer[2, 3])
///   - int2DOut:  an output 2D-array of 32-bit integers - should return the same values as the input int2DIn (out-Integer[2, 3])
///   - long2DIn:  an input 2D-array of 64-bit integers (2 rows, 3 columns) - for column-major order language, reverse the order (in-Long[2, 3])
///   - long2DOut: an output 2D-array of 64-bit integers - should return the same values as the input long2DIn (out-Long[2, 3])
///   - real2DIn:  an input 2D-array of 64-bit reals (2 rows, 3 columns) - for column-major order language, reverse the order (in-Double[2, 3])
///   - real2DOut: an output 2D-array of 64-bit reals - should return the same values as the input real2DIn (out-Double[2, 3])
public func testInterface1(_ char_In: String, _ char_Out: inout String,
                           _ int_In: Int32, _ int_Out: UnsafeMutablePointer<Int32>,
                           _ long_In: Int64, _ long_Out: UnsafeMutablePointer<Int64>,
                           _ real_In: Double, _ real_Out: UnsafeMutablePointer<Double>,
                           _ str_In: String, _ str_Out: inout String,
                           _ int1D_In: UnsafeMutablePointer<Int32>, _ int1D_Out: UnsafeMutablePointer<Int32>,
                           _ long1D_In: UnsafeMutablePointer<Int64>, _ long1D_Out: UnsafeMutablePointer<Int64>,
                           _ real1D_In: UnsafeMutablePointer<Double>, _ real1D_Out: UnsafeMutablePointer<Double>,
                           _ int2D_In: UnsafeMutablePointer<(Int32, Int32, Int32)>, _ int2D_Out: UnsafeMutablePointer<(Int32, Int32, Int32)>,
                           _ long2D_In: UnsafeMutablePointer<(Int64, Int64, Int64)>, _ long2D_Out: UnsafeMutablePointer<(Int64, Int64, Int64)>,
                           _ real2D_In: UnsafeMutablePointer<(Double, Double, Double)>, _ real2D_Out: UnsafeMutablePointer<(Double, Double, Double)>) {

    let _char_In = char_In.utf8CString[0]
    var _char_Out = CChar(0)
    let _str_In = str_In.cString
    var _str_Out = emptyCcharArray(size: INPUTCARDLEN)            //[INPUTCARDLEN = 512]

    TestInterface(_char_In, &_char_Out,
                  int_In, int_Out,
                  long_In, long_Out,
                  real_In, real_Out,
                  _str_In, &_str_Out,
                  int1D_In, int1D_Out,
                  long1D_In, long1D_Out,
                  real1D_In, real1D_Out,
                  int2D_In, int2D_Out,
                  long2D_In, long2D_Out,
                  real2D_In, real2D_Out)

    char_Out = String(UnicodeScalar(UInt8(bitPattern: _char_Out)))
    str_Out = String(fromCcharArray: _str_Out, size: INPUTCARDLEN)

}

/// Tests different input/output data types that are supported by the Astrodynamic Standards library.
/// - Parameters:
///   - char_InOut:   Output should return 'Z' (inout-Character)
///   - int_InOut:    Output should return Input + 1 (inout-Integer)
///   - long_InOut:   Output should return Input + 2 (inout-Long)
///   - real_InOut:   Output should return Input + 42.123456 (inout-Double)
///   - str_InOut:    Output should return "It doesn't matter what your string was." (inout-Character[512])
///   - int1D_InOut:  Output should return Input + 1 (inout-Integer[3])
///   - long1D_InOut: Output should return Input + 1234567890123456789 (inout-Long[3])
///   - real1D_InOut: Output should return Input + 42.0 (inout-Double[3])
///   - int2D_InOut:  Output should return Input + 1 (inout-Integer[2, 3])
///   - long2D_InOut: Output should return Input + 6 (inout-Long[2, 3])
///   - real2D_InOut: Output should return Input + 7.6 (inout-Double[2, 3])
public func testInterface2(_ char_InOut: inout String,
                           _ int_InOut: UnsafeMutablePointer<Int32>,
                           _ long_InOut: UnsafeMutablePointer<Int64>,
                           _ real_InOut: UnsafeMutablePointer<Double>,
                           _ str_InOut: inout String,
                           _ int1D_InOut: UnsafeMutablePointer<Int32>,
                           _ long1D_InOut: UnsafeMutablePointer<Int64>,
                           _ real1D_InOut: UnsafeMutablePointer<Double>,
                           _ int2D_InOut: UnsafeMutablePointer<(Int32, Int32, Int32)>,
                           _ long2D_InOut: UnsafeMutablePointer<(Int64, Int64, Int64)>,
                           _ real2D_InOut: UnsafeMutablePointer<(Double, Double, Double)>) {

    var _char_InOut = char_InOut.utf8CString[0]
    var _str_InOut = str_InOut.toCcharArray()

    TestInterface2(&_char_InOut, int_InOut, long_InOut, real_InOut, &_str_InOut,
                   int1D_InOut, long1D_InOut, real1D_InOut,
                   int2D_InOut, long2D_InOut, real2D_InOut)

    char_InOut = String(UnicodeScalar(UInt8(bitPattern: _char_InOut)))
    str_InOut = String(fromCcharArray: _str_InOut, size: INPUTCARDLEN)

}

/// Tests input and output arrays with unknown length that are supported by the Astrodynamic Standards library.
/// - Parameters:
///   - int1DIn: Unknown dimension should be length (3) (in-Integer[*])
///   - int1DOut: Unknown dimension should be length (3), Unk1DOut should return same as Unk1DIn * 4 (out-Integer[*])
///   - int2DIn: Unknown dimension should be length (2) (in-Integer[*, 3])
///   - int2DOut: Unknown dimension should be length (2), Unk2DOut should return same as Unk2DIn * 5 (out-Integer[*, 3])
public func testInterface3(_ int1D_In: UnsafeMutablePointer<Int32>,
                           _ int1D_Out: UnsafeMutablePointer<Int32>,
                           _ int2D_In: UnsafeMutablePointer<(Int32, Int32, Int32)>,
                           _ int2D_Out: UnsafeMutablePointer<(Int32, Int32, Int32)>) {

    TestInterface3(int1D_In, int1D_Out, int2D_In, int2D_Out)

}
