// This wrapper file was generated automatically by the GenDllWrappers program.
import Foundation

#if os(Linux)
fileprivate let libHandle = loadDll("libelops.so")
#elseif os(Windows)
fileprivate let libHandle = loadDll("ElOps.dll")
#else
fileprivate let libHandle = loadDll("libelops.dylib")
#endif

// Notes: This function has been deprecated since v9.0. 
// Initializes ElOps dll for use in the program
public func ElOpsInit( _ apAddr: Int64 ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64 ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "ElOpsInit"), to: FunctionSignature.self)

    return function(apAddr)
}

// Returns information about the current version of ElOps.dll. The information is placed in the string parameter you pass in
public func ElOpsGetInfo( _ infoStr: UnsafeMutablePointer<CChar> ) {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "ElOpsGetInfo"), to: FunctionSignature.self)

    function(infoStr)
}

// Checks to see if satellite has geo orbit
public func IsGeoOrbit( _ incli: Double, _ period: Double ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Double,
                                                   Double ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "IsGeoOrbit"), to: FunctionSignature.self)

    return function(incli, period)
}

// Estimates the approx long east subpt
public func CompLonEastSubPt( _ ds50UTC: Double,
                              _ node: Double,
                              _ omega: Double,
                              _ mnAnomaly: Double ) -> Double {

    typealias FunctionSignature = @convention(c) ( Double,
                                                   Double,
                                                   Double,
                                                   Double ) -> Double

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "CompLonEastSubPt"), to: FunctionSignature.self)

    return function(ds50UTC, node, omega, mnAnomaly)
}

// Computes the decay time of the input satellite
public func FindSatDecayTime( _ satKey: Int64,
                              _ f10Avg: Double,
                              _ decayDs50UTC: UnsafeMutablePointer<Double> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   Double,
                                                   UnsafeMutablePointer<Double> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "FindSatDecayTime"), to: FunctionSignature.self)

    return function(satKey, f10Avg, decayDs50UTC)
}

// Returs parameters of a satellite via its satKey
public func GetSatParameters( _ satKey: Int64, _ xa_satparm: UnsafeMutablePointer<Double> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   UnsafeMutablePointer<Double> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "GetSatParameters"), to: FunctionSignature.self)

    return function(satKey, xa_satparm)
}

// Returs the satellite number associated with the input satKey
public func SatNumOf( _ satKey: Int64 ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64 ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SatNumOf"), to: FunctionSignature.self)

    return function(satKey)
}

// Adds an impulsive maneuver (using VP-card string format) to the specified elset (VCM, SpVec, or Tle type 6) represented by its satKey
// Note: All maneuvers have to be entered before the satellite's initialization step
public func AddManeuverVPStr( _ satKey: Int64, _ vpString: UnsafeMutablePointer<CChar> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   UnsafeMutablePointer<CChar> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "AddManeuverVPStr"), to: FunctionSignature.self)

    return function(satKey, vpString)
}

// Adds an impulsive maneuver (using VP-card array format) to the specified elset (VCM, SpVec, or Tle type 6) represented by its satKey
// Note: All maneuvers have to be entered before the satellite's initialization step
public func AddManeuverVPArr( _ satKey: Int64, _ xa_vp: UnsafeMutablePointer<Double> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   UnsafeMutablePointer<Double> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "AddManeuverVPArr"), to: FunctionSignature.self)

    return function(satKey, xa_vp)
}

// Satellite maintenance category
//Synchronous
public let SATCAT_SYNCHRONOUS = 1
//Deep space (not synchronous)
public let SATCAT_DEEPSPACE   = 2
//Decaying (perigee height below 575 km)
public let SATCAT_DECAYING    = 3
//Routine (everything else)
public let SATCAT_ROUTINE     = 4

// Indexes of available satellite data fields
//epoch in days since 1950, UTC
public let XF_ELFIELD_EPOCHUTC =  1
//mean anomaly (deg)
public let XF_ELFIELD_MNANOM   =  2
//right ascension of the asending node (deg)
public let XF_ELFIELD_NODE     =  3
//argument of perigee (deg)
public let XF_ELFIELD_OMEGA    =  4
//period (min)
public let XF_ELFIELD_PERIOD   =  5
//eccentricity (unitless)
public let XF_ELFIELD_ECCEN    =  6
//inclination (deg)
public let XF_ELFIELD_INCLI    =  7
//mean motion (revs/day)
public let XF_ELFIELD_MNMOTION =  8
//either SGP4 bStar (1/er) or SP bTerm (m2/kg)
public let XF_ELFIELD_BFIELD   =  9
//perigee height (km)
public let XF_ELFIELD_PERIGEEHT = 10
//apogee height (km)
public let XF_ELFIELD_APOGEEHT = 11
//perigee (km)
public let XF_ELFIELD_PERIGEE  = 12
//apogee (km)
public let XF_ELFIELD_APOGEE   = 13
//semi major axis (km)
public let XF_ELFIELD_A        = 14
//Satellite category (Synchronous, Deep space, Decaying, Routine)
public let XF_ELFIELD_SATCAT   = 15
//Astat 3 Height multiplier
public let XF_ELFIELD_HTM3     = 16
//Center of mass offset (m)
public let XF_ELFIELD_CMOFFSET = 17
//n-double-dot/6  (for SGP, eph-type = 0)
public let XF_ELFIELD_N2DOT    = 18


// Indexes of available satellite parameters
//satellite's epoch in days since 1950, UTC
public let XA_SATPARM_EPOCHUTC =  0
//satellite's mean anomaly (deg)
public let XA_SATPARM_MNANOM   =  1
//satellite's right ascension of the asending node (deg)
public let XA_SATPARM_NODE     =  2
//satellite's argument of perigee (deg)
public let XA_SATPARM_OMEGA    =  3
//satellite's period (min)
public let XA_SATPARM_PERIOD   =  4
//satellite's eccentricity (unitless)
public let XA_SATPARM_ECCEN    =  5
//satellite's inclination (deg)
public let XA_SATPARM_INCLI    =  6
//satellite's mean motion (revs/day)
public let XA_SATPARM_MNMOTION =  7
//satellite's either SGP4 bStar (1/er) or SP bTerm (m2/kg)
public let XA_SATPARM_BFIELD   =  8
//satellite's perigee height (km)
public let XA_SATPARM_PERIGEEHT =  9
//satellite's apogee height (km)
public let XA_SATPARM_APOGEEHT = 10
//satellite's perigee (km)
public let XA_SATPARM_PERIGEE  = 11
//satellite's apogee (km)
public let XA_SATPARM_APOGEE   = 12
//satellite's semi major axis (km)
public let XA_SATPARM_A        = 13
//satellite's category (1=Synchronous, 2=Deep space, 3=Decaying, 4=Routine)
public let XA_SATPARM_SATCAT   = 14
//satellite's center of mass offset (m)
public let XA_SATPARM_CMOFFSET = 15
//satellite's east longitude east subpoint (deg) - only for synchronous orbits
public let XA_SATPARM_LONE     = 16
//satellite's longitude drift rate (deg East/day) - only for synchronous orbits
public let XA_SATPARM_DRIFT    = 17
//satellite's omega rate of change (deg/day)
public let XA_SATPARM_OMEGADOT = 18
//satellite's nodal precession rate (deg/day)
public let XA_SATPARM_RADOT    = 19
//satellite's nodal period (min)
public let XA_SATPARM_NODALPRD = 20
//satellite's nodal crossing time prior to its epoch (ds50UTC)
public let XA_SATPARM_NODALX   = 21
//satellite is GEO: 0=no, 1=yes
public let XA_SATPARM_ISGEO    = 22
//satellite's relative energy - only for GOBS
public let XA_SATPARM_RELENERGY = 23
//satellite's number
public let XA_SATPARM_SATNUM   = 24
//satellite's orbital elset type - see ELTTYPE_? for list of available values (old name XA_SATPARM_OET)
public let XA_SATPARM_ELTTYPE  = 25
//obsolete - should use new name XA_SATPARM_ELTTYPE intead
public let XA_SATPARM_OET      = 25
//satellite's propagation type - see PROPTYPE_? for list of available values
public let XA_SATPARM_PROPTYPE = 26
//satellite's element number
public let XA_SATPARM_ELSETNUM = 27
//sin(incl)*sin(r.a. node)
public let XA_SATPARM_WX       = 28
//-sin(incl)*cos(r.a. node)
public let XA_SATPARM_WY       = 29
//cos(incl)
public let XA_SATPARM_WZ       = 30
//Trough/Drift Flag, 0 - 75 deg trough, 1 - 255 deg trough, 2 - both troughs, 3 - unstable point, 4 - East drift, 5 - West drift
public let XA_SATPARM_TROUGH   = 31

public let XA_SATPARM_SIZE     = 32

// Different input time options of VP card
//VP's input time is in days since 1950 UTC
public let VP_TIME_DS50UTC = 0
//VP's input time is in minutes since epoch
public let VP_TIME_MSE     = 1

// VP record arrangement in array format
//VP's input time types (VP_TIME_DS50UTC or VP_TIME_MSE)
public let XA_VP_TIMETYPE    = 0
//VP's input time types (VP_TIME_DS50UTC or VP_TIME_MSE)
public let XA_VP_TIMEVAL     = 1
//impulse U-component of delta-velocity (km/sec)
public let XA_VP_IMPULSE_U   = 2
//impulse V-component of delta-velocity (km/sec)
public let XA_VP_IMPULSE_V   = 3
//impulse W-component of delta-velocity (km/sec)
public let XA_VP_IMPULSE_W   = 4
//apply above delta-v this number of times at the interval specified below
public let XA_VP_REPETITIONS = 5
//time interval in minutes between repetitions specified above
public let XA_VP_INTERVAL    = 6

public let XA_VP_SIZE        = 16

//*******************************************************************************

// ========================= End of auto generated code ==========================
