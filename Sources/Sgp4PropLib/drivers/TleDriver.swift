//
//  TleDriver.swift
//
//
//  Created by Gavin Eadie on 12/4/22.
//

import Foundation

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
