// This wrapper file was generated automatically by the GenDllWrappers program.
import Foundation

#if os(Linux)
fileprivate let libHandle = loadDll("libsgp4prop.so")
#elseif os(Windows)
fileprivate let libHandle = loadDll("Sgp4Prop.dll")
#else
fileprivate let libHandle = loadDll("libsgp4prop.dylib")
#endif

public func Sgp4Init( _ apAddr: Int64 ) -> Int32 {

    typealias functionSignature = @convention(c) ( Int64 ) -> Int32

    let function = unsafeBitCast(getFunctionPointer(libHandle, "Sgp4Init"), to: functionSignature.self)

    return function(apAddr)
}

public func Sgp4GetInfo( _ infoStr: UnsafeMutablePointer<CChar> ) {

    typealias functionSignature = @convention(c) ( UnsafeMutablePointer<CChar> ) -> Void

    let function = unsafeBitCast(getFunctionPointer(libHandle, "Sgp4GetInfo"), to: functionSignature.self)

    function(infoStr)
}

public func Sgp4InitSat( _ satKey: Int64 ) -> Int32 {

    typealias functionSignature = @convention(c) ( Int64 ) -> Int32

    let function = unsafeBitCast(getFunctionPointer(libHandle, "Sgp4InitSat"), to: functionSignature.self)

    return function(satKey)
}

public func Sgp4RemoveSat( _ satKey: Int64 ) -> Int32 {

    typealias functionSignature = @convention(c) ( Int64 ) -> Int32

    let function = unsafeBitCast(getFunctionPointer(libHandle, "Sgp4RemoveSat"), to: functionSignature.self)

    return function(satKey)
}

public func Sgp4RemoveAllSats(  ) -> Int32 {

    typealias functionSignature = @convention(c) (  ) -> Int32

    let function = unsafeBitCast(getFunctionPointer(libHandle, "Sgp4RemoveAllSats"), to: functionSignature.self)

    return function()
}

public func Sgp4GetCount(  ) -> Int32 {

    typealias functionSignature = @convention(c) (  ) -> Int32

    let function = unsafeBitCast(getFunctionPointer(libHandle, "Sgp4GetCount"), to: functionSignature.self)

    return function()
}

public func Sgp4PropMse( _ satKey: Int64,
                         _ mse: Double,
                         _ ds50UTC: UnsafeMutablePointer<Double>,
                         _ pos: UnsafeMutablePointer<Double>,
                         _ vel: UnsafeMutablePointer<Double>,
                         _ llh: UnsafeMutablePointer<Double> ) -> Int32 {

    typealias functionSignature = @convention(c) ( Int64,
                                                   Double,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Int32

    let function = unsafeBitCast(getFunctionPointer(libHandle, "Sgp4PropMse"), to: functionSignature.self)

    return function(satKey, mse, ds50UTC, pos, vel, llh)
}

public func Sgp4PropDs50UTC( _ satKey: Int64,
                             _ ds50UTC: Double,
                             _ mse: UnsafeMutablePointer<Double>,
                             _ pos: UnsafeMutablePointer<Double>,
                             _ vel: UnsafeMutablePointer<Double>,
                             _ llh: UnsafeMutablePointer<Double> ) -> Int32 {

    typealias functionSignature = @convention(c) ( Int64,
                                                   Double,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Int32

    let function = unsafeBitCast(getFunctionPointer(libHandle, "Sgp4PropDs50UTC"), to: functionSignature.self)

    return function(satKey, ds50UTC, mse, pos, vel, llh)
}

public func Sgp4PropDs50UtcPosVel( _ satKey: Int64,
                                   _ ds50UTC: Double,
                                   _ pos: UnsafeMutablePointer<Double>,
                                   _ vel: UnsafeMutablePointer<Double> ) -> Int32 {

    typealias functionSignature = @convention(c) ( Int64,
                                                   Double,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Int32

    let function = unsafeBitCast(getFunctionPointer(libHandle, "Sgp4PropDs50UtcPosVel"), to: functionSignature.self)

    return function(satKey, ds50UTC, pos, vel)
}

public func Sgp4PropDs50UtcLLH( _ satKey: Int64,
                                _ ds50UTC: Double,
                                _ llh: UnsafeMutablePointer<Double> ) -> Int32 {

    typealias functionSignature = @convention(c) ( Int64,
                                                   Double,
                                                   UnsafeMutablePointer<Double> ) -> Int32

    let function = unsafeBitCast(getFunctionPointer(libHandle, "Sgp4PropDs50UtcLLH"), to: functionSignature.self)

    return function(satKey, ds50UTC, llh)
}

public func Sgp4PropDs50UtcPos( _ satKey: Int64,
                                _ ds50UTC: Double,
                                _ pos: UnsafeMutablePointer<Double> ) -> Int32 {

    typealias functionSignature = @convention(c) ( Int64,
                                                   Double,
                                                   UnsafeMutablePointer<Double> ) -> Int32

    let function = unsafeBitCast(getFunctionPointer(libHandle, "Sgp4PropDs50UtcPos"), to: functionSignature.self)

    return function(satKey, ds50UTC, pos)
}

public func Sgp4GetPropOut( _ satKey: Int64,
                            _ xf_Sgp4Out: Int32,
                            _ destArr: UnsafeMutablePointer<Double> ) -> Int32 {

    typealias functionSignature = @convention(c) ( Int64,
                                                   Int32,
                                                   UnsafeMutablePointer<Double> ) -> Int32

    let function = unsafeBitCast(getFunctionPointer(libHandle, "Sgp4GetPropOut"), to: functionSignature.self)

    return function(satKey, xf_Sgp4Out, destArr)
}

public func Sgp4PropAll( _ satKey: Int64,
                         _ timeType: Int32,
                         _ timeIn: Double,
                         _ xa_Sgp4Out: UnsafeMutablePointer<Double> ) -> Int32 {

    typealias functionSignature = @convention(c) ( Int64,
                                                   Int32,
                                                   Double,
                                                   UnsafeMutablePointer<Double> ) -> Int32

    let function = unsafeBitCast(getFunctionPointer(libHandle, "Sgp4PropAll"), to: functionSignature.self)

    return function(satKey, timeType, timeIn, xa_Sgp4Out)
}

public func Sgp4PosVelToKep( _ yr: Int32,
                             _ day: Double,
                             _ pos: UnsafeMutablePointer<Double>,
                             _ vel: UnsafeMutablePointer<Double>,
                             _ posNew: UnsafeMutablePointer<Double>,
                             _ velNew: UnsafeMutablePointer<Double>,
                             _ sgp4MeanKep: UnsafeMutablePointer<Double> ) -> Int32 {

    typealias functionSignature = @convention(c) ( Int32,
                                                   Double,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Int32

    let function = unsafeBitCast(getFunctionPointer(libHandle, "Sgp4PosVelToKep"), to: functionSignature.self)

    return function(yr, day, pos, vel, posNew, velNew, sgp4MeanKep)
}

public func Sgp4PosVelToTleArr( _ pos: UnsafeMutablePointer<Double>,
                                _ vel: UnsafeMutablePointer<Double>,
                                _ xa_tle: UnsafeMutablePointer<Double> ) -> Int32 {

    typealias functionSignature = @convention(c) ( UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Int32

    let function = unsafeBitCast(getFunctionPointer(libHandle, "Sgp4PosVelToTleArr"), to: functionSignature.self)

    return function(pos, vel, xa_tle)
}

public func Sgp4ReepochTLE( _ satKey: Int64,
                            _ reepochDs50UTC: Double,
                            _ line1Out: UnsafeMutablePointer<CChar>,
                            _ line2Out: UnsafeMutablePointer<CChar> ) -> Int32 {

    typealias functionSignature = @convention(c) ( Int64,
                                                   Double,
                                                   UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<CChar> ) -> Int32

    let function = unsafeBitCast(getFunctionPointer(libHandle, "Sgp4ReepochTLE"), to: functionSignature.self)

    return function(satKey, reepochDs50UTC, line1Out, line2Out)
}

public func Sgp4ReepochCsv( _ satKey: Int64,
                            _ reepochDs50UTC: Double,
                            _ csvLine: UnsafeMutablePointer<CChar> ) -> Int32 {

    typealias functionSignature = @convention(c) ( Int64,
                                                   Double,
                                                   UnsafeMutablePointer<CChar> ) -> Int32

    let function = unsafeBitCast(getFunctionPointer(libHandle, "Sgp4ReepochCsv"), to: functionSignature.self)

    return function(satKey, reepochDs50UTC, csvLine)
}

public func Sgp4SetLicFilePath( _ licFilePath: UnsafeMutablePointer<CChar> ) {

    typealias functionSignature = @convention(c) ( UnsafeMutablePointer<CChar> ) -> Void

    let function = unsafeBitCast(getFunctionPointer(libHandle, "Sgp4SetLicFilePath"), to: functionSignature.self)

    function(licFilePath)
}

public func Sgp4GetLicFilePath( _ licFilePath: UnsafeMutablePointer<CChar> ) {

    typealias functionSignature = @convention(c) ( UnsafeMutablePointer<CChar> ) -> Void

    let function = unsafeBitCast(getFunctionPointer(libHandle, "Sgp4GetLicFilePath"), to: functionSignature.self)

    function(licFilePath)
}

public func Sgp4GenEphems( _ satKey: Int64,
                           _ startTime: Double,
                           _ endTime: Double,
                           _ stepSize: Double,
                           _ sgp4_ephem: Int32,
                           _ arrSize: Int32,
                           _ ephemArr: UnsafeMutablePointer<(Double, Double, Double, Double, Double, Double, Double)>,
                           _ genEphemPts: UnsafeMutablePointer<Int32> ) -> Int32 {

    let _ephemArr = UnsafeMutableRawPointer(ephemArr).bindMemory(to: Double.self, capacity: 0)

    typealias functionSignature = @convention(c) ( Int64,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   Int32,
                                                   Int32,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Int32> ) -> Int32

    let function = unsafeBitCast(getFunctionPointer(libHandle, "Sgp4GenEphems"), to: functionSignature.self)

    return function(satKey, startTime, endTime, stepSize, sgp4_ephem, arrSize, _ephemArr, genEphemPts)
}

public func Sgp4GenEphems_OS( _ xa_tle: UnsafeMutablePointer<Double>,
                              _ startTime: Double,
                              _ endTime: Double,
                              _ stepSize: Double,
                              _ sgp4_ephem: Int32,
                              _ arrSize: Int32,
                              _ ephemArr: UnsafeMutablePointer<(Double, Double, Double, Double, Double, Double, Double)>,
                              _ genEphemPts: UnsafeMutablePointer<Int32> ) -> Int32 {

    let _ephemArr = UnsafeMutableRawPointer(ephemArr).bindMemory(to: Double.self, capacity: 0)

    typealias functionSignature = @convention(c) ( UnsafeMutablePointer<Double>,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   Int32,
                                                   Int32,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Int32> ) -> Int32

    let function = unsafeBitCast(getFunctionPointer(libHandle, "Sgp4GenEphems_OS"), to: functionSignature.self)

    return function(xa_tle, startTime, endTime, stepSize, sgp4_ephem, arrSize, _ephemArr, genEphemPts)
}

public func Sgp4PropAllSats( _ satKeys: UnsafeMutablePointer<Int64>,
                             _ numOfSats: Int32,
                             _ ds50UTC: Double,
                             _ ephemArr: UnsafeMutablePointer<(Double, Double, Double, Double, Double, Double)> ) -> Int32 {

    let _ephemArr = UnsafeMutableRawPointer(ephemArr).bindMemory(to: Double.self, capacity: 0)

    typealias functionSignature = @convention(c) ( UnsafeMutablePointer<Int64>,
                                                   Int32,
                                                   Double,
                                                   UnsafeMutablePointer<Double> ) -> Int32

    let function = unsafeBitCast(getFunctionPointer(libHandle, "Sgp4PropAllSats"), to: functionSignature.self)

    return function(satKeys, numOfSats, ds50UTC, _ephemArr)
}

// Different time types for passing to Sgp4PropAll
//propagation time is in minutes since epoch
let SGP4_TIMETYPE_MSE      = 0
//propagation time is in days since 1950, UTC
let SGP4_TIMETYPE_DS50UTC  = 1

// Sgp4 propagated output fields
//Revolution number
let XF_SGP4OUT_REVNUM       = 1
//Nodal period, apogee, perigee
let XF_SGP4OUT_NODAL_AP_PER = 2
//Mean Keplerian
let XF_SGP4OUT_MEAN_KEP     = 3
//Osculating Keplerian
let XF_SGP4OUT_OSC_KEP      = 4

// Sgp4 propagated data
//Propagation time in days since 1950, UTC
let XA_SGP4OUT_DS50UTC      =  0
//Propagation time in minutes since the satellite's epoch time
let XA_SGP4OUT_MSE          =  1
//ECI X position (km) in True Equator and Mean Equinox of Epoch
let XA_SGP4OUT_POSX         =  2
//ECI Y position (km) in True Equator and Mean Equinox of Epoch
let XA_SGP4OUT_POSY         =  3
//ECI Z position (km) in True Equator and Mean Equinox of Epoch
let XA_SGP4OUT_POSZ         =  4
//ECI X velocity (km/s) in True Equator and Mean Equinox of Epoch
let XA_SGP4OUT_VELX         =  5
//ECI Y velocity (km/s) in True Equator and Mean Equinox of Epoch
let XA_SGP4OUT_VELY         =  6
//ECI Z velocity (km/s) in True Equator and Mean Equinox of Epoch
let XA_SGP4OUT_VELZ         =  7
//Geodetic latitude (deg)
let XA_SGP4OUT_LAT          =  8
//Geodetic longitude (deg)
let XA_SGP4OUT_LON          =  9
//Height above geoid (km)
let XA_SGP4OUT_HEIGHT       = 10
//Revolution number
let XA_SGP4OUT_REVNUM       = 11
//Nodal period (min)
let XA_SGP4OUT_NODALPER     = 12
//Apogee (km)
let XA_SGP4OUT_APOGEE       = 13
//Perigee (km)
let XA_SGP4OUT_PERIGEE      = 14
//Mean semi-major axis (km)
let XA_SGP4OUT_MN_A         = 15
//Mean eccentricity (unitless)
let XA_SGP4OUT_MN_E         = 16
//Mean inclination (deg)
let XA_SGP4OUT_MN_INCLI     = 17
//Mean mean anomaly (deg)
let XA_SGP4OUT_MN_MA        = 18
//Mean right ascension of the asending node (deg)
let XA_SGP4OUT_MN_NODE      = 19
//Mean argument of perigee (deg)
let XA_SGP4OUT_MN_OMEGA     = 20
//Osculating semi-major axis (km)
let XA_SGP4OUT_OSC_A        = 21
//Osculating eccentricity (unitless)
let XA_SGP4OUT_OSC_E        = 22
//Osculating inclination (deg)
let XA_SGP4OUT_OSC_INCLI    = 23
//Osculating mean anomaly (deg)
let XA_SGP4OUT_OSC_MA       = 24
//Osculating right ascension of the asending node (deg)
let XA_SGP4OUT_OSC_NODE     = 25
//Osculating argument of perigee (deg)
let XA_SGP4OUT_OSC_OMEGA    = 26

let XA_SGP4OUT_SIZE         = 64

// Different options for generating ephemerides from SGP4
//ECI TEME of DATE     - 0: time in days since 1950 UTC, 1-3: pos (km), 4-6: vel (km/sec)
let SGP4_EPHEM_ECI   = 1
//MEME of J2K (4 terms)- 0: time in days since 1950 UTC, 1-3: pos (km), 4-6: vel (km/sec)
let SGP4_EPHEM_J2K   = 2


// Different dynamic step size options
//Use a simple algorithm to determine step size based on satellite's current position
let DYN_SS_BASIC  = -1

//*******************************************************************************


// Different return values of errCode from Sgp4 propagation
//SGP4 propagates successfully
let GP_ERR_NONE        = 0
//Bad FK model (FK5 must be selected)
let GP_ERR_BADFK       = 1
//A is negative
let GP_ERR_ANEGATIVE   = 2
//A is to large
let GP_ERR_ATOOLARGE   = 3
//Eccentricity is hyperbolic
let GP_ERR_EHYPERPOLIC = 4
//Eccentricity is negative
let GP_ERR_ENEGATIVE   = 5
//Mean anomaly is too large
let GP_ERR_MATOOLARGE  = 6
//e**2 is too large
let GP_ERR_E2TOOLARGE  = 7


//*******************************************************************************


// ========================= End of auto generated code ==========================
