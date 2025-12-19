// This wrapper file was generated automatically by the GenDllWrappers program.
import Foundation

#if os(Linux)
fileprivate let libHandle = loadDll("libspprop.so")
#elseif os(Windows)
fileprivate let libHandle = loadDll("SpProp.dll")
#else
fileprivate let libHandle = loadDll("libspprop.dylib")
#endif

// Notes: This function has been deprecated since v9.0. 
// Initializes SpProp DLL for use in the program
// If this function returns an error, it is recommended that the users stop the program immediately. The error occurs if the users forget to load and initialize all the prerequisite DLLs, as listed in the DLL Prerequisites section, before using this DLL. 
public func SpInit( _ apAddr: Int64 ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64 ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SpInit"), to: FunctionSignature.self)

    return function(apAddr)
}

// Returns information about the current version of SpProp DLL. The information is placed in the string parameter you pass in
// The returned string provides information about the version number, build date, and the platform of the Sp DLL. 
public func SpGetInfo( _ infoStr: UnsafeMutablePointer<CChar> ) {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SpGetInfo"), to: FunctionSignature.self)

    function(infoStr)
}

// Loads SP-related parameters (SP application controls, prediction controls, numerical integration controls) from a text file
public func SpLoadFile( _ spInputFile: UnsafeMutablePointer<CChar> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SpLoadFile"), to: FunctionSignature.self)

    return function(spInputFile)
}

// Loads SP-related parameters (SP application controls, prediction controls, numerical integration controls) and SP elsets from a text file
public func SpLoadFileAll( _ spInputFile: UnsafeMutablePointer<CChar> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SpLoadFileAll"), to: FunctionSignature.self)

    return function(spInputFile)
}

// Saves currently loaded SP-related parameters (SP application controls, prediction controls, integration controls) to a file
// The purpose of this function is to save the current SP-related settings, usually used in GUI applications, for future use.
public func SpSaveFile( _ spFile: UnsafeMutablePointer<CChar>,
                        _ saveMode: Int32,
                        _ saveForm: Int32 ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar>,
                                                   Int32,
                                                   Int32 ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SpSaveFile"), to: FunctionSignature.self)

    return function(spFile, saveMode, saveForm)
}

// Initializes an SP satellite from an SP TLE, SPVEC, or VCM
// Internally, when this function is called, the SpProp DLL will look into the right binary tree, based on the vector type extracted from the satKey, and search for the satKey. If found, the SpProp DLL will use the associated SP data to create an SP object for this satellite in its own binary tree. Subsequent calls to propagate this satellite will use the data in the SP object to compute the satellite's new state.
// 
// The users need to call this routine only once for each satellite they want to propagate or every time the satellite data, from which it was initialized, is changed. The call needs to be placed before any calls to the SP propagate routines (SpPropMse, SpPropDs50UTC...).
public func SpInitSat( _ satKey: Int64 ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64 ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SpInitSat"), to: FunctionSignature.self)

    return function(satKey)
}

// Initializes an SP satellite from an SP TLE, SPVEC, or VCM (thread-safe)
// Internally, when this function is called, the SpProp DLL will look into the right binary tree, based on the vector type extracted from the satKey, and search for the satKey. If found, the SpProp DLL will use the associated SP data to create an SP object for this satellite in its own binary tree. Subsequent calls to propagate this satellite will use the data in the SP object to compute the satellite's new state.
// 
// The users need to call this routine only once for each satellite they want to propagate or every time the satellite data, from which it was initialized, is changed. The call needs to be placed before any calls to the SP propagate routines (SpPropMse, SpPropDs50UTC...).
public func SpInitSat_MT( _ satKey: Int64, _ xa_spParms: UnsafeMutablePointer<Double> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   UnsafeMutablePointer<Double> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SpInitSat_MT"), to: FunctionSignature.self)

    return function(satKey, xa_spParms)
}

// Removes a satellite, represented by the satKey, from the set of currently loaded satellites
// Calling this function removes all satellites from the set maintained by SpProp.dll. However, the data loaded by Vcm.dll, Tle.dll, SpVec.dll, and ExtEphem.dll is unaffected.
// If the users enter an invalid satKey - a non-existing satKey in memory, the function will return a non-zero value indicating an error.
public func SpRemoveSat( _ satKey: Int64 ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64 ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SpRemoveSat"), to: FunctionSignature.self)

    return function(satKey)
}

// Removes all currently loaded satellites from memory
// Calling this function removes all satellites from the set maintained by SpProp.dll. However, the data loaded by Vcm.dll, Tle.dll, SpVec.dll, and ExtEphem.dll is unaffected.
// The function returns zero if all the satellites were removed successfully from the SpProp DLL's binary tree.
public func SpRemoveAllSats(  ) -> Int32 {

    typealias FunctionSignature = @convention(c) (  ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SpRemoveAllSats"), to: FunctionSignature.self)

    return function()
}

// Returns the number of SP objects currently created. 
public func SpGetCount(  ) -> Int32 {

    typealias FunctionSignature = @convention(c) (  ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SpGetCount"), to: FunctionSignature.self)

    return function()
}

// Removes all SP-related data from memory (Geo models, Flux records, JPL, DCA, etc.)
public func SpReset(  ) {

    typealias FunctionSignature = @convention(c) (  ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SpReset"), to: FunctionSignature.self)

    function()
}

// Retrieves the value of an SP application control parameter
// <br>
// The table below shows the values for the xf_SpApp parameter:
// <table>
// <caption>table</caption>
// <tr>
// <td><b>Index</b></td>
// <td><b>Index Interpretation</b></td>
// </tr>
// <tr><td>1 </td><td>Geopotential directory path</td></tr>
// <tr><td>2 </td><td>Buffer size</td></tr>
// <tr><td>3 </td><td>Run mode</td></tr>
// <tr><td>4 </td><td>Save partials data</td></tr>
// <tr><td>5 </td><td>Specter compatibility mode</td></tr>
// <tr><td>6 </td><td>Consider parameter</td></tr>
// <tr><td>7 </td><td>Decay altitude</td></tr>
// <tr><td>8 </td><td>Output coordinate system</td></tr>
// <tr><td>9 </td><td>Additional VCM options</td></tr>
// </table>
public func SpGetApCtrl( _ xf_SpApp: Int32, _ valueStr: UnsafeMutablePointer<CChar> ) {

    typealias FunctionSignature = @convention(c) ( Int32,
                                                   UnsafeMutablePointer<CChar> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SpGetApCtrl"), to: FunctionSignature.self)

    function(xf_SpApp, valueStr)
}

// Retrieves all SP application control parameters with a single function call
public func SpGetApCtrlAll( _ geoDir: UnsafeMutablePointer<CChar>,
                            _ bufSize: UnsafeMutablePointer<Int32>,
                            _ runMode: UnsafeMutablePointer<Int32>,
                            _ savePartials: UnsafeMutablePointer<Int32>,
                            _ isSpectr: UnsafeMutablePointer<Int32>,
                            _ consider: UnsafeMutablePointer<Double>,
                            _ decayAlt: UnsafeMutablePointer<Int32>,
                            _ outCoord: UnsafeMutablePointer<Int32> ) {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Int32> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SpGetApCtrlAll"), to: FunctionSignature.self)

    function(geoDir, bufSize, runMode, savePartials, isSpectr, consider, decayAlt, outCoord)
}

// Sets an SP application control parameter
// See SpGetApCtrl for a list of the values for the xf_SpApp parameter.
public func SpSetApCtrl( _ xf_SpApp: Int32, _ valueStr: UnsafeMutablePointer<CChar> ) {

    typealias FunctionSignature = @convention(c) ( Int32,
                                                   UnsafeMutablePointer<CChar> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SpSetApCtrl"), to: FunctionSignature.self)

    function(xf_SpApp, valueStr)
}

// Sets all SP application control parameters with a single function call
public func SpSetApCtrlAll( _ geoDir: UnsafeMutablePointer<CChar>,
                            _ bufSize: Int32,
                            _ runMode: Int32,
                            _ savePartials: Int32,
                            _ isSpectr: Int32,
                            _ consider: Double,
                            _ decayAlt: Int32,
                            _ outCoord: Int32 ) {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar>,
                                                   Int32,
                                                   Int32,
                                                   Int32,
                                                   Int32,
                                                   Double,
                                                   Int32,
                                                   Int32 ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SpSetApCtrlAll"), to: FunctionSignature.self)

    function(geoDir, bufSize, runMode, savePartials, isSpectr, consider, decayAlt, outCoord)
}

// Retrieves the value of a numerical integration control parameter
// <br>
// The table below shows the values for xf_4P parameter:
// <table>
// <caption>table</caption>
// <tr>
// <td><b>Index</b></td>
// <td><b>Index Interpretation</b></td>
// </tr>
// <tr><td>1  </td><td> Geopotential model to use</td></tr>
// <tr><td>2  </td><td> Earth gravity pertubations flag</td></tr>
// <tr><td>3  </td><td> Drag pertubations flag </td></tr>
// <tr><td>4  </td><td> Radiation pressure pertubations flag</td></tr>
// <tr><td>5  </td><td> Lunar/Solar pertubations flag</td></tr>
// <tr><td>6  </td><td> F10 value</td></tr>
// <tr><td>7  </td><td> F10 average value</td></tr>
// <tr><td>8  </td><td> Ap value</td></tr>
// <tr><td>9  </td><td> Geopotential truncation order/degree/zonals</td></tr>
// <tr><td>10 </td><td> Corrector step convergence criterion; exponent of 1/10; default = 10</td></tr>
// <tr><td>11 </td><td> Outgassing pertubations flag</td></tr>
// <tr><td>12 </td><td> Solid earth ocean tide pertubations flag</td></tr>
// <tr><td>13 </td><td> Input vector coordinate system</td></tr>
// <tr><td>14 </td><td> Nutation terms</td></tr>
// <tr><td>15 </td><td> Recompute pertubations at each corrector step</td></tr>
// <tr><td>16 </td><td> Variable of intergration control</td></tr>
// <tr><td>17 </td><td> Variable step size control</td></tr>
// <tr><td>18 </td><td> Initial step size</td></tr>
// <tr><td>21 </td><td> DCA file name</td></tr>
// <tr><td>22 </td><td> Solar flux file name</td></tr>
// <tr><td>23 </td><td> Geopotential file name</td></tr>
// <tr><td>24 </td><td> JPL file name</td></tr>
// <tr><td>25 </td><td> JPL start time</td></tr>
// <tr><td>26 </td><td> JPL stop time</td></tr>
// </table>
// See the SpProp.pdf document under the librarydocuments folder, section 7.3
// "Numerical Integration Control (4P-Card)".  This document has a description
// of each column for a 4P card.  For an example, see files in the 
// Verify/SpProp/Execution/input folder, such as sp_sat1.inp and look at the 
// line that ends with "4P".  
public func SpGet4P( _ xf_4P: Int32, _ valueStr: UnsafeMutablePointer<CChar> ) {

    typealias FunctionSignature = @convention(c) ( Int32,
                                                   UnsafeMutablePointer<CChar> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SpGet4P"), to: FunctionSignature.self)

    function(xf_4P, valueStr)
}

// Sets the value of a numerical integration control parameter
// See SpGet4P for a list of the values for the xf_4P parameter.
// For flux, dca, and jpl file settings, the actual file loading happens when the first SpSatInit() is called. 
// If the user needs to load these files instantly, please call the SpLoadFile() instead
// See the SpProp.pdf document under the librarydocuments folder, section 7.3
// "Numerical Integration Control (4P-Card)".  This document has a description
// of each column for a 4P card.  For an example, see files in the 
// Verify/SpProp/Execution/input folder, such as sp_sat1.inp and look at the 
// line that ends with "4P".  
public func SpSet4P( _ xf_4P: Int32, _ valueStr: UnsafeMutablePointer<CChar> ) {

    typealias FunctionSignature = @convention(c) ( Int32,
                                                   UnsafeMutablePointer<CChar> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SpSet4P"), to: FunctionSignature.self)

    function(xf_4P, valueStr)
}

// Retrieves prediction control parameters
public func SpGetPredCtrl( _ startFrEpoch: UnsafeMutablePointer<Int32>,
                           _ stopFrEpoch: UnsafeMutablePointer<Int32>,
                           _ startTime: UnsafeMutablePointer<Double>,
                           _ stopTime: UnsafeMutablePointer<Double>,
                           _ interval: UnsafeMutablePointer<Double> ) {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SpGetPredCtrl"), to: FunctionSignature.self)

    function(startFrEpoch, stopFrEpoch, startTime, stopTime, interval)
}

// Sets prediction control parameters
public func SpSetPredCtrl( _ startFrEpoch: Int32,
                           _ stopFrEpoch: Int32,
                           _ startTime: Double,
                           _ stopTime: Double,
                           _ interval: Double ) {

    typealias FunctionSignature = @convention(c) ( Int32,
                                                   Int32,
                                                   Double,
                                                   Double,
                                                   Double ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SpSetPredCtrl"), to: FunctionSignature.self)

    function(startFrEpoch, stopFrEpoch, startTime, stopTime, interval)
}

// Retrieves the value of a field of an SP satellite
// <br>
// The table below shows the values for the xf_SpSat parameter:
// <table>
// <caption>table</caption>
// <tr>
// <td><b>Index</b></td>
// <td><b>Index Interpretation</b></td>
// </tr>
// <tr><td>1 </td><td> Satellite number I5</td></tr>
// <tr><td>2 </td><td> Satellite's epoch time in days since 1950, UTC </td></tr>
// <tr><td>3 </td><td> Satellite's epoch time in days since 1950, TAI</td></tr>
// <tr><td>4 </td><td> Mu value </td></tr>
// <tr><td>5 </td><td> Covariance Matrix flag</td></tr>
// <tr><td>6 </td><td> Integration mode</td></tr>
// <tr><td>7 </td><td> Nutation terms</td></tr>
// <tr><td>8 </td><td> Specter compatibility mode</td></tr>
// </table>
public func SpGetSatData( _ satKey: Int64,
                          _ xf_SpSat: Int32,
                          _ valueStr: UnsafeMutablePointer<CChar> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   Int32,
                                                   UnsafeMutablePointer<CChar> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SpGetSatData"), to: FunctionSignature.self)

    return function(satKey, xf_SpSat, valueStr)
}

// Retrieves all fields of an SP satellite with a single function call
public func SpGetSatDataAll( _ satKey: Int64,
                             _ satNum: UnsafeMutablePointer<Int32>,
                             _ epochDs50UTC: UnsafeMutablePointer<Double>,
                             _ epochDs50TAI: UnsafeMutablePointer<Double>,
                             _ mu: UnsafeMutablePointer<Double>,
                             _ hasCovMtx: UnsafeMutablePointer<Int32>,
                             _ integMode: UnsafeMutablePointer<Int32>,
                             _ nTerms: UnsafeMutablePointer<Int32>,
                             _ isSpectr: UnsafeMutablePointer<Int32> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Int32> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SpGetSatDataAll"), to: FunctionSignature.self)

    return function(satKey, satNum, epochDs50UTC, epochDs50TAI, mu, hasCovMtx, integMode, nTerms, isSpectr)
}

// Propagates a satellite, represented by the satKey, to the time expressed in minutes since the 
// satellite's epoch time
public func SpPropMse( _ satKey: Int64,
                       _ mse: Double,
                       _ xa_timeTypes: UnsafeMutablePointer<Double>,
                       _ revNum: UnsafeMutablePointer<Int32>,
                       _ posJ2K: UnsafeMutablePointer<Double>,
                       _ velJ2K: UnsafeMutablePointer<Double> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   Double,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SpPropMse"), to: FunctionSignature.self)

    return function(satKey, mse, xa_timeTypes, revNum, posJ2K, velJ2K)
}

// Propagates a satellite, represented by the satKey, to the time expressed in days since 1950, UTC. 
public func SpPropDs50UTC( _ satKey: Int64,
                           _ ds50UTC: Double,
                           _ xa_timeTypes: UnsafeMutablePointer<Double>,
                           _ revNum: UnsafeMutablePointer<Int32>,
                           _ posJ2K: UnsafeMutablePointer<Double>,
                           _ velJ2K: UnsafeMutablePointer<Double> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   Double,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SpPropDs50UTC"), to: FunctionSignature.self)

    return function(satKey, ds50UTC, xa_timeTypes, revNum, posJ2K, velJ2K)
}

// Propagates a satellite, represented by the satKey, to the time expressed in days since 1950, UTC. 
// It only returns the latitude, longitude, and height at that time in coordinate system of Date
// It is the users' responsibility to decide what to do with the returned value. For example, if the users want to check for decay or low altitude, they can put that logic into their own code.
// 
// This function is built especially for application that plots ground trace.
public func SpPropDs50UtcLLH( _ satKey: Int64,
                              _ ds50UTC: Double,
                              _ llh: UnsafeMutablePointer<Double> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   Double,
                                                   UnsafeMutablePointer<Double> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SpPropDs50UtcLLH"), to: FunctionSignature.self)

    return function(satKey, ds50UTC, llh)
}

// Propagates a satellite, represented by the satKey, to the time expressed in days since 1950, UTC. 
// It only returns the satellite's ECI position in TEME of DATE
// It is the users' responsibility to decide what to do with the returned value. For example, if the users want to check for decay or low altitude, they can put that logic into their own code.
// 
// This function is built especially for application that plots satellites' positions in 3D.
public func SpPropDs50UtcPos( _ satKey: Int64,
                              _ ds50UTC: Double,
                              _ pos: UnsafeMutablePointer<Double> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   Double,
                                                   UnsafeMutablePointer<Double> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SpPropDs50UtcPos"), to: FunctionSignature.self)

    return function(satKey, ds50UTC, pos)
}

// Propagates a satellite, represented by the satKey, to the time expressed in either minutes since epoch or days since 1950, UTC. 
// <br>
// All propagation data is returned by this function.
public func SpPropAll( _ satKey: Int64,
                       _ timeType: Int32,
                       _ timeIn: Double,
                       _ covType: Int32,
                       _ xa_spOut: UnsafeMutablePointer<Double> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   Int32,
                                                   Double,
                                                   Int32,
                                                   UnsafeMutablePointer<Double> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SpPropAll"), to: FunctionSignature.self)

    return function(satKey, timeType, timeIn, covType, xa_spOut)
}

// Propagates a satellite, represented by the satKey, to the time expressed in days since 1950, UTC. 
// It only returns the position and velocity in TEME of Date
public func SpGetStateDs50UTC( _ satKey: Int64,
                               _ ds50UTC: Double,
                               _ posDate: UnsafeMutablePointer<Double>,
                               _ velDate: UnsafeMutablePointer<Double> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   Double,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SpGetStateDs50UTC"), to: FunctionSignature.self)

    return function(satKey, ds50UTC, posDate, velDate)
}

// Reepochs the state of an existing SP object associated with the satKey. 
// Proper initialization is handled internally so no need to call SpSatInit() afterward 
public func SpSetStateDs50UTC( _ satKey: Int64,
                               _ ds50UTC: Double,
                               _ posDate: UnsafeMutablePointer<Double>,
                               _ velDate: UnsafeMutablePointer<Double> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   Double,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SpSetStateDs50UTC"), to: FunctionSignature.self)

    return function(satKey, ds50UTC, posDate, velDate)
}

// Updates an SP object associated with the satKey with the new input data stored in setDataArr. 
// Then propagates the updated SP object to the requested time propTimeDs50UTC. 
// Resulting propagated data will be stored in propDataArr.
public func SpSetAndProp( _ satKey: Int64,
                          _ setDataArr: UnsafeMutablePointer<Double>,
                          _ propTimeDs50UTC: Double,
                          _ propDataArr: UnsafeMutablePointer<Double> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   UnsafeMutablePointer<Double>,
                                                   Double,
                                                   UnsafeMutablePointer<Double> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SpSetAndProp"), to: FunctionSignature.self)

    return function(satKey, setDataArr, propTimeDs50UTC, propDataArr)
}

// This function is reserved for future use. The purpose is to return propagator output data based on user special requests that have not yet been determined
// Use this function immediately after the call to SpPropMse or SpPropDs50UTC. 
public func SpGetPropOut( _ satKey: Int64,
                          _ index: Int32,
                          _ destArr: UnsafeMutablePointer<Double> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   Int32,
                                                   UnsafeMutablePointer<Double> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SpGetPropOut"), to: FunctionSignature.self)

    return function(satKey, index, destArr)
}

// Returns the covariance matrix of a satellite
// Use this function immediately after the call to SpPropMse or SpPropDs50UTC. 
public func SpGetCovMtx( _ satKey: Int64,
                         _ covType: Int32,
                         _ covMtx: UnsafeMutablePointer<(Double, Double, Double, Double, Double, Double)> ) -> Int32 {

    let _covMtx = UnsafeMutableRawPointer(covMtx).bindMemory(to: Double.self, capacity: 36)

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   Int32,
                                                   UnsafeMutablePointer<Double> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SpGetCovMtx"), to: FunctionSignature.self)

    return function(satKey, covType, _covMtx)
}

// Computes the covariance sigma from the input covariance matrix
public func SpCompCovSigma( _ covMtx: UnsafeMutablePointer<(Double, Double, Double, Double, Double, Double)>, _ covSigma: UnsafeMutablePointer<Double> ) {

    let _covMtx = UnsafeMutableRawPointer(covMtx).bindMemory(to: Double.self, capacity: 36)

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SpCompCovSigma"), to: FunctionSignature.self)

    function(_covMtx, covSigma)
}

// Sets all numerical integration control parameters with a single function call
// See the SpProp.pdf document under the librarydocuments folder, section 7.3
// "Numerical Integration Control (4P-Card)".  This document has a description
// of each column for a 4P card.  For an example, see files in the 
// Verify/SpProp/Execution/input folder, such as sp_sat1.inp and look at the 
// line that ends with "4P".  
public func SpSet4pAll( _ geoIdx: Int32,
                        _ bulgePert: Int32,
                        _ dragPert: Int32,
                        _ radPresPert: Int32,
                        _ lunSolPert: Int32,
                        _ f10: Int32,
                        _ f10Avg: Int32,
                        _ ap: Int32,
                        _ trunc: Int32,
                        _ incr: Int32,
                        _ ogPert: Int32,
                        _ tidePert: Int32,
                        _ inCoord: Int32,
                        _ nTerms: Int32,
                        _ reEval: Int32,
                        _ integStepMode: Int32,
                        _ stepSizeMethod: Int32,
                        _ initStepSize: Double,
                        _ dcaFile: UnsafeMutablePointer<CChar>,
                        _ fluxFile: UnsafeMutablePointer<CChar>,
                        _ geoFile: UnsafeMutablePointer<CChar>,
                        _ jplFile: UnsafeMutablePointer<CChar>,
                        _ jplStart: UnsafeMutablePointer<CChar>,
                        _ jplStop: UnsafeMutablePointer<CChar> ) {

    typealias FunctionSignature = @convention(c) ( Int32,
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
                                                   Int32,
                                                   Int32,
                                                   Int32,
                                                   Int32,
                                                   Int32,
                                                   Int32,
                                                   Double,
                                                   UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<CChar> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SpSet4pAll"), to: FunctionSignature.self)

    function(geoIdx, bulgePert, dragPert, radPresPert, lunSolPert, f10, f10Avg, ap, trunc, incr, ogPert, tidePert, inCoord, nTerms, reEval, integStepMode, stepSizeMethod, initStepSize, dcaFile, fluxFile, geoFile, jplFile, jplStart, jplStop)
}

// Retrieves all numerical integration control parameters with a single function call
// See the SpProp.pdf document under the librarydocuments folder, section 7.3
// "Numerical Integration Control (4P-Card)".  This document has a description
// of each column for a 4P card.  For an example, see files in the 
// Verify/SpProp/Execution/input folder, such as sp_sat1.inp and look at the 
// line that ends with "4P".  
public func SpGet4pAll( _ geoIdx: UnsafeMutablePointer<Int32>,
                        _ bulgePert: UnsafeMutablePointer<Int32>,
                        _ dragPert: UnsafeMutablePointer<Int32>,
                        _ radPresPert: UnsafeMutablePointer<Int32>,
                        _ lunSolPert: UnsafeMutablePointer<Int32>,
                        _ f10: UnsafeMutablePointer<Int32>,
                        _ f10Avg: UnsafeMutablePointer<Int32>,
                        _ ap: UnsafeMutablePointer<Int32>,
                        _ trunc: UnsafeMutablePointer<Int32>,
                        _ incr: UnsafeMutablePointer<Int32>,
                        _ ogPert: UnsafeMutablePointer<Int32>,
                        _ tidePert: UnsafeMutablePointer<Int32>,
                        _ inCoord: UnsafeMutablePointer<Int32>,
                        _ nTerms: UnsafeMutablePointer<Int32>,
                        _ reEval: UnsafeMutablePointer<Int32>,
                        _ integStepMode: UnsafeMutablePointer<Int32>,
                        _ stepSizeMethod: UnsafeMutablePointer<Int32>,
                        _ initStepSize: UnsafeMutablePointer<Double>,
                        _ dcaFile: UnsafeMutablePointer<CChar>,
                        _ fluxFile: UnsafeMutablePointer<CChar>,
                        _ geoFile: UnsafeMutablePointer<CChar>,
                        _ jplFile: UnsafeMutablePointer<CChar>,
                        _ jplStart: UnsafeMutablePointer<CChar>,
                        _ jplStop: UnsafeMutablePointer<CChar> ) {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<Int32>,
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
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<CChar> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SpGet4pAll"), to: FunctionSignature.self)

    function(geoIdx, bulgePert, dragPert, radPresPert, lunSolPert, f10, f10Avg, ap, trunc, incr, ogPert, tidePert, inCoord, nTerms, reEval, integStepMode, stepSizeMethod, initStepSize, dcaFile, fluxFile, geoFile, jplFile, jplStart, jplStop)
}

// Read the integration control settings from a 4P-Card.
// See the SpProp.pdf document under the librarydocuments folder, section 7.3
// "Numerical Integration Control (4P-Card)".  This document has a description
// of each column for a 4P card.  For an example, see files in the 
// Verify/SpProp/Execution/input folder, such as sp_sat1.inp and look at the 
// line that ends with "4P".  
public func SpSet4PCard( _ card4P: UnsafeMutablePointer<CChar> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SpSet4PCard"), to: FunctionSignature.self)

    return function(card4P)
}

// Builds and returns the integration control card (4P-Card) from the current settings
// See the SpProp.pdf document under the librarydocuments folder, section 7.3
// "Numerical Integration Control (4P-Card)".  This document has a description
// of each column for a 4P card.  For an example, see files in the 
// Verify/SpProp/Execution/input folder, such as sp_sat1.inp and look at the 
// line that ends with "4P".  
public func SpGet4PCard( _ card4P: UnsafeMutablePointer<CChar> ) {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SpGet4PCard"), to: FunctionSignature.self)

    function(card4P)
}

// Adds one solar flux record to memory. This API can be used to avoid SpLoadFile's file I/O      
public func SpAddFluxRec( _ refDs50UTC: Double,
                          _ f10: Double,
                          _ f10Avg: Double,
                          _ ap: UnsafeMutablePointer<Double> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Double,
                                                   Double,
                                                   Double,
                                                   UnsafeMutablePointer<Double> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SpAddFluxRec"), to: FunctionSignature.self)

    return function(refDs50UTC, f10, f10Avg, ap)
}

// Returns the times, in days since 1950 UTC, of ephemeris points stored in SP buffer that meet the requirement as specified in the minStepSize
// This function is used to retrieve times in which SP propagator stored satellite's state vectors in memory (natural integration step size).
// An error will occur if the actualEphPts reaches the maxEphPts. In this case, the function will return all ephemereris times up to the time when that maxEphPts is reached.
public func SpGetEphemTimes( _ satKey: Int64,
                             _ maxEphPts: Int32,
                             _ startDs50UTC: Double,
                             _ stopDs50UTC: Double,
                             _ minStepSize: Double,
                             _ actualEphPts: UnsafeMutablePointer<Int32>,
                             _ ds50UTCArr: UnsafeMutablePointer<Double> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   Int32,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Double> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SpGetEphemTimes"), to: FunctionSignature.self)

    return function(satKey, maxEphPts, startDs50UTC, stopDs50UTC, minStepSize, actualEphPts, ds50UTCArr)
}

// Generates ephemerides for the input satellite, represented by its satKey, for the specified time span and step size
// Notes: if arrSize isn't big enough to store all the ephemeris points, the function will exit when the ephemArr reaches
// that many points (arrSize) and the errCode is set to IDX_ERR_WARN
public func SpGenEphems( _ satKey: Int64,
                         _ startDs50UTC: Double,
                         _ stopDs50UTC: Double,
                         _ stepSize: Double,
                         _ sp_ephem: Int32,
                         _ arrSize: Int32,
                         _ ephemArr: UnsafeMutablePointer<(Double, Double, Double, Double, Double, Double, Double)>,
                         _ genEphemPts: UnsafeMutablePointer<Int32> ) -> Int32 {

    let _ephemArr = UnsafeMutableRawPointer(ephemArr).bindMemory(to: Double.self, capacity: 0)

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   Int32,
                                                   Int32,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Int32> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SpGenEphems"), to: FunctionSignature.self)

    return function(satKey, startDs50UTC, stopDs50UTC, stepSize, sp_ephem, arrSize, _ephemArr, genEphemPts)
}

// This function is similar to SpGenEphems but also returns covariance matrix data
// Notes: Make sure to turn on the "save partials" flag so that covariance matrix data can be generated
public func SpGenEphemsCov( _ satKey: Int64,
                            _ startDs50UTC: Double,
                            _ stopDs50UTC: Double,
                            _ stepSize: Double,
                            _ sp_ephem: Int32,
                            _ covType: Int32,
                            _ arrSize: Int32,
                            _ ephemArr: UnsafeMutablePointer<(Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double)>,
                            _ genEphemPts: UnsafeMutablePointer<Int32> ) -> Int32 {

    let _ephemArr = UnsafeMutableRawPointer(ephemArr).bindMemory(to: Double.self, capacity: 0)

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   Int32,
                                                   Int32,
                                                   Int32,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Int32> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SpGenEphemsCov"), to: FunctionSignature.self)

    return function(satKey, startDs50UTC, stopDs50UTC, stepSize, sp_ephem, covType, arrSize, _ephemArr, genEphemPts)
}

// Generates ephemerides for the input vcm (in string format) for the specified time span and step size
// Notes: if arrSize isn't big enough to store all the ephemeris points, the function will exit when the ephemArr reaches
// that many points (arrSize) and the errCode is set to IDX_ERR_WARN
public func SpGenEphemsVcm_OS( _ vcmString: UnsafeMutablePointer<CChar>,
                               _ startDs50UTC: Double,
                               _ stopDs50UTC: Double,
                               _ stepSize: Double,
                               _ sp_ephem: Int32,
                               _ arrSize: Int32,
                               _ ephemArr: UnsafeMutablePointer<(Double, Double, Double, Double, Double, Double, Double)>,
                               _ genEphemPts: UnsafeMutablePointer<Int32> ) -> Int32 {

    let _ephemArr = UnsafeMutableRawPointer(ephemArr).bindMemory(to: Double.self, capacity: 0)

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar>,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   Int32,
                                                   Int32,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Int32> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SpGenEphemsVcm_OS"), to: FunctionSignature.self)

    return function(vcmString, startDs50UTC, stopDs50UTC, stepSize, sp_ephem, arrSize, _ephemArr, genEphemPts)
}

// This function is similar to SpGenEphemsVcm_OS but also returns covariance matrix data
public func SpGenEphemsVcmCov_OS( _ vcmString: UnsafeMutablePointer<CChar>,
                                  _ startDs50UTC: Double,
                                  _ stopDs50UTC: Double,
                                  _ stepSize: Double,
                                  _ sp_ephem: Int32,
                                  _ covType: Int32,
                                  _ arrSize: Int32,
                                  _ ephemArr: UnsafeMutablePointer<(Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double)>,
                                  _ genEphemPts: UnsafeMutablePointer<Int32> ) -> Int32 {

    let _ephemArr = UnsafeMutableRawPointer(ephemArr).bindMemory(to: Double.self, capacity: 0)

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar>,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   Int32,
                                                   Int32,
                                                   Int32,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Int32> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SpGenEphemsVcmCov_OS"), to: FunctionSignature.self)

    return function(vcmString, startDs50UTC, stopDs50UTC, stepSize, sp_ephem, covType, arrSize, _ephemArr, genEphemPts)
}

// Propagates all input satellites, represented by their satKeys, to the time expressed in days since 1950, UTC. 
public func SpPropAllSats( _ satKeys: UnsafeMutablePointer<Int64>,
                           _ numOfSats: Int32,
                           _ ds50UTC: Double,
                           _ ephemArr: UnsafeMutablePointer<(Double, Double, Double, Double, Double, Double)> ) -> Int32 {

    let _ephemArr = UnsafeMutableRawPointer(ephemArr).bindMemory(to: Double.self, capacity: 0)

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<Int64>,
                                                   Int32,
                                                   Double,
                                                   UnsafeMutablePointer<Double> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SpPropAllSats"), to: FunctionSignature.self)

    return function(satKeys, numOfSats, ds50UTC, _ephemArr)
}

// Propagates a satellite, represented by the satKey, to the time expressed in either minutes since epoch or days since 1950, UTC. 
// <br>
// All propagation data is returned by this function.
public func SpPropAllExt( _ satKey: Int64,
                          _ timeType: Int32,
                          _ timeIn: Double,
                          _ spCoord: Int32,
                          _ xf_CovMtx: Int32,
                          _ stmType: Int32,
                          _ xa_spExt: UnsafeMutablePointer<Double> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   Int32,
                                                   Double,
                                                   Int32,
                                                   Int32,
                                                   Int32,
                                                   UnsafeMutablePointer<Double> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SpPropAllExt"), to: FunctionSignature.self)

    return function(satKey, timeType, timeIn, spCoord, xf_CovMtx, stmType, xa_spExt)
}

// Loads solar flux file (J70MOD or JBH09) for use in AtmspDensity() 
public func SpLoadFluxFile( _ fluxFile: UnsafeMutablePointer<CChar> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SpLoadFluxFile"), to: FunctionSignature.self)

    return function(fluxFile)
}

// Loads DCA temperature coefficient file (DCA1/HASDM1 or DCA2/HASDM2) for use in AtmspDensity()
public func SpLoadDCAFile( _ dcaFile: UnsafeMutablePointer<CChar> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SpLoadDCAFile"), to: FunctionSignature.self)

    return function(dcaFile)
}

// Computes atmospheric density using the input time/location/drag model
public func AtmspDensity( _ ds50UTC: Double,
                          _ llh: UnsafeMutablePointer<Double>,
                          _ drgMdl: Int32,
                          _ rho: UnsafeMutablePointer<Double>,
                          _ errCode: UnsafeMutablePointer<Int32> ) {

    typealias FunctionSignature = @convention(c) ( Double,
                                                   UnsafeMutablePointer<Double>,
                                                   Int32,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Int32> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "AtmspDensity"), to: FunctionSignature.self)

    function(ds50UTC, llh, drgMdl, rho, errCode)
}

// Gets DCA Record at specified time
public func GetDcaRec( _ ds50UTC: Double,
                       _ ds50UTCRec: UnsafeMutablePointer<Double>,
                       _ flux: UnsafeMutablePointer<Double>,
                       _ storm: UnsafeMutablePointer<Double>,
                       _ ctxi: UnsafeMutablePointer<(Double, Double, Double, Double, Double, Double, Double)>,
                       _ stxi: UnsafeMutablePointer<(Double, Double, Double, Double, Double, Double, Double)>,
                       _ ctci: UnsafeMutablePointer<(Double, Double, Double, Double, Double, Double, Double)>,
                       _ stci: UnsafeMutablePointer<(Double, Double, Double, Double, Double, Double, Double)>,
                       _ errCode: UnsafeMutablePointer<Int32> ) {

    let _ctxi = UnsafeMutableRawPointer(ctxi).bindMemory(to: Double.self, capacity: 49)
    let _stxi = UnsafeMutableRawPointer(stxi).bindMemory(to: Double.self, capacity: 49)
    let _ctci = UnsafeMutableRawPointer(ctci).bindMemory(to: Double.self, capacity: 49)
    let _stci = UnsafeMutableRawPointer(stci).bindMemory(to: Double.self, capacity: 49)

    typealias FunctionSignature = @convention(c) ( Double,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Int32> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "GetDcaRec"), to: FunctionSignature.self)

    function(ds50UTC, ds50UTCRec, flux, storm, _ctxi, _stxi, _ctci, _stci, errCode)
}

// Unloads the flux/JBHSGI flux
public func SpRemoveFlux(  ) {

    typealias FunctionSignature = @convention(c) (  ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SpRemoveFlux"), to: FunctionSignature.self)

    function()
}

// Unloads the DCA records
public func SpRemoveDCAFile(  ) {

    typealias FunctionSignature = @convention(c) (  ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SpRemoveDCAFile"), to: FunctionSignature.self)

    function()
}

// VCM additional options
//use VCM's own data
public let VCMOPT_USEOWN    = 0
//force VCM to use global solar flux and timing constants data
public let VCMOPT_USEGLOBAL = 1

// Run Modes
//Perfromance priority. This mode allows the buffer of integration points to extend freely
public let IDX_RUNMODE_PERF = 0
//Memory priority. This mode only allows a number of integration points to be saved in the buffer at any one time
public let IDX_RUNMODE_MEM  = 1

//*******************************************************************************

// Partials Saving Modes
//Save partials in the buffer
public let IDX_PARTIALS_SAVE = 1
//Don't save partials in the buffer
public let IDX_PARTIALS_DONT = 0

// Indexes of different covariance matrices
//UVW convariance matrix - TEME of DATE
public let XF_COVMTX_UVW_DATE  =  1
//Cartesian covariance matrix - TEME of DATE
public let XF_COVMTX_XYZ_DATE  =  2
//Equinoctial covariance matrix - TEME of DATE (not available for "PARTIALS: ANALYTIC")
public let XF_COVMTX_EQNX_DATE =  3
//UVW convariance matrix - MEME of J2K (same result as UVW TEME of DATE)
public let XF_COVMTX_UVW_J2K   = 11
//Cartesian covariance matrix - MEME of J2K
public let XF_COVMTX_XYZ_J2K   = 12
//Equinoctial covariance matrix - MEME of J2K  (not available for "PARTIALS: ANALYTIC")
public let XF_COVMTX_EQNX_J2K  = 13
//*******************************************************************************

// Indexes of Lunar/Solar and Planets perturbation modes
//Lunar/Solar perturbation off
public let LSPERT_NONE      = 0
//Lunar/Solar perturbation on (using Analytic mode)
public let LSPERT_ANALYTIC  = 1
//Lunar/Solar perturbation using JPL ephemeris file
public let LSPERT_JPL       = 2
//Lunar/Solar + All planets perturbation using JPL ephemeris file
public let LSPERT_ALL       = 3
//Lunar/Solar + Jupiter and Venus using JPL ephemeris file (Big Force Planets)
public let LSPERT_BIG       = 4
//Lunar/Solar + Jupiter, Venus, Saturn, Mars, and Mercury using JPL ephemeris file (Big and Medium Force Planets)
public let LSPERT_MED       = 5
//Lunar/Solar + All planets perturbation except Pluto using JPL ephemeris file (Big, Medium, and Small Force Planets)
public let LSPERT_SMA       = 6

//*******************************************************************************

// State Transition Matrix Types
//UVW state transition matrix
public let STMTYPE_UVW       = 1
//Cartesian state transition matrix
public let STMTYPE_XYZ       = 2
//Equinoctial state transition matrix
public let STMTYPE_EQNX      = 3

// Different output coordinate systems options for pos/vel/acc
//Output coordinate systems in TEME of Date
public let SPCOORD_ECI      = 1
//Output coordinate systems in MEME of J2K
public let SPCOORD_J2K      = 2

// Different drag perturbation models
//Jacchia 64 model
public let DRGMDL_JAC64   =  1
//Jacchia 70 model
public let DRGMDL_JAC70   =  2
//Dynamic Calibration Atmosphere 1 (DCA1/HASDM1) model
public let DRGMDL_DCA1    =  3
//JBH09 model
public let DRGMDL_JBH09   = 40
//JBH09 and Dynamic Calibration Atmosphere 2 (DCA2/HASDM2)
public let DRGMDL_JBHDCA2 = 41

// Indexes of SP 4P card fields
//Geopotential model to use
public let XF_4P_GEOIDX   = 1
//Earth gravity pertubations flag
public let XF_4P_BULGEFLG = 2
//Drag pertubations flag
public let XF_4P_DRAGFLG  = 3
//Radiation pressure pertubations flag
public let XF_4P_RADFLG   = 4
//Lunar/Solar pertubations flag
public let XF_4P_LUNSOL   = 5
//F10 value
public let XF_4P_F10      = 6
//F10 average value
public let XF_4P_F10AVG   = 7
//Ap value
public let XF_4P_AP       = 8
//Geopotential truncation order/degree/zonals
public let XF_4P_TRUNC    = 9
//Corrector step convergence criterion, exponent of 1/10, default = 10
public let XF_4P_CONVERG  = 10
//Outgassing pertubations flag
public let XF_4P_OGFLG    = 11
//Solid earth and ocean tide pertubations flag
public let XF_4P_TIDESFLG = 12
//Input vector coordinate system
public let XF_4P_INCOORD  = 13
//Nutation terms
public let XF_4P_NTERMS   = 14
//Recompute pertubations at each corrector step
public let XF_4P_REEVAL   = 15
//Variable of intergration control
public let XF_4P_INTEGCTRL = 16
//Variable step size control
public let XF_4P_VARSTEP  = 17
//Initial step size
public let XF_4P_INITSTEP = 18

//DCA file name
public let XF_4P_DCAFILE  = 21
//Solar flux file name
public let XF_4P_FLUXFILE = 22
//Geopotential file name
public let XF_4P_GEOFILE  = 23
//JPL file name
public let XF_4P_JPLFILE  = 24
//JPL start time
public let XF_4P_JPLSTART = 25
//JPL stop time
public let XF_4P_JPLSTOP  = 26

//XF_4P_PLANETS  = 27, &    // Sets perturbations from all planets to on
//XF_4P_MERCURY  = 28, &    // Sets perturbation from Mercury to on
//XF_4P_VENUS    = 29, &    // Sets perturbation from Venus to on
//XF_4P_MARS     = 30, &    // Sets perturbation from Mars to on
//XF_4P_JUPITER  = 31, &    // Sets perturbation from Jupiter to on
//XF_4P_SATURN   = 32, &    // Sets perturbation from Saturn to on
//XF_4P_URANUS   = 33, &    // Sets perturbation from Uranus to on
//XF_4P_NEPTUNE  = 34, &    // Sets perturbation from Neptune to on
//XF_4P_PLUTO    = 35       // Sets perturbation from Pluto to on

//*******************************************************************************

// Indexes of SP application control (preference) parameters
//Geopotential directory path
public let XF_SPAPP_GEODIR   = 1
//Buffer size
public let XF_SPAPP_BUFSIZE  = 2
//Run mode, see IDX_RUNMODE_ for available options
public let XF_SPAPP_RUNMODE  = 3
//Save partials data
public let XF_SPAPP_SAVEPART = 4
//Specter compatibility mode
public let XF_SPAPP_SPECTR   = 5
//Consider parameter
public let XF_SPAPP_CONSIDER = 6
//Decay altitude
public let XF_SPAPP_DECAYALT = 7
//Output coordinate system
public let XF_SPAPP_OUTCOORD = 8
//VCM additional options
public let XF_SPAPP_VCMOPT   = 9

//*******************************************************************************

// Indexes of data fields of an initialized SP satellite
//Satellite number I5
public let XF_SPSAT_SATNUM  = 1
//Satellite's epoch time in days since 1950, UTC
public let XF_SPSAT_DS50UTC = 2
//Satellite's epoch time in days since 1950, TAI
public let XF_SPSAT_DS50TAI = 3
//Mu value
public let XF_SPSAT_MU      = 4
//Covariance Matrix flag
public let XF_SPSAT_HASCOV  = 5
//Integration mode
public let XF_SPSAT_INTMODE = 6
//Nutation terms
public let XF_SPSAT_NTERMS  = 7
//Specter compatibility mode
public let XF_SPSAT_SPECTR  = 8

//*******************************************************************************

//// Indexes of Planetary Control
//   XAI_PLANET_MERCURY = 1, & // 0 = off, 1 = on
//   XAI_PLANET_VENUS   = 2, & // 0 = off, 1 = on
//   XAI_PLANET_EARTH   = 3, & // Not used
//   XAI_PLANET_MARS    = 4, & // 0 = off, 1 = on
//   XAI_PLANET_JUPITER = 5, & // 0 = off, 1 = on
//   XAI_PLANET_SATRUN  = 6, & // 0 = off, 1 = on
//   XAI_PLANET_URANUS  = 7, & // 0 = off, 1 = on
//   XAI_PLANET_NEPTUNE = 8, & // 0 = off, 1 = on
//   XAI_PLANET_PLUTO   = 9, & // 0 = off, 1 = on
//   XAI_PLANET_SIZE    = 9    // Size of array
//
////*******************************************************************************

// Different time types for passing to SpPropAll
//propagation time is in minutes since epoch
public let SP_TIMETYPE_MSE      = 0
//propagation time is in days since 1950, UTC
public let SP_TIMETYPE_DS50UTC  = 1


// Sp propagated data
//Propagation time in days since 1950, UTC
public let XA_SPOUT_UTC       =  0
//Propagation time in minutes since the satellite's epoch time
public let XA_SPOUT_MSE       =  1
//Propagation time in days since 1950, UT1
public let XA_SPOUT_UT1       =  2
//Propagation time in days since 1950, TAI
public let XA_SPOUT_TAI       =  3
//Propagation time in days since 1950, ET
public let XA_SPOUT_ET        =  4
//Revolution number
public let XA_SPOUT_REVNUM    =  5
//Number of nutation terms
public let XA_SPOUT_NTERMS    =  6
//Spectr compatible mode (0=not compatible, 1=compatible)
public let XA_SPOUT_ISSPECTR  =  7
//Has input covariance matrix (0=no, 1=yes)
public let XA_SPOUT_HASCOVMTX =  8

//J2K position X (km)
public let XA_SPOUT_J2KPOSX   = 10
//J2K position Y (km)
public let XA_SPOUT_J2KPOSY   = 11
//J2K position Z (km)
public let XA_SPOUT_J2KPOSZ   = 12
//J2K velocity X (km/s)
public let XA_SPOUT_J2KVELX   = 13
//J2K velocity Y (km/s)
public let XA_SPOUT_J2KVELY   = 14
//J2K velocity Z (km/s)
public let XA_SPOUT_J2KVELZ   = 15
//ECI position X (km)
public let XA_SPOUT_ECIPOSX   = 16
//ECI position Y (km)
public let XA_SPOUT_ECIPOSY   = 17
//ECI position Z (km)
public let XA_SPOUT_ECIPOSZ   = 18
//ECI velocity X (km/s)
public let XA_SPOUT_ECIVELX   = 19
//ECI velocity Y (km/s)
public let XA_SPOUT_ECIVELY   = 20
//ECI velocity Z (km/s)
public let XA_SPOUT_ECIVELZ   = 21
//Geodetic latitude (deg)
public let XA_SPOUT_LAT       = 22
//Geodetic longitude (deg)
public let XA_SPOUT_LON       = 23
//Height above geoid (km)
public let XA_SPOUT_HEIGHT    = 24

//Covariance matrix type, if available:  1=UVW, 2=ECI_DATE, 3=EQNX_DATE, 12=ECI_J2K, 13=EQNX_J2K
public let XA_SPOUT_COVTYPE   = 30
//6 by 6 covariance matrix (31-66)
public let XA_SPOUT_COVMTX    = 31

//J2K acceleration X (km/s^2)
public let XA_SPOUT_J2KACCX   = 70
//J2K acceleration Y (km/s^2)
public let XA_SPOUT_J2KACCY   = 71
//J2K acceleration Z (km/s^2)
public let XA_SPOUT_J2KACCZ   = 72
//ECI acceleration X (km/s^2)
public let XA_SPOUT_ECIACCX   = 73
//ECI acceleration Y (km/s^2)
public let XA_SPOUT_ECIACCY   = 74
//ECI acceleration Z (km/s^2)
public let XA_SPOUT_ECIACCZ   = 75

public let XA_SPOUT_SIZE      = 128

// Sp extended propagation data
//Propagation time in days since 1950, UTC
public let XA_SPEXT_UTC       =  0
//Propagation time in minutes since the satellite's epoch time
public let XA_SPEXT_MSE       =  1
//Propagation time in days since 1950, UT1
public let XA_SPEXT_UT1       =  2
//Propagation time in days since 1950, TAI
public let XA_SPEXT_TAI       =  3
//Propagation time in days since 1950, ET
public let XA_SPEXT_ET        =  4
//Revolution number
public let XA_SPEXT_REVNUM    =  5
//Number of nutation terms
public let XA_SPEXT_NTERMS    =  6
//Spectr compatible mode (0=not compatible, 1=compatible)
public let XA_SPEXT_ISSPECTR  =  7
//Has input covariance matrix (0=no, 1=yes)
public let XA_SPEXT_HASCOVMTX =  8

//Output coordSysinate of pos/vel/accel: 1=TEME of Date, 2= MEME of J2K
public let XA_SPEXT_COORD     = 10
//position X (km)
public let XA_SPEXT_POSX      = 11
//position Y (km)
public let XA_SPEXT_POSY      = 12
//position Z (km)
public let XA_SPEXT_POSZ      = 13
//velocity X (km/s)
public let XA_SPEXT_VELX      = 14
//velocity Y (km/s)
public let XA_SPEXT_VELY      = 15
//velocity Z (km/s)
public let XA_SPEXT_VELZ      = 16
//acceleration X (km/s^2)
public let XA_SPEXT_ACCX      = 17
//acceleration Y (km/s^2)
public let XA_SPEXT_ACCY      = 18
//acceleration Z (km/s^2)
public let XA_SPEXT_ACCZ      = 19

//Covariance matrix type, if available:  1=UVW, 2=ECI_DATE, 3=EQNX_DATE, 12=ECI_J2K, 13=EQNX_J2K
public let XA_SPEXT_COVTYPE   = 30
//6 by 6 covariance matrix (31-66/1D format - 36 elements)
public let XA_SPEXT_COVMTX    = 31

//State transition matrix type, if available: 2=ECI_Date, 3=Eqnx_DATE
public let XA_SPEXT_STMTYPE   = 70
//6x9 state transition matrix  (71-124/1D format - 54 elements - row major)
public let XA_SPEXT_STM       = 71

public let XA_SPEXT_SIZE      = 128


// Different options for generating ephemerides from SP
//ECI TEME of DATE     - 0: time in days since 1950 UTC, 1-3: pos (km), 4-6: vel (km/sec)
public let SP_EPHEM_ECI   = 1
//MEME of J2K (4 terms)- 0: time in days since 1950 UTC, 1-3: pos (km), 4-6: vel (km/sec)
public let SP_EPHEM_J2K   = 2


// Different time types returned by the SP propagator
//Time in minutes since the satellite's epoch time
public let XA_TIMETYPES_MSE  = 0
//Time in days since 1950, UTC
public let XA_TIMETYPES_UTC  = 1
//Time in days since 1950, UT1
public let XA_TIMETYPES_UT1  = 2
//Time in days since 1950, TAI
public let XA_TIMETYPES_TAI  = 3
//Time in days since 1950, ET
public let XA_TIMETYPES_ET   = 4

public let XA_TIMETYPES_SIZE = 5

// Indexes of SP application control (preference) parameters for individual satellite (thread-safe)
//Buffer size, enter zero if default value is desired
public let XA_SPPARMS_BUFSIZE  = 2
//Run mode, see IDX_RUNMODE_? for available options
public let XA_SPPARMS_RUNMODE  = 3
//Save partials data, 0=don't save partials, 1=save partials (needed for covariance)
public let XA_SPPARMS_SAVEPART = 4
//Specter compatibility mode
public let XA_SPPARMS_SPECTR   = 5
//Consider parameter
public let XA_SPPARMS_CONSIDER = 6
//Decay altitude
public let XA_SPPARMS_DECAYALT = 7
//VCM additional options, see VCMOPT_? for available options
public let XA_SPPARMS_VCMOPT   = 9
public let XA_SPPARMS_SIZE     = 32

// ========================= End of auto generated code ==========================
