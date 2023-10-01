// This wrapper file was generated automatically by the GenDllWrappers program.
import Foundation

#if os(Linux)
fileprivate let libHandle = loadDll("libextephem.so")
#elseif os(Windows)
fileprivate let libHandle = loadDll("ExtEphem.dll")
#else
fileprivate let libHandle = loadDll("libextephem.dylib")
#endif

// Notes: This function has been deprecated since v9.0. 
// Initializes ExtEphem DLL for use in the program
// If this function returns an error, it is recommended that the users stop the program immediately. 
// The error occurs if the users forget to load and initialize all the prerequisite DLLs, as listed 
// in the DLL Prerequisite section, before using this DLL.
public func ExtEphInit( _ apAddr: Int64 ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64 ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "ExtEphInit"), to: FunctionSignature.self)

    return function(apAddr)
}

// Returns information about the current version of ExtEphem DLL. 
// The information is placed in the string parameter passed in.
// The returned string provides information about the version number, build date, and the platform of the ExtEphem DLL. 
public func ExtEphGetInfo( _ infoStr: UnsafeMutablePointer<CChar> ) {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "ExtEphGetInfo"), to: FunctionSignature.self)

    function(infoStr)
}

// Loads a file containing EXTEPHEM's
// The users can use this function repeatedly to load EXTEPHEMs from different input files. 
// However, only unique satKeys are stored in the binary tree. Duplicated EXTEPHEMs 
// (determined by same file name, satellite number + epoch) won't be stored.
// 
// EXTEPHEMs can be included directly in the main input file or they can be read from a 
// separate file identified with "EPHFIL =[pathname\filename]".
// 
// This function only reads EXTEPHEMs from the main input file or EXTEPHEMs from the file 
// identified with EPHFIL in the input file. It won't read anything else.
public func ExtEphLoadFile( _ extEphFile: UnsafeMutablePointer<CChar> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "ExtEphLoadFile"), to: FunctionSignature.self)

    return function(extEphFile)
}

// Saves the currently loaded EXTEPHEM's to a file (EPHFIL=input file name)
public func ExtEphSaveFile( _ extEphFile: UnsafeMutablePointer<CChar>,
                            _ saveMode: Int32,
                            _ saveForm: Int32 ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar>,
                                                   Int32,
                                                   Int32 ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "ExtEphSaveFile"), to: FunctionSignature.self)

    return function(extEphFile, saveMode, saveForm)
}

// Removes an EXTEPHEM represented by the satKey from memory
// If the users enter an invalid satKey (the satKey does not exist in memory), the function will return a non-zero value indicating an error.
public func ExtEphRemoveSat( _ satKey: Int64 ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64 ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "ExtEphRemoveSat"), to: FunctionSignature.self)

    return function(satKey)
}

// Removes all EXTEPHEMS from memory
public func ExtEphRemoveAllSats(  ) -> Int32 {

    typealias FunctionSignature = @convention(c) (  ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "ExtEphRemoveAllSats"), to: FunctionSignature.self)

    return function()
}

// Returns the number of EXTEPHEM's currently loaded
// See ExtEphGetLoaded for example.
// This function is useful for dynamically allocating memory for the array that is passed to the function ExtEphGetLoaded().
public func ExtEphGetCount(  ) -> Int32 {

    typealias FunctionSignature = @convention(c) (  ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "ExtEphGetCount"), to: FunctionSignature.self)

    return function()
}

// Retrieves all of the currently loaded satKeys. These satKeys can be used to access the external ephemeris data for the EXTEPHEM's
// It is recommended that ExtEphGetCount() is used to count how many satellites are currently loaded in the ExtEphem DLL's binary tree. 
// The users then use this number to dynamically allocate the satKeys array and pass it to this function.
// 
// If the users prefer to pass a static array to the function, ensure that it is big enough to store all the satKeys in memory.
public func ExtEphGetLoaded( _ order: Int32, _ satKeys: UnsafeMutablePointer<Int64> ) {

    typealias FunctionSignature = @convention(c) ( Int32,
                                                   UnsafeMutablePointer<Int64> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "ExtEphGetLoaded"), to: FunctionSignature.self)

    function(order, satKeys)
}

// Allows for an EXTEPHEM to be added to memory without using an input file. The function creates a place holder for an EXTEPHEM
// If the same satellite (same satNum and epochDs50UTC) was previously added to the ExtEphem DLL's binary tree, 
// the function will generate a new unique satKey. This is very useful when the users want to compare ephemerides 
// of the same satellite number and same epoch time from different sources. 
public func ExtEphAddSat( _ satNum: Int32,
                          _ epochDs50UTC: Double,
                          _ AE: Double,
                          _ Ke: Double,
                          _ coordSys: Int32 ) -> Int64 {

    typealias FunctionSignature = @convention(c) ( Int32,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   Int32 ) -> Int64

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "ExtEphAddSat"), to: FunctionSignature.self)

    return function(satNum, epochDs50UTC, AE, Ke, coordSys)
}

// Adds an ephemeris point to the end of an EXTEPHEM's set of ephemeris points
// The new ephemeris point will only be added to the array if its time is greater than the times of all points already in the array. 
// Therefore, the array is always in sorted order (t1 &lt; t2 &lt;... &lt; tn).
public func ExtEphAddSatEphem( _ satKey: Int64,
                               _ ds50UTC: Double,
                               _ pos: UnsafeMutablePointer<Double>,
                               _ vel: UnsafeMutablePointer<Double>,
                               _ revNum: Int32 ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   Double,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   Int32 ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "ExtEphAddSatEphem"), to: FunctionSignature.self)

    return function(satKey, ds50UTC, pos, vel, revNum)
}

// Adds an ephemeris point (including covariance matrix) to the end of an EXTEPHEM's set of ephemeris points
public func ExtEphAddSatEphemCovMtx( _ satKey: Int64,
                                     _ ds50UTC: Double,
                                     _ pos: UnsafeMutablePointer<Double>,
                                     _ vel: UnsafeMutablePointer<Double>,
                                     _ revNum: Int32,
                                     _ covUVW: UnsafeMutablePointer<Double> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   Double,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   Int32,
                                                   UnsafeMutablePointer<Double> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "ExtEphAddSatEphemCovMtx"), to: FunctionSignature.self)

    return function(satKey, ds50UTC, pos, vel, revNum, covUVW)
}

// Adds an ephemeris point (including covariance matrix) to the end of an EXTEPHEM's set of ephemeris points
public func ExtEphAddSatEphemExt( _ satKey: Int64,
                                  _ ds50UTC: Double,
                                  _ pos: UnsafeMutablePointer<Double>,
                                  _ vel: UnsafeMutablePointer<Double>,
                                  _ revNum: Int32,
                                  _ extArr: UnsafeMutablePointer<Double> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   Double,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   Int32,
                                                   UnsafeMutablePointer<Double> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "ExtEphAddSatEphemExt"), to: FunctionSignature.self)

    return function(satKey, ds50UTC, pos, vel, revNum, extArr)
}

// Loads satellite data from an external ephemeris file (any valid external ephemeris file formats) and returns a satKey on success
public func ExtEphAddSatFrFile( _ extEphFile: UnsafeMutablePointer<CChar> ) -> Int64 {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar> ) -> Int64

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "ExtEphAddSatFrFile"), to: FunctionSignature.self)

    return function(extEphFile)
}

// Retrieves all data for an EXTEPHEM with a single function call
public func ExtEphGetAllFields( _ satKey: Int64,
                                _ satNum: UnsafeMutablePointer<Int32>,
                                _ satName: UnsafeMutablePointer<CChar>,
                                _ recName: UnsafeMutablePointer<CChar>,
                                _ epochDs50UTC: UnsafeMutablePointer<Double>,
                                _ AE: UnsafeMutablePointer<Double>,
                                _ Ke: UnsafeMutablePointer<Double>,
                                _ pos: UnsafeMutablePointer<Double>,
                                _ vel: UnsafeMutablePointer<Double>,
                                _ coordSys: UnsafeMutablePointer<Int32>,
                                _ numOfPts: UnsafeMutablePointer<Int32>,
                                _ fileLoc: UnsafeMutablePointer<CChar> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<CChar> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "ExtEphGetAllFields"), to: FunctionSignature.self)

    return function(satKey, satNum, satName, recName, epochDs50UTC, AE, Ke, pos, vel, coordSys, numOfPts, fileLoc)
}

// Retrieves the value of a specific field of an EXTEPHEM
// <br>
// When using xf_ExtEph = 11, the input coordinate system is returned as an integer value.  The table below shows the coordinate system values:
// <table>
// <caption>table</caption>
// <tr>
// <td><b>Value</b></td>
// <td><b>Coordinate System</b></td>
// </tr>
// <tr><td>1  </td><td>ECI TEME of DATE</td></tr>
// <tr><td>2  </td><td>MEME of J2K</td></tr>
// <tr><td>3  </td><td>Earth Fixed Greenwich (EFG)</td></tr>
// <tr><td>4  </td><td>Earch Centered Rotation (ECR)</td></tr>
// <tr><td>100</td><td>Invalid</td></tr>
// </table>   
public func ExtEphGetField( _ satKey: Int64,
                            _ xf_ExtEph: Int32,
                            _ valueStr: UnsafeMutablePointer<CChar> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   Int32,
                                                   UnsafeMutablePointer<CChar> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "ExtEphGetField"), to: FunctionSignature.self)

    return function(satKey, xf_ExtEph, valueStr)
}

// Updates the value of a specific field of an EXTEPHEM
public func ExtEphSetField( _ satKey: Int64,
                            _ xf_ExtEph: Int32,
                            _ valueStr: UnsafeMutablePointer<CChar> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   Int32,
                                                   UnsafeMutablePointer<CChar> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "ExtEphSetField"), to: FunctionSignature.self)

    return function(satKey, xf_ExtEph, valueStr)
}

// Retrieves the times (in days since 1950 UTC) of the start and end ephemeris points of the EXTEPHEM  
public func ExtEphStartEndTime( _ satKey: Int64,
                                _ startDs50UTC: UnsafeMutablePointer<Double>,
                                _ endDs50UTC: UnsafeMutablePointer<Double> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "ExtEphStartEndTime"), to: FunctionSignature.self)

    return function(satKey, startDs50UTC, endDs50UTC)
}

// Retrieves the data for a specific point within an EXTEPHEM
// It is important to know that the array subscript starts at one (not zero).
public func ExtEphGetEphemeris( _ satKey: Int64,
                                _ index: Int32,
                                _ ds50UTC: UnsafeMutablePointer<Double>,
                                _ pos: UnsafeMutablePointer<Double>,
                                _ vel: UnsafeMutablePointer<Double>,
                                _ revNum: UnsafeMutablePointer<Int32> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   Int32,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Int32> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "ExtEphGetEphemeris"), to: FunctionSignature.self)

    return function(satKey, index, ds50UTC, pos, vel, revNum)
}

// Retrieves the data (including the covariance matrix) for a specific point within an EXTEPHEM
public func ExtEphGetCovMtx( _ satKey: Int64,
                             _ index: Int32,
                             _ ds50UTC: UnsafeMutablePointer<Double>,
                             _ pos: UnsafeMutablePointer<Double>,
                             _ vel: UnsafeMutablePointer<Double>,
                             _ revNum: UnsafeMutablePointer<Int32>,
                             _ covMtx: UnsafeMutablePointer<(Double, Double, Double, Double, Double, Double)> ) -> Int32 {

    let _covMtx = UnsafeMutableRawPointer(covMtx).bindMemory(to: Double.self, capacity: 36)

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   Int32,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Double> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "ExtEphGetCovMtx"), to: FunctionSignature.self)

    return function(satKey, index, ds50UTC, pos, vel, revNum, _covMtx)
}

// Interpolates the external ephemeris data to the requested time in minutes since the satellite's epoch time
// The coordinate system of the output position and velocity is the same as the input ephemerides.
public func ExtEphMse( _ satKey: Int64,
                       _ mse: Double,
                       _ ds50UTC: UnsafeMutablePointer<Double>,
                       _ pos: UnsafeMutablePointer<Double>,
                       _ vel: UnsafeMutablePointer<Double>,
                       _ revNum: UnsafeMutablePointer<Int32> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   Double,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Int32> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "ExtEphMse"), to: FunctionSignature.self)

    return function(satKey, mse, ds50UTC, pos, vel, revNum)
}

// Interpolates the external ephemeris data to the requested time in minutes since the satellite's epoch time
public func ExtEphMseCovMtx( _ satKey: Int64,
                             _ mse: Double,
                             _ ds50UTC: UnsafeMutablePointer<Double>,
                             _ pos: UnsafeMutablePointer<Double>,
                             _ vel: UnsafeMutablePointer<Double>,
                             _ revNum: UnsafeMutablePointer<Int32>,
                             _ covMtx: UnsafeMutablePointer<(Double, Double, Double, Double, Double, Double)> ) -> Int32 {

    let _covMtx = UnsafeMutableRawPointer(covMtx).bindMemory(to: Double.self, capacity: 36)

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   Double,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Double> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "ExtEphMseCovMtx"), to: FunctionSignature.self)

    return function(satKey, mse, ds50UTC, pos, vel, revNum, _covMtx)
}

// Interpolates the external ephemeris data to the requested time in days since 1950, UTC
// The coordinate system of the output position and velocity is the same as the input ephemerides.
public func ExtEphDs50UTC( _ satKey: Int64,
                           _ ds50UTC: Double,
                           _ mse: UnsafeMutablePointer<Double>,
                           _ pos: UnsafeMutablePointer<Double>,
                           _ vel: UnsafeMutablePointer<Double>,
                           _ revNum: UnsafeMutablePointer<Int32> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   Double,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Int32> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "ExtEphDs50UTC"), to: FunctionSignature.self)

    return function(satKey, ds50UTC, mse, pos, vel, revNum)
}

// Interpolates the external ephemeris data to the requested time in days since 1950, UTC
public func ExtEphDs50UTCCovMtx( _ satKey: Int64,
                                 _ ds50UTC: Double,
                                 _ mse: UnsafeMutablePointer<Double>,
                                 _ pos: UnsafeMutablePointer<Double>,
                                 _ vel: UnsafeMutablePointer<Double>,
                                 _ revNum: UnsafeMutablePointer<Int32>,
                                 _ covMtx: UnsafeMutablePointer<(Double, Double, Double, Double, Double, Double)> ) -> Int32 {

    let _covMtx = UnsafeMutableRawPointer(covMtx).bindMemory(to: Double.self, capacity: 36)

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   Double,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Double> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "ExtEphDs50UTCCovMtx"), to: FunctionSignature.self)

    return function(satKey, ds50UTC, mse, pos, vel, revNum, _covMtx)
}

// Extensible routine which retrieves/interpolates external ephemeris data based on user's request
public func ExtEphXten( _ satKey: Int64,
                        _ xf_getEph: Int32,
                        _ inVal: Double,
                        _ extArr: UnsafeMutablePointer<Double> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   Int32,
                                                   Double,
                                                   UnsafeMutablePointer<Double> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "ExtEphXten"), to: FunctionSignature.self)

    return function(satKey, xf_getEph, inVal, extArr)
}

// This function returns a string that represents the EXTFIL= directive used to read a particular EXTEPHEM
public func ExtEphGetLine( _ satKey: Int64, _ line: UnsafeMutablePointer<CChar> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   UnsafeMutablePointer<CChar> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "ExtEphGetLine"), to: FunctionSignature.self)

    return function(satKey, line)
}

// Returns the first satKey that matches the satNum in the EXTEPHEM binary tree
// This function is useful when ExtEphem DLL is used in applications that requires only one record (one EXTEPHEM entry) 
// for one satellite and the applications refer to that EXTEPHEM by its satellite number. 
// However, the Astrodynamic Standard Shared library only uses satKeys; this function helps to return the associated satKey of that satellite.
public func ExtEphGetSatKey( _ satNum: Int32 ) -> Int64 {

    typealias FunctionSignature = @convention(c) ( Int32 ) -> Int64

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "ExtEphGetSatKey"), to: FunctionSignature.self)

    return function(satNum)
}

// Creates satKey from EXTEPHEM's satelite number and date time group string
// This is the proper way to reconstruct a satKey from its fields. If the users use their own routine to do this, the computed satKey might be different. 
public func ExtEphFieldsToSatKey( _ satNum: Int32, _ epochDtg: UnsafeMutablePointer<CChar> ) -> Int64 {

    typealias FunctionSignature = @convention(c) ( Int32,
                                                   UnsafeMutablePointer<CChar> ) -> Int64

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "ExtEphFieldsToSatKey"), to: FunctionSignature.self)

    return function(satNum, epochDtg)
}

// Indexes of coordinate systems
//ECI TEME of DATE
public let COORD_ECI   = 1
//MEME of J2K
public let COORD_J2K   = 2
//Earth Fixed Greenwich (EFG)
public let COORD_EFG   = 3
//Earch Centered Rotation (ECR)
public let COORD_ECR   = 4
//Lat Lon Height and a vector offset (range, azimuth, elevation)
public let COORD_LLH   = 5
//Sensor site (ECR) and a vector offset (range, azimuth, elevation)
public let COORD_SEN   = 6

//ECI TEME of DATE, fixed point
public let COORD_ECIFP = 11
//MEME of J2K, fixed point
public let COORD_J2KFP = 12
//Earth Fixed Greenwich (EFG), fixed point
public let COORD_EFGFP = 13
//Earch Centered Rotation (ECR), fixed point
public let COORD_ECRFP = 14
//Lat Lon Height and an offset vector (range, azimuth, elevation)
public let COORD_LLHOV = 15
//Sensor site (ECR) and an offset vector (range, azimuth, elevation)
public let COORD_SENOV = 16
//Current position (LLH), heading (azimuth), and constant speed of an mobile object that travels in a rhumb line course
public let COORD_HCSRL = 17
//List of waypoints (LLH) that describes the movement of an object that travels in a rhumb line course
public let COORD_WPTRL = 18
//Current position (LLH), initial heading (azimuth), and constant speed of an mobile object that travels in a great circle course
public let COORD_HCSGC = 19
//List of waypoints (LLH) that describes the movement of an object that travels in a great circle course
public let COORD_WPTGC = 20


//Invalid coordinate system
public let COORD_INVALID = 100

//UVW convariance matrix - TEME of DATE
public let COVMTX_UVW_DATE  =  0
//Cartesian covariance matrix - TEME of DATE
public let COVMTX_XYZ_DATE  = 10
//Equinoctial covariance matrix - TEME of DATE
public let COVMTX_EQNX_DATE = 20
//UVW convariance matrix - MEME of J2K
public let COVMTX_UVW_J2K   = 30
//Cartesian covariance matrix - MEME of J2K
public let COVMTX_XYZ_J2K   = 40
//Equinoctial covariance matrix - MEME of J2K
public let COVMTX_EQNX_J2K  = 50


//Get ephemeris data using time in minutes since epoch
public let XF_GETEPH_MSE = 1
//Get ephemeris data using time in days since 1950 UTC
public let XF_GETEPH_UTC = 2
//Get ephemeris data using index of the element in the array
public let XF_GETEPH_IDX = 3

// Indexes of EXTEPH data fields
//Satellite number I5
public let XF_EXTEPH_SATNUM    =  1
//Epoch YYDDDHHMMSS.SSS
public let XF_EXTEPH_EPOCH     =  2
//Earth radius (km)
public let XF_EXTEPH_AE        =  3
//Ke
public let XF_EXTEPH_KE        =  4
//position X (km) F16.8
public let XF_EXTEPH_POSX      =  5
//position Y (km) F16.8
public let XF_EXTEPH_POSY      =  6
//position Z (km) F16.8
public let XF_EXTEPH_POSZ      =  7
//velocity X (km/s) F16.12
public let XF_EXTEPH_VELX      =  8
//velocity Y (km/s) F16.12
public let XF_EXTEPH_VELY      =  9
//velocity Z (km/s) F16.12
public let XF_EXTEPH_VELZ      = 10
//Input coordinate systems
public let XF_EXTEPH_COORD     = 11
//Num of ephemeris points
public let XF_EXTEPH_NUMOFPTS  = 12
//Ephemeris file path
public let XF_EXTEPH_FILEPATH  = 13
//International Designator
public let XF_EXTEPH_SATNAME   = 14
//Record name
public let XF_EXTEPH_RECNAME   = 15

// ========================= End of auto generated code ==========================
