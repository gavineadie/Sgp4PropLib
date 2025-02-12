// This wrapper file was generated automatically by the GenDllWrappers program.
import Foundation

#if os(Linux)
fileprivate let libHandle = loadDll("libcombo.so")
#elseif os(Windows)
fileprivate let libHandle = loadDll("Combo.dll")
#else
fileprivate let libHandle = loadDll("libcombo.dylib")
#endif

// Notes: This function has been deprecated since v9.0. 
// Initializes Combo dll for use in the program
// If this function returns an error, it is recommended that the users stop the program immediately. The error occurs if the users forget to load and initialize all the prerequisite DLLs, as listed in the DLL Prerequisite section, before using this DLL.
public func ComboInit( _ apAddr: Int64 ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64 ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "ComboInit"), to: FunctionSignature.self)

    return function(apAddr)
}

// Returns information about the current version of Combo.dll. The information is placed in the string parameter you pass in
// The returned string provides information about the version number, build date, and the platform of the Combo DLL. 
public func ComboGetInfo( _ infoStr: UnsafeMutablePointer<CChar> ) {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "ComboGetInfo"), to: FunctionSignature.self)

    function(infoStr)
}

// Loads Combo-related parameters (7P/8P/9P cards, and Combo parameter free format) from a text file
public func ComboLoadFile( _ comboInputFile: UnsafeMutablePointer<CChar> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "ComboLoadFile"), to: FunctionSignature.self)

    return function(comboInputFile)
}

// Loads Combo control parameters and all Combo related data (environment, time, elsets) from an input text file
public func ComboLoadFileAll( _ comboInputFile: UnsafeMutablePointer<CChar> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "ComboLoadFileAll"), to: FunctionSignature.self)

    return function(comboInputFile)
}

// Loads a single Combo-typed card (7P, 8P, and 9P)
public func ComboLoadCard( _ card: UnsafeMutablePointer<CChar> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "ComboLoadCard"), to: FunctionSignature.self)

    return function(card)
}

// Saves any currently loaded COMBO-related settings to a file
// The purpose of this function is to save the current Combo-related settings, usually used in GUI applications, for future use.
public func ComboSaveFile( _ comboFile: UnsafeMutablePointer<CChar>,
                           _ saveMode: Int32,
                           _ saveForm: Int32 ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar>,
                                                   Int32,
                                                   Int32 ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "ComboSaveFile"), to: FunctionSignature.self)

    return function(comboFile, saveMode, saveForm)
}

// Returns the number of primary and secondary satellites that were entered via 7P-card, 8P-card, 9P-card, or Combo parameter free format 
public func ComboGetNumOfPriSecSats( _ numPriSats: UnsafeMutablePointer<Int32>, _ numSecSats: UnsafeMutablePointer<Int32> ) {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Int32> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "ComboGetNumOfPriSecSats"), to: FunctionSignature.self)

    function(numPriSats, numSecSats)
}

// Returns an array of primary satellite numbers that were entered via 7P-card, 9P-card, or Combo parameter free format
public func ComboGetPriSatNums( _ priSatNums: UnsafeMutablePointer<Int32> ) {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<Int32> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "ComboGetPriSatNums"), to: FunctionSignature.self)

    function(priSatNums)
}

// Returns an array of secondary satellite numbers that were entered via 7P-card, 8P-card, or Combo parameter free format
public func ComboGetSecSatNums( _ secSatNums: UnsafeMutablePointer<Int32> ) {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<Int32> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "ComboGetSecSatNums"), to: FunctionSignature.self)

    function(secSatNums)
}

// Constructs Combo 7P-Card from COMBO control parameters
public func ComboGet7pCard( _ combo7pCard: UnsafeMutablePointer<CChar> ) {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "ComboGet7pCard"), to: FunctionSignature.self)

    function(combo7pCard)
}

// Retrieves all Combo control parameters with a single function call
public func ComboGet7pAll( _ timeFlg: UnsafeMutablePointer<Int32>,
                           _ startTime: UnsafeMutablePointer<Double>,
                           _ stopTime: UnsafeMutablePointer<Double>,
                           _ relMinFlg: UnsafeMutablePointer<Int32>,
                           _ absMinFlg: UnsafeMutablePointer<Int32>,
                           _ closeProxFlg: UnsafeMutablePointer<Int32>,
                           _ relEphFlg: UnsafeMutablePointer<Int32>,
                           _ pocSigma: UnsafeMutablePointer<Double>,
                           _ relMinLim: UnsafeMutablePointer<Double>,
                           _ closeProxLim: UnsafeMutablePointer<Double>,
                           _ relEphInterval: UnsafeMutablePointer<Double>,
                           _ prtOpt: UnsafeMutablePointer<Int32> ) {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Int32> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "ComboGet7pAll"), to: FunctionSignature.self)

    function(timeFlg, startTime, stopTime, relMinFlg, absMinFlg, closeProxFlg, relEphFlg, pocSigma, relMinLim, closeProxLim, relEphInterval, prtOpt)
}

// Sets all Combo control parameters with a single function call
public func ComboSet7pAll( _ timeFlg: Int32,
                           _ startTime: Double,
                           _ stopTime: Double,
                           _ relMinFlg: Int32,
                           _ absMinFlg: Int32,
                           _ closeProxFlg: Int32,
                           _ relEphFlg: Int32,
                           _ pocSigma: Double,
                           _ relMinLim: Double,
                           _ closeProxLim: Double,
                           _ relEphInterval: Double,
                           _ prtOpt: Int32 ) {

    typealias FunctionSignature = @convention(c) ( Int32,
                                                   Double,
                                                   Double,
                                                   Int32,
                                                   Int32,
                                                   Int32,
                                                   Int32,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   Int32 ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "ComboSet7pAll"), to: FunctionSignature.self)

    function(timeFlg, startTime, stopTime, relMinFlg, absMinFlg, closeProxFlg, relEphFlg, pocSigma, relMinLim, closeProxLim, relEphInterval, prtOpt)
}

// Retrieves the value of a single Combo control parameter (7P-card)
public func ComboGet7pField( _ xf_7P: Int32, _ retVal: UnsafeMutablePointer<CChar> ) {

    typealias FunctionSignature = @convention(c) ( Int32,
                                                   UnsafeMutablePointer<CChar> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "ComboGet7pField"), to: FunctionSignature.self)

    function(xf_7P, retVal)
}

// Sets the value of a single Combo control parameter (7P-card)
// See ComboGet7pField for a list of index values for the parameter xf_7P.
public func ComboSet7pField( _ xf_7P: Int32, _ valueStr: UnsafeMutablePointer<CChar> ) {

    typealias FunctionSignature = @convention(c) ( Int32,
                                                   UnsafeMutablePointer<CChar> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "ComboSet7pField"), to: FunctionSignature.self)

    function(xf_7P, valueStr)
}

// Returns computation of miss between orbits (COMBO) data for the specified primary and secondary satellites
// <br>
// If <i>absMinDs50UTC</i> = 0 or <i>absMinDist</i> = 1.0E20, this means no absolute minimum found. Otherwise, the <i>absMinDs50UTC</i> and <i>absMinDist</i> are returned whether or not <i>absMinDist</i> is greater than the specified "Close proximity limit".
// <br>
// Returns zero indicating the COMBO data was computed successfully. Other values indicate an error. Here is the list of possible error/warning code it returns:
// <table>
//     <caption>table</caption>
// <tr>
// <td><b>Value</b></td>
// <td><b>Value Interpretation</b></td>
// </tr>
// <tr><td>101 </td><td>Primary satellite's epoch too far from the time span</td></tr>
// <tr><td>102 </td><td>Secondary satellite's epoch too far from the time span</td></tr>
// <tr><td>103 </td><td>Primary/secondary satellites are identical</td></tr>
// <tr><td>104 </td><td>Secondary satellite failed perigee/apogee test</td></tr>
// <tr><td>105 </td><td>Secondary satellite is considered a brief span</td></tr>
// <tr><td>106 </td><td>Secondary satellite is in sustained relative geometry</td></tr>
// </table>
// <br>
// When the function's returned value is 108 (secondary satellite is in sustained relative geometry), the entry/exit times should be ignored.
public func ComboCompPriSec( _ priSatKey: Int64,
                             _ secSatKey: Int64,
                             _ absMinDs50UTC: UnsafeMutablePointer<Double>,
                             _ absMinDist: UnsafeMutablePointer<Double>,
                             _ relMinDs50UTCs: UnsafeMutablePointer<Double>,
                             _ numOfRelMins: UnsafeMutablePointer<Int32>,
                             _ entryDs50UTCs: UnsafeMutablePointer<Double>,
                             _ exitDs50UTCs: UnsafeMutablePointer<Double>,
                             _ numOfEntryExits: UnsafeMutablePointer<Int32> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   Int64,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Int32> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "ComboCompPriSec"), to: FunctionSignature.self)

    return function(priSatKey, secSatKey, absMinDs50UTC, absMinDist, relMinDs50UTCs, numOfRelMins, entryDs50UTCs, exitDs50UTCs, numOfEntryExits)
}

// Returns computation of miss between orbits (COMBO) data for the specified primary and secondary satellites
// This function is similar to ComboCompPriSec but allows the user to enter separate COMBO parameters for each call which is suitable for multithread application
public func ComboCompPriSec_MT( _ xa_cb_parms: UnsafeMutablePointer<Double>,
                                _ priSatKey: Int64,
                                _ secSatKey: Int64,
                                _ absMinDs50UTC: UnsafeMutablePointer<Double>,
                                _ absMinDist: UnsafeMutablePointer<Double>,
                                _ relMinDs50UTCs: UnsafeMutablePointer<Double>,
                                _ numOfRelMins: UnsafeMutablePointer<Int32>,
                                _ entryDs50UTCs: UnsafeMutablePointer<Double>,
                                _ exitDs50UTCs: UnsafeMutablePointer<Double>,
                                _ numOfEntryExits: UnsafeMutablePointer<Int32> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<Double>,
                                                   Int64,
                                                   Int64,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Int32> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "ComboCompPriSec_MT"), to: FunctionSignature.self)

    return function(xa_cb_parms, priSatKey, secSatKey, absMinDs50UTC, absMinDist, relMinDs50UTCs, numOfRelMins, entryDs50UTCs, exitDs50UTCs, numOfEntryExits)
}

// Computes probability of collision between a primary and secondary satellite
public func ComboPOC( _ priSatPos: UnsafeMutablePointer<Double>,
                      _ priSatVel: UnsafeMutablePointer<Double>,
                      _ priSatCov: UnsafeMutablePointer<(Double, Double, Double)>,
                      _ priSatRad: Double,
                      _ secSatPos: UnsafeMutablePointer<Double>,
                      _ secSatVel: UnsafeMutablePointer<Double>,
                      _ secSatCov: UnsafeMutablePointer<(Double, Double, Double)>,
                      _ secSatRad: Double,
                      _ xf_CovType: Int32,
                      _ xa_cb_poc: UnsafeMutablePointer<Double> ) -> Int32 {

    let _priSatCov = UnsafeMutableRawPointer(priSatCov).bindMemory(to: Double.self, capacity: 9)
    let _secSatCov = UnsafeMutableRawPointer(secSatCov).bindMemory(to: Double.self, capacity: 9)

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   Double,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   Double,
                                                   Int32,
                                                   UnsafeMutablePointer<Double> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "ComboPOC"), to: FunctionSignature.self)

    return function(priSatPos, priSatVel, _priSatCov, priSatRad, secSatPos, secSatVel, _secSatCov, secSatRad, xf_CovType, xa_cb_poc)
}

// Computes probability of collision using data from a CSM/OCM file
public func ComboCSMPOC( _ csmFile: UnsafeMutablePointer<CChar>,
                         _ sumR: Double,
                         _ xa_cb_poc: UnsafeMutablePointer<Double> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar>,
                                                   Double,
                                                   UnsafeMutablePointer<Double> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "ComboCSMPOC"), to: FunctionSignature.self)

    return function(csmFile, sumR, xa_cb_poc)
}

// Combo control parameters in input array xa_cb_parms that is used in ComboCompPriSec_MT()
//input format for begin and end times (0: minutes since epoch, 1: days since 1950 UTC)
public let XA_CB_PARMS_TIMEFLG     =  1
//begin time
public let XA_CB_PARMS_STARTTIME   =  2
//end time
public let XA_CB_PARMS_STOPTIME    =  3
//maximum separation for relative minima (km) - for reporting times when relative minima is less than this specified value
public let XA_CB_PARMS_MAXSEP      =  4
//close proximity limit (km) - for reporting entry/exit times when pri/sec separation distance equals this specified value
public let XA_CB_PARMS_PROXLIM     =  5
public let XA_CB_PARMS_SIZE        = 16

// Constants represent combo failed cases
//Primary satellite's epoch too far from time span
public let FAILED_PRITOOFAR = 101
//Secondary satellite's epoch too far from time span
public let FAILED_SECTOOFAR = 102
//Primary/secondary satellites are identical
public let FAILED_SAMESAT   = 103
//Secondary satellite failed perigee/apogee test
public let FAILED_ALTITUDE  = 104
//Secondary satellite is considered a brief span
public let WARN_BRIEFSPAN   = 105
//Secondary satellite is in sustained relative geometry
public let WARN_SUSRELGEO   = 106

// Indexes of LAMOD 7P-card fields
//Input time format : 0: Minutes since epoch, 1: UTC
public let XF_7P_TIMEFLAG    = 1
//Begin time
public let XF_7P_BEGTIME     = 2
//End time
public let XF_7P_ENDTIME     = 3
//Control flag for computing relative minima
public let XF_7P_RELMINFLG   = 4
//Control flag for computing absolute minimum
public let XF_7P_ABSMINFLG   = 5
//Control flag for computing periods of close proximity
public let XF_7P_EETIMES     = 6
//Control flag for computing relative ephemeris
public let XF_7P_RELEPHFLG   = 7
//Control flag for computing probability of collision
public let XF_7P_POCSIGMA    = 8
//Maximum separation for relative minima
public let XF_7P_RELMINLIM   = 9
//Close proximity limit
public let XF_7P_ABSMINLIM   = 10
//Relative ephemeris sampling interval
public let XF_7P_RELEPHINT   = 11
//Print options
public let XF_7P_PRTOPT      = 12
//Primary satellite effective radius (m)
public let XF_7P_PRADIUS     = 13
//Secondary satellite effective radius (m)
public let XF_7P_SRADIUS     = 14

// Different input of covariance matrix to compute POC
//ECI pos, vel, and ECI covariance
public let XF_COVTYPE_ECI   = 1
//EFG pos, vel, and UVW covariance
public let XF_COVTYPE_UVW   = 2

// Indexes of Combo's POC data
//Normalized distance (n-sigma) to circumscribing square
public let XA_CB_POC_NORMSQR  = 0
//POC of square
public let XA_CB_POC_SQR      = 1
//Normalized distance (n-sigma) to circle
public let XA_CB_POC_NORMCIR  = 2
//POC of circle
public let XA_CB_POC_CIR      = 3

public let XA_CB_POC_SIZE     = 4


// ========================= End of auto generated code ==========================
