// This wrapper file was generated automatically by the GenDllWrappers program.
import Foundation

#if os(Linux)
fileprivate let libHandle = loadDll("libaof.so")
#elseif os(Windows)
fileprivate let libHandle = loadDll("Aof.dll")
#else
fileprivate let libHandle = loadDll("libaof.dylib")
#endif

// Notes: This function has been deprecated since v9.0. 
// Initializes Aof dll for use in the program
public func AofInit( _ apAddr: Int64 ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64 ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "AofInit"), to: FunctionSignature.self)

    return function(apAddr)
}

// Returns information about the current version of Aof.dll. The information is placed in the string parameter you pass in
public func AofGetInfo( _ infoStr: UnsafeMutablePointer<CChar> ) {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "AofGetInfo"), to: FunctionSignature.self)

    function(infoStr)
}

// Loads Aof-related parameters (1P/2P/3P cards, and Aof parameter free format) from an input text file
public func AofLoadFile( _ aofInputFile: UnsafeMutablePointer<CChar> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "AofLoadFile"), to: FunctionSignature.self)

    return function(aofInputFile)
}

// Loads Aof-related parameters from an input text file
public func AofLoadFileAll( _ aofInputFile: UnsafeMutablePointer<CChar> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "AofLoadFileAll"), to: FunctionSignature.self)

    return function(aofInputFile)
}

// Loads a single Aof-typed card
public func AofLoadCard( _ card: UnsafeMutablePointer<CChar> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "AofLoadCard"), to: FunctionSignature.self)

    return function(card)
}

// This function retrieves various AOF input data being entered from input flat files (and/or various AOF input cards)
public func AofGetDataFrInputFiles( _ xa_aofCtrl: UnsafeMutablePointer<Double>,
                                    _ numOfInpSats: UnsafeMutablePointer<Int32>,
                                    _ aofInpSats: UnsafeMutablePointer<Int32>,
                                    _ numOfMissions: UnsafeMutablePointer<Int32>,
                                    _ xa_aofSen: UnsafeMutablePointer<(Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double)>,
                                    _ numOfAreas: UnsafeMutablePointer<Int32>,
                                    _ xa_aofArea: UnsafeMutablePointer<(Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double)> ) {

    let _xa_aofSen = UnsafeMutableRawPointer(xa_aofSen).bindMemory(to: Double.self, capacity: 1600)
    let _xa_aofArea = UnsafeMutableRawPointer(xa_aofArea).bindMemory(to: Double.self, capacity: 1600)

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "AofGetDataFrInputFiles"), to: FunctionSignature.self)

    function(xa_aofCtrl, numOfInpSats, aofInpSats, numOfMissions, _xa_aofSen, numOfAreas, _xa_aofArea)
}

// This function resets all Aof control parameters previously loaded from input text files
public func AofReset(  ) {

    typealias FunctionSignature = @convention(c) (  ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "AofReset"), to: FunctionSignature.self)

    function()
}

// Computes entry/exit times of basic overflight satellite/sensor (cone) versus basic defended areas (box, circle, point)
// <br>
// Note:  for xa_aofArea type=4 (polygon), use the AofComplex method.
public func AofBasic( _ xa_aofRun: UnsafeMutablePointer<Double>,
                      _ satKey: Int64,
                      _ xa_aofSen: UnsafeMutablePointer<Double>,
                      _ xa_aofArea: UnsafeMutablePointer<Double>,
                      _ numOfPasses: UnsafeMutablePointer<Int32>,
                      _ xa_entExitTimes: UnsafeMutablePointer<Double> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<Double>,
                                                   Int64,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Double> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "AofBasic"), to: FunctionSignature.self)

    return function(xa_aofRun, satKey, xa_aofSen, xa_aofArea, numOfPasses, xa_entExitTimes)
}

// Computes entry/exit times of overflight satellite/sensor having complex configurations (cone, donut, butterfly, leftButterly, rightButterfly)
// versus defended areas defined by multiple lat lon height points (polygon)
// The input array llhArr is a zero-based array with latitude, longitude and altitude of each point in subsequent entries, e.g.:
// llhArr[0] = point 1 latitude, 
// llhArr[1] = point 1 longitude, 
// llhArr[2] = point 1 altitude, 
// llhArr[3] = point 2 latitude, etc.
public func AofComplex( _ xa_aofRun: UnsafeMutablePointer<Double>,
                        _ satKey: Int64,
                        _ xa_aofSen: UnsafeMutablePointer<Double>,
                        _ numOfLlhPts: Int32,
                        _ llhArr: UnsafeMutablePointer<Double>,
                        _ numOfPasses: UnsafeMutablePointer<Int32>,
                        _ xa_entExitTimes: UnsafeMutablePointer<Double> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<Double>,
                                                   Int64,
                                                   UnsafeMutablePointer<Double>,
                                                   Int32,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Double> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "AofComplex"), to: FunctionSignature.self)

    return function(xa_aofRun, satKey, xa_aofSen, numOfLlhPts, llhArr, numOfPasses, xa_entExitTimes)
}

// This function returns a look angle from the llh point to the overfly satellite at the specified time
public func AofGetLook( _ ds50TAI: Double,
                        _ llh: UnsafeMutablePointer<Double>,
                        _ satKey: Int64,
                        _ xa_look: UnsafeMutablePointer<Double> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Double,
                                                   UnsafeMutablePointer<Double>,
                                                   Int64,
                                                   UnsafeMutablePointer<Double> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "AofGetLook"), to: FunctionSignature.self)

    return function(ds50TAI, llh, satKey, xa_look)
}

// This function returns a view angle from the overfly satellite to a llh point at the specified time
public func AofGetView( _ ds50TAI: Double,
                        _ llh: UnsafeMutablePointer<Double>,
                        _ satKey: Int64,
                        _ xa_aofView: UnsafeMutablePointer<Double> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Double,
                                                   UnsafeMutablePointer<Double>,
                                                   Int64,
                                                   UnsafeMutablePointer<Double> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "AofGetView"), to: FunctionSignature.self)

    return function(ds50TAI, llh, satKey, xa_aofView)
}

// Determines darkness level of the "defended" area at the specified time
// For a description of the input parameter array xa_aofArea, see AofBasic.
public func AofGetDarknessLevel( _ ds50TAI: Double, _ xa_aofArea: UnsafeMutablePointer<Double> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Double,
                                                   UnsafeMutablePointer<Double> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "AofGetDarknessLevel"), to: FunctionSignature.self)

    return function(ds50TAI, xa_aofArea)
}

// AOF parameters
//input start/stop time type: 1=minutes since epoch (MSE), 0=date time (DTG)
public let XA_AOFCTRL_TIMEFLG  =  0
//start time of interest (either MSE or DTG)
public let XA_AOFCTRL_START    =  1
//stop time of interest (either MSE or DTG)
public let XA_AOFCTRL_STOP     =  2
//search interval (min)
public let XA_AOFCTRL_INTERVAL =  3
//print output control flag, 0=print penetrations only, 1=print penetrations and data description
public let XA_AOFCTRL_PRTOPT   =  4
//search method: 0=use brute force method, 1=use analytical method
public let XA_AOFCTRL_SRCHMET  =  5
//output sort type: S=sort each area by sat#, then time, T=sort each area by time, then sat#
public let XA_AOFCTRL_SRTTYPE  =  6

public let XA_AOFCTRL_SIZE     = 16


// Defended area types
//area box type
public let AREATYPE_I_BOX     =  1
//area circle type
public let AREATYPE_I_CIRCLE  =  2
//area point type
public let AREATYPE_I_POINT   =  3
//area polygon type
public let AREATYPE_I_POLYGON =  4


// AOF satellite/mission (satellite/sensor) data
//satellite number of sensor-bearing satellite
public let XA_AOFSEN_SATNUM   =  0
//reserved for future use
public let XA_AOFSEN_TYPE     =  1
//off nadir minimum look angle (deg) (=0 for Cone)
public let XA_AOFSEN_MINEL    =  2
//off nadir maximum look angle (deg)
public let XA_AOFSEN_MAXEL    =  3
//minimum azimuth of first azimuth range (deg)
public let XA_AOFSEN_MINAZ1   =  4
//maximum azimuth of first azimuth range (deg)
public let XA_AOFSEN_MAXAZ1   =  5
//minimum azimuth of second azimuth range (deg)
public let XA_AOFSEN_MINAZ2   =  6
//maximum azimuth of second azimuth range (deg)
public let XA_AOFSEN_MAXAZ2   =  7
//reserved for future use
public let XA_AOFSEN_ELEM7    =  8
//reserved for future use
public let XA_AOFSEN_ELEM8    =  9
//reserved for future use
public let XA_AOFSEN_ELEM9    = 10
//reserved for future use
public let XA_AOFSEN_ELEM10   = 11

public let XA_AOFSEN_SIZE     = 16


// AOF satellite/sensor types
//circle (specify only off-nadir maximum look angle)
public let AOFSENTYPE_CIRCLE = 0


// AOF run parameters
//Maximum number of passes that AOF returns in one start/stop time
public let XA_AOFRUN_MAXPASSES = 0
//AOF start time in days since 1950, UTC
public let XA_AOFRUN_START    = 1
//AOF stop time in days since 1950, UTC
public let XA_AOFRUN_STOP     = 2
//Search interval (min)
public let XA_AOFRUN_INTERVAL = 3

public let XA_AOFRUN_SIZE     = 8


// AOF defended area types
//Defended area is a box
public let AOF_AREATYPE_BOX     = 1
//Defended area is a circle
public let AOF_AREATYPE_CIRCLE  = 2
//Defended area is a point
public let AOF_AREATYPE_POINT   = 3
//Defended area is a polygon
public let AOF_AREATYPE_POLYGON = 4



// AOF defended area data
//Area number
public let XA_AOFAREA_NUM   = 0
//| 1 = BOX                       | 2 = CIRCLE              | 3 = POINT
public let XA_AOFAREA_TYPE  = 1
//| N lat (deg) upper left corner | N lat (deg) center point| N lat (deg) center point
public let XA_AOFAREA_ELEM1 = 2
//| E lon (deg) upper left corner | E lon (deg) center point| E lon (deg) center point
public let XA_AOFAREA_ELEM2 = 3
//| N lat (deg) lower right corner| circle radius (km)      | height (km, above reference geoid)
public let XA_AOFAREA_ELEM3 = 4
//| E lon (deg) lower right corner|                         |
public let XA_AOFAREA_ELEM4 = 5

public let XA_AOFAREA_SIZE  = 16


// Penetration-level darkness status
//lit throughout penetration
public let DARKLEVEL_ALLLIT  = 0
//dark throughout penetration
public let DARKLEVEL_ALLDARK = 1
//partly-lit during penetration
public let DARKLEVEL_PARTLIT = 2

// View angle from overfly satellite to a llh point
//Azimuth (deg)
public let XA_AOFVIEW_AZIM   = 0
//Elevation (deg)
public let XA_AOFVIEW_ELEV   = 1
//Has line of sight to the point (1=Yes, 0=No-earth obstructs the view)
public let XA_AOFVIEW_HASLOS = 2

public let XA_AOFVIEW_SIZE   = 8

//maximum of number of lat-lon-height points that can be used to describe a defended area
public let MAX_LLHPOINTS = 120




// ========================= End of auto generated code ==========================
