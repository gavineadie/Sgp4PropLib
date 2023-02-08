// This wrapper file was generated automatically by the GenDllWrappers program.
import Foundation

#if os(Linux)
fileprivate let libHandle = loadDll("libtimefunc.so")
#elseif os(Windows)
fileprivate let libHandle = loadDll("TimeFunc.dll")
#else
fileprivate let libHandle = loadDll("libtimefunc.dylib")
#endif

// Notes: This function has been deprecated since v9.0.
// Initializes the TimeFunc DLL for use in the program.
// If this function returns an error, it is recommended that you stop the program immediately.
//
// An error will occur if you forget to load and initialize all the prerequisite DLLs, as listed in the DLL Prerequisites section of the accompanying documentation, before using this DLL.
public func TimeFuncInit( _ apAddr: Int64 ) -> Int32 {

    typealias functionSignature = @convention(c) ( Int64 ) -> Int32

    let function = unsafeBitCast(getFunctionPointer(libHandle, "TimeFuncInit"), to: functionSignature.self)

    return function(apAddr)
}

// Returns the information about the TimeFunc DLL.  The information is placed in the string parameter you pass in.
// The returned string provides information about the version number, build date, and the platform of the TimeFunc DLL.
public func TimeFuncGetInfo( _ infoStr: UnsafeMutablePointer<CChar> ) {

    typealias functionSignature = @convention(c) ( UnsafeMutablePointer<CChar> ) -> Void

    let function = unsafeBitCast(getFunctionPointer(libHandle, "TimeFuncGetInfo"), to: functionSignature.self)

    function(infoStr)
}

// Loads timing constants data from an input file.
// Time constants can be included directly in the main input file or they can be read from a separate file identified with "TIMFIL=[pathname\filename]".
//
// The input file is read in two passes. The function first looks for "TIMFIL=" lines, then it looks for timing constant data which was included directly. The result of this is that data entered using both methods will be processed, but the "TIMFIL=" data will be processed first.
//
// The time constants are also read in from each VCM. However, only the most recent time constants among VCMs are stored in the memory, see VCM.dll documentation.
// See the "Time Constants Data Description" section in the accompanying TimeFunc documentation file for supported formats.
public func TConLoadFile( _ tconFile: UnsafeMutablePointer<CChar> ) -> Int32 {

    typealias functionSignature = @convention(c) ( UnsafeMutablePointer<CChar> ) -> Int32

    let function = unsafeBitCast(getFunctionPointer(libHandle, "TConLoadFile"), to: functionSignature.self)

    return function(tconFile)
}

// Loads timing constants data and prediction control (6P-card) from an input file.
// Time constants can be included directly in the main input file or they can be read from a separate file identified with "TIMFIL=[pathname\filename]".
//
// The input file is read in two passes. The function first looks for "TIMFIL=" lines, then it looks for timing constant data which was included directly. The result of this is that data entered using both methods will be processed, but the "TIMFIL=" data will be processed first.
//
// The time constants are also read in from each VCM. However, only the most recent time constants among VCMs are stored in the memory, see VCM.dll documentation.
public func TimeFuncLoadFile( _ tconFile: UnsafeMutablePointer<CChar> ) -> Int32 {

    typealias functionSignature = @convention(c) ( UnsafeMutablePointer<CChar> ) -> Int32

    let function = unsafeBitCast(getFunctionPointer(libHandle, "TimeFuncLoadFile"), to: functionSignature.self)

    return function(tconFile)
}

// Checks to see if timing constants have been loaded into memory.
// The timing constants can be loaded from a timing constants file or from VCM(s).  See TConLoadFile, TConAddOne, and TConAddARec functions.
public func IsTConFileLoaded(  ) -> Int32 {

    typealias functionSignature = @convention(c) (  ) -> Int32

    let function = unsafeBitCast(getFunctionPointer(libHandle, "IsTConFileLoaded"), to: functionSignature.self)

    return function()
}

// Saves currently loaded timing constants data to a file.
// The data will be saved in the format specified by the form parameter, regardless of the format or method originally used to load it.
public func TConSaveFile( _ tconFile: UnsafeMutablePointer<CChar>,
                          _ saveMode: Int32,
                          _ saveForm: Int32 ) -> Int32 {

    typealias functionSignature = @convention(c) ( UnsafeMutablePointer<CChar>,
                                                   Int32,
                                                   Int32 ) -> Int32

    let function = unsafeBitCast(getFunctionPointer(libHandle, "TConSaveFile"), to: functionSignature.self)

    return function(tconFile, saveMode, saveForm)
}

// Adds a timing constant record to memory. Note that this function is solely for backward compatible with legacy software.
// The users should use TConLoadFile or TimeFuncLoadFile to load timing constants file instead.
public func TConAddARec( _ refDs50UTC: Double,
                         _ leapDs50UTC: Double,
                         _ taiMinusUTC: Double,
                         _ ut1MinusUTC: Double,
                         _ ut1Rate: Double,
                         _ polarX: Double,
                         _ polarY: Double ) -> Int32 {

    typealias functionSignature = @convention(c) ( Double,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   Double ) -> Int32

    let function = unsafeBitCast(getFunctionPointer(libHandle, "TConAddARec"), to: functionSignature.self)

    return function(refDs50UTC, leapDs50UTC, taiMinusUTC, ut1MinusUTC, ut1Rate, polarX, polarY)
}

// Adds one timing constant record to memory. This API can be used to avoid TConLoadFile's file I/O
public func TConAddOne( _ refDs50UTC: Double,
                        _ taiMinusUTC: Double,
                        _ ut1MinusUTC: Double,
                        _ ut1Rate: Double,
                        _ polarX: Double,
                        _ polarY: Double ) -> Int32 {

    typealias functionSignature = @convention(c) ( Double,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   Double ) -> Int32

    let function = unsafeBitCast(getFunctionPointer(libHandle, "TConAddOne"), to: functionSignature.self)

    return function(refDs50UTC, taiMinusUTC, ut1MinusUTC, ut1Rate, polarX, polarY)
}

// Retrieves the timing constants record, if exists, at the requested input time in ds50UTC.
// If the requested record is not found, 0's will be returned for all of the constants. You can use this fact to determine whether the record was found or not. Simply check the taiMinusUTC value after calling this function. Since that value can never be 0 for a valid record, if it is 0 the record was not found.
public func UTCToTConRec( _ ds50UTC: Double,
                          _ taiMinusUTC: UnsafeMutablePointer<Double>,
                          _ ut1MinusUTC: UnsafeMutablePointer<Double>,
                          _ ut1Rate: UnsafeMutablePointer<Double>,
                          _ polarX: UnsafeMutablePointer<Double>,
                          _ polarY: UnsafeMutablePointer<Double> ) {

    typealias functionSignature = @convention(c) ( Double,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeBitCast(getFunctionPointer(libHandle, "UTCToTConRec"), to: functionSignature.self)

    function(ds50UTC, taiMinusUTC, ut1MinusUTC, ut1Rate, polarX, polarY)
}

// Removes all the timing constants records in memory.
public func TConRemoveAll(  ) -> Int32 {

    typealias functionSignature = @convention(c) (  ) -> Int32

    let function = unsafeBitCast(getFunctionPointer(libHandle, "TConRemoveAll"), to: functionSignature.self)

    return function()
}

// Converts an internal time in ds50UTC to a string in DTG20 format. The resulting string takes the form "YYYY/DDD HHMM SS.SSS".
// The input ds50UTC must be greater than 2192.0, which corresponds to a time later than 1st Jan 1956. Any input value less than or equal to 2192.0 will yield "1956/001 0000 00.000".
public func UTCToDTG20( _ ds50UTC: Double, _ dtg20: UnsafeMutablePointer<CChar> ) {

    typealias functionSignature = @convention(c) ( Double,
                                                   UnsafeMutablePointer<CChar> ) -> Void

    let function = unsafeBitCast(getFunctionPointer(libHandle, "UTCToDTG20"), to: functionSignature.self)

    function(ds50UTC, dtg20)
}

// Converts a time in ds50UTC to a time in DTG19 format. The resulting string takes the form "YYYYMonDDHHMMSS.SSS".
// See "UTCToDTG20" for an example.
// The input ds50UTC must be greater than 2192.0, which corresponds to a time later than 1st Jan 1956. Any input value less than or equal to 2192.0 will yield "1956Jan01000000.000".
// Note, the return value is in the DTG19 format "YYYYMonDDHHMMSS.SSS", not the "YY DDD HH MM SS.SSS" format.
public func UTCToDTG19( _ ds50UTC: Double, _ dtg19: UnsafeMutablePointer<CChar> ) {

    typealias functionSignature = @convention(c) ( Double,
                                                   UnsafeMutablePointer<CChar> ) -> Void

    let function = unsafeBitCast(getFunctionPointer(libHandle, "UTCToDTG19"), to: functionSignature.self)

    function(ds50UTC, dtg19)
}

// Converts a time in ds50UTC to a time in DTG17 format. The resulting string takes the form "YYYY/DDD.DDDDDDDD" format.
// See "UTCToDTG20" for an example.
// The input ds50UTC must be greater than 2192.0, which corresponds to a time later than 1st Jan 1956. Any input value less than or equal to 2192.0 will yield "1956/001.00000000".
public func UTCToDTG17( _ ds50UTC: Double, _ dtg17: UnsafeMutablePointer<CChar> ) {

    typealias functionSignature = @convention(c) ( Double,
                                                   UnsafeMutablePointer<CChar> ) -> Void

    let function = unsafeBitCast(getFunctionPointer(libHandle, "UTCToDTG17"), to: functionSignature.self)

    function(ds50UTC, dtg17)
}

// Converts a time in ds50UTC to a time in DTG15 format. The resulting string takes the form "YYDDDHHMMSS.SSS".
// See "UTCToDTG20" for an example.
// The input ds50UTC must be greater than 2192.0, which corresponds to a time later than 1st Jan 1956. Any input value less than or equal to 2192.0 will yield "56001000000.000".
public func UTCToDTG15( _ ds50UTC: Double, _ dtg15: UnsafeMutablePointer<CChar> ) {

    typealias functionSignature = @convention(c) ( Double,
                                                   UnsafeMutablePointer<CChar> ) -> Void

    let function = unsafeBitCast(getFunctionPointer(libHandle, "UTCToDTG15"), to: functionSignature.self)

    function(ds50UTC, dtg15)
}

// Converts a time in one of the DTG formats to a time in ds50UTC. DTG15, DTG17, DTG19, and DTG20 formats are accepted.
// See "UTCToDTG20" for an example.
// During the conversion, this function processes only numbers and the '.' character. This means that you can format dtgStr in a format that makes sense. You can use spaces and the '/' character for example if you wish.
//
// The function can process dates from 1950 to 2049. Any input outside this range will yield "0.0".
// This function supports DTG19 inputs in both "YY DDD HH MM SS.SSS" and "YYYYMonDDHHMMSS.SSS" formats.
public func DTGToUTC( _ dtg: UnsafeMutablePointer<CChar> ) -> Double {

    typealias functionSignature = @convention(c) ( UnsafeMutablePointer<CChar> ) -> Double

    let function = unsafeBitCast(getFunctionPointer(libHandle, "DTGToUTC"), to: functionSignature.self)

    return function(dtg)
}

// Converts a time in ds50UTC to a time in ds50TAI using timing constants records in memory.
// If no timing constants records were loaded, ds50UTC and ds50TAI are the same.
// Partial days may be returned.
public func UTCToTAI( _ ds50UTC: Double ) -> Double {

    typealias functionSignature = @convention(c) ( Double ) -> Double

    let function = unsafeBitCast(getFunctionPointer(libHandle, "UTCToTAI"), to: functionSignature.self)

    return function(ds50UTC)
}

// Converts a time in ds50UTC to a time in ds50UT1 using timing constants records in memory.
// If no timing constants records were loaded, ds50UTC and ds50UT1 are the same.
// Partial days may be returned.
public func UTCToUT1( _ ds50UTC: Double ) -> Double {

    typealias functionSignature = @convention(c) ( Double ) -> Double

    let function = unsafeBitCast(getFunctionPointer(libHandle, "UTCToUT1"), to: functionSignature.self)

    return function(ds50UTC)
}

// Converts a time in ds50UTC to a time in ds50ET using timing constants records in memory.
// If no timing constants records were loaded, ds50UTC and ds50UT1 are the same.
// Partial days may be returned.
public func UTCToET( _ ds50UTC: Double ) -> Double {

    typealias functionSignature = @convention(c) ( Double ) -> Double

    let function = unsafeBitCast(getFunctionPointer(libHandle, "UTCToET"), to: functionSignature.self)

    return function(ds50UTC)
}

// Converts a time in ds50TAI to a time in ds50UTC using timing constants records in memory.
// If no timing constants records were loaded, ds50TAI and ds50UTC are the same.
// Partial days may be returned.
public func TAIToUTC( _ ds50TAI: Double ) -> Double {

    typealias functionSignature = @convention(c) ( Double ) -> Double

    let function = unsafeBitCast(getFunctionPointer(libHandle, "TAIToUTC"), to: functionSignature.self)

    return function(ds50TAI)
}

// Converts a time in ds50TAI to a time in ds50UT1 using timing constants records in memory.
// If no timing constants records were loaded, ds50TAI and ds50UT1 are the same.
// Partial days may be returned.
public func TAIToUT1( _ ds50TAI: Double ) -> Double {

    typealias functionSignature = @convention(c) ( Double ) -> Double

    let function = unsafeBitCast(getFunctionPointer(libHandle, "TAIToUT1"), to: functionSignature.self)

    return function(ds50TAI)
}

// Converts a year and a number of days to a time in ds50UTC.
// Partial days may be returned.
public func YrDaysToUTC( _ year: Int32, _ dayOfYear: Double ) -> Double {

    typealias functionSignature = @convention(c) ( Int32,
                                                   Double ) -> Double

    let function = unsafeBitCast(getFunctionPointer(libHandle, "YrDaysToUTC"), to: functionSignature.self)

    return function(year, dayOfYear)
}

// Converts a time in ds50UTC to a year and day of year.
// The input ds50UTC must be greater than 2192.0, which corresponds to a time later than 1st Jan 1956. Any input value less than or equal to 2192.0 will yield Year=1956, Day=1.0.
public func UTCToYrDays( _ ds50UTC: Double,
                         _ year: UnsafeMutablePointer<Int32>,
                         _ dayOfYear: UnsafeMutablePointer<Double> ) {

    typealias functionSignature = @convention(c) ( Double,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeBitCast(getFunctionPointer(libHandle, "UTCToYrDays"), to: functionSignature.self)

    function(ds50UTC, year, dayOfYear)
}

// Converts a set of time components (year, day of year, hour, minute, second) to a time in ds50UTC.
// Partial days may be returned.
// See "TimeComps2ToUTC" for a function which takes a month and day instead of a day of year value.
public func TimeComps1ToUTC( _ year: Int32,
                             _ dayOfYear: Int32,
                             _ hh: Int32,
                             _ mm: Int32,
                             _ sss: Double ) -> Double {

    typealias functionSignature = @convention(c) ( Int32,
                                                   Int32,
                                                   Int32,
                                                   Int32,
                                                   Double ) -> Double

    let function = unsafeBitCast(getFunctionPointer(libHandle, "TimeComps1ToUTC"), to: functionSignature.self)

    return function(year, dayOfYear, hh, mm, sss)
}

// Converts a time in ds50UTC to its individual components (year, day of year, hour, minute, second).
// See "TimeComps1ToUTC" for an example.
// The input ds50UTC must be greater than 2192.0, which corresponds to a time later than 1st Jan 1956. Any input value less than or equal to 2192.0 will be reset to that value.
public func UTCToTimeComps1( _ ds50UTC: Double,
                             _ year: UnsafeMutablePointer<Int32>,
                             _ dayOfYear: UnsafeMutablePointer<Int32>,
                             _ hh: UnsafeMutablePointer<Int32>,
                             _ mm: UnsafeMutablePointer<Int32>,
                             _ sss: UnsafeMutablePointer<Double> ) {

    typealias functionSignature = @convention(c) ( Double,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeBitCast(getFunctionPointer(libHandle, "UTCToTimeComps1"), to: functionSignature.self)

    function(ds50UTC, year, dayOfYear, hh, mm, sss)
}

// Converts a set of time components (year, month, day of month, hour, minute, second) to a time in ds50UTC.
// Partial days may be returned.
// See "TimeComps1ToUTC" for a function which takes a day of year value instead of a month and day.
public func TimeComps2ToUTC( _ year: Int32,
                             _ mon: Int32,
                             _ dayOfMonth: Int32,
                             _ hh: Int32,
                             _ mm: Int32,
                             _ sss: Double ) -> Double {

    typealias functionSignature = @convention(c) ( Int32,
                                                   Int32,
                                                   Int32,
                                                   Int32,
                                                   Int32,
                                                   Double ) -> Double

    let function = unsafeBitCast(getFunctionPointer(libHandle, "TimeComps2ToUTC"), to: functionSignature.self)

    return function(year, mon, dayOfMonth, hh, mm, sss)
}

// Converts a time in ds50UTC to its individual components (year, month, day of month, hour, minute, second).
// See "TimeComps1ToUTC" for an example.
// The input ds50UTC must be greater than 2192.0, which corresponds to a time later than 1st Jan 1956. Any input value less than or equal to 2192.0 will be reset to that value.
public func UTCToTimeComps2( _ ds50UTC: Double,
                             _ year: UnsafeMutablePointer<Int32>,
                             _ month: UnsafeMutablePointer<Int32>,
                             _ dayOfMonth: UnsafeMutablePointer<Int32>,
                             _ hh: UnsafeMutablePointer<Int32>,
                             _ mm: UnsafeMutablePointer<Int32>,
                             _ sss: UnsafeMutablePointer<Double> ) {

    typealias functionSignature = @convention(c) ( Double,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeBitCast(getFunctionPointer(libHandle, "UTCToTimeComps2"), to: functionSignature.self)

    function(ds50UTC, year, month, dayOfMonth, hh, mm, sss)
}

// Computes right ascension of Greenwich at the specified time in ds50UT1.
// The Fk constants as you currently have them set up in EnvConst.dll are used.
// EnvConst.dll is not marked as a direct dependency of TimeFunc.dll. However, it obviously must be loaded in order to be able to use this function since you must first obtain a handle via the EnvGetFkPtr() function.
public func ThetaGrnwch( _ ds50UT1: Double, _ lenvFk: Int64 ) -> Double {

    typealias functionSignature = @convention(c) ( Double,
                                                   Int64 ) -> Double

    let function = unsafeBitCast(getFunctionPointer(libHandle, "ThetaGrnwch"), to: functionSignature.self)

    return function(ds50UT1, lenvFk)
}

// Computes right ascension of Greenwich at the specified time in ds50UT1 using the Fourth Fundamental Catalogue (FK4).
// There is no need to load or initialize EnvConst.dll when computing right ascension using this function.
public func ThetaGrnwchFK4( _ ds50UT1: Double ) -> Double {

    typealias functionSignature = @convention(c) ( Double ) -> Double

    let function = unsafeBitCast(getFunctionPointer(libHandle, "ThetaGrnwchFK4"), to: functionSignature.self)

    return function(ds50UT1)
}

// Computes right ascension of Greenwich at the specified time in ds50UT1 using the Fifth Fundamental Catalogue (FK5).
// There is no need to load or initialize EnvConst.dll when computing right ascension using this function.
public func ThetaGrnwchFK5( _ ds50UT1: Double ) -> Double {

    typealias functionSignature = @convention(c) ( Double ) -> Double

    let function = unsafeBitCast(getFunctionPointer(libHandle, "ThetaGrnwchFK5"), to: functionSignature.self)

    return function(ds50UT1)
}

// This function is intended for future use.  No information is currently available.
// This function is intended for future use.  No information is currently available.
public func TimeConvFrTo( _ funcIdx: Int32,
                          _ frArr: UnsafeMutablePointer<Double>,
                          _ toArr: UnsafeMutablePointer<Double> ) {

    typealias functionSignature = @convention(c) ( Int32,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeBitCast(getFunctionPointer(libHandle, "TimeConvFrTo"), to: functionSignature.self)

    function(funcIdx, frArr, toArr)
}

// Returns prediction control parameters. The parameters are placed in the reference variables passed to this function.
public func Get6P( _ startFrEpoch: UnsafeMutablePointer<Int32>,
                   _ stopFrEpoch: UnsafeMutablePointer<Int32>,
                   _ startTime: UnsafeMutablePointer<Double>,
                   _ stopTime: UnsafeMutablePointer<Double>,
                   _ interval: UnsafeMutablePointer<Double> ) {

    typealias functionSignature = @convention(c) ( UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeBitCast(getFunctionPointer(libHandle, "Get6P"), to: functionSignature.self)

    function(startFrEpoch, stopFrEpoch, startTime, stopTime, interval)
}

// Sets prediction control parameters.
public func Set6P( _ startFrEpoch: Int32,
                   _ stopFrEpoch: Int32,
                   _ startTime: Double,
                   _ stopTime: Double,
                   _ interval: Double ) {

    typealias functionSignature = @convention(c) ( Int32,
                                                   Int32,
                                                   Double,
                                                   Double,
                                                   Double ) -> Void

    let function = unsafeBitCast(getFunctionPointer(libHandle, "Set6P"), to: functionSignature.self)

    function(startFrEpoch, stopFrEpoch, startTime, stopTime, interval)
}

// Returns current prediction control parameters in form of a 6P-Card string.
public func Get6PCardLine( _ card6PLine: UnsafeMutablePointer<CChar> ) {

    typealias functionSignature = @convention(c) ( UnsafeMutablePointer<CChar> ) -> Void

    let function = unsafeBitCast(getFunctionPointer(libHandle, "Get6PCardLine"), to: functionSignature.self)

    function(card6PLine)
}

// ========================= End of auto generated code ==========================
