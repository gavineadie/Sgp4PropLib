// This wrapper file was generated automatically by the GenDllWrappers program.
import Foundation

#if os(Linux)
fileprivate let libHandle = loadDll("libfov.so")
#elseif os(Windows)
fileprivate let libHandle = loadDll("Fov.dll")
#else
fileprivate let libHandle = loadDll("libfov.dylib")
#endif

// Notes: This function has been deprecated since v9.0. 
// Initializes Fov dll for use in the program
public func FovInit( _ apAddr: Int64 ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64 ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "FovInit"), to: FunctionSignature.self)

    return function(apAddr)
}

// Returns information about the current version of Fov.dll. The information is placed in the string parameter you pass in
public func FovGetInfo( _ infoStr: UnsafeMutablePointer<CChar> ) {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "FovGetInfo"), to: FunctionSignature.self)

    function(infoStr)
}

// Loads Fov-related parameters (1P/2P/3P cards, and Fov parameter free format) from an input text file
public func FovLoadFile( _ fovInputFile: UnsafeMutablePointer<CChar> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "FovLoadFile"), to: FunctionSignature.self)

    return function(fovInputFile)
}

// Loads Fov-related parameters (1P/2P/3P cards, and Fov parameter free format) from an input text file
public func FovLoadFileAll( _ fovInputFile: UnsafeMutablePointer<CChar> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "FovLoadFileAll"), to: FunctionSignature.self)

    return function(fovInputFile)
}

// Loads a single Fov-typed card
public func FovLoadCard( _ card: UnsafeMutablePointer<CChar> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "FovLoadCard"), to: FunctionSignature.self)

    return function(card)
}

// Saves any currently loaded Fov-related settings to a file
public func FovSaveFile( _ fovFile: UnsafeMutablePointer<CChar>,
                         _ saveMode: Int32,
                         _ saveForm: Int32 ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar>,
                                                   Int32,
                                                   Int32 ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "FovSaveFile"), to: FunctionSignature.self)

    return function(fovFile, saveMode, saveForm)
}

// This function retrieves various FOV input data being entered from input flat files (various FOV cards)
public func FovGetDataFrInputFiles( _ xa_fovCtrl: UnsafeMutablePointer<Double>,
                                    _ numOfWindows: UnsafeMutablePointer<Int32>,
                                    _ startStopTimes: UnsafeMutablePointer<Double>,
                                    _ numOfSources: UnsafeMutablePointer<Int32>,
                                    _ xa_fovSrc_Arr: UnsafeMutablePointer<(Double, Double, Double, Double, Double, Double, Double, Double)>,
                                    _ numOfTargets: UnsafeMutablePointer<Int32>,
                                    _ xa_fovTgt_Arr: UnsafeMutablePointer<(Double, Double, Double, Double, Double, Double, Double, Double)>,
                                    _ numVicSats: UnsafeMutablePointer<Int32>,
                                    _ vicSatNums: UnsafeMutablePointer<Int32> ) {

    let _xa_fovSrc_Arr = UnsafeMutableRawPointer(xa_fovSrc_Arr).bindMemory(to: Double.self, capacity: 1024)
    let _xa_fovTgt_Arr = UnsafeMutableRawPointer(xa_fovTgt_Arr).bindMemory(to: Double.self, capacity: 1024)

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Int32> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "FovGetDataFrInputFiles"), to: FunctionSignature.self)

    function(xa_fovCtrl, numOfWindows, startStopTimes, numOfSources, _xa_fovSrc_Arr, numOfTargets, _xa_fovTgt_Arr, numVicSats, vicSatNums)
}

// This function screens the specified start/end time window and returns passes when the target satellite can be seen (passed all limit checks) by the source 
public func FovFindTargetPasses( _ startTimeDs50UTC: Double,
                                 _ stopTimeDs50UTC: Double,
                                 _ srcSenKey: Int64,
                                 _ tgtSatKey: Int64,
                                 _ tgtPassesArr: UnsafeMutablePointer<(Double, Double)>,
                                 _ numOfPasses: UnsafeMutablePointer<Int32> ) -> Int32 {

    let _tgtPassesArr = UnsafeMutableRawPointer(tgtPassesArr).bindMemory(to: Double.self, capacity: 0)

    typealias FunctionSignature = @convention(c) ( Double,
                                                   Double,
                                                   Int64,
                                                   Int64,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Int32> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "FovFindTargetPasses"), to: FunctionSignature.self)

    return function(startTimeDs50UTC, stopTimeDs50UTC, srcSenKey, tgtSatKey, _tgtPassesArr, numOfPasses)
}

// This function screens a potential victim satellite for penetrating the illumination cone between a source and a target (target is an elset).
// <br>
// The xa_emeDat array size is [numObs, 3].  The penetration time indexes are:
// <table>
// <caption>table</caption>
// <tr>
// <td><b>Name</b></td>
// <td><b>Index</b></td>
// <td><b>Index Interpretation</b></td>
// </tr>
// <tr><td> 0</td><td> entry time (ds50UTC)</td></tr>
// <tr><td> 1</td><td> minimum time (ds50UTC)</td></tr>
// <tr><td> 2</td><td> exit time (ds50UTC)</td></tr>
// </table>
// <br>
// See FovGetDataFrInputFiles for a description of the XA_FOVSRC parameter values.
public func FovTargetElset( _ xa_fovRun: UnsafeMutablePointer<Double>,
                            _ xa_fovSrc: UnsafeMutablePointer<Double>,
                            _ tgtSatKey: Int64,
                            _ vicSatKey: Int64,
                            _ xa_emeDat: UnsafeMutablePointer<(Double, Double, Double)>,
                            _ numOfPasses: UnsafeMutablePointer<Int32> ) -> Int32 {

    let _xa_emeDat = UnsafeMutableRawPointer(xa_emeDat).bindMemory(to: Double.self, capacity: 0)

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   Int64,
                                                   Int64,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Int32> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "FovTargetElset"), to: FunctionSignature.self)

    return function(xa_fovRun, xa_fovSrc, tgtSatKey, vicSatKey, _xa_emeDat, numOfPasses)
}

// This function returns a look angle from the source to the potential victim satellite at the specified time (target is an elset)
// <br>
// If actual number of passes exceeds the set limit in XA_FOVRUN_MAXPASSES, an error is returned. However, the data in xa_emeDat is still valid.
public func FovTargetElsetLook( _ currDs50TAI: Double,
                                _ xa_fovSrc: UnsafeMutablePointer<Double>,
                                _ vicSatKey: Int64,
                                _ xa_look: UnsafeMutablePointer<Double> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Double,
                                                   UnsafeMutablePointer<Double>,
                                                   Int64,
                                                   UnsafeMutablePointer<Double> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "FovTargetElsetLook"), to: FunctionSignature.self)

    return function(currDs50TAI, xa_fovSrc, vicSatKey, xa_look)
}

// This function screens a potential victim satellite for penetrating the illumination cone between a source and a target (target is a vector: AZ/EL or RA/DEC).
// See FovTargetElset for a description of the xa_emeDat array.<br>
// If actual number of passes exceeds the set limit in XA_FOVRUN_MAXPASSES, an error is returned. However, the data in xa_emeDat is still valid 
public func FovTargetVec( _ xa_fovRun: UnsafeMutablePointer<Double>,
                          _ xa_fovSrc: UnsafeMutablePointer<Double>,
                          _ xa_fovTgt: UnsafeMutablePointer<Double>,
                          _ vicSatKey: Int64,
                          _ xa_emeDat: UnsafeMutablePointer<(Double, Double, Double)>,
                          _ numOfPasses: UnsafeMutablePointer<Int32> ) -> Int32 {

    let _xa_emeDat = UnsafeMutableRawPointer(xa_emeDat).bindMemory(to: Double.self, capacity: 0)

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   Int64,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Int32> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "FovTargetVec"), to: FunctionSignature.self)

    return function(xa_fovRun, xa_fovSrc, xa_fovTgt, vicSatKey, _xa_emeDat, numOfPasses)
}

// This function returns a look angle from the source to the potential victim satellite at the specified time (target is a vector: AZ/EL or RA/DEC).
// See FovGetDataFrInputFiles for a description of the XA_FOVSRC and XA_FOVTGT parameter values.
// See FovTargetElsetLook for a description of the XA_LOOK parameter values.
public func FovTargetVecLook( _ currDs50TAI: Double,
                              _ xa_fovSrc: UnsafeMutablePointer<Double>,
                              _ xa_fovTgt: UnsafeMutablePointer<Double>,
                              _ vicSatKey: Int64,
                              _ xa_look: UnsafeMutablePointer<Double> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Double,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   Int64,
                                                   UnsafeMutablePointer<Double> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "FovTargetVecLook"), to: FunctionSignature.self)

    return function(currDs50TAI, xa_fovSrc, xa_fovTgt, vicSatKey, xa_look)
}

// Resets all FOV control parameters back to their default values
public func FovReset(  ) {

    typealias FunctionSignature = @convention(c) (  ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "FovReset"), to: FunctionSignature.self)

    function()
}

// Fov run parameters
//Maximum number of passes (entry/minimum/exit times) that FOV returns in one start/stop time
public let XA_FOVRUN_MAXPASSES = 0
//FOV start time in days since 1950, UTC
public let XA_FOVRUN_START    = 1
//FOV stop time in days since 1950, UTC
public let XA_FOVRUN_STOP     = 2
//Cone half angle (deg) (0=auto) (0-45)
public let XA_FOVRUN_HALFCONE = 3
//Search interval (min)
public let XA_FOVRUN_INTERVAL = 4

public let XA_FOVRUN_SIZE     = 8

// FOV source types
//Source is sensor
public let FOV_SRCTYPE_SEN = 1
//Source is lat lon height
public let FOV_SRCTYPE_LLH = 2
//Source is EFG
public let FOV_SRCTYPE_EFG = 3
//Source is XYZ
public let FOV_SRCTYPE_XYZ = 4

// FOV source types
//Target is elset
public let FOV_TGTTYPE_ELSET = 1
//Target is constant Az/El
public let FOV_TGTTYPE_AZEL  = 2
//Target is RA/Dec (STAR)
public let FOV_TGTTYPE_RADEC = 3

// FOV source specification
//1=SEN   | 2=LLH       | 3=EFG      | 4=XYZ
public let XA_FOVSRC_TYPE  = 0
//Sensor# | Source ID   | Source ID  | Source ID
public let XA_FOVSRC_ID    = 1
//| N lat (deg) | EFG: E (m) | X (m)
public let XA_FOVSRC_ELEM1 = 2
//| E lon (deg) | EFG: F (m) | Y (m)
public let XA_FOVSRC_ELEM2 = 3
//| height (m)  | EFG: G (m) | Z (m)
public let XA_FOVSRC_ELEM3 = 4
//|             |            | time of position in Ds50UTC
public let XA_FOVSRC_ELEM4 = 5

public let XA_FOVSRC_SIZE  = 8


// FOV target specification
//1=ELSET | 2=AZEL    | 3=RADEC
public let XA_FOVTGT_TYPE  = 0
//Elset#  | Target ID | Target ID
public let XA_FOVTGT_ID    = 1
//| az (deg)  | RA (deg)
public let XA_FOVTGT_ELEM1 = 2
//| el (deg)  | Dec (deg)
public let XA_FOVTGT_ELEM2 = 3
//|           | equinox indicator
public let XA_FOVTGT_ELEM3 = 4

public let XA_FOVTGT_SIZE  = 8

// entry/minimum/exit time data
//entry time (ds50UTC)
public let XA_EMEDAT_ENTRY = 0
//minimum time (ds50UTC)
public let XA_EMEDAT_MIN   = 1
//exit time (ds50UTC)
public let XA_EMEDAT_EXIT  = 2

public let XA_EMEDAT_SIZE  = 3

// FOV parameters
//Cone half angle (deg) (0=auto) (0-45)
public let XA_FOVCTRL_HALFCONE = 0
//Search interval (min)
public let XA_FOVCTRL_INTERVAL = 1
//Print option
public let XA_FOVCTRL_PRTOPT   = 2

public let XA_FOVCTRL_SIZE     = 8


//maximum number of windows/potential, victims/sources/targets allowed to be entered via an input file
public let FOVMAXNUM = 128

// ========================= End of auto generated code ==========================
