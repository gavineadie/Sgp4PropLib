// This wrapper file was generated automatically by the GenDllWrappers program.
import Foundation

#if os(Linux)
fileprivate let libHandle = loadDll("librotas.so")
#elseif os(Windows)
fileprivate let libHandle = loadDll("Rotas.dll")
#else
fileprivate let libHandle = loadDll("librotas.dylib")
#endif

// Notes: This function has been deprecated since v9.0. 
// Initializes Rotas DLL for use in the program
public func RotasInit( _ apAddr: Int64 ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64 ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "RotasInit"), to: FunctionSignature.self)

    return function(apAddr)
}

// Returns information about the current version of Rotas DLL. 
// The information is placed in the string parameter passed in.
public func RotasGetInfo( _ infoStr: UnsafeMutablePointer<CChar> ) {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "RotasGetInfo"), to: FunctionSignature.self)

    function(infoStr)
}

// Loads Rotas-related parameters from an input text file
public func RotasLoadFile( _ rotasInputFile: UnsafeMutablePointer<CChar> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "RotasLoadFile"), to: FunctionSignature.self)

    return function(rotasInputFile)
}

// Loads Rotas control parameters and all Rotas related data (environment, time, elsets, sensors, obs) from an input text file
public func RotasLoadFileAll( _ rotasInputFile: UnsafeMutablePointer<CChar> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "RotasLoadFileAll"), to: FunctionSignature.self)

    return function(rotasInputFile)
}

// Loads a single Rotas-typed card
public func RotasLoadCard( _ card: UnsafeMutablePointer<CChar> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "RotasLoadCard"), to: FunctionSignature.self)

    return function(card)
}

// Saves current Rotas settings to a file
public func RotasSaveFile( _ rotasFile: UnsafeMutablePointer<CChar>,
                           _ saveMode: Int32,
                           _ saveForm: Int32 ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar>,
                                                   Int32,
                                                   Int32 ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "RotasSaveFile"), to: FunctionSignature.self)

    return function(rotasFile, saveMode, saveForm)
}

// Builds and returns the Rotas P-Card from the current Rotas settings
public func RotasGetPCard( _ rotasPCard: UnsafeMutablePointer<CChar> ) {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "RotasGetPCard"), to: FunctionSignature.self)

    function(rotasPCard)
}

// Retrieves all Rotas control parameters with a single function call
public func RotasGetPAll( _ rotasMode: UnsafeMutablePointer<CChar>,
                          _ grossBeta: UnsafeMutablePointer<Double>,
                          _ betaLimit: UnsafeMutablePointer<Double>,
                          _ deltaTLimit: UnsafeMutablePointer<Double>,
                          _ deltaHLimit: UnsafeMutablePointer<Double>,
                          _ astat2Mult: UnsafeMutablePointer<Int32>,
                          _ prtFlag: UnsafeMutablePointer<Int32>,
                          _ retagFlag: UnsafeMutablePointer<Int32>,
                          _ ltcFlag: UnsafeMutablePointer<Int32>,
                          _ maxNumAssoc: UnsafeMutablePointer<Int32>,
                          _ debiasFlag: UnsafeMutablePointer<Int32>,
                          _ diagMode: UnsafeMutablePointer<Int32>,
                          _ covPrtFlag: UnsafeMutablePointer<Int32>,
                          _ isTrackMode: UnsafeMutablePointer<Int32>,
                          _ remRetagObs: UnsafeMutablePointer<Int32>,
                          _ extArr: UnsafeMutablePointer<Double> ) {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "RotasGetPAll"), to: FunctionSignature.self)

    function(rotasMode, grossBeta, betaLimit, deltaTLimit, deltaHLimit, astat2Mult, prtFlag, retagFlag, ltcFlag, maxNumAssoc, debiasFlag, diagMode, covPrtFlag, isTrackMode, remRetagObs, extArr)
}

// Sets all Rotas control parameters with a single function call
public func RotasSetPAll( _ rotasMode: UnsafeMutablePointer<CChar>,
                          _ grossBeta: Double,
                          _ betaLimit: Double,
                          _ deltaTLimit: Double,
                          _ deltaHLimit: Double,
                          _ astat2Mult: Int32,
                          _ prtFlag: Int32,
                          _ retagFlag: Int32,
                          _ ltcFlag: Int32,
                          _ maxNumAssoc: Int32,
                          _ debiasFlag: Int32,
                          _ diagMode: Int32,
                          _ covPrtFlag: Int32,
                          _ isTrackMode: Int32,
                          _ remRetagObs: Int32,
                          _ extArr: UnsafeMutablePointer<Double> ) {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar>,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   Int32,
                                                   Int32,
                                                   Int32,
                                                   Int32,
                                                   Int32,
                                                   Int32,
                                                   Int32,
                                                   Int32,
                                                   Int32,
                                                   Int32,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "RotasSetPAll"), to: FunctionSignature.self)

    function(rotasMode, grossBeta, betaLimit, deltaTLimit, deltaHLimit, astat2Mult, prtFlag, retagFlag, ltcFlag, maxNumAssoc, debiasFlag, diagMode, covPrtFlag, isTrackMode, remRetagObs, extArr)
}

// Retrieves the value of a specified Rotas control parameter (P-card field)
// <br>
// The table below shows the values for the xf_RP parameter:
// <table>
// <caption>table</caption>
// <tr>
// <td><b>Index</b></td>
// <td><b>Index Interpretation</b></td>
// </tr>
// <tr><td> 1 </td><td> Rotas processing mode</td></tr>
// <tr><td> 2 </td><td> Gross Beta limit (deg)</td></tr>
// <tr><td> 3 </td><td> ASTAT 0 Beta limit (deg)</td></tr>
// <tr><td> 4 </td><td> ASTAT 0 delta-t limit (min)</td></tr>
// <tr><td> 5 </td><td> ASTAT 0 delta-height limit (km)</td></tr>
// <tr><td> 6 </td><td> ASTAT 2 multiplier</td></tr>
// <tr><td> 7 </td><td> Residual print flag</td></tr>
// <tr><td> 8 </td><td> Retag ASTAT 1 ob flag</td></tr>
// <tr><td> 9 </td><td> Light-time correction flag</td></tr>
// <tr><td>10 </td><td> Maximum number of ALLEL assoc's to compute</td></tr>
// <tr><td>11 </td><td> Diagnostic print flag</td></tr>
// <tr><td>12 </td><td> Covariance print flag</td></tr>
// <tr><td>13 </td><td> Perform track processing</td></tr>
// <tr><td>14 </td><td> Retagged ob are removed from further association</td></tr>
// <tr><td>15 </td><td> Debias ob flag</td></tr>
// </table>
public func RotasGetPField( _ xf_RP: Int32, _ retVal: UnsafeMutablePointer<CChar> ) {

    typealias FunctionSignature = @convention(c) ( Int32,
                                                   UnsafeMutablePointer<CChar> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "RotasGetPField"), to: FunctionSignature.self)

    function(xf_RP, retVal)
}

//  Sets the value of a specified Rotas control parameter (P-card field)
// See RotasGetPField for values for the xf_RP parameter.
public func RotasSetPField( _ xf_RP: Int32, _ valueStr: UnsafeMutablePointer<CChar> ) {

    typealias FunctionSignature = @convention(c) ( Int32,
                                                   UnsafeMutablePointer<CChar> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "RotasSetPField"), to: FunctionSignature.self)

    function(xf_RP, valueStr)
}

// Gets ASTAT 1 association multipliers
public func RotasGetAssocMultipliers( _ xa_assocMultp: UnsafeMutablePointer<Int32> ) {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<Int32> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "RotasGetAssocMultipliers"), to: FunctionSignature.self)

    function(xa_assocMultp)
}

// Sets ASTAT 1 association multipliers
public func RotasSetAssocMultipliers( _ xa_assocMultp: UnsafeMutablePointer<Int32> ) {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<Int32> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "RotasSetAssocMultipliers"), to: FunctionSignature.self)

    function(xa_assocMultp)
}

// Resets all Rotas control parameters back to their default values
public func RotasResetAll(  ) {

    typealias FunctionSignature = @convention(c) (  ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "RotasResetAll"), to: FunctionSignature.self)

    function()
}

// Determines if the observation/satellite pair can possibly have an association
public func RotasHasASTAT( _ obsKey: Int64, _ satKey: Int64 ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   Int64 ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "RotasHasASTAT"), to: FunctionSignature.self)

    return function(obsKey, satKey)
}

// Determines if the observation/satellite pair can possibly have an association - suitable for multithread application (using global Multipliers)
public func RotasHasASTAT_MT( _ xa_rt_parms: UnsafeMutablePointer<Double>,
                              _ obsKey: Int64,
                              _ satKey: Int64 ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<Double>,
                                                   Int64,
                                                   Int64 ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "RotasHasASTAT_MT"), to: FunctionSignature.self)

    return function(xa_rt_parms, obsKey, satKey)
}

// Determines if the observation/satellite pair can possibly have an association - suitable for multithread application (using provided Multipliers)
public func RotasHasASTATMultp_MT( _ xa_assocMultp: UnsafeMutablePointer<Int32>,
                                   _ xa_rt_parms: UnsafeMutablePointer<Double>,
                                   _ obsKey: Int64,
                                   _ satKey: Int64 ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Double>,
                                                   Int64,
                                                   Int64 ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "RotasHasASTATMultp_MT"), to: FunctionSignature.self)

    return function(xa_assocMultp, xa_rt_parms, obsKey, satKey)
}

// Computes residuals for one observation against one satellite
// Obs type 0 (range rate only) cannot be used to compute residuals.
public func RotasComputeObsResiduals( _ obsKey: Int64,
                                      _ satKey: Int64,
                                      _ xa_ObsRes: UnsafeMutablePointer<Double>,
                                      _ satElts: UnsafeMutablePointer<Double>,
                                      _ obElts: UnsafeMutablePointer<Double> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   Int64,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "RotasComputeObsResiduals"), to: FunctionSignature.self)

    return function(obsKey, satKey, xa_ObsRes, satElts, obElts)
}

// Computes residuals for one observation against one satellite - suitable for multithread application (using global Multipliers)
// Obs type 0 (range rate only) cannot be used to compute residuals.
public func RotasComputeObsResiduals_MT( _ xa_rt_parms: UnsafeMutablePointer<Double>,
                                         _ obsKey: Int64,
                                         _ satKey: Int64,
                                         _ xa_ObsRes: UnsafeMutablePointer<Double>,
                                         _ satElts: UnsafeMutablePointer<Double>,
                                         _ obElts: UnsafeMutablePointer<Double> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<Double>,
                                                   Int64,
                                                   Int64,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "RotasComputeObsResiduals_MT"), to: FunctionSignature.self)

    return function(xa_rt_parms, obsKey, satKey, xa_ObsRes, satElts, obElts)
}

// Computes residuals for one observation against one satellite - suitable for multithread application (using provided Multipliers)
// Obs type 0 (range rate only) cannot be used to compute residuals.
public func RotasComputeObsResidualsMultp_MT( _ xa_assocMultp: UnsafeMutablePointer<Int32>,
                                              _ xa_rt_parms: UnsafeMutablePointer<Double>,
                                              _ obsKey: Int64,
                                              _ satKey: Int64,
                                              _ xa_ObsRes: UnsafeMutablePointer<Double>,
                                              _ satElts: UnsafeMutablePointer<Double>,
                                              _ obElts: UnsafeMutablePointer<Double> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Double>,
                                                   Int64,
                                                   Int64,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "RotasComputeObsResidualsMultp_MT"), to: FunctionSignature.self)

    return function(xa_assocMultp, xa_rt_parms, obsKey, satKey, xa_ObsRes, satElts, obElts)
}

// Computes residuals for a track of observations against one satellite. Each track is treated as a single entity (using global parameters)
public func RotasComputeTrackResiduals( _ obsKeys: UnsafeMutablePointer<Int64>,
                                        _ trackStartIdx: Int32,
                                        _ trackLength: Int32,
                                        _ satKey: Int64,
                                        _ xa_ObsRes: UnsafeMutablePointer<Double>,
                                        _ trackObsKeys: UnsafeMutablePointer<Int64>,
                                        _ b3ObsCard: UnsafeMutablePointer<CChar>,
                                        _ satElts: UnsafeMutablePointer<Double>,
                                        _ obElts: UnsafeMutablePointer<Double> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<Int64>,
                                                   Int32,
                                                   Int32,
                                                   Int64,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Int64>,
                                                   UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "RotasComputeTrackResiduals"), to: FunctionSignature.self)

    return function(obsKeys, trackStartIdx, trackLength, satKey, xa_ObsRes, trackObsKeys, b3ObsCard, satElts, obElts)
}

// Computes residuals for a track of observations against one satellite. Each track is treated as a single entity (using provided parameters)
public func RotasComputeTrackResiduals_MT( _ xa_assocMultp: UnsafeMutablePointer<Int32>,
                                           _ xa_rt_parms: UnsafeMutablePointer<Double>,
                                           _ obsKeys: UnsafeMutablePointer<Int64>,
                                           _ trackStartIdx: Int32,
                                           _ trackLength: Int32,
                                           _ satKey: Int64,
                                           _ xa_ObsRes: UnsafeMutablePointer<Double>,
                                           _ trackObsKeys: UnsafeMutablePointer<Int64>,
                                           _ b3ObsCard: UnsafeMutablePointer<CChar>,
                                           _ satElts: UnsafeMutablePointer<Double>,
                                           _ obElts: UnsafeMutablePointer<Double> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Int64>,
                                                   Int32,
                                                   Int32,
                                                   Int64,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Int64>,
                                                   UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "RotasComputeTrackResiduals_MT"), to: FunctionSignature.self)

    return function(xa_assocMultp, xa_rt_parms, obsKeys, trackStartIdx, trackLength, satKey, xa_ObsRes, trackObsKeys, b3ObsCard, satElts, obElts)
}

// Computes residuals for one observation against one satellite directly (no need to load ob and propagate satellite)
public func RotasCompObResDirect( _ obDataArr: UnsafeMutablePointer<Double>,
                                  _ satDataArr: UnsafeMutablePointer<Double>,
                                  _ xa_ObsRes: UnsafeMutablePointer<Double> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "RotasCompObResDirect"), to: FunctionSignature.self)

    return function(obDataArr, satDataArr, xa_ObsRes)
}

// Returns the name of the retag obs file
public func RotasGetRetagObsFile( _ retagObsFile: UnsafeMutablePointer<CChar> ) {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "RotasGetRetagObsFile"), to: FunctionSignature.self)

    function(retagObsFile)
}

// Sets the file name of the retag obs file
public func RotasSetRetagObsFile( _ retagObsFile: UnsafeMutablePointer<CChar> ) {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "RotasSetRetagObsFile"), to: FunctionSignature.self)

    function(retagObsFile)
}

// Different light-time correction (LTC) options
//Don't apply LTC
public let LTC_DONTAPPLY  = 0
//Apply LTC analytically
public let LTC_ANALYTIC   = 1
//Apply LTC exactly
public let LTC_EXACT      = 2

// Residual computation methods
//Delta/427M method
public let RESCOMPMETH_DELTA427M = 1
//Spadoc 4 method
public let RESCOMPMETH_SPADOC4   = 2

// PV Ob data
//ob ECI position X (km) in TEME of Date
public let XA_OBPV_POSX     =  0
//ob ECI position Y (km) in TEME of Date
public let XA_OBPV_POSY     =  1
//ob ECI position Z (km) in TEME of Date
public let XA_OBPV_POSZ     =  2
//ob ECI velocity X (km/sec) in TEME of Date
public let XA_OBPV_VELX     =  3
//ob ECI velocity Y (km/sec) in TEME of Date
public let XA_OBPV_VELY     =  4
//ob ECI velocity Z (km/sec) in TEME of Date
public let XA_OBPV_VELZ     =  5
//ob time in days since 1950, UTC
public let XA_OBPV_TIME     =  6

//the last available index
public let XA_OBPV_END      = 15
public let XA_OBPV_SIZE     = 16

// Satellite state data
//satellite ECI position X (km) in TEME of Date
public let XA_SATPV_POSX    =  0
//satellite ECI position Y (km) in TEME of Date
public let XA_SATPV_POSY    =  1
//satellite ECI position Z (km) in TEME of Date
public let XA_SATPV_POSZ    =  2
//satellite ECI velocity X (km/sec) in TEME of Date
public let XA_SATPV_VELX    =  3
//satellite ECI velocity Y (km/sec) in TEME of Date
public let XA_SATPV_VELY    =  4
//satellite ECI velocity Z (km/sec) in TEME of Date
public let XA_SATPV_VELZ    =  5

//the last available index
public let XA_SATPV_END     = 15
public let XA_SATPV_SIZE    = 16


// Obs residual data field indexes
//Azimuth residual (deg)
public let XA_OBSRES_AZ     =  0
//Elevation residual (deg)
public let XA_OBSRES_EL     =  1
//Range residual (km)
public let XA_OBSRES_RANGE  =  2
//Height residual (deg)
public let XA_OBSRES_HEIGHT =  3
//Beta residual (deg). asin(dot(priU, secW))
public let XA_OBSRES_BETA   =  4
//Delta T residual (min)
public let XA_OBSRES_DELTAT =  5
//Vector magnitude (km)
public let XA_OBSRES_VMAG   =  6
//Time since epoch (days)
public let XA_OBSRES_AGE    =  7
//True argument of latitude (deg)
public let XA_OBSRES_SU     =  8
//Revolution number
public let XA_OBSRES_REVNUM =  9
//Range rate residual (km/sec)
public let XA_OBSRES_RNGRATE = 10
//Observation ASTAT
public let XA_OBSRES_ASTAT  = 11
//Observation type
public let XA_OBSRES_OBSTYPE = 12
//Satellite true anomaly (deg)
public let XA_OBSRES_SATANOM = 13
//Satellite elevation (deg)
public let XA_OBSRES_SATELEV = 14
//Satellite maintenance category
public let XA_OBSRES_SATCAT = 15
//Obs time in ds50UTC
public let XA_OBSRES_OBSTIME = 16
//Obs azimuth (deg)
public let XA_OBSRES_OBSAZ  = 17
//Obs elevation (deg)
public let XA_OBSRES_OBSEL  = 18
//Velocity angle residual (deg)
public let XA_OBSRES_VELANG = 19
//Angular momentum residual (deg).  acos(dot(priW, secW))
public let XA_OBSRES_ANGMOM = 20
//Right ascension residual (deg) (for ob types 5, 9, 19)
public let XA_OBSRES_RA     = 21
//Declination residual (deg) (for ob types 5, 9, 19)
public let XA_OBSRES_DEC    = 22
//Delta X position (km)
public let XA_OBSRES_POSX   = 23
//Delta Y position (km)
public let XA_OBSRES_POSY   = 24
//Delta Z position (km)
public let XA_OBSRES_POSZ   = 25
//Delta X velocity (km/sec)
public let XA_OBSRES_VELX   = 26
//Delta Y velocity (km/sec)
public let XA_OBSRES_VELY   = 27
//Delta Z velocity (km/sec)
public let XA_OBSRES_VELZ   = 28
//Angle only - Obs computed range (km)
public let XA_OBSRES_OBSRNG = 29

//Obs right ascension (deg)
public let XA_OBSRES_OBSRA  = 30
//Obs declination (deg)
public let XA_OBSRES_OBSDEC = 31
//Delta east longitude (deg)
public let XA_OBSRES_LON    = 32

//Delta U position (km)
public let XA_OBSRES_POSU   = 33
//Delta V position (km)
public let XA_OBSRES_POSV   = 34
//Delta W position (km)
public let XA_OBSRES_POSW   = 35
//3D position chi-squared residual (km) (Light Time Correction flag must be set to 0 or 2, will not work with 1)
public let XA_OBSRES_CHI    = 36

//Angular Separation between Obs and State (Deg)
public let XA_OBSRES_ANGSEP = 38
//TDOA Time Difference of Arrival residual (nano-second)
public let XA_OBSRES_TDOA   = 39
//FDOA Frequency Differecnce of Arrival (Hz)
public let XA_OBSRES_FDOA   = 40

public let XA_OBSRES_SIZE   = 100

// Indexes of Rotas Control parameter fields (Rotas P-Card)
//Rotas processing mode
public let XF_RP_MODE       =  1
//Gross Beta limit (deg)
public let XF_RP_GROSSBETA  =  2
//ASTAT 0 Beta limit (deg)
public let XF_RP_BETALIM    =  3
//ASTAT 0 delta-t limit (min)
public let XF_RP_DELTATLIM  =  4
//ASTAT 0 delta-height limit (km)
public let XF_RP_DELTAHLIM  =  5
//ASTAT 2 multiplier
public let XF_RP_ASTAT2MULT =  6
//Residual print flag
public let XF_RP_PRTFLAG    =  7
//Retag ASTAT 1 ob flag
public let XF_RP_RETAGFLAG  =  8
//Light-time correction flag
public let XF_RP_LTC        =  9
//Maximum number of ALLEL assoc's to compute
public let XF_RP_NUMASSOC   = 10
//Diagnostic print flag
public let XF_RP_DIAGNOSTIC = 11
//Covariance print flag
public let XF_RP_PRTCOV     = 12
//Perform track processing
public let XF_RP_TRACKFLAG  = 13
//Retagged ob are removed from further association
public let XF_RP_REMRETAG   = 14
//Debias ob flag
public let XF_RP_DEBIAS     = 15
//Residual computation method: 1=DELTA/427M, 2=SPADOC-4(default)
public let XF_RP_RESCOMPMETH = 16

// ROTAS control parameters in input array xa_rt_parms that is used in RotasHasASTAT_MT() and
//Gross Beta limit (deg)
public let XA_RT_PARMS_GROSSBETA   =  1
//ASTAT 0 Beta limit (deg)
public let XA_RT_PARMS_BETALIM     =  2
//ASTAT 0 delta-t limit (min)
public let XA_RT_PARMS_DELTATLIM   =  3
//ASTAT 0 delta-height limit (km)
public let XA_RT_PARMS_DELTAHLIM   =  4
//ASTAT 2 multiplier
public let XA_RT_PARMS_ASTAT2MULT  =  5
//Light-time correction (LTC) flag: 0= don't apply LTC, 1= apply LTC analytically, 2= apply LTC exactly
public let XA_RT_PARMS_LTC         =  6
//debias ob flag: 0= do not debias, 1= debias ob
public let XA_RT_PARMS_DEBIAS      =  7
//Residual computation method: 1=DELTA/427M, 2=SPADOC-4(default)
public let XA_RT_PARMS_RESCOMPMETH =  8
//Flag for Annual Aberration 0 = do not apply, 1 = apply aberration correction
public let XA_RT_PARMS_ANNUALAB	   =  9
//Flag for Diurnal Aberration 0 = do not apply, 1 = apply aberration correction
public let XA_RT_PARMS_DIURNALAB   = 10
public let XA_RT_PARMS_SIZE        = 16

// ROTAS Association Multipliers
//ASTAT 1 Beta multiplier for Synchronous
public let XA_ASSOCMULTP_BETA_SYN   =  0
//ASTAT 1 Delta-t multiplier for Synchronous
public let XA_ASSOCMULTP_DELTAT_SYN =  1
//ASTAT 1 Delta-height multiplier for Synchronous
public let XA_ASSOCMULTP_DELTAH_SYN =  2
//ASTAT 1 Beta multiplier for Deep-space
public let XA_ASSOCMULTP_BETA_DS    =  3
//ASTAT 1 Delta-t multiplier for Deep-space
public let XA_ASSOCMULTP_DELTAT_DS  =  4
//ASTAT 1 Delta-height multiplier for Deep-space
public let XA_ASSOCMULTP_DELTAH_DS  =  5
//ASTAT 1 Beta multiplier for Decaying
public let XA_ASSOCMULTP_BETA_DCY   =  6
//ASTAT 1 Delta-t multiplier for Decaying
public let XA_ASSOCMULTP_DELTAT_DCY =  7
//ASTAT 1 Delta-height multiplier for Decaying
public let XA_ASSOCMULTP_DELTAH_DCY =  8
//ASTAT 1 Beta multiplier for Routine
public let XA_ASSOCMULTP_BETA_RTN   =  9
//ASTAT 1 Delta-t multiplier for Routine
public let XA_ASSOCMULTP_DELTAT_RTN = 10
//ASTAT 1 Delta-height multiplier for Routine
public let XA_ASSOCMULTP_DELTAH_RTN = 11

public let XA_ASSOCMULTP_SIZE       = 12

// ========================= End of auto generated code ==========================
