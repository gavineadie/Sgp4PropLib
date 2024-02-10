// This wrapper file was generated automatically by the GenDllWrappers program.
import Foundation

#if os(Linux)
fileprivate let libHandle = loadDll("libsgp4prop.so")
#elseif os(Windows)
fileprivate let libHandle = loadDll("Sgp4Prop.dll")
#else
fileprivate let libHandle = loadDll("libsgp4prop.dylib")
#endif

// Notes: This function has been deprecated since v9.0. 
// Initializes the Sgp4 DLL for use in the program.
// <br>
// If this function returns an error, it is recommended that you stop the program immediately.
// <br>
// An error will occur if you forget to load and initialize all the prerequisite DLLs, as listed in the DLL Prerequisites section of the accompanying documentation, before using this DLL.
public func Sgp4Init( _ apAddr: Int64 ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64 ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "Sgp4Init"), to: FunctionSignature.self)

    return function(apAddr)
}

// Returns information about the current version of Sgp4Prop.dll. The information is placed in the string parameter you pass in.
// The returned string provides information about the version number, build date, and platform.
public func Sgp4GetInfo( _ infoStr: UnsafeMutablePointer<CChar> ) {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "Sgp4GetInfo"), to: FunctionSignature.self)

    function(infoStr)
}

// Loads SGP4-related parameters (prediction controls, JPL settings) and SGP4 elsets from a text file
public func Sgp4LoadFileAll( _ sgp4InputFile: UnsafeMutablePointer<CChar> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "Sgp4LoadFileAll"), to: FunctionSignature.self)

    return function(sgp4InputFile)
}

// Saves currently loaded SGP4-related parameters (SGP4 application controls, prediction controls, integration controls) to a file
// The purpose of this function is to save the current SGP4-related settings, usually used in GUI applications, for future use.
public func Sgp4SaveFile( _ sgp4File: UnsafeMutablePointer<CChar>,
                          _ saveMode: Int32,
                          _ saveForm: Int32 ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar>,
                                                   Int32,
                                                   Int32 ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "Sgp4SaveFile"), to: FunctionSignature.self)

    return function(sgp4File, saveMode, saveForm)
}

// Initializes an SGP4 satellite from an SGP or SGP4 TLE.
// Internally, when this function is called, Tle.dll's set of TLEs is searched for the provided satKey. If found, the associated TLE data will be used to create an SGP4 satellite which then will be added to Sgp4Prop.dll's set of satellites. Subsequent calls to propagate this satellite will use the data in this set to compute the satellite's new state.
// 
// This routine should be called once for each satellite you wish to propagate before propagation begins, or any time the associated data that is stored by Tle.dll is changed.
// 
// The call to this routine needs to be placed before any calls to the SGP4 propagator routines (Sgp4PropMse(), Sgp4PropDs50UTC(), etc.).
public func Sgp4InitSat( _ satKey: Int64 ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64 ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "Sgp4InitSat"), to: FunctionSignature.self)

    return function(satKey)
}

// Removing a satellite from the propagator's set of satellites does not affect the corresponding TLE data loaded by calls to routines in Tle.dll.
public func Sgp4RemoveSat( _ satKey: Int64 ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64 ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "Sgp4RemoveSat"), to: FunctionSignature.self)

    return function(satKey)
}

// Removes all currently loaded satellites from memory.
// Calling this function removes all satellites from the set maintained by Sgp4Prop.dll. However, the TLE data loaded by Tle.dll is unaffected by this function.
public func Sgp4RemoveAllSats(  ) -> Int32 {

    typealias FunctionSignature = @convention(c) (  ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "Sgp4RemoveAllSats"), to: FunctionSignature.self)

    return function()
}

// Returns the number of GP objects currently created. 
public func Sgp4GetCount(  ) -> Int32 {

    typealias FunctionSignature = @convention(c) (  ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "Sgp4GetCount"), to: FunctionSignature.self)

    return function()
}

// Propagates a satellite, represented by the satKey, to the time expressed in minutes since the satellite's epoch time. 
// The resulting data about the satellite is placed in the various reference parameters.
// It is the users' responsibility to decide what to do with the returned value. For example, if the users want to check for decay or low altitude, they can put that logic into their own code.
// 
// This function can be called in random time requests.
// The following cases will result in an error:
// <ul>
// <li>Semi major axis A &lt;= 0 or A &gt;1.0D6</li>
// <li>Eccentricity E &gt;= 1.0 or E &lt; -1.0D-3</li>
// <li>Mean anomaly MA&gt;=1.0D10</li>
// <li>Hyperbolic orbit E<sup>2</sup>&gt;= 1.0</li>
// <li>satKey doesn't exist in the set of loaded satellites</li>
// <li>FK model not set to FK5</li>
// </ul>
public func Sgp4PropMse( _ satKey: Int64,
                         _ mse: Double,
                         _ ds50UTC: UnsafeMutablePointer<Double>,
                         _ pos: UnsafeMutablePointer<Double>,
                         _ vel: UnsafeMutablePointer<Double>,
                         _ llh: UnsafeMutablePointer<Double> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   Double,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "Sgp4PropMse"), to: FunctionSignature.self)

    return function(satKey, mse, ds50UTC, pos, vel, llh)
}

// Propagates a satellite, represented by the satKey, to the time expressed in days since 1950, UTC. 
// The resulting data about the satellite is placed in the pos (position), vel (velocity), and llh (Lat/Lon/Height) parameters.
// It is the users' responsibility to decide what to do with the returned value. For example, if the users want to check for decay or low altitude, they can put that logic into their own code.
// The following cases will result in an error:
// <ul>
// <li>Semi major axis A &lt;= 0 or A &gt;1.0D6</li>
// <li>Eccentricity E &gt;= 1.0 or E &lt; -1.0D-3</li>
// <li>Mean anomaly MA&gt;=1.0D10</li>
// <li>Hyperbolic orbit E<sup>2</sup>&gt;= 1.0</li>
// <li>satKey doesn't exist in the set of loaded satellites</li>
// <li>GEO model not set to WGS-72 and/or FK model not set to FK5</li>
// </ul>
public func Sgp4PropDs50UTC( _ satKey: Int64,
                             _ ds50UTC: Double,
                             _ mse: UnsafeMutablePointer<Double>,
                             _ pos: UnsafeMutablePointer<Double>,
                             _ vel: UnsafeMutablePointer<Double>,
                             _ llh: UnsafeMutablePointer<Double> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   Double,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "Sgp4PropDs50UTC"), to: FunctionSignature.self)

    return function(satKey, ds50UTC, mse, pos, vel, llh)
}

// Propagates a satellite, represented by the satKey, to the time expressed in days since 1950, UTC. 
// The resulting data about the satellite is placed in the pos (position), vel (velocity) parameters.
public func Sgp4PropDs50UtcPosVel( _ satKey: Int64,
                                   _ ds50UTC: Double,
                                   _ pos: UnsafeMutablePointer<Double>,
                                   _ vel: UnsafeMutablePointer<Double> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   Double,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "Sgp4PropDs50UtcPosVel"), to: FunctionSignature.self)

    return function(satKey, ds50UTC, pos, vel)
}

// Propagates a satellite, represented by the satKey, to the time expressed in days since 1950, UTC. 
// Only the geodetic information is returned by this function.
// It is the users' responsibility to decide what to do with the returned value. For example, if the users want to check for decay or low altitude, they can put that logic into their own code.
// 
// This function is similar to Sgp4PropDs50UTC but returns only LLH.  This function is designed especially for applications which plot ground traces.
// The following cases will result in an error:
// <ul>
// <li>Semi major axis A &lt;= 0 or A &gt;1.0D6</li>
// <li>Eccentricity E &gt;= 1.0 or E &lt; -1.0D-3</li>
// <li>Mean anomaly MA&gt;=1.0D10</li>
// <li>Hyperbolic orbit E<sup>2</sup>&gt;= 1.0</li>
// <li>satKey doesn't exist in the set of loaded satellites</li>
// <li>GEO model not set to WGS-72 and/or FK model not set to FK5</li>
// </ul>
public func Sgp4PropDs50UtcLLH( _ satKey: Int64,
                                _ ds50UTC: Double,
                                _ llh: UnsafeMutablePointer<Double> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   Double,
                                                   UnsafeMutablePointer<Double> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "Sgp4PropDs50UtcLLH"), to: FunctionSignature.self)

    return function(satKey, ds50UTC, llh)
}

// Propagates a satellite, represented by the satKey, to the time expressed in days since 1950, UTC. 
// Only the ECI position vector is returned by this function.
// It is the users' responsibility to decide what to do with the returned value. For example, if the users want to check for decay or low altitude, they can put that logic into their own code.
// 
// This function is similar to Sgp4PropDs50UTC but returns only ECI position vector.  This function is designed especially for applications which plot satellite position in 3D.
// The following cases will result in an error:
// <ul>
// <li>Semi major axis A &lt;= 0 or A &gt;1.0D6</li>
// <li>Eccentricity E &gt;= 1.0 or E &lt; -1.0D-3</li>
// <li>Mean anomaly MA&gt;=1.0D10</li>
// <li>Hyperbolic orbit E<sup>2</sup>&gt;= 1.0</li>
// <li>satKey doesn't exist in the set of loaded satellites</li>
// <li>GEO model not set to WGS-72 and/or FK model not set to FK5</li>
// </ul>
public func Sgp4PropDs50UtcPos( _ satKey: Int64,
                                _ ds50UTC: Double,
                                _ pos: UnsafeMutablePointer<Double> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   Double,
                                                   UnsafeMutablePointer<Double> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "Sgp4PropDs50UtcPos"), to: FunctionSignature.self)

    return function(satKey, ds50UTC, pos)
}

// Retrieves propagator's precomputed results. This function can be used to obtain results from 
// a propagation which are not made available through calls to the propagation functions themselves.
// <br>
// See example in Sgp4PropMse or Sgp4PropDs50UTC.
// <br>
// This function should be called immediately after a successful call to Sgp4PropMse() or Sgp4PropDs50UTC() to retrieve the desired values.
// <br>
// It is the caller's responsibility to ensure that the array passed in the destArray parameter is large enough to hold the requested values. The required size can be found by looking at the destArray size column of the table below describing valid index values.
// <br>
// The destArray Arrangement column lists the order of the elements in the array. It is not necessarily the subscript of the element in the array since this is language-dependent. For example, in C/C++ the first element in every array is the zero-subscripted element. In other programming languages, the subscript of the first element is 1.
// <br>
// Note: This function is not thread safe, please use Sgp4PropAll() instead 
// <br>
// The table below shows the values for the xf_Sgp4Out parameter:
// <table>
// <caption>table</caption>
// <tr>
// <td><b>Index</b></td>
// <td><b>Index Interpretation</b></td>
// <td><b>DestArray size</b></td>
// <td><b>DestArray Arrangement</b></td>
// </tr>
// <tr><td>1</td><td>Revolution number</td><td>1</td><td><ol><li>Revolution number (based on the Osculating Keplerian
// Elements)</li></ol></td></tr>
// <tr><td>2</td><td>Nodal Apogee Perigee</td><td>3</td><td><ol><li>nodal period (minutes)</li><li>apogee
// (km)</li><li>perigee (km)</li></ol></td></tr>
// <tr><td>3</td><td>Mean Keplerian Elements</td><td>6</td><td><ol><li>semi-major axis (km)</li><li>eccentricity
// (unitless)</li><li>inclination (degree)</li><li>mean anomaly (degree)</li><li>right ascension of the ascending node
// (degree)</li><li>argument of perigee (degree)</li></ol></td></tr>
// <tr><td>4</td><td>Osculating Keplerian Elements</td><td>6</td><td>Same as Mean Keplerian Elements</td></tr>
// </table>
public func Sgp4GetPropOut( _ satKey: Int64,
                            _ xf_Sgp4Out: Int32,
                            _ destArr: UnsafeMutablePointer<Double> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   Int32,
                                                   UnsafeMutablePointer<Double> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "Sgp4GetPropOut"), to: FunctionSignature.self)

    return function(satKey, xf_Sgp4Out, destArr)
}

// Propagates a satellite, represented by the satKey, to the time expressed in either minutes since epoch or days since 1950, UTC. 
// All propagation data is returned by this function.
public func Sgp4PropAll( _ satKey: Int64,
                         _ timeType: Int32,
                         _ timeIn: Double,
                         _ xa_Sgp4Out: UnsafeMutablePointer<Double> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   Int32,
                                                   Double,
                                                   UnsafeMutablePointer<Double> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "Sgp4PropAll"), to: FunctionSignature.self)

    return function(satKey, timeType, timeIn, xa_Sgp4Out)
}

// Converts osculating position and velocity vectors to a set of mean Keplerian SGP4 elements.
// The new position and velocity vectors are the results of using SGP4 propagator to propagate the computed sgp4MeanKep to the time specified in year and day of epoch time. 
// They should be closely matched with the input osculating position and velocity vectors.
// 
// The mean Keplerian elements are SGP4's Brouwer mean motion not SGP's Kozai mean motion.
// Notes: Even if the function fails, the less acurate results may still be availalbe 
public func Sgp4PosVelToKep( _ yr: Int32,
                             _ day: Double,
                             _ pos: UnsafeMutablePointer<Double>,
                             _ vel: UnsafeMutablePointer<Double>,
                             _ posNew: UnsafeMutablePointer<Double>,
                             _ velNew: UnsafeMutablePointer<Double>,
                             _ xa_kep: UnsafeMutablePointer<Double> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int32,
                                                   Double,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "Sgp4PosVelToKep"), to: FunctionSignature.self)

    return function(yr, day, pos, vel, posNew, velNew, xa_kep)
}

// Converts osculating position and velocity vectors to TLE array - allows bstar/bterm, drag values to be used in the conversion if desired
// The function is similar to Sgp4PosVelToKep but allows the user to specify agom (XP mode) and bstar/bterm values, if desired, to be used in solving for the new Keplerian elements.
// 
// The updated elements returned in the xa_tle array is of type SGP and the mean motion is Kozai mean motion.
// Notes: Even if the function fails, the less acurate results may still be availalbe 
public func Sgp4PosVelToTleArr( _ pos: UnsafeMutablePointer<Double>,
                                _ vel: UnsafeMutablePointer<Double>,
                                _ xa_tle: UnsafeMutablePointer<Double> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "Sgp4PosVelToTleArr"), to: FunctionSignature.self)

    return function(pos, vel, xa_tle)
}

// Reepochs a loaded TLE, represented by the satKey, to a new epoch.
public func Sgp4ReepochTLE( _ satKey: Int64,
                            _ reepochDs50UTC: Double,
                            _ line1Out: UnsafeMutablePointer<CChar>,
                            _ line2Out: UnsafeMutablePointer<CChar> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   Double,
                                                   UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<CChar> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "Sgp4ReepochTLE"), to: FunctionSignature.self)

    return function(satKey, reepochDs50UTC, line1Out, line2Out)
}

// Reepochs a loaded TLE, represented by the satKey, to a new epoch in Csv format.
public func Sgp4ReepochCsv( _ satKey: Int64,
                            _ reepochDs50UTC: Double,
                            _ csvLine: UnsafeMutablePointer<CChar> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   Double,
                                                   UnsafeMutablePointer<CChar> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "Sgp4ReepochCsv"), to: FunctionSignature.self)

    return function(satKey, reepochDs50UTC, csvLine)
}

// This function has been deprecated since v8.2
// Note: The only requirement now is that "SGP4_Open_License.txt" file needs to be in those folders specified in PATH/LD_LIBRARY_PATH environment or AstroStds DLLs/SOs'
public func Sgp4SetLicFilePath( _ licFilePath: UnsafeMutablePointer<CChar> ) {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "Sgp4SetLicFilePath"), to: FunctionSignature.self)

    function(licFilePath)
}

// This function has been deprecated since v8.2
// Note: The only requirement now is that "SGP4_Open_License.txt" file needs to be in those folders specified in PATH/LD_LIBRARY_PATH environment or AstroStds DLLs/SOs'
public func Sgp4GetLicFilePath( _ licFilePath: UnsafeMutablePointer<CChar> ) {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "Sgp4GetLicFilePath"), to: FunctionSignature.self)

    function(licFilePath)
}

// Generates ephemerides for the input satellite, represented by its satKey, for the specified time span and step size
// Notes: if arrSize isn't big enough to store all the ephemeris points, the function will exit when the ephemArr reaches
// that many points (arrSize) and the errCode is set to IDX_ERR_WARN
public func Sgp4GenEphems( _ satKey: Int64,
                           _ startTime: Double,
                           _ endTime: Double,
                           _ stepSize: Double,
                           _ sgp4_ephem: Int32,
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

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "Sgp4GenEphems"), to: FunctionSignature.self)

    return function(satKey, startTime, endTime, stepSize, sgp4_ephem, arrSize, _ephemArr, genEphemPts)
}

// Generates ephemerides for the input TLE - in an array format - for the specified time span and step size (IOC - In Once Call)
// Notes: <br>
// - This function takes in TLE data directly and doesn't need to go through loading/geting satKey/initializing steps<br>
// - if arrSize isn't big enough to store all the ephemeris points, the function will exit when the ephemArr reaches
//   that many points (arrSize) and the errCode is set to IDX_ERR_WARN
public func Sgp4GenEphems_OS( _ xa_tle: UnsafeMutablePointer<Double>,
                              _ startTime: Double,
                              _ endTime: Double,
                              _ stepSize: Double,
                              _ sgp4_ephem: Int32,
                              _ arrSize: Int32,
                              _ ephemArr: UnsafeMutablePointer<(Double, Double, Double, Double, Double, Double, Double)>,
                              _ genEphemPts: UnsafeMutablePointer<Int32> ) -> Int32 {

    let _ephemArr = UnsafeMutableRawPointer(ephemArr).bindMemory(to: Double.self, capacity: 0)

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<Double>,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   Int32,
                                                   Int32,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Int32> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "Sgp4GenEphems_OS"), to: FunctionSignature.self)

    return function(xa_tle, startTime, endTime, stepSize, sgp4_ephem, arrSize, _ephemArr, genEphemPts)
}

// Propagates all input satellites, represented by their satKeys, to the time expressed in days since 1950, UTC. 
public func Sgp4PropAllSats( _ satKeys: UnsafeMutablePointer<Int64>,
                             _ numOfSats: Int32,
                             _ ds50UTC: Double,
                             _ ephemArr: UnsafeMutablePointer<(Double, Double, Double, Double, Double, Double)> ) -> Int32 {

    let _ephemArr = UnsafeMutableRawPointer(ephemArr).bindMemory(to: Double.self, capacity: 0)

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<Int64>,
                                                   Int32,
                                                   Double,
                                                   UnsafeMutablePointer<Double> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "Sgp4PropAllSats"), to: FunctionSignature.self)

    return function(satKeys, numOfSats, ds50UTC, _ephemArr)
}
// Different return values of errCode from Sgp4 propagation
//SGP4 propagates successfully
public let GP_ERR_NONE        = 0
//Bad FK model (FK5 must be selected)
public let GP_ERR_BADFK       = 1
//A is negative
public let GP_ERR_ANEGATIVE   = 2
//A is to large
public let GP_ERR_ATOOLARGE   = 3
//Eccentricity is hyperbolic
public let GP_ERR_EHYPERPOLIC = 4
//Eccentricity is negative
public let GP_ERR_ENEGATIVE   = 5
//Mean anomaly is too large
public let GP_ERR_MATOOLARGE  = 6
//e**2 is too large
public let GP_ERR_E2TOOLARGE  = 7

// Different time types for passing to Sgp4PropAll
//propagation time is in minutes since epoch
public let SGP4_TIMETYPE_MSE      = 0
//propagation time is in days since 1950, UTC
public let SGP4_TIMETYPE_DS50UTC  = 1

// Sgp4 propagated output fields
//Revolution number
public let XF_SGP4OUT_REVNUM       = 1
//Nodal period, apogee, perigee
public let XF_SGP4OUT_NODAL_AP_PER = 2
//Mean Keplerian
public let XF_SGP4OUT_MEAN_KEP     = 3
//Osculating Keplerian
public let XF_SGP4OUT_OSC_KEP      = 4

// Sgp4 propagated data
//Propagation time in days since 1950, UTC
public let XA_SGP4OUT_DS50UTC      =  0
//Propagation time in minutes since the satellite's epoch time
public let XA_SGP4OUT_MSE          =  1
//ECI X position (km) in True Equator and Mean Equinox of Epoch
public let XA_SGP4OUT_POSX         =  2
//ECI Y position (km) in True Equator and Mean Equinox of Epoch
public let XA_SGP4OUT_POSY         =  3
//ECI Z position (km) in True Equator and Mean Equinox of Epoch
public let XA_SGP4OUT_POSZ         =  4
//ECI X velocity (km/s) in True Equator and Mean Equinox of Epoch
public let XA_SGP4OUT_VELX         =  5
//ECI Y velocity (km/s) in True Equator and Mean Equinox of Epoch
public let XA_SGP4OUT_VELY         =  6
//ECI Z velocity (km/s) in True Equator and Mean Equinox of Epoch
public let XA_SGP4OUT_VELZ         =  7
//Geodetic latitude (deg)
public let XA_SGP4OUT_LAT          =  8
//Geodetic longitude (deg)
public let XA_SGP4OUT_LON          =  9
//Height above geoid (km)
public let XA_SGP4OUT_HEIGHT       = 10
//Revolution number
public let XA_SGP4OUT_REVNUM       = 11
//Nodal period (min)
public let XA_SGP4OUT_NODALPER     = 12
//Apogee (km)
public let XA_SGP4OUT_APOGEE       = 13
//Perigee (km)
public let XA_SGP4OUT_PERIGEE      = 14
//Mean semi-major axis (km)
public let XA_SGP4OUT_MN_A         = 15
//Mean eccentricity (unitless)
public let XA_SGP4OUT_MN_E         = 16
//Mean inclination (deg)
public let XA_SGP4OUT_MN_INCLI     = 17
//Mean mean anomaly (deg)
public let XA_SGP4OUT_MN_MA        = 18
//Mean right ascension of the asending node (deg)
public let XA_SGP4OUT_MN_NODE      = 19
//Mean argument of perigee (deg)
public let XA_SGP4OUT_MN_OMEGA     = 20
//Osculating semi-major axis (km)
public let XA_SGP4OUT_OSC_A        = 21
//Osculating eccentricity (unitless)
public let XA_SGP4OUT_OSC_E        = 22
//Osculating inclination (deg)
public let XA_SGP4OUT_OSC_INCLI    = 23
//Osculating mean anomaly (deg)
public let XA_SGP4OUT_OSC_MA       = 24
//Osculating right ascension of the asending node (deg)
public let XA_SGP4OUT_OSC_NODE     = 25
//Osculating argument of perigee (deg)
public let XA_SGP4OUT_OSC_OMEGA    = 26

public let XA_SGP4OUT_SIZE         = 64

// Different options for generating ephemerides from SGP4
//ECI TEME of DATE     - 0: time in days since 1950 UTC, 1-3: pos (km), 4-6: vel (km/sec)
public let SGP4_EPHEM_ECI   = 1
//MEME of J2K (4 terms)- 0: time in days since 1950 UTC, 1-3: pos (km), 4-6: vel (km/sec)
public let SGP4_EPHEM_J2K   = 2


// Different dynamic step size options
//Use a simple algorithm to determine step size based on satellite's current position
public let DYN_SS_BASIC  = -1

//*******************************************************************************

// ========================= End of auto generated code ==========================
