// This wrapper file was generated automatically by the GenDllWrappers program.
import Foundation

#if os(Linux)
fileprivate let libHandle = loadDll("libsatstate.so")
#elseif os(Windows)
fileprivate let libHandle = loadDll("SatState.dll")
#else
fileprivate let libHandle = loadDll("libsatstate.dylib")
#endif

// Notes: This function has been deprecated since v9.0. 
// Initializes SatState DLL for use in the program
// If this function returns an error, it is recommended that the users stop the program immediately. 
// The error occurs if the users forget to load and initialize all the prerequisite DLLs, 
// as listed in the DLL Prerequisite section, before using this DLL.
public func SatStateInit( _ apAddr: Int64 ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64 ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SatStateInit"), to: FunctionSignature.self)

    return function(apAddr)
}

// Returns information about the current version of SatState DLL. 
// The information is placed in the string parameter passed in.
// The returned string provides information about the version number, build date, and the platform of the SatState DLL. 
public func SatStateGetInfo( _ infoStr: UnsafeMutablePointer<CChar> ) {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SatStateGetInfo"), to: FunctionSignature.self)

    function(infoStr)
}

// Loads any orbital element types (TLE's/SPVEC's/VCM's), EXTEPHEM's, and/or propagator controls from an input text file
// Internally, if taskMode = 1, this function calls SpProp.SpLoadFile(); 
// and if taskMode = 2, this function calls Tle.TleLoadFile(), SpVec.SpVecLoadFile(), Vcm.VcmLoadFile(), ExtEphem.ExtEphLoadFile(); 
// if taskMode = 3, both tasks (1 and 2) are executed.
public func SatStateLoadFile( _ inputFile: UnsafeMutablePointer<CChar>, _ xf_Task: Int32 ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar>,
                                                   Int32 ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SatStateLoadFile"), to: FunctionSignature.self)

    return function(inputFile, xf_Task)
}

// Saves currently loaded orbital element types (TLE's/SPVEC's/VCM's), EXTEPHEM's, and/or propagator controls to a file
// The purpose of this function is to save the current SatState-related settings, usually used in GUI applications, for future use.
// 
// Internally, if taskMode = 1, this function calls SpProp.SpSaveFile(); 
// and if taskMode = 2, this function calls Tle.TleSaveFile(), SpVec.SpVecSavedFile(), Vcm.VcmSaveFile(), ExtEphem.ExtEphSaveFile(); 
// if taskMode = 3, both tasks (1 and 2) are executed.
public func SatStateSaveFile( _ outFile: UnsafeMutablePointer<CChar>,
                              _ saveMode: Int32,
                              _ saveForm: Int32,
                              _ xf_Task: Int32 ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar>,
                                                   Int32,
                                                   Int32,
                                                   Int32 ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SatStateSaveFile"), to: FunctionSignature.self)

    return function(outFile, saveMode, saveForm, xf_Task)
}

// Removes a satellite from the appropriate elset DLL's set of loaded satellites. 
// The function will automatically choose the proper set of elsets from which to remove the satellite. 
// The choices are: Tle.dll, SpVec.dll, Vcm.dll, or ExtEphem.dll   
// If the users enter an invalid satKey (a satKey that does not exist in memory), the function will return a non-zero value indicating an error.
public func SatStateRemoveSat( _ satKey: Int64 ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64 ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SatStateRemoveSat"), to: FunctionSignature.self)

    return function(satKey)
}

// Removes a satellite from the appropriate sets of loaded satellites (elset dll and propagator dll). 
// The function will remove the satellite from the elset DLL's sets as in SatStateRemoveSat() and 
// from the appropriate propagator's set of initialized satellites if it exists there.
public func SatStateRemoveSatAll( _ satKey: Int64 ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64 ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SatStateRemoveSatAll"), to: FunctionSignature.self)

    return function(satKey)
}

// Removes all satellites from all of the loaded data sets. 
// It will remove all satellites from the following sets: Tle, SpVec, Vcm, ExtEphem, Sgp4Prop, and SpProp
public func SatStateRemoveAllSats(  ) -> Int32 {

    typealias FunctionSignature = @convention(c) (  ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SatStateRemoveAllSats"), to: FunctionSignature.self)

    return function()
}

// Resets propagator settings back to their default values
public func SatStateReset(  ) {

    typealias FunctionSignature = @convention(c) (  ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SatStateReset"), to: FunctionSignature.self)

    function()
}

// Returns the total number of satellites (TLE's, SPVEC's, VCM's, and EXTEPHEM's) currently loaded in memory
// See SatStateGetLoaded for example.
// This function is useful for dynamically allocating memory for the array that is passed to the function SatStateGetLoaded.
public func SatStateGetCount(  ) -> Int32 {

    typealias FunctionSignature = @convention(c) (  ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SatStateGetCount"), to: FunctionSignature.self)

    return function()
}

// Retrieves all of the currently loaded satKeys. 
// These satKeys can be used to access the internal data for the satellites.
// It is recommended that SatStateGetCount() is used to count how many satellites are currently loaded in memory. 
// The user can then use this number to dynamically allocate the satKeys array and pass it to this function.
// 
// If the user prefers to pass a static array to the function, make sure it is big enough to store all the satKeys in memory.
public func SatStateGetLoaded( _ order: Int32, _ satKeys: UnsafeMutablePointer<Int64> ) {

    typealias FunctionSignature = @convention(c) ( Int32,
                                                   UnsafeMutablePointer<Int64> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SatStateGetLoaded"), to: FunctionSignature.self)

    function(order, satKeys)
}

// Returns the first satKey that contains the specified satellite number in all sets of loaded satellites. 
// These sets will be searched: Tle, SpVec, Vcm, and ExtEphem.
// This function is useful when a satellite is used in applications that require only one record for one 
// satellite and the applications refer to that satellite by its satellite number. 
// However, the Astrodynamic Standard Shared library is only working with satKeys, this function helps to return the associated satKey of that satellite.
public func SatStateNumToKey( _ satNum: Int32 ) -> Int64 {

    typealias FunctionSignature = @convention(c) ( Int32 ) -> Int64

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SatStateNumToKey"), to: FunctionSignature.self)

    return function(satNum)
}

// Retrieves the data which is common to all satellite types. 
// All common fields are retrieved with a single function call.
// The apogee height and perigee height are defined as the distance above an ellipsoid 
// created using the earth flattening factor from the selected geopotential model.
// Note:  When using SP elsets (TLE type 6, SPVEC, or VCM), calling SatStateGetSatDataAll 
// will implicitly call SpInit in order to extract the mu value from the GEO file the elset is tied to.  
// The elset must have a valid GEO directory available or an error will be returned.
public func SatStateGetSatDataAll( _ satKey: Int64,
                                   _ satNum: UnsafeMutablePointer<Int32>,
                                   _ satName: UnsafeMutablePointer<CChar>,
                                   _ eltType: UnsafeMutablePointer<Int32>,
                                   _ revNum: UnsafeMutablePointer<Int32>,
                                   _ epochDs50UTC: UnsafeMutablePointer<Double>,
                                   _ bField: UnsafeMutablePointer<Double>,
                                   _ elsetNum: UnsafeMutablePointer<Int32>,
                                   _ incli: UnsafeMutablePointer<Double>,
                                   _ node: UnsafeMutablePointer<Double>,
                                   _ eccen: UnsafeMutablePointer<Double>,
                                   _ omega: UnsafeMutablePointer<Double>,
                                   _ mnAnomaly: UnsafeMutablePointer<Double>,
                                   _ mnMotion: UnsafeMutablePointer<Double>,
                                   _ period: UnsafeMutablePointer<Double>,
                                   _ perigeeHt: UnsafeMutablePointer<Double>,
                                   _ apogeeHt: UnsafeMutablePointer<Double>,
                                   _ perigee: UnsafeMutablePointer<Double>,
                                   _ apogee: UnsafeMutablePointer<Double>,
                                   _ a: UnsafeMutablePointer<Double> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SatStateGetSatDataAll"), to: FunctionSignature.self)

    return function(satKey, satNum, satName, eltType, revNum, epochDs50UTC, bField, elsetNum, incli, node, eccen, omega, mnAnomaly, mnMotion, period, perigeeHt, apogeeHt, perigee, apogee, a)
}

// Retrieves an individual field of a satellite. 
public func SatStateGetSatDataField( _ satKey: Int64,
                                     _ xf_Sat: Int32,
                                     _ retVal: UnsafeMutablePointer<CChar> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   Int32,
                                                   UnsafeMutablePointer<CChar> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SatStateGetSatDataField"), to: FunctionSignature.self)

    return function(satKey, xf_Sat, retVal)
}

// Initializes a TLE, SPVEC, or VCM in preparation for propagation, or an EXTEPHEM in preparation for interpolation
public func SatStateInitSat( _ satKey: Int64 ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64 ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SatStateInitSat"), to: FunctionSignature.self)

    return function(satKey)
}

// Propagates a TLE/SPVEC/VCM, or interpolates an EXTEPHEM. 
// The satellite is propagated/interpolated to the specified time calculated in minutes since the satellite's epoch time
public func SatStateMse( _ satKey: Int64,
                         _ mse: Double,
                         _ ds50UTC: UnsafeMutablePointer<Double>,
                         _ revNum: UnsafeMutablePointer<Int32>,
                         _ pos: UnsafeMutablePointer<Double>,
                         _ vel: UnsafeMutablePointer<Double>,
                         _ llh: UnsafeMutablePointer<Double> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   Double,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SatStateMse"), to: FunctionSignature.self)

    return function(satKey, mse, ds50UTC, revNum, pos, vel, llh)
}

// Propagates a TLE/SPVEC/VCM, or interpolates an EXTEPHEM. 
// The satellite is propagated/interpolated to the specified time calculated in days since 1950, UTC.
public func SatStateDs50UTC( _ satKey: Int64,
                             _ ds50UTC: Double,
                             _ mse: UnsafeMutablePointer<Double>,
                             _ revNum: UnsafeMutablePointer<Int32>,
                             _ pos: UnsafeMutablePointer<Double>,
                             _ vel: UnsafeMutablePointer<Double>,
                             _ llh: UnsafeMutablePointer<Double> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   Double,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SatStateDs50UTC"), to: FunctionSignature.self)

    return function(satKey, ds50UTC, mse, revNum, pos, vel, llh)
}

// Returns additional propagated/interpolated results (reserved for future implementation)
// Reserved for future implementation
// Use this function immediately after the call to SatStateMse or SatStateDs50UTC. 
public func SatStateGetPropOut( _ satKey: Int64,
                                _ index: Int32,
                                _ destArr: UnsafeMutablePointer<Double> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   Int32,
                                                   UnsafeMutablePointer<Double> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SatStateGetPropOut"), to: FunctionSignature.self)

    return function(satKey, index, destArr)
}

// Returns various ephemeris comparison results between two satellite states.
// <br>
// The "in-track" is NOT the velocity direction, but is defined as completing the right handed coordinate system 
// defined by the position vector (radial) and the angular momentum vector (cross-track).
public func SatStateEphCom( _ primSatKey: Int64,
                            _ secSatKey: Int64,
                            _ ds50UTC: Double,
                            _ uvwFlag: Int32,
                            _ xa_Delta: UnsafeMutablePointer<Double> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   Int64,
                                                   Double,
                                                   Int32,
                                                   UnsafeMutablePointer<Double> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SatStateEphCom"), to: FunctionSignature.self)

    return function(primSatKey, secSatKey, ds50UTC, uvwFlag, xa_Delta)
}

// Returns various ephemeris comparison results between two satellite states (_OS one step) .
// <br>
// The "in-track" is NOT the velocity direction, but is defined as completing the right handed coordinate system 
// defined by the position vector (radial) and the angular momentum vector (cross-track).
public func SatStateEphCom_OS( _ priPosVel: UnsafeMutablePointer<Double>,
                               _ secPosVel: UnsafeMutablePointer<Double>,
                               _ ds50UTC: Double,
                               _ uvwFlag: Int32,
                               _ xa_Delta: UnsafeMutablePointer<Double> ) {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   Double,
                                                   Int32,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SatStateEphCom_OS"), to: FunctionSignature.self)

    function(priPosVel, secPosVel, ds50UTC, uvwFlag, xa_Delta)
}

// Determines if a satellite contains covariance matrix. 
// 0=no, 1=yes
public func SatStateHasCovMtx( _ satKey: Int64 ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64 ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SatStateHasCovMtx"), to: FunctionSignature.self)

    return function(satKey)
}

// Propagates/Interpolates UVW covariance matrix from VCM/External ephemeris to the time in days since 1950
public func SatStateGetCovUVW( _ satKey: Int64,
                               _ ds50UTC: Double,
                               _ covUVW: UnsafeMutablePointer<(Double, Double, Double, Double, Double, Double)> ) -> Int32 {

    let _covUVW = UnsafeMutableRawPointer(covUVW).bindMemory(to: Double.self, capacity: 36)

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   Double,
                                                   UnsafeMutablePointer<Double> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SatStateGetCovUVW"), to: FunctionSignature.self)

    return function(satKey, ds50UTC, _covUVW)
}

// Generate external ephemeris file for the specified satellite (via its unique satKey) 
// Note: No need to initialize the satellite before this call. If it was intialized, it will be removed after this call
public func SatStateGenEphFile( _ satKey: Int64,
                                _ startDs50UTC: Double,
                                _ stopDs50UTC: Double,
                                _ stepSizeSecs: Double,
                                _ ephFileName: UnsafeMutablePointer<CChar>,
                                _ ephFileType: Int32 ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   UnsafeMutablePointer<CChar>,
                                                   Int32 ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SatStateGenEphFile"), to: FunctionSignature.self)

    return function(satKey, startDs50UTC, stopDs50UTC, stepSizeSecs, ephFileName, ephFileType)
}

// Finds the time of ascending nodal crossing of the specified satellite prior to an input time in days since 1950 TAI
public func GetNodalCrossingPriorToTime( _ satKey: Int64, _ ds50TAI: Double ) -> Double {

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   Double ) -> Double

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "GetNodalCrossingPriorToTime"), to: FunctionSignature.self)

    return function(satKey, ds50TAI)
}

// Get the Gobs parameters for a TLE
public func GetGobsParams( _ satKey: Int64,
                           _ ds50UTC: Double,
                           _ xa_gobs: UnsafeMutablePointer<Double>,
                           _ errCode: UnsafeMutablePointer<Int32> ) {

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   Double,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Int32> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "GetGobsParams"), to: FunctionSignature.self)

    function(satKey, ds50UTC, xa_gobs, errCode)
}

// Does an XP GOBS comparison
public func GobsCom( _ primSatKey: Int64,
                     _ secSatKey: Int64,
                     _ ds50UTC: Double,
                     _ xa_gobs_lim: UnsafeMutablePointer<Double>,
                     _ xa_gobs_delta: UnsafeMutablePointer<Double> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   Int64,
                                                   Double,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "GobsCom"), to: FunctionSignature.self)

    return function(primSatKey, secSatKey, ds50UTC, xa_gobs_lim, xa_gobs_delta)
}

// Does an XP GOBS comparison using gobs arrays
public func GobsComArr( _ xa_gobs_prim: UnsafeMutablePointer<Double>,
                        _ xa_gobs_sec: UnsafeMutablePointer<Double>,
                        _ xa_gobs_lim: UnsafeMutablePointer<Double>,
                        _ xa_gobs_delta: UnsafeMutablePointer<Double> ) {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "GobsComArr"), to: FunctionSignature.self)

    function(xa_gobs_prim, xa_gobs_sec, xa_gobs_lim, xa_gobs_delta)
}

// Indexes of available satellite data fields
//Satellite epoch time in days since 1950 UTC
public let XF_SATFIELD_EPOCHUTC =  1
//Mean anomaly (deg)
public let XF_SATFIELD_MNANOM   =  2
//Right ascension of asending node (deg)
public let XF_SATFIELD_NODE     =  3
//Argument of perigee (deg)
public let XF_SATFIELD_OMEGA    =  4
//Satellite's period (min)
public let XF_SATFIELD_PERIOD   =  5
//Eccentricity
public let XF_SATFIELD_ECCEN    =  6
//Orbit inclination (deg)
public let XF_SATFIELD_INCLI    =  7
//Mean motion (rev/day)
public let XF_SATFIELD_MNMOTION =  8
//GP B* drag term (1/er)  or SP Radiation Pressure Coefficient
public let XF_SATFIELD_BFIELD   =  9
//Perigee height above the geoid (km)
public let XF_SATFIELD_PERIGEEHT = 10
//Apogee height above the geoid (km)
public let XF_SATFIELD_APOGEEHT = 11
//Perigee height above the center of the earth (km)
public let XF_SATFIELD_PERIGEE  = 12
//Apogee height above the center of the earth (km)
public let XF_SATFIELD_APOGEE   = 13
//Semimajor axis (km)
public let XF_SATFIELD_A        = 14
//Mean motion derivative (rev/day**2 /2)
public let XF_SATFIELD_NDOT     = 15
//Satellite category (Synchronous, Deep space, Decaying, Routine)
public let XF_SATFIELD_SATCAT   = 16
//Astat 3 Height multiplier
public let XF_SATFIELD_HTM3     = 17
//Center of mass offset (m)
public let XF_SATFIELD_CMOFFSET = 18
//Unused
public let XF_SATFIELD_N2DOT    = 19
//GP node dot (deg/s)
public let XF_SATFIELD_NODEDOT  = 20
//GP only - the last time when propagation has error
public let XF_SATFIELD_ERRORTIME = 21
//value of mu
public let XF_SATFIELD_MU       = 22


//*******************************************************************************

// Indexes of available deltas
//delta position (km)
public let XA_DELTA_POS         =  0
//delta time (sec)
public let XA_DELTA_TIME        =  1
//delta position in radial direction (km)
public let XA_DELTA_PRADIAL     =  2
//delta position in in-track direction (km)
public let XA_DELTA_PINTRCK     =  3
//delta position in cross-track direction (km)
public let XA_DELTA_PCRSSTRCK   =  4
//delta velocity (km/sec)
public let XA_DELTA_VEL         =  5
//delta velocity in radial direction (km/sec)
public let XA_DELTA_VRADIAL     =  6
//delta velocity in in-track direction (km/sec)
public let XA_DELTA_VINTRCK     =  7
//delta velocity in cross-track direction (km/sec)
public let XA_DELTA_VCRSSTRCK   =  8
//delta Beta (deg)
public let XA_DELTA_BETA        =  9
//delta height (km)
public let XA_DELTA_HEIGHT      = 10
//delta angular momentum (deg)
public let XA_DELTA_ANGMOM      = 11
//3D position Mahalanobis distance in UVW Space (Bubble Covariance, only if covariance propagation is available or turned on)
public let XA_DELTA_MHLNBS_UVW  = 12
//3D position Mahalanobis distance in Height-Time_Beta Space (Banana Covariance, only if covariance propagation is available or turned on)
public let XA_DELTA_MHLNBS_HTB  = 13

public let XA_DELTA_SIZE        = 100

// Indexes of Satellite data fields
//Satellite number I5
public let XF_SAT_NUM      =  1
//Satellite international designator A8
public let XF_SAT_NAME     =  2
//Element type I1 (old name XF_SAT_EPHTYPE)
public let XF_SAT_ELTTYPE  =  3
//Obsolete - should use new name XF_SAT_ELTTYPE instead
public let XF_SAT_EPHTYPE  =  3
//Epoch revolution number I6
public let XF_SAT_REVNUM   =  4
//Epoch time in days since 1950
public let XF_SAT_EPOCH    =  5
//BStar drag component (GP) or Ballistic coefficient-BTerm (SP) (m^2/kg)
public let XF_SAT_BFIELD   =  6
//Element set number
public let XF_SAT_ELSETNUM =  7
//Inclination (deg)
public let XF_SAT_INCLI    =  8
//Right ascension of ascending node (deg)
public let XF_SAT_NODE     =  9
//Eccentricity
public let XF_SAT_ECCEN    = 10
//Argument of perigee (deg)
public let XF_SAT_OMEGA    = 11
//Mean anomaly (deg)
public let XF_SAT_MNANOM   = 12
//Mean motion (revs/day)
public let XF_SAT_MNMOTN   = 13
//Satellite period (min)
public let XF_SAT_PERIOD   = 14
//Perigee Height(km)
public let XF_SAT_PERIGEEHT = 15
//Apogee Height (km)
public let XF_SAT_APOGEEHT = 16
//Perigee(km)
public let XF_SAT_PERIGEE  = 17
//Apogee (km)
public let XF_SAT_APOGEE   = 18
//Semi-major axis (km)
public let XF_SAT_A        = 19


// Indexes of SatState's load/save file task mode
//Only load/save propagator control parameters
public let XF_TASK_CTRLONLY = 1
//Only load/save orbital elements/external ephemeris data
public let XF_TASK_SATONLY  = 2
//Load/Save both 1 and 2
public let XF_TASK_BOTH     = 3


// Different external ephemeris file types
//ITC file format
public let EPHFILETYPE_ITC         =  1
//ITC compact (without covariance matrix) file format
public let EPHFILETYPE_ITC_WOCOV   =  2


// Gobs records
//Satellite number
public let XA_GOBS_SATNUM    =  0
//East Longitude
public let XA_GOBS_LONE      =  1
//Longitude Drift Rate
public let XA_GOBS_DRIFT     =  2
//satellite's relative energy (deg^2/sec^2) - only for GOBS
public let XA_GOBS_RELENERGY =  3
//sin(incl)*sin(r.a. node)
public let XA_GOBS_WX        =  4
//-sin(incl)*cos(r.a. node)
public let XA_GOBS_WY        =  5
//cos(incl)
public let XA_GOBS_WZ        =  6
//abar x
public let XA_GOBS_ABARX     =  7
//abar y
public let XA_GOBS_ABARY     =  8
//abar z
public let XA_GOBS_ABARZ     =  9
//AGOM
public let XA_GOBS_AGOM      = 10
//Trough/Drift Flag, 0 - 75 deg trough, 1 - 255 deg trough, 2 - both troughs, 3 - unstable point, 4 - East drift, 5 - West drift
public let XA_GOBS_TROUGH    = 11
//Total Energy of sat (-mu/(2*a))
public let XA_GOBS_TOTENERGY = 12
//Inclination of sat
public let XA_GOBS_INCL      = 13

public let XA_GOBS_SIZE      = 32


// Indexes of GOBS limits
//0 - ignore trough logic, 1 - implement trough logic
public let XA_GOBS_LIM_TROUGH      =  0
//Primary satellite is plane changer
public let XA_GOBS_LIM_PCP         =  1
//Secondary satellite is plane changer
public let XA_GOBS_LIM_PCS         =  2
//Primary satellite is plane changer
public let XA_GOBS_LIM_ACTIVEP     =  3
//Secondary satellite is plane changer
public let XA_GOBS_LIM_ACTIVES     =  4
//Min Longitude of sat
public let XA_GOBS_LIM_LONGMIN     =  5
//Max Longitude of sat
public let XA_GOBS_LIM_LONGMAX     =  6
//Min Agom of sat
public let XA_GOBS_LIM_AGOMMIN     =  7
//Max Agom of sat
public let XA_GOBS_LIM_AGOMMAX     =  8
//Max Inclination of sat
public let XA_GOBS_LIM_INCLMAX     =  9

public let XA_GOBS_LIM_SIZE        = 16


// Indexes of available deltas
//Primary satellite number
public let XA_GOBS_DELTA_PRIMESAT     =  0
//Secondary satellite number
public let XA_GOBS_DELTA_SECONDARYSAT =  1
//GOBS correlation score
public let XA_GOBS_DELTA_ASTAT        =  2
//delta orbital plane
public let XA_GOBS_DELTA_DOP          =  3
//delta shape
public let XA_GOBS_DELTA_DABAR        =  4
//delta Relative Energy (deg^2/day^2)
public let XA_GOBS_DELTA_DRELENERGY   =  5
//Longitude of Primary
public let XA_GOBS_DELTA_LONGP        =  6
//Minimum Longitude of Secondary
public let XA_GOBS_DELTA_LONGMIN      =  7
//Maximum Longitude of Secondary
public let XA_GOBS_DELTA_LONGMAX      =  8
//0 - opposite throughs or drift rates, 1 - trough or drift rates match
public let XA_GOBS_DELTA_TROUGH       =  9
//0|1    Plane Match Flag
public let XA_GOBS_DELTA_PLANE        = 10
//0|1    Shape Match Flag
public let XA_GOBS_DELTA_SHAPE        = 11
//0|1    Relative Energy Match Flag
public let XA_GOBS_DELTA_ENERGY       = 12
//0|1|2  Longitude Match Flag (2 is fuzzy match)
public let XA_GOBS_DELTA_LONG         = 13
//0|1    Agom Match Flag
public let XA_GOBS_DELTA_AGOM         = 14
//0|1    Incl Match Flag
public let XA_GOBS_DELTA_INCL         = 15

public let XA_GOBS_DELTA_SIZE         = 16


//*******************************************************************************

// ========================= End of auto generated code ==========================
