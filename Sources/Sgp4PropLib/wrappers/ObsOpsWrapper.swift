// This wrapper file was generated automatically by the GenDllWrappers program.
import Foundation

#if os(Linux)
fileprivate let libHandle = loadDll("libobsops.so")
#elseif os(Windows)
fileprivate let libHandle = loadDll("ObsOps.dll")
#else
fileprivate let libHandle = loadDll("libobsops.dylib")
#endif

// Notes: This function has been deprecated since v9.0.    
// Initializes ObsOps DLL for use in the program
public func ObsOpsInit( _ apAddr: Int64 ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64 ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "ObsOpsInit"), to: FunctionSignature.self)

    return function(apAddr)
}

// Returns information about the current version of ObsOps DLL. 
// The information is placed in the string parameter passed in.
public func ObsOpsGetInfo( _ infoStr: UnsafeMutablePointer<CChar> ) {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "ObsOpsGetInfo"), to: FunctionSignature.self)

    function(infoStr)
}

// Loads Iomod parameters from an input text file
public func IomodLoadFile( _ iomodInputFile: UnsafeMutablePointer<CChar> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "IomodLoadFile"), to: FunctionSignature.self)

    return function(iomodInputFile)
}

// Loads Iomod control parameters and all Iomod related data (environment, time, sensors, obs) from an input text file
public func IomodLoadFileAll( _ iomodInputFile: UnsafeMutablePointer<CChar> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "IomodLoadFileAll"), to: FunctionSignature.self)

    return function(iomodInputFile)
}

// Saves any currently loaded IOMOD-related settings to a file
public func IomodSaveFile( _ iomodFile: UnsafeMutablePointer<CChar>,
                           _ saveMode: Int32,
                           _ saveForm: Int32 ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar>,
                                                   Int32,
                                                   Int32 ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "IomodSaveFile"), to: FunctionSignature.self)

    return function(iomodFile, saveMode, saveForm)
}

// Builds and returns the IOMOD-parameter card (IP-Card) from the current IOMOD settings
public func IomodGetIpCard( _ iomodIPCard: UnsafeMutablePointer<CChar> ) {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "IomodGetIpCard"), to: FunctionSignature.self)

    function(iomodIPCard)
}

// Retrieves all IOMOD parameters with a single function call
public func IomodGetIpAll( _ printIOHG: UnsafeMutablePointer<Int32>,
                           _ useFirst3Obs: UnsafeMutablePointer<Int32>,
                           _ satNum: UnsafeMutablePointer<Int32>,
                           _ sortOrder: UnsafeMutablePointer<Int32>,
                           _ satName: UnsafeMutablePointer<CChar>,
                           _ runDC: UnsafeMutablePointer<Int32>,
                           _ runRotas: UnsafeMutablePointer<Int32>,
                           _ extArr: UnsafeMutablePointer<Double> ) {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "IomodGetIpAll"), to: FunctionSignature.self)

    function(printIOHG, useFirst3Obs, satNum, sortOrder, satName, runDC, runRotas, extArr)
}

// Sets all IOMOD parameters with a single function call
public func IomodSetIpAll( _ printIOHG: Int32,
                           _ useFirst3Obs: Int32,
                           _ satNum: Int32,
                           _ sortOrder: Int32,
                           _ satName: UnsafeMutablePointer<CChar>,
                           _ runDC: Int32,
                           _ runRotas: Int32,
                           _ extArr: UnsafeMutablePointer<Double> ) {

    typealias FunctionSignature = @convention(c) ( Int32,
                                                   Int32,
                                                   Int32,
                                                   Int32,
                                                   UnsafeMutablePointer<CChar>,
                                                   Int32,
                                                   Int32,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "IomodSetIpAll"), to: FunctionSignature.self)

    function(printIOHG, useFirst3Obs, satNum, sortOrder, satName, runDC, runRotas, extArr)
}

// Retrieves the value of a specified IOMOD parameter
// <br>
// The table below indicates which index values for the xf_IP parameter:
// <table summary="">
// <tr>
// <td><b>xf_IP named constants/values</b></td>
// <td><b>Interpretation</b></td>
// </tr>
// <tr><td>XF_IP_PRINTIOHG  = 1</td><td>control flag for IOHG advisory prints: 0=do not print IOHG information, 1=print
// IOHG</td></tr>
// <tr><td>XF_IP_USE1ST3OBS = 2</td><td>use first 3 obs flag</td></tr>
// <tr><td>XF_IP_SATNUM     = 3</td><td>satelite number</td></tr>
// <tr><td>XF_IP_SORTORDER  = 4</td><td>obs sorting order</td></tr>
// <tr><td>XF_IP_SATNAME    = 5</td><td>international designator </td></tr>
// <tr><td>XF_IP_RUNDC      = 6</td><td>run DC flag: 1=yes, 0=no [deprecated]</td></tr>
// <tr><td>XF_IP_RUNROTAS   = 7</td><td>run ROTAS flag: 1=yes, 0=no [deprecated]</td></tr>
// </table>
public func IomodGetIpField( _ xf_IP: Int32, _ retVal: UnsafeMutablePointer<CChar> ) {

    typealias FunctionSignature = @convention(c) ( Int32,
                                                   UnsafeMutablePointer<CChar> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "IomodGetIpField"), to: FunctionSignature.self)

    function(xf_IP, retVal)
}

// Sets the value of a specified IOMOD parameter
// See IomodGetIpField for a description of the xf_IP parameter.
public func IomodSetIpField( _ xf_IP: Int32, _ valueStr: UnsafeMutablePointer<CChar> ) {

    typealias FunctionSignature = @convention(c) ( Int32,
                                                   UnsafeMutablePointer<CChar> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "IomodSetIpField"), to: FunctionSignature.self)

    function(xf_IP, valueStr)
}

// Computes initial orbit vector from many observations using Herrick-Gibbs method
public func ManyObsToPosVel( _ obsKeyArr: UnsafeMutablePointer<Int64>,
                             _ arrSize: Int32,
                             _ timeDs50UTC: UnsafeMutablePointer<Double>,
                             _ pos: UnsafeMutablePointer<Double>,
                             _ vel: UnsafeMutablePointer<Double>,
                             _ arr3ObsKeys: UnsafeMutablePointer<Int64> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<Int64>,
                                                   Int32,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Int64> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "ManyObsToPosVel"), to: FunctionSignature.self)

    return function(obsKeyArr, arrSize, timeDs50UTC, pos, vel, arr3ObsKeys)
}

// Computes initial orbit vector from three selected observations using Herrick-Gibbs method
public func ThreeObsToPosVel( _ arr3ObsKeys: UnsafeMutablePointer<Int64>,
                              _ timeDs50UTC: UnsafeMutablePointer<Double>,
                              _ pos: UnsafeMutablePointer<Double>,
                              _ vel: UnsafeMutablePointer<Double> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<Int64>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "ThreeObsToPosVel"), to: FunctionSignature.self)

    return function(arr3ObsKeys, timeDs50UTC, pos, vel)
}

// Computes initial orbit vector directly from the input sensor/observation data - thread safe
public func Iomod_OS( _ xa_senLoc: UnsafeMutablePointer<Double>,
                      _ numObs: Int32,
                      _ xa_obsArr: UnsafeMutablePointer<(Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double)>,
                      _ timeDs50UTC: UnsafeMutablePointer<Double>,
                      _ pos: UnsafeMutablePointer<Double>,
                      _ vel: UnsafeMutablePointer<Double> ) -> Int32 {

    let _xa_obsArr = UnsafeMutableRawPointer(xa_obsArr).bindMemory(to: Double.self, capacity: 0)

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<Double>,
                                                   Int32,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "Iomod_OS"), to: FunctionSignature.self)

    return function(xa_senLoc, numObs, _xa_obsArr, timeDs50UTC, pos, vel)
}

// Computes initial orbit vector from two selected observations using Two-Ob method
// Note: Two-Ob method only works with ob types: 2, 3, 4, P, and V
public func TwoObsToPosVel( _ arr2ObsKeys: UnsafeMutablePointer<Int64>,
                            _ timeDs50UTC: UnsafeMutablePointer<Double>,
                            _ pos: UnsafeMutablePointer<Double>,
                            _ vel: UnsafeMutablePointer<Double> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<Int64>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "TwoObsToPosVel"), to: FunctionSignature.self)

    return function(arr2ObsKeys, timeDs50UTC, pos, vel)
}

// Computes the initial orbit vector from three selected angle-only observations using the Gooding Algorithm.
public func AnglesOnlyToPosVel( _ arr3ObsKeys: UnsafeMutablePointer<Int64>,
                                _ range1: Double,
                                _ range3: Double,
                                _ NHREV: Int32,
                                _ IND: Int32,
                                _ MAXIT: Int32,
                                _ PDINC: Double,
                                _ CRIVAL: Double,
                                _ timeDs50UTC: UnsafeMutablePointer<Double>,
                                _ pos: UnsafeMutablePointer<Double>,
                                _ vel: UnsafeMutablePointer<Double> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<Int64>,
                                                   Double,
                                                   Double,
                                                   Int32,
                                                   Int32,
                                                   Int32,
                                                   Double,
                                                   Double,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "AnglesOnlyToPosVel"), to: FunctionSignature.self)

    return function(arr3ObsKeys, range1, range3, NHREV, IND, MAXIT, PDINC, CRIVAL, timeDs50UTC, pos, vel)
}

// Computes the track length of a track whose first observation started at the input startIdx.
// This routine can be used in a loop to find all the tracks in the observation list.
// Remember to sort obs in the obsKeyArr in the ascending order of sensor, satno, obsType, time, elev 
// by calling ObsGetLoaded(-6, pObsKeys) before feeding the array to this routine
public func FindTrack( _ obsKeyArr: UnsafeMutablePointer<Int64>,
                       _ arrSize: Int32,
                       _ startIdx: Int32,
                       _ trackLength: UnsafeMutablePointer<Int32> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<Int64>,
                                                   Int32,
                                                   Int32,
                                                   UnsafeMutablePointer<Int32> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "FindTrack"), to: FunctionSignature.self)

    return function(obsKeyArr, arrSize, startIdx, trackLength)
}

// Computes initial orbit vector from a track of obs. Also returns the three obs in the track that are used by IOMOD
public func ATrackToPosVel( _ obsKeys: UnsafeMutablePointer<Int64>,
                            _ trackStartIdx: Int32,
                            _ trackLength: Int32,
                            _ timeDs50UTC: UnsafeMutablePointer<Double>,
                            _ pos: UnsafeMutablePointer<Double>,
                            _ vel: UnsafeMutablePointer<Double>,
                            _ trackObsKeys: UnsafeMutablePointer<Int64> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<Int64>,
                                                   Int32,
                                                   Int32,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Int64> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "ATrackToPosVel"), to: FunctionSignature.self)

    return function(obsKeys, trackStartIdx, trackLength, timeDs50UTC, pos, vel, trackObsKeys)
}

// Returns the default values of the triangulation settings
public func TriGetDefParams( _ xa_tri: UnsafeMutablePointer<Double> ) {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "TriGetDefParams"), to: FunctionSignature.self)

    function(xa_tri)
}

// Triangulates the input obs and write generated obs with range data to the specified output file
public func TriComputeToFile( _ obsKeyArr: UnsafeMutablePointer<Int64>,
                              _ arrSize: Int32,
                              _ xa_tri: UnsafeMutablePointer<Double>,
                              _ toFile: UnsafeMutablePointer<CChar> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<Int64>,
                                                   Int32,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<CChar> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "TriComputeToFile"), to: FunctionSignature.self)

    return function(obsKeyArr, arrSize, xa_tri, toFile)
}

// Triangulates the input obs and returns the overlap and polyfit information; creates and loads obs with range data into memory and returns their associated obsKeys
public func TriCompute1( _ obsKeyArr: UnsafeMutablePointer<Int64>,
                         _ arrSize: Int32,
                         _ xa_tri: UnsafeMutablePointer<Double>,
                         _ numOvlps: UnsafeMutablePointer<Int32>,
                         _ xa_ovlp: UnsafeMutablePointer<(Double, Double, Double, Double, Double, Double, Double, Double)>,
                         _ numFits: UnsafeMutablePointer<Int32>,
                         _ xa_fit: UnsafeMutablePointer<(Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double)>,
                         _ maxGenObs: Int32,
                         _ nGenObs: UnsafeMutablePointer<Int32>,
                         _ genObsKeys: UnsafeMutablePointer<Int64> ) -> Int32 {

    let _xa_ovlp = UnsafeMutableRawPointer(xa_ovlp).bindMemory(to: Double.self, capacity: 0)
    let _xa_fit = UnsafeMutableRawPointer(xa_fit).bindMemory(to: Double.self, capacity: 0)

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<Int64>,
                                                   Int32,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Double>,
                                                   Int32,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Int64> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "TriCompute1"), to: FunctionSignature.self)

    return function(obsKeyArr, arrSize, xa_tri, numOvlps, _xa_ovlp, numFits, _xa_fit, maxGenObs, nGenObs, genObsKeys)
}

// Triangulates the input obs and returns the overlap and polyfit information 
public func TriCompute2( _ obsKeyArr: UnsafeMutablePointer<Int64>,
                         _ arrSize: Int32,
                         _ xa_tri: UnsafeMutablePointer<Double>,
                         _ numOvlps: UnsafeMutablePointer<Int32>,
                         _ xa_ovlp: UnsafeMutablePointer<(Double, Double, Double, Double, Double, Double, Double, Double)>,
                         _ numFits: UnsafeMutablePointer<Int32>,
                         _ xa_fit: UnsafeMutablePointer<(Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double)> ) -> Int32 {

    let _xa_ovlp = UnsafeMutableRawPointer(xa_ovlp).bindMemory(to: Double.self, capacity: 0)
    let _xa_fit = UnsafeMutableRawPointer(xa_fit).bindMemory(to: Double.self, capacity: 0)

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<Int64>,
                                                   Int32,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Double> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "TriCompute2"), to: FunctionSignature.self)

    return function(obsKeyArr, arrSize, xa_tri, numOvlps, _xa_ovlp, numFits, _xa_fit)
}

// Triangulates the input obs; creates and loads obs with range data (by triangulation) into memory and returns their associated obsKeys
public func TriCompute3( _ obsKeyArr: UnsafeMutablePointer<Int64>,
                         _ arrSize: Int32,
                         _ xa_tri: UnsafeMutablePointer<Double>,
                         _ maxGenObs: Int32,
                         _ nGenObs: UnsafeMutablePointer<Int32>,
                         _ genObsKeys: UnsafeMutablePointer<Int64> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<Int64>,
                                                   Int32,
                                                   UnsafeMutablePointer<Double>,
                                                   Int32,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Int64> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "TriCompute3"), to: FunctionSignature.self)

    return function(obsKeyArr, arrSize, xa_tri, maxGenObs, nGenObs, genObsKeys)
}

// Returns the default values of the waterfall altitude (km)
public func GetWaterfallAlt(  ) -> Double {

    typealias FunctionSignature = @convention(c) (  ) -> Double

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "GetWaterfallAlt"), to: FunctionSignature.self)

    return function()
}

// Converts angle-only observation to lat/lon/height positions
public func AnglesOnlyToLLH( _ obsKey: Int64,
                             _ assumedAltitude: Double,
                             _ rho: UnsafeMutablePointer<Double>,
                             _ llhs: UnsafeMutablePointer<(Double, Double, Double)>,
                             _ numSols: UnsafeMutablePointer<Int32> ) -> Int32 {

    let _llhs = UnsafeMutableRawPointer(llhs).bindMemory(to: Double.self, capacity: 6)

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   Double,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Int32> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "AnglesOnlyToLLH"), to: FunctionSignature.self)

    return function(obsKey, assumedAltitude, rho, _llhs, numSols)
}

// Calculates length of output arrays for Lomb
// Used to allocated px, py, prob before call to Lomb
public func LombLengthOut( _ ofac: Double,
                           _ hifac: Double,
                           _ nSample: Int32 ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Double,
                                                   Double,
                                                   Int32 ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "LombLengthOut"), to: FunctionSignature.self)

    return function(ofac, hifac, nSample)
}

// Creates Lomb-Scargle periodogram.  Reference: Numerical Recipes   
// Used to find frequencies in unevenly sampled data, such as Visual Magnitude vs. Time
public func Lomb( _ x: UnsafeMutablePointer<Double>,
                  _ y: UnsafeMutablePointer<Double>,
                  _ nSample: Int32,
                  _ ofac: Double,
                  _ hifac: Double,
                  _ px: UnsafeMutablePointer<Double>,
                  _ py: UnsafeMutablePointer<Double>,
                  _ prob: UnsafeMutablePointer<Double>,
                  _ pxmax: UnsafeMutablePointer<Double>,
                  _ pymax: UnsafeMutablePointer<Double>,
                  _ probMax: UnsafeMutablePointer<Double> ) {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   Int32,
                                                   Double,
                                                   Double,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "Lomb"), to: FunctionSignature.self)

    function(x, y, nSample, ofac, hifac, px, py, prob, pxmax, pymax, probMax)
}

// Find False Alarm Probablility of given Power (lower is less likely to be a false alarm)
public func LombFalseProb( _ py: Double,
                           _ nout: Int32,
                           _ ofac: Double ) -> Double {

    typealias FunctionSignature = @convention(c) ( Double,
                                                   Int32,
                                                   Double ) -> Double

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "LombFalseProb"), to: FunctionSignature.self)

    return function(py, nout, ofac)
}

// Find Power of given False Alarm Probablility
public func LombFalseProbInv( _ prob: Double,
                              _ nout: Int32,
                              _ ofac: Double ) -> Double {

    typealias FunctionSignature = @convention(c) ( Double,
                                                   Int32,
                                                   Double ) -> Double

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "LombFalseProbInv"), to: FunctionSignature.self)

    return function(prob, nout, ofac)
}

// Calculate length of output for LombWaveFit
public func LombLengthCoef( _ nFreq: Int32 ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int32 ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "LombLengthCoef"), to: FunctionSignature.self)

    return function(nFreq)
}

// Fits user defined frequencies to data to find the magnitudes
// Solves the equation
// y= C + sum( A(i)*sin(2*pi*freq(i)*t) + B(i)*sin(2*pi*freq(i)*t)  )
// For coefficients A and B corresponding to each frequency
public func LombWaveFit( _ x: UnsafeMutablePointer<Double>,
                         _ y: UnsafeMutablePointer<Double>,
                         _ nSamples: Int32,
                         _ freq: UnsafeMutablePointer<Double>,
                         _ nfreq: Int32,
                         _ coeffs: UnsafeMutablePointer<Double> ) {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   Int32,
                                                   UnsafeMutablePointer<Double>,
                                                   Int32,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "LombWaveFit"), to: FunctionSignature.self)

    function(x, y, nSamples, freq, nfreq, coeffs)
}

// Calculate value of y given time, x, 
// and frequencies and magnitudes that were gotten from wavefit
// solves the equation
// y= C + sum( A(i)*sin(2*pi*freq(i)*t) + B(i)*sin(2*pi*freq(i)*t)  )
// for y
public func LombCalcValueFromTime( _ x: Double,
                                   _ mags: UnsafeMutablePointer<Double>,
                                   _ freq: UnsafeMutablePointer<Double>,
                                   _ nfreq: Int32 ) -> Double {

    typealias FunctionSignature = @convention(c) ( Double,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   Int32 ) -> Double

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "LombCalcValueFromTime"), to: FunctionSignature.self)

    return function(x, mags, freq, nfreq)
}

// Given two observations, calculate the angle between them
// Supports obsType 1,2,3,4,5,8,9,18,19
public func AngleBetweenObs( _ obsKey1: Int64,
                             _ obsKey2: Int64,
                             _ angSep: UnsafeMutablePointer<Double>,
                             _ errCode: UnsafeMutablePointer<Int32> ) {

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   Int64,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Int32> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "AngleBetweenObs"), to: FunctionSignature.self)

    function(obsKey1, obsKey2, angSep, errCode)
}

// Indexes for accessing Iomod control parameters
//control flag for IOHG advisory prints: 0=do not print IOHG information, 1=print IOHG
public let XF_IP_PRINTIOHG  = 1
//use first 3 obs flag
public let XF_IP_USE1ST3OBS = 2
//satelite number
public let XF_IP_SATNUM     = 3
//obs sorting order
public let XF_IP_SORTORDER  = 4
//international designator
public let XF_IP_SATNAME    = 5
//run DC flag: 1=yes, 0=no
public let XF_IP_RUNDC      = 6
//run ROTAS flag: 1=yes, 0=no
public let XF_IP_RUNROTAS   = 7

// Indexes of TRI configuration parameters
//I - Flag to specify whether or not to use triangulation's default parameters: =[1]: use them and ignore the rest; =0: not to use them
public let XA_TRI_USEDEFAULT       =  0
//I - Output obs type (valid values are 0, 2, 3, 4, 6, 8 and 9)
public let XA_TRI_OBSTYPEOUT       =  1
//I - Flag to specify whether or not to apply sensor bias: =[1]: apply bias, =0: not apply bias
public let XA_TRI_APPLYBIAS        =  2
//I - apply applyLTC time correction (applyLTC) flag: 0=do no apply, [1]= aplly applyLTC
public let XA_TRI_LTC              =  3
//I - number of obs created for each overlap track
public let XA_TRI_CREATEOBSSIZE    =  4
//I - default order of the Polyfit for angle RA/DEC
public let XA_TRI_DEFANGLEORDER    =  5
//I - default order of the Polyfit for range
public let XA_TRI_DEFRANGEORDER    =  6
//I - default order of the Polyfit for EFG components
public let XA_TRI_DEFEFGORDER      =  7
//I - whether or not to use auto mode for angle (increase order if needed when doing Polyfit)
public let XA_TRI_AUTOFITANGLE     =  8
//I - whether or not to use auto for range (increase order if needed when doing Polyfit)
public let XA_TRI_AUTOFITRANGE     =  9
//I - anchor order of RA/DEC
public let XA_TRI_ANCHORRADEC      = 10
//I - check to see satellite number is different
public let XA_TRI_SEPSATNO         = 11
//D - limit RMS for RA (arcsec)
public let XA_TRI_RARMSLIM         = 12
//D - limit RMS for Dec (arcsec)
public let XA_TRI_DECRMSLIM        = 13
//D- limit RMS for Range (km)
public let XA_TRI_RANGERMSLIM      = 14
//D - track separation criteria (minutes)
public let XA_TRI_TRKSEPARATION    = 15
//D - minimum stereoscopic angle (deg)
public let XA_TRI_MINSTEREOANGLE   = 16

public let XA_TRI_SIZE             = 32

// Indexes of overlap track data
//I - Satellite number
public let XA_OVLP_SATNUM       =  0
//I - Sensor number of track 1
public let XA_OVLP_SENNUM1      =  1
//I - Sensor number of track 2
public let XA_OVLP_SENNUM2      =  2
//D - Overlap track's start time (in DS50UTC)
public let XA_OVLP_STARTTIME    =  3
//D - Overlap track's end time (in DS50UTC)
public let XA_OVLP_ENDTIME      =  4

//
public let XA_OVLP_SIZE         =  8

// Indexes of polyfitting track data
//I - Satellite number
public let XA_FIT_SATNUM        =  0
//I - Sensor number of track 1
public let XA_FIT_SENNUM1       =  1
//I - Sensor number of track 2
public let XA_FIT_SENNUM2       =  2

//I - Right ascension polyfit order of track 1
public let XA_FIT_RAORDER1      =  3
//I - Right ascension polyfit order of track 2
public let XA_FIT_RAORDER2      =  4
//D - Right ascension RMS of track 1
public let XA_FIT_RARMS1        =  5
//D - Right ascension RMS of track 2
public let XA_FIT_RARMS2        =  6

//I - Declination polyfit order of track 1
public let XA_FIT_DECORDER1     =  7
//I - Declination polyfit order of track 2
public let XA_FIT_DECORDER2     =  8
//D - Declination RMS of track 1
public let XA_FIT_DECMS1        =  9
//D - Declination RMS of track 2
public let XA_FIT_DECRMS2       = 10

//I - Declination polyfit order of track 1
public let XA_FIT_RANGEORDER1   = 11
//I - Declination polyfit order of track 2
public let XA_FIT_RANGEORDER2   = 12
//D - Declination RMS of track 1
public let XA_FIT_RANGERMS1     = 13
//D - Declination RMS of track 2
public let XA_FIT_RANGERMS2     = 14

//D - First stereoscopic angle (deg)
public let XA_FIT_THETA1        = 15
//D - Second stereoscopic angle (deg)
public let XA_FIT_THETA2        = 16
//D - Third stereoscopic angle (deg)
public let XA_FIT_THETA3        = 17

//
public let XA_FIT_SIZE          =  32


// ========================= End of auto generated code ==========================
