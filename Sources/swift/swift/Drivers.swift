//
//  Drivers.swift
//  
//
//  Created by Gavin Eadie on 12/4/22.
//

import Foundation
import obj_c

// ================================================ MAIN
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
/// dynamic library (`AstroFunc.AstroFuncInit`, `TimeFunc.TimeFuncInit...`), the initialization routine will check to see if the passed in handle refers to a valid global data set.
/// If you forget to call this function first, the `GetLastErrMsg()` function won't return a
/// correct value.
/// - Returns: A handle to the global data set. You will pass this handle to other initialization functions within other DLLs in the API.
public func dllMainInit() -> Int64 { DllMainInit() }

/// Returns information about the DllMain DLL.
///
/// The returned string provides information about the version number, build date, and the platform.
/// - Returns: A string holding the information about DllMain.dll. (out-Character[128])
public func dllMainGetInfo() -> String {

    var infoString = Array(repeating: Int8(0), count: Int(INFOSTRLEN))
    DllMainGetInfo(&infoString)
    infoString[Int(INFOSTRLEN)-1] = 0
    return String(cString: infoString).trimRight()

}

/// Returns a list of names of the Standardized Astrodynamic Algorithms dynamic
/// libraries that were initialized successfully.
/// - Returns: A string with the names of the dynamic libraries that were initialized
/// successfully. (out-Character[512])
public func getInitDllNames() -> String {

    var getNamesString = Array(repeating: Int8(0), count: Int(GETSETSTRLEN))
    GetInitDllNames(&getNamesString)
    getNamesString[Int(GETSETSTRLEN)-1] = 0
    return String(cString: getNamesString).trimRight()

}

/// Returns a character string describing the last error that occurred. As a common practice,
/// this function is called to retrieve the error message when an error occurs.
///
/// This function works with or without an opened log file.
///
/// If you call this function before you have called DllMainInit(), the function will
/// return an invalid string. This could result in undefined behavior.
/// - Returns: A string that stores the last logged error message. (out-Character[128])
public func getLastErrMsg() -> String {

    var messageString = Array(repeating: Int8(0), count: Int(LOGMSGLEN))
    GetLastErrMsg(&messageString)
    messageString[Int(LOGMSGLEN)-1] = 0
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
/// - Returns: A string that stores the last logged informational message. (out-Character[128])
public func GetLastInfoMsg() -> String {

    var messageString = Array(repeating: Int8(0), count: Int(LOGMSGLEN))
    GetLastInfoMsg(&messageString)
    messageString[Int(LOGMSGLEN)-1] = 0
    return String(cString: messageString).trimRight()

}

/// Opens a log file and enables the writing of diagnostic information into it.
///
/// All of the DLLs in the library will write diagnostic information into the log file once this function has been called.  If the file specified by logFileName already exists, its contents are erased.
///
/// Enabling logging can potentially result in large amounts of diagnostic information being
/// generated, which can lead to large amounts of storage being consumed as well as
/// performance decreases. For this reason, it is recommended that this function only
/// be used for debugging purposes.
/// - Parameter fileName: The name of the log file to use. (in-Character[512])
/// - Returns: 0 if the file was opened successfully. Other values indicate an error.
public func openLogFile(_ filePath: String) -> Int32 {

    OpenLogFile(makeCString(from: filePath))

}

/// Writes a message into the log file.
///
/// Make sure the log file is open by calling OpenLogFile before using this function.
///
/// - Parameter message: A message to be written into the log file, limited to 128 characters.
/// If the message is longer than this, it will be truncated. (in-Character[128])
public func logMessage(_ message: String) {

    LogMessage(makeCString(from: message))

}

/// Closes the currently open log file and reset the last logged error message to null.
///
/// Remember to close the log file before exiting the program.
public func closeLogFile() { CloseLogFile() }

// ================================================ ENV
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

    EnvInit(dllHandle)

}

public func envGetInfo() -> String {

    var infoString = Array(repeating: Int8(0), count: Int(512))
    EnvGetInfo(&infoString)
    infoString[511] = 0
    return String(cString: infoString).trimRight()

}

// ================================================ TIME
public func timeFuncInit(_ dllHandle: Int64) -> Int32 {

    TimeFuncInit(dllHandle)

}

public func timeFuncGetInfo() -> String {

    var infoString = Array(repeating: Int8(0), count: Int(512))
    TimeFuncGetInfo(&infoString)
    infoString[511] = 0
    return String(cString: infoString).trimRight()

}

/// This function supports DTG19 inputs in both "YY DDD HH MM SS.SSS" and
/// "YYYYMonDDHHMMSS.SSS" formats.
///
/// The function can process dates from 1950 to 2049.
/// Any input outside this range will yield "0.0" .. actually, Double(0.0).
/// - Parameter time: The string to convert. Can be any of the DTG formats
/// previously documented. (in-Character[20])
/// - Returns: The number of days since 1950 UTC
public func dtgToUTC(_ DTG19: String) -> Double {

    DTGToUTC(makeCString(from: DTG19))

}

/// Converts a time in ds50UTC to a time in ds50TAI using timing constants records in memory.
///
/// If no timing constants records were loaded, ds50UTC and ds50TAI are the same.
/// - Parameter ds50UTC: Days since 1950, UTC to be converted.
/// - Returns: The number of days since 1950, TAI. Partial days may be returned.
public func utcToTAI(_ ds50UTC: Double) -> Double {

    UTCToTAI(ds50UTC)

}

/// Converts a time in ds50UTC to a time in ds50UT1 using timing constants records in memory.
///
/// If no timing constants records were loaded, `ds50UTC` and `ds50UT1` are the same.
/// - Parameter ds50UTC: Days since 1950, UTC to be converted. (in-Double)
/// - Returns: The number of days since 1950, TAI. Partial days may be returned.
public func utcToUT1(_ ds50UTC: Double) -> Double {

    UTCToUT1(ds50UTC)

}

/// Converts a time in ds50UTC to a time in ds50ET using timing constants records in memory.
///
/// If no timing constants records were loaded, ds50UTC and ds50UT1 are the same.
///
/// - Parameter ds50UTC: Days since 1950, UTC to be converted. (in-Double)
/// - Returns: The number of days since 1950, ET. Partial days may be returned.
public func utcToET(_ ds50UTC: Double) -> Double {

    UTCToET(ds50UTC)

}

/// Converts a year and a number of days to a time in ds50UTC.
///
/// - Parameters:
///   - year: Two or four digit years are accepted. (in-Integer)
///   - dayOfYear: The day of year. Partial days can be specified. (in-Double)
/// - Returns: returns The number of days since 1950, UTC. Partial days may be returned.
func yrDaysToUTC(_ year: Int32, _ dayOfYear: Double) -> Double {

    YrDaysToUTC(year, dayOfYear)

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
func timeComps1ToUTC(_ year: Int32, _ dayOfYear: Int32,
                     _ hh: Int32, _ mm: Int32, _ sss: Double) -> Double {

    TimeComps1ToUTC(year, dayOfYear, hh, mm, sss)

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
func utcToTimeComps1(_ ds50UTC: Double,
                     _ year: inout Int32, _ dayOfYear: inout Int32,
                     _ hh: inout Int32, _ mm: inout Int32, _ sss: inout Double) {
    precondition(ds50UTC >= 2192.0, "UTCToTimeComps1 failure: ds50UTC < 2192.0")

    UTCToTimeComps1(ds50UTC, &year, &dayOfYear, &hh, &mm, &sss)

}

func timeComps2ToUTC(_ year: Int32, _ month: Int32, _ dayOfMonth: Int32,
                     _ hh: Int32, _ mm: Int32, _ sss: Double) -> Double {

    TimeComps2ToUTC(year, month, dayOfMonth, hh, mm, sss)

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
func utcToTimeComps2(_ ds50UTC: Double,
                     _ year: inout Int32, _ month: inout Int32, _ dayofMonth: inout Int32,
                     _ hh: inout Int32, _ mm: inout Int32, _ sss: inout Double) {

    precondition(ds50UTC >= 2192.0, "UTCToTimeComps2 failure: ds50UTC < 2192.0")

    UTCToTimeComps2(ds50UTC, &year, &month, &dayofMonth, &hh, &mm, &sss)

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
func utcToYrDays(_ ds50UTC: Double,
                 _ year: inout Int32, _ dayOfYear: inout Double) {
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
/// - Parameter ds50UTC: Days since 1950, UTC to be converted. (in-Double)
/// - Returns: A string to hold the result of the conversion. (out-Character[19])
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
/// - Parameter ds50UTC: Days since 1950, UTC to be converted. (in-Double)
/// - Returns: A string to hold the result of the conversion. (out-Character[19])
public func utcToDTG17(_ ds50UTC: Double) -> String {

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
/// - Parameter ds50UTC: Days since 1950, UTC to be converted. (in-Double)
/// - Returns: A string to hold the result of the conversion. (out-Character[19])
public func utcToDTG15(_ ds50UTC: Double) -> String {

    var string24 = Array(repeating: Int8(0), count: Int(24))
    UTCToDTG15(ds50UTC, &string24)
    string24[23] = 0
    return String(cString: string24).trimRight()

}

/// Removes all the timing constants records in memory.
/// - Returns: 0 if all timing constants records are successfully removed from memory,
/// non-0 if there is an error.
public func tConRemoveAll() -> Int32 { TConRemoveAll() }

// ================================================ ASTRO
public func astroFuncInit(_ dllHandle: Int64) -> Int32 {

    AstroFuncInit(dllHandle)

}

public func astroFuncGetInfo() -> String {

    var infoString = Array(repeating: Int8(0), count: Int(512))
    AstroFuncGetInfo(&infoString)
    infoString[511] = 0
    return String(cString: infoString).trimRight()

}

// ================================================ TLE
/// Initializes Tle DLL for use in the program. If this function returns an error, it is recommended that you stop the program immediately.
///
/// - Parameter dllHandle: The handle that was returned from DllMainInit
/// - Returns: 0 if Tle.dll is initialized successfully, non-0 if there is an error.
public func tleInit(_ dllHandle: Int64) -> Int32 {

    TleInit(dllHandle)

}

/// Returns the information about the Tle DLL.
///
/// The returned string provides information about the version number, build date, and the platform of the Tle DLL.
/// - Returns: A string to hold the information about the Tle DLL.
public func tleGetInfo() -> String {

    var infoString = Array(repeating: Int8(0), count: Int(512))
    TleGetInfo(&infoString)
    infoString[511] = 0
    return String(cString: infoString).trimRight()

}

public func tleAddSatFrLines (_ line1: String, _ line2: String) -> Int64 {

    TleAddSatFrLines(makeCString(from: line1), makeCString(from: line2))

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

    TleLoadFile(makeCString(from: tleFileName))

}

// ================================================ SGP4
/// Initializes the Sgp4 DLL for use in the program.
///
/// If this function returns an error, it is recommended that you stop the program immediately.
///
/// An error will occur if you forget to load and initialize all the prerequisite DLLs,
/// as listed in the DLL Prerequisites section of the accompanying documentation,
/// before using this DLL.
/// - Parameter dllHandle: The handle that was returned from `DllMainInit()`
/// - Returns: 0 if Sgp4Prop.dll is initialized successfully, non-0 if there is an error.
public func sgp4Init(_ dllHandle: Int64) -> Int32 { Sgp4Init(dllHandle) }

/// Returns information about the current version of Sgp4Prop.dll.
///
/// - Returns: The returned string provides information about the version number, build date, and platform.
public func sgp4GetInfo() -> String {

    var infoString = Array(repeating: Int8(0), count: Int(512))
    Sgp4GetInfo(&infoString)
    infoString[511] = 0
    return String(cString: infoString).trimRight()

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
/// This key will have been returned by one of the routines in Tle.dll. (in-Long)
/// - Returns: 0 if the satellite is successfully initialized and added to
/// Sgp4Prop.dll's set of satellites, non-0 if there is an error.
public func sgp4InitSat(_ satKey: Int64) -> Int32 { Sgp4InitSat(satKey) }

/// Removing a satellite from the propagator's set of satellites does not affect the
/// corresponding TLE data loaded by calls to routines in Tle.dll.
/// - Parameter satKey: The satellite's unique key. (in-Long)
/// - Returns: 0 if the satellite is removed successfully, non-0 if there is an error
public func sgp4RemoveSat(_ satKey: Int64) -> Int32 { Sgp4RemoveSat(satKey) }

/// Removes all currently loaded satellites from memory.
///
/// Calling this function removes all satellites from the set maintained by
/// Sgp4Prop.dll. However, the TLE data loaded by Tle.dll is unaffected by this function.
/// - Returns: 0 if all satellites are removed successfully from memory, non-0 if there is an error.
public func sgp4RemoveAllSats() -> Int32 { TleRemoveAllSats() }

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
///   - satKey: The satellite's unique key. (in-Long)
///   - ds50UTC: The time to propagate to, expressed in days since 1950, UTC. (in-Double)
///   - mse: Resulting time in minutes since the satellite's epoch time. (out-Double)
///   - pos: Resulting ECI position vector (km) in True Equator and Mean Equinox of Epoch. (out-Double[3])
///   - vel: Resulting ECI velocity vector (km/s) in True Equator and Mean Equinox of Epoch. (out-Double[3])
///   - llh: Resulting geodetic latitude (deg), longitude(deg), and height (km). (out-Double[3])
/// - Returns: 0 if the propagation is successful, non-0 if there is an error (see error decoder in GP_ERR_?).
public func sgp4PropMse(_ satKey: Int64, _ mse: Double, _ ds50UTC: UnsafeMutablePointer<Double>, _ pos: UnsafeMutablePointer<Double>, _ vel: UnsafeMutablePointer<Double>, _ llh: UnsafeMutablePointer<Double>) -> Int32 {

    Sgp4PropMse(satKey, mse, ds50UTC, pos, vel, llh)
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
///   - satkey: The unique key of the satellite to propagate. (in-Long)
///   - time: The time to propagate to, expressed in days since 1950, UTC. (in-Double)
///   - minutesSinceEpoch: Resulting time in minutes since the satellite's
///   epoch time. (out-Double)
///   - pos: Resulting ECI position vector (km) in True Equator and Mean Equinox of Epoch. (out-Double[3])
///   - vel: Resulting ECI velocity vector (km/s) in True Equator and Mean Equinox of Epoch. (out-Double[3])
///   - llh: Resulting geodetic latitude (deg), longitude(deg), and height (km). (out-Double[3])
/// - Returns: returns 0 if the propagation is successful, non-0 if there is an error (see error decoder in GP_ERR_?).
public func sgp4PropDs50UTC(_ satKey: Int64, _ ds50UTC: Double, _ mse: UnsafeMutablePointer<Double>, _ pos: UnsafeMutablePointer<Double>, _ vel: UnsafeMutablePointer<Double>, _ llh: UnsafeMutablePointer<Double>) -> Int32 {

    Sgp4PropDs50UTC(satKey, ds50UTC, mse, pos, vel, llh)

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
///   - satKey: The unique key of the satellite to propagate. (in-Long)
///   - ds50UTC: The time to propagate to, expressed in days since 1950, UTC. (in-Double)
///   - llh: Resulting geodetic latitude (deg), longitude(deg), and height (km). (out-Double[3])
/// - Returns: 0 if the propagation is successful, non-0 if there is an error (see error decoder in GP_ERR_?).
public func sgp4PropDs50UtcLLH(_ satKey: Int64, _ ds50UTC: Double, _ llh: UnsafeMutablePointer<Double>) -> Int32 {

    Sgp4PropDs50UtcLLH(satKey, ds50UTC, llh)

}
