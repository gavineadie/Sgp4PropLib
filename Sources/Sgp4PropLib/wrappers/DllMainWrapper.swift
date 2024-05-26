// This wrapper file was generated automatically by the GenDllWrappers program.
import Foundation

#if os(Linux)
fileprivate let libHandle = loadDll("libdllmain.so")
#elseif os(Windows)
fileprivate let libHandle = loadDll("DllMain.dll")
#else
fileprivate let libHandle = loadDll("libdllmain.dylib")
#endif

// Notes: This function has been deprecated since v9.0. 
// Initializes DllMain program (host of Astro Standards libraries) for use in any Astro Standards applications
@available(*, deprecated, message: "This function has been deprecated since v9.0")
public func DllMainInit(  ) -> Int64 {

    typealias FunctionSignature = @convention(c) (  ) -> Int64

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "DllMainInit"), to: FunctionSignature.self)

    return function()
}

// Returns information about the DllMain DLL. 
// The returned string provides information about the version number, build date, and the platform. 
public func DllMainGetInfo( _ infoStr: UnsafeMutablePointer<CChar> ) {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "DllMainGetInfo"), to: FunctionSignature.self)

    function(infoStr)
}

// Loads DllMain-related parameters (AS_MOIC) from a text file
public func DllMainLoadFile( _ dllMainFile: UnsafeMutablePointer<CChar> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "DllMainLoadFile"), to: FunctionSignature.self)

    return function(dllMainFile)
}

// Opens a log file and enables the writing of diagnostic information into it. 
// All of the DLLs in the library will write diagnostic information into the log file once this function has been called.
// If the file specified by logFileName already exists, its contents are erased.
// 
// Enabling logging can potentially result in large amounts of diagnostic information being generated, which can lead to large amounts of storage being consumed as well as performance decreases. For this reason, it is recommended that this function only be used for debugging purposes.
public func OpenLogFile( _ fileName: UnsafeMutablePointer<CChar> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "OpenLogFile"), to: FunctionSignature.self)

    return function(fileName)
}

// Closes the currently open log file and reset the last logged error message to null. 
// Remember to close the log file before exiting the program.
public func CloseLogFile(  ) {

    typealias FunctionSignature = @convention(c) (  ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "CloseLogFile"), to: FunctionSignature.self)

    function()
}

// Writes a message into the log file.
// Make sure the log file is open by calling OpenLogFile before using this function.
// 
// The message is limited to 128 characters. If the message is longer than this, it will be truncated.
public func LogMessage( _ msgStr: UnsafeMutablePointer<CChar> ) {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "LogMessage"), to: FunctionSignature.self)

    function(msgStr)
}

// Returns a character string describing the last error that occurred. 
// As a common practice, this function is called to retrieve the error message when an error occurs.
// 
// This function works with or without an opened log file.
// 
// If you call this function before you have called DllMainInit(), the function will return an invalid string. This could result in undefined behavior.
public func GetLastErrMsg( _ lastErrMsg: UnsafeMutablePointer<CChar> ) {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "GetLastErrMsg"), to: FunctionSignature.self)

    function(lastErrMsg)
}

// Returns a character string describing the last informational message that was recorded. 
// This function is usually called right after space objects (TLEs, VCMs, sensors, observations, etc.) in an input text file were loaded. It gives information about how many records were successfully loaded, how many were bad, and how many were duplicated.
// 
// This function works with or without an opened log file.
// 
// If you call this function before you have called DllMainInit(), the function will return an invalid string. This could result in undefined behavior.
// This function provides a quick way to check whether all of the prerequisite DLLs have been loaded and initialized correctly. Improper initialization of the Standardized Astrodynamic Algorithms DLLs is one of the most common causes of program crashes.
public func GetLastInfoMsg( _ lastInfoMsg: UnsafeMutablePointer<CChar> ) {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "GetLastInfoMsg"), to: FunctionSignature.self)

    function(lastInfoMsg)
}

// Notes: This function has been deprecated since v9.0. 
// Returns a list of names of the Standardized Astrodynamic Algorithms DLLs that were initialized successfully.
@available(*, deprecated, message: "This function has been deprecated since v9.0")
public func GetInitDllNames( _ initDllNames: UnsafeMutablePointer<CChar> ) {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "GetInitDllNames"), to: FunctionSignature.self)

    function(initDllNames)
}

// Tests different input/output data types that are supported by the Astrodynamic Standards library.
public func TestInterface( _ cIn: CChar,
                           _ cOut: UnsafeMutablePointer<CChar>,
                           _ intIn: Int32,
                           _ intOut: UnsafeMutablePointer<Int32>,
                           _ longIn: Int64,
                           _ longOut: UnsafeMutablePointer<Int64>,
                           _ realIn: Double,
                           _ realOut: UnsafeMutablePointer<Double>,
                           _ strIn: UnsafeMutablePointer<CChar>,
                           _ strOut: UnsafeMutablePointer<CChar>,
                           _ int1DIn: UnsafeMutablePointer<Int32>,
                           _ int1DOut: UnsafeMutablePointer<Int32>,
                           _ long1DIn: UnsafeMutablePointer<Int64>,
                           _ long1DOut: UnsafeMutablePointer<Int64>,
                           _ real1DIn: UnsafeMutablePointer<Double>,
                           _ real1DOut: UnsafeMutablePointer<Double>,
                           _ int2DIn: UnsafeMutablePointer<(Int32, Int32, Int32)>,
                           _ int2DOut: UnsafeMutablePointer<(Int32, Int32, Int32)>,
                           _ long2DIn: UnsafeMutablePointer<(Int64, Int64, Int64)>,
                           _ long2DOut: UnsafeMutablePointer<(Int64, Int64, Int64)>,
                           _ real2DIn: UnsafeMutablePointer<(Double, Double, Double)>,
                           _ real2DOut: UnsafeMutablePointer<(Double, Double, Double)> ) {

    let _int2DIn = UnsafeMutableRawPointer(int2DIn).bindMemory(to: Int32.self, capacity: 6)
    let _int2DOut = UnsafeMutableRawPointer(int2DOut).bindMemory(to: Int32.self, capacity: 6)
    let _long2DIn = UnsafeMutableRawPointer(long2DIn).bindMemory(to: Int64.self, capacity: 6)
    let _long2DOut = UnsafeMutableRawPointer(long2DOut).bindMemory(to: Int64.self, capacity: 6)
    let _real2DIn = UnsafeMutableRawPointer(real2DIn).bindMemory(to: Double.self, capacity: 6)
    let _real2DOut = UnsafeMutableRawPointer(real2DOut).bindMemory(to: Double.self, capacity: 6)

    typealias FunctionSignature = @convention(c) ( CChar,
                                                   UnsafeMutablePointer<CChar>,
                                                   Int32,
                                                   UnsafeMutablePointer<Int32>,
                                                   Int64,
                                                   UnsafeMutablePointer<Int64>,
                                                   Double,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Int64>,
                                                   UnsafeMutablePointer<Int64>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Int64>,
                                                   UnsafeMutablePointer<Int64>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "TestInterface"), to: FunctionSignature.self)

    function(cIn, cOut, intIn, intOut, longIn, longOut, realIn, realOut, strIn, strOut, int1DIn, int1DOut, long1DIn, long1DOut, real1DIn, real1DOut, _int2DIn, _int2DOut, _long2DIn, _long2DOut, _real2DIn, _real2DOut)
}

// Tests different input/output data types that are supported by the Astrodynamic Standards library.
public func TestInterface2( _ cInOut: UnsafeMutablePointer<CChar>,
                            _ intInOut: UnsafeMutablePointer<Int32>,
                            _ longInOut: UnsafeMutablePointer<Int64>,
                            _ realInOut: UnsafeMutablePointer<Double>,
                            _ strInOut: UnsafeMutablePointer<CChar>,
                            _ int1DInOut: UnsafeMutablePointer<Int32>,
                            _ long1DInOut: UnsafeMutablePointer<Int64>,
                            _ real1DInOut: UnsafeMutablePointer<Double>,
                            _ int2DInOut: UnsafeMutablePointer<(Int32, Int32, Int32)>,
                            _ long2DInOut: UnsafeMutablePointer<(Int64, Int64, Int64)>,
                            _ real2DInOut: UnsafeMutablePointer<(Double, Double, Double)> ) {

    let _int2DInOut = UnsafeMutableRawPointer(int2DInOut).bindMemory(to: Int32.self, capacity: 6)
    let _long2DInOut = UnsafeMutableRawPointer(long2DInOut).bindMemory(to: Int64.self, capacity: 6)
    let _real2DInOut = UnsafeMutableRawPointer(real2DInOut).bindMemory(to: Double.self, capacity: 6)

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Int64>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Int64>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Int64>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "TestInterface2"), to: FunctionSignature.self)

    function(cInOut, intInOut, longInOut, realInOut, strInOut, int1DInOut, long1DInOut, real1DInOut, _int2DInOut, _long2DInOut, _real2DInOut)
}

// Tests input and output arrays with unknown length that are supported by the Astrodynamic Standards library.
public func TestInterface3( _ Unk1DIn: UnsafeMutablePointer<Int32>,
                            _ Unk1DOut: UnsafeMutablePointer<Int32>,
                            _ Unk2DIn: UnsafeMutablePointer<(Int32, Int32, Int32)>,
                            _ Unk2DOut: UnsafeMutablePointer<(Int32, Int32, Int32)> ) {

    let _Unk2DIn = UnsafeMutableRawPointer(Unk2DIn).bindMemory(to: Int32.self, capacity: 0)
    let _Unk2DOut = UnsafeMutableRawPointer(Unk2DOut).bindMemory(to: Int32.self, capacity: 0)

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Int32> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "TestInterface3"), to: FunctionSignature.self)

    function(Unk1DIn, Unk1DOut, _Unk2DIn, _Unk2DOut)
}

// Returns data parsed from user's AS_MOIC-typed input card - up to 128 fields are allowed.
public func GetMOICData( _ arrSize: Int32, _ xa_moic: UnsafeMutablePointer<Double> ) {

    typealias FunctionSignature = @convention(c) ( Int32,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "GetMOICData"), to: FunctionSignature.self)

    function(arrSize, xa_moic)
}

// Sets ELSET key mode
// This mode can also be turned on if the user loads an input text file that includes this line - "AS_DMA_ON" -
// and is currently calling any of these methods: DllMainLoadFile(), TleLoadFile(), SpVecLoadFile(), or VcmLoadFile()
public func SetElsetKeyMode( _ elset_keyMode: Int32 ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int32 ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SetElsetKeyMode"), to: FunctionSignature.self)

    return function(elset_keyMode)
}

// Gets current ELSET key mode
public func GetElsetKeyMode(  ) -> Int32 {

    typealias FunctionSignature = @convention(c) (  ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "GetElsetKeyMode"), to: FunctionSignature.self)

    return function()
}

// Sets key mode for ALL (elsets/obs/sensors). This takes precedence over individual elset/obs/sensor key mode
// This mode can also be turned on if the user loads an input text file that includes this line - "AS_DMA_ALL_ON"
public func SetAllKeyMode( _ all_keyMode: Int32 ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int32 ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SetAllKeyMode"), to: FunctionSignature.self)

    return function(all_keyMode)
}

// Gets current ALL (elsets/obs/sensors) key mode
public func GetAllKeyMode(  ) -> Int32 {

    typealias FunctionSignature = @convention(c) (  ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "GetAllKeyMode"), to: FunctionSignature.self)

    return function()
}

// Resets ALL (elsets/obs/sensors) key mode to its default value which then allows individual elsets/obs/sensors to use their own key mode settings.
// Also reset DUPLICATION key mode to its default value.
public func ResetAllKeyMode(  ) {

    typealias FunctionSignature = @convention(c) (  ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "ResetAllKeyMode"), to: FunctionSignature.self)

    function()
}

// Sets DUPLICATION key mode - change the default behavior of returning a key which already exists in memory: zero versus actual value
public func SetDupKeyMode( _ dupKeyMode: Int32 ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int32 ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SetDupKeyMode"), to: FunctionSignature.self)

    return function(dupKeyMode)
}

// Gets current DUPLICATION key mode
public func GetDupKeyMode(  ) -> Int32 {

    typealias FunctionSignature = @convention(c) (  ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "GetDupKeyMode"), to: FunctionSignature.self)

    return function()
}

// log message string length
public let LOGMSGLEN = 128

// DHN 06Feb12 - Increase file path length to 512 characters from 128 characters to handle longer file path
public let FILEPATHLEN = 512

// DHN 10Feb12 - Uniformally using 512 characters to passing/receiving string in all Get/Set Field functions
public let GETSETSTRLEN = 512

public let INFOSTRLEN = 128

// DHN 10Feb12 - All input card types' (elsets, ob, sensors, ...) can now have maximum of 512 characters
public let INPUTCARDLEN = 512

// Different orbital element types
//Element type - SGP Tle type 0
public let ELTTYPE_TLE_SGP   = 1
//Element type - SGP4 Tle type 2
public let ELTTYPE_TLE_SGP4  = 2
//Element type - SP Tle type 6
public let ELTTYPE_TLE_SP    = 3
//Element type - SP Vector
public let ELTTYPE_SPVEC_B1P = 4
//Element type - VCM
public let ELTTYPE_VCM       = 5
//Element type - External ephemeris
public let ELTTYPE_EXTEPH    = 6
//Element type - SGP Tle type 4 - XP
public let ELTTYPE_TLE_XP    = 7

//*******************************************************************************

// Propagation types
//GP/SGP4/SGP4-XP propagator
public let PROPTYPE_GP  = 1
//SP propagator
public let PROPTYPE_SP  = 2
//External ephemeris
public let PROPTYPE_X   = 3
//Unknown
public let PROPTYPE_UK  = 4
//*******************************************************************************

// Add sat error
//Bad satellite key
public let BADSATKEY = -1
//Duplicate satellite key
public let DUPSATKEY =  0

//*******************************************************************************

// satellite/observation/sensor key possible errors
//Bad (satellite/observation/sensor) key
public let BADKEY = -1
//Duplicate (satellite/observation/sensor) key
public let DUPKEY =  0

//*******************************************************************************

// Options used in GetLoaded()
//ascending order
public let IDX_ORDER_ASC   = 0
//descending order
public let IDX_ORDER_DES   = 1
//order as read
public let IDX_ORDER_READ  = 2
//tree traversal order
public let IDX_ORDER_QUICK = 9

//*******************************************************************************

// Different key mode options for all elset-satKey/obs-obsKey/sensor-senKey
//Default - duplicate elsets/observations/sensors can not be loaded in their binary trees
public let ALL_KEYMODE_NODUP  = 0
//Allow duplicate elsets/obs/sensor to be loaded and have direct memory access (DMA - no duplication check and no binary tree)
public let ALL_KEYMODE_DMA    = 1

//*******************************************************************************


// Different key mode options for elset satKey
//Default - duplicate elsets can not be loaded in binary tree
public let ELSET_KEYMODE_NODUP  = 0
//Allow duplicate elsets to be loaded and have direct memory access (DMA - no duplication check and no binary tree)
public let ELSET_KEYMODE_DMA    = 1

//*******************************************************************************

// Different duplication key mode options (apply to non DMA mode only)
//Returning (satellite/sensor/obs) key is zero to signify the existing data/key was already in memory
public let DUPKEY_ZERO   = 0
//Return actual (satellite/sensor/obs) key regardless of the key/data duplication
public let DUPKEY_ACTUAL = 1

//*******************************************************************************


//Input time is in minutes since epoch
public let TIME_IS_MSE = 1
//Input time is in days since 1950 TAI
public let TIME_IS_TAI = 2
//Input time is in days since 1950 UTC
public let TIME_IS_UTC = 3

//*******************************************************************************

// ========================= End of auto generated code ==========================
