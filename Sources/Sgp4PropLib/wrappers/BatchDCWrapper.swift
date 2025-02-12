// This wrapper file was generated automatically by the GenDllWrappers program.
import Foundation

#if os(Linux)
fileprivate let libHandle = loadDll("libbatchdc.so")
#elseif os(Windows)
fileprivate let libHandle = loadDll("BatchDC.dll")
#else
fileprivate let libHandle = loadDll("libbatchdc.dylib")
#endif

// Notes: This function has been deprecated since v9.0. 
// Initializes BatchDC DLL for use in the program
public func BatchDCInit( _ apAddr: Int64 ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64 ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "BatchDCInit"), to: FunctionSignature.self)

    return function(apAddr)
}

// Returns information about the current version of BatchDC DLL. 
// The information is placed in the string parameter passed in.
public func BatchDCGetInfo( _ infoStr: UnsafeMutablePointer<CChar> ) {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "BatchDCGetInfo"), to: FunctionSignature.self)

    function(infoStr)
}

// Read/Load BatchDC input data from an input file
public func BatchDCLoadFile( _ batchDCInputFile: UnsafeMutablePointer<CChar> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "BatchDCLoadFile"), to: FunctionSignature.self)

    return function(batchDCInputFile)
}

// Loads BatchDC control parameters and all BatchDC related data (environment, time, elsets, sensors) from an input text file
public func BatchDCLoadFileAll( _ batchDCInputFile: UnsafeMutablePointer<CChar> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "BatchDCLoadFileAll"), to: FunctionSignature.self)

    return function(batchDCInputFile)
}

// Read/Load BatchDC-typed input data from an input card
public func BatchDCLoadCard( _ card: UnsafeMutablePointer<CChar> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "BatchDCLoadCard"), to: FunctionSignature.self)

    return function(card)
}

// Builds and returns the DC parameter card (1P-Card) from the current DC settings
public func BatchDCGetPCard( _ dcPCard: UnsafeMutablePointer<CChar> ) {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "BatchDCGetPCard"), to: FunctionSignature.self)

    function(dcPCard)
}

// Saves any currently loaded BatchDC-related settings to a file
public func BatchDCSaveFile( _ batchDCFile: UnsafeMutablePointer<CChar>,
                             _ saveMode: Int32,
                             _ saveForm: Int32 ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar>,
                                                   Int32,
                                                   Int32 ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "BatchDCSaveFile"), to: FunctionSignature.self)

    return function(batchDCFile, saveMode, saveForm)
}

// Gets BatchDC parameter data (P Card) - all fields
// <br>
// The table below shows the structure of the integer array xai_ctrl:
// <table>
//     <caption>table</caption>
//     <tr>
//         <td><b>Index</b></td>
//         <td><b>Index Interpretation</b></td>
//     </tr>
//     <tr><td>0</td><td>DC print option</td></tr>
//     <tr><td>1</td><td>Apply biases from sensor file</td></tr>
//     <tr><td>2</td><td>Weighed DC flag</td></tr>
//     <tr><td>3</td><td>Epoch placement control</td></tr>
//     <tr><td>4</td><td>Element correction flag - Ag</td></tr>
//     <tr><td>5</td><td>Element correction flag - Af</td></tr>
//     <tr><td>6</td><td>Element correction flag - Psi</td></tr>
//     <tr><td>7</td><td>Element correction flag - Chi</td></tr>
//     <tr><td>8</td><td>Element correction flag - L</td></tr>
//     <tr><td>9</td><td>Element correction flag - N</td></tr>
//     <tr><td>10</td><td>Element correction flag - B* (SGP4) B (SP)</td></tr>
//     <tr><td>11</td><td>Element correction flag - Agom (SP)</td></tr>
//     <tr><td>12</td><td>Correction order</td></tr>
//     <tr><td>13</td><td>Correct by the specified correction order for 1 iteration only</td></tr>
//     <tr><td>14</td><td>Flag specifies which residuals are used for RMS calculation and convergence</td></tr>
//     <tr><td>15</td><td>Flag; if set, produce sensor performance analysis summary</td></tr>
//     <tr><td>16</td><td>Flag; if set, deweight according to # of obs per track</td></tr>
//     <tr><td>17</td><td>Iteration summary control</td></tr>
//     <tr><td>18</td><td>Partials method</td></tr>
//     <tr><td>19</td><td>Light time correction control</td></tr>
//     <tr><td>20</td><td>Number of iteration to allow no auto rejection of residuals</td></tr>
//     <tr><td>21</td><td>Propagation method</td></tr>
//     <tr><td>22</td><td>Flag; if set, correct B* vs X</td></tr>
//     <tr><td>23</td><td>Max # of iterations before declaring divergence</td></tr>
//     <tr><td>24</td><td>Use predicted RMS versus previous RMS for convergence testing</td></tr>
// </table>
// <br>
// The table below shows the structure of the real array xar_ctrl:
// <table>
//     <caption>table</caption>
//     <tr>
//         <td><b>Index</b></td>
//         <td><b>Index Interpretation</b></td>
//     </tr>
//     <tr><td>0</td><td>RMS multiplier</td></tr>
//     <tr><td>1</td><td>Time of specified epoch</td></tr>
//     <tr><td>2</td><td>Convergence criteria on time correction (%)</td></tr>
//     <tr><td>3</td><td>First pass delta-t rejection criteria</td></tr>
//     <tr><td>4</td><td>Convergence criteria on 7-elt correction (%)</td></tr>
//     <tr><td>5</td><td>Reset value for B term in subset correction</td></tr>
// </table>
public func BatchDCGetParams( _ xai_ctrl: UnsafeMutablePointer<Int32>,
                              _ xar_ctrl: UnsafeMutablePointer<Double>,
                              _ xas_ctrl: UnsafeMutablePointer<CChar> ) {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<CChar> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "BatchDCGetParams"), to: FunctionSignature.self)

    function(xai_ctrl, xar_ctrl, xas_ctrl)
}

// Sets BatchDC parameter data (P Card) - all fields
// See BatchDCGetParams for the structure of the xai_ctrl and xar_ctrl arrays.
public func BatchDCSetParams( _ xai_ctrl: UnsafeMutablePointer<Int32>,
                              _ xar_ctrl: UnsafeMutablePointer<Double>,
                              _ xas_ctrl: UnsafeMutablePointer<CChar> ) {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<CChar> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "BatchDCSetParams"), to: FunctionSignature.self)

    function(xai_ctrl, xar_ctrl, xas_ctrl)
}

// Returns DC control parameters using array format
public func BatchDCGetCtrlArr( _ xa_dcCtrl: UnsafeMutablePointer<Double> ) {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "BatchDCGetCtrlArr"), to: FunctionSignature.self)

    function(xa_dcCtrl)
}

// Sets DC control parameters using array format
public func BatchDCSetCtrlArr( _ xa_dcCtrl: UnsafeMutablePointer<Double> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<Double> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "BatchDCSetCtrlArr"), to: FunctionSignature.self)

    return function(xa_dcCtrl)
}

// Initializes DC parameters for the satellite
// See BatchDCGetParams for the structure of the xai_dcElts and xar_dcElts arrays.
public func BatchDCInitSat( _ satKey: Int64,
                            _ numObs: UnsafeMutablePointer<Int32>,
                            _ obsKeys: UnsafeMutablePointer<Int64>,
                            _ xai_dcElts: UnsafeMutablePointer<Int32>,
                            _ xar_dcElts: UnsafeMutablePointer<Double>,
                            _ xas_dcElts: UnsafeMutablePointer<CChar> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Int64>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<CChar> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "BatchDCInitSat"), to: FunctionSignature.self)

    return function(satKey, numObs, obsKeys, xai_dcElts, xar_dcElts, xas_dcElts)
}

// Initializes DC parameters for the satellite using only the provided/preselected obsKeys (not all loaded obs) (Thread-Safe)
// See BatchDCGetParams for the structure of the xai_dcElts and xar_dcElts arrays.
public func BatchDCInitSatObsKeys( _ satKey: Int64,
                                   _ xa_dcCtrl: UnsafeMutablePointer<Double>,
                                   _ numObs: Int32,
                                   _ obsKeys: UnsafeMutablePointer<Int64>,
                                   _ xai_dcElts: UnsafeMutablePointer<Int32>,
                                   _ xar_dcElts: UnsafeMutablePointer<Double>,
                                   _ xas_dcElts: UnsafeMutablePointer<CChar> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   UnsafeMutablePointer<Double>,
                                                   Int32,
                                                   UnsafeMutablePointer<Int64>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<CChar> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "BatchDCInitSatObsKeys"), to: FunctionSignature.self)

    return function(satKey, xa_dcCtrl, numObs, obsKeys, xai_dcElts, xar_dcElts, xas_dcElts)
}

// Initializes DC parameters for the satellite using only obs that match the provided obs selection criteria (not all loaded obs) (Thread-Safe)
// See BatchDCGetParams for the structure of the xai_dcElts and xar_dcElts arrays.
// Note: This can be accomplished by using ObsGetSelected() and BatchDCInitSatObsKeys() as well
public func BatchDCInitSatObsSel( _ satKey: Int64,
                                  _ xa_dcCtrl: UnsafeMutablePointer<Double>,
                                  _ xa_selob: UnsafeMutablePointer<Double>,
                                  _ numObs: UnsafeMutablePointer<Int32>,
                                  _ obsKeys: UnsafeMutablePointer<Int64>,
                                  _ xai_dcElts: UnsafeMutablePointer<Int32>,
                                  _ xar_dcElts: UnsafeMutablePointer<Double>,
                                  _ xas_dcElts: UnsafeMutablePointer<CChar> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Int64>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<CChar> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "BatchDCInitSatObsSel"), to: FunctionSignature.self)

    return function(satKey, xa_dcCtrl, xa_selob, numObs, obsKeys, xai_dcElts, xar_dcElts, xas_dcElts)
}

// Performs batch-least-square differential corrections to the specified satellite and
// return the corrected elements and related data - using all loaded obs
// <br>
// Note: The input satellite must be intialized by calling BatchDCInitSat() prior to calling this routine
// <br>
// See BatchDCGetParams for the structure of the xai_dcElts array.
// <br>
// The table below shows the structure of the integer array xar_dcElts:
// <table>
//     <caption>table</caption>
//     <tr>
//         <td><b>Index</b></td>
//         <td><b>Index Interpretation</b></td>
//     </tr>
//     <tr><td>0</td><td>elset's epoch time in days since 1950 UTC</td></tr>
//     <tr><td>1</td><td>n-dot/2  (for SGP, eph-type = 0)</td></tr>
//     <tr><td>2</td><td>n-double-dot/6  (for SGP, eph-type = 0)</td></tr>
//     <tr><td>3</td><td>either SGP4 bStar (1/er) or SP bTerm (m2/kg)</td></tr>
//     <tr><td>4</td><td>SP agom (m**2/kg)</td></tr>
//     <tr><td>5</td><td>SP outgassing parameter (km/s**2)</td></tr>
//     <tr><td>6</td><td>semi major axis (km)</td></tr>
//     <tr><td>7</td><td>eccentricity</td></tr>
//     <tr><td>8</td><td>inclination (deg)</td></tr>
//     <tr><td>9</td><td>mean anamoly (deg)</td></tr>
//     <tr><td>10</td><td>right ascension of the ascending node (deg)</td></tr>
//     <tr><td>11</td><td>argument of perigee (deg)</td></tr>
//     <tr><td>12</td><td>AF</td></tr>
//     <tr><td>13</td><td>AG</td></tr>
//     <tr><td>14</td><td>CHI</td></tr>
//     <tr><td>15</td><td>PSI</td></tr>
//     <tr><td>16</td><td>mean longitude (deg)</td></tr>
//     <tr><td>17</td><td>mean motion (revs/day)</td></tr>
//     <tr><td>18</td><td>ECI posX (km)</td></tr>
//     <tr><td>19</td><td>ECI posY (km)</td></tr>
//     <tr><td>20</td><td>ECI posZ (km)</td></tr>
//     <tr><td>21</td><td>ECI velX (km/s)</td></tr>
//     <tr><td>22</td><td>ECI velY (km/s)</td></tr>
//     <tr><td>23</td><td>ECI velZ (km/s)</td></tr>
//     <tr><td></td><td></td></tr>
//     <tr><td>40</td><td>RMS (km)</td></tr>
//     <tr><td>41</td><td>unweighted RMS (km)</td></tr>
//     <tr><td>42</td><td>delta T RMS (min)</td></tr>
//     <tr><td>43</td><td>beta RMS (deg)</td></tr>
//     <tr><td>44</td><td>delta height RMS (km)</td></tr>
//     <tr><td>45</td><td>convergence value (km)</td></tr>
//     <tr><td>46</td><td>predicted RMS (km)</td></tr>
//     <tr><td></td><td></td></tr>
//     <tr><td>60</td><td>covariance diagonal L</td></tr>
//     <tr><td>61</td><td>covariance diagonal N</td></tr>
//     <tr><td>62</td><td>covariance diagonal CHI</td></tr>
//     <tr><td>63</td><td>covariance diagonal PSI</td></tr>
//     <tr><td>64</td><td>covariance diagonal AF</td></tr>
//     <tr><td>65</td><td>covariance diagonal AG</td></tr>
//     <tr><td>66</td><td>covariance diagonal BTERM</td></tr>
//     <tr><td>67</td><td>covariance not used</td></tr>
//     <tr><td>68</td><td>covariance diagonal AGOM</td></tr>
//     <tr><td></td><td></td></tr>
//     <tr><td>200-244</td><td>equinoctial covariance matrix - the lower triangular half 200-244</td></tr>
// </table>
public func BatchDCSolve( _ satKey: Int64,
                          _ xai_dcElts: UnsafeMutablePointer<Int32>,
                          _ xar_dcElts: UnsafeMutablePointer<Double>,
                          _ xas_dcElts: UnsafeMutablePointer<CChar> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<CChar> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "BatchDCSolve"), to: FunctionSignature.self)

    return function(satKey, xai_dcElts, xar_dcElts, xas_dcElts)
}

// Performs batch-least-square differential corrections to the specified satellite and
// return the corrected elements and related data - using only the provided obsKeys (not all loaded obs)
// Note: The input satellite must be intialized by calling BatchDCInitSat() prior to calling this routine
// See BatchDCGetParams for the structure of the xai_dcElts array.
// See BatchDCSolve for the structure of the xar_dcElts array.
public func BatchDCSolveSelObs( _ satKey: Int64,
                                _ obsKeys: UnsafeMutablePointer<Int64>,
                                _ numObs: Int32,
                                _ xai_dcElts: UnsafeMutablePointer<Int32>,
                                _ xar_dcElts: UnsafeMutablePointer<Double>,
                                _ xas_dcElts: UnsafeMutablePointer<CChar> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   UnsafeMutablePointer<Int64>,
                                                   Int32,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<CChar> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "BatchDCSolveSelObs"), to: FunctionSignature.self)

    return function(satKey, obsKeys, numObs, xai_dcElts, xar_dcElts, xas_dcElts)
}

// Removes a satellite, represented by the satKey, from BatchDC's memory
public func BatchDCRemoveSat( _ satKey: Int64 ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64 ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "BatchDCRemoveSat"), to: FunctionSignature.self)

    return function(satKey)
}

// Iterates DC for the satellite
// <br>
// xa_ObsRes size is [numObs, 100].  xa_rejFlg size is [numObs, 32].
// <br>
// The table below shows the values contained in xa_ObsRes for each ob:
// <table>
//     <caption>table</caption>
//     <tr>
//         <td><b>Index</b></td>
//         <td><b>Index Interpretation</b></td>
//     </tr>
//     <tr><td> 0 </td><td> Azimuth residual (deg)</td></tr>
//     <tr><td> 1 </td><td> Elevation residual (deg)</td></tr>
//     <tr><td> 2 </td><td> Range residual (km)</td></tr>
//     <tr><td> 3 </td><td> Height residual (deg)</td></tr>
//     <tr><td> 4 </td><td> Beta residual (deg)</td></tr>
//     <tr><td> 5 </td><td> Delta T residual (min)</td></tr>
//     <tr><td> 6 </td><td> Vector magnitude (km)</td></tr>
//     <tr><td> 7 </td><td> Time since epoch (days)</td></tr>
//     <tr><td> 8 </td><td> True argument of latitude (deg)</td></tr>
//     <tr><td> 9 </td><td> Revolution number  </td></tr>
//     <tr><td>10 </td><td> Range rate residual (km/sec)</td></tr>
//     <tr><td>11 </td><td> observation ASTAT</td></tr>
//     <tr><td>12 </td><td> observation type</td></tr>
//     <tr><td>13 </td><td> satellite true anomaly (deg)</td></tr>
//     <tr><td>14 </td><td> satellite elevation (deg)</td></tr>
//     <tr><td>15 </td><td> satellite maintenance category</td></tr>
//     <tr><td>16 </td><td> obs time in ds50UTC</td></tr>
//     <tr><td>17 </td><td> obs azimuth (deg)</td></tr>
//     <tr><td>18 </td><td> obs elevation (deg)</td></tr>
//     <tr><td>19 </td><td> Velocity angle residual (deg)</td></tr>
//     <tr><td>20 </td><td> Angular momentum residual (deg)</td></tr>
//     <tr><td>21 </td><td> Right ascension residual (deg) (for ob types 5, 9, 19)</td></tr>
//     <tr><td>22 </td><td> Declination residual (deg) (for ob types 5, 9, 19)</td></tr>
//     <tr><td>23 </td><td> Delta X position (km)</td></tr>
//     <tr><td>24 </td><td> Delta Y position (km)</td></tr>
//     <tr><td>25 </td><td> Delta Z position (km)</td></tr>
//     <tr><td>26 </td><td> Delta X velocity (km/sec)</td></tr>
//     <tr><td>27 </td><td> Delta Y velocity (km/sec)</td></tr>
//     <tr><td>28 </td><td> Delta Z velocity (km/sec)</td></tr>
//     <tr><td>29 </td><td> Angle only obs computed range (km)</td></tr>
//     <tr><td>30 </td><td> obs azimuth (deg)</td></tr>
//     <tr><td>31 </td><td> obs elevation (deg)</td></tr>
// </table>
// <br>
// See BatchDCGetParams for the structure of the xai_dcElts array.
// <br>
// See BatchDCSolve for the structure of the xar_dcElts array.
public func BatchDCIterate( _ satKey: Int64,
                            _ xa_ObsRes: UnsafeMutablePointer<(Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double)>,
                            _ xa_rejFlg: UnsafeMutablePointer<(Int32, Int32, Int32, Int32, Int32, Int32, Int32, Int32, Int32, Int32, Int32, Int32, Int32, Int32, Int32, Int32, Int32, Int32, Int32, Int32, Int32, Int32, Int32, Int32, Int32, Int32, Int32, Int32, Int32, Int32, Int32, Int32)>,
                            _ xai_dcElts: UnsafeMutablePointer<Int32>,
                            _ xar_dcElts: UnsafeMutablePointer<Double>,
                            _ xas_dcElts: UnsafeMutablePointer<CChar> ) -> Int32 {

    let _xa_ObsRes = UnsafeMutableRawPointer(xa_ObsRes).bindMemory(to: Double.self, capacity: 0)
    let _xa_rejFlg = UnsafeMutableRawPointer(xa_rejFlg).bindMemory(to: Int32.self, capacity: 0)

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<CChar> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "BatchDCIterate"), to: FunctionSignature.self)

    return function(satKey, _xa_ObsRes, _xa_rejFlg, xai_dcElts, xar_dcElts, xas_dcElts)
}

// Returns a concatenated string representation of a VCM generated by a successful DC
public func BatchDCGetVcm( _ satKey: Int64, _ vcmLines: UnsafeMutablePointer<CChar> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   UnsafeMutablePointer<CChar> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "BatchDCGetVcm"), to: FunctionSignature.self)

    return function(satKey, vcmLines)
}

// Returns the full file name of the output SP Vector file that was specified using "SPVOUT = " 
// in the main input file or using the BatchDCSetSpVOutFileName() function call
public func BatchDCGetSpVOut( _ spVOutFile: UnsafeMutablePointer<CChar> ) {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "BatchDCGetSpVOut"), to: FunctionSignature.self)

    function(spVOutFile)
}

// Sets the full file name of the SP Vector output file which will be used to store the generated SP vector data
public func BatchDCSetSpVOut( _ spVOutFile: UnsafeMutablePointer<CChar> ) {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "BatchDCSetSpVOut"), to: FunctionSignature.self)

    function(spVOutFile)
}

// Resets all BatchDC control parameters back to their default values and empties the DC binary tree (objects created by BatchDCInitSat)
public func BatchDCResetAll(  ) {

    typealias FunctionSignature = @convention(c) (  ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "BatchDCResetAll"), to: FunctionSignature.self)

    function()
}

// Returns DC acceptance criteria data for the specified satellite
public func BatchDCGetAccptCrit( _ satKey: Int64, _ xa_ac: UnsafeMutablePointer<Double> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   UnsafeMutablePointer<Double> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "BatchDCGetAccptCrit"), to: FunctionSignature.self)

    return function(satKey, xa_ac)
}

// Performs batch-least-square differential corrections to the specified satellite (VCM/SPVEC) and
// returns the corrected SGP4/SGP4-XP elements and related data
// Note: No need to initialize VCM before calling this method
public func SpToEGP( _ satKey: Int64,
                     _ xa_egpCtrl: UnsafeMutablePointer<Double>,
                     _ xai_dcElts: UnsafeMutablePointer<Int32>,
                     _ xar_dcElts: UnsafeMutablePointer<Double>,
                     _ xas_dcElts: UnsafeMutablePointer<CChar> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<CChar> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SpToEGP"), to: FunctionSignature.self)

    return function(satKey, xa_egpCtrl, xai_dcElts, xar_dcElts, xas_dcElts)
}

// Performs batch-least-square differential corrections to the specified satellite (VCM/SPVEC) and
// returns the corrected elements SGP4/SGP4-XP in form of a TLE
// Note: No need to initialize VCM before calling this method
public func SpToTle( _ satKey: Int64,
                     _ xa_egpCtrl: UnsafeMutablePointer<Double>,
                     _ line1: UnsafeMutablePointer<CChar>,
                     _ line2: UnsafeMutablePointer<CChar> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<CChar> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SpToTle"), to: FunctionSignature.self)

    return function(satKey, xa_egpCtrl, line1, line2)
}

// Combines SpToEGP and SpToTle functions into just one function call
// Note: No need to initialize VCM before calling this method
public func SpToTleComb( _ satKey: Int64,
                         _ xa_egpCtrl: UnsafeMutablePointer<Double>,
                         _ line1: UnsafeMutablePointer<CChar>,
                         _ line2: UnsafeMutablePointer<CChar>,
                         _ xai_dcElts: UnsafeMutablePointer<Int32>,
                         _ xar_dcElts: UnsafeMutablePointer<Double>,
                         _ xas_dcElts: UnsafeMutablePointer<CChar> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<CChar> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SpToTleComb"), to: FunctionSignature.self)

    return function(satKey, xa_egpCtrl, line1, line2, xai_dcElts, xar_dcElts, xas_dcElts)
}

// Performs batch-least-square differential corrections to the specified satellite (VCM/SPVEC) and
// returns the corrected elements SGP4/SGP4-XP in form of a TLE
// Note: No need to initialize VCM before calling this method
public func SpToCsv( _ satKey: Int64,
                     _ xa_egpCtrl: UnsafeMutablePointer<Double>,
                     _ csvLine: UnsafeMutablePointer<CChar> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<CChar> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SpToCsv"), to: FunctionSignature.self)

    return function(satKey, xa_egpCtrl, csvLine)
}

// Combines SpToEGP and SpToCsv functions into just one function call
// Note: No need to initialize VCM before calling this method
public func SpToCsvComb( _ satKey: Int64,
                         _ xa_egpCtrl: UnsafeMutablePointer<Double>,
                         _ csvLine: UnsafeMutablePointer<CChar>,
                         _ xai_dcElts: UnsafeMutablePointer<Int32>,
                         _ xar_dcElts: UnsafeMutablePointer<Double>,
                         _ xas_dcElts: UnsafeMutablePointer<CChar> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<CChar> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SpToCsvComb"), to: FunctionSignature.self)

    return function(satKey, xa_egpCtrl, csvLine, xai_dcElts, xar_dcElts, xas_dcElts)
}

// Performs batch-least-square differential corrections using the input external ephemeris and treating them as observations and
// returns the corrected SGP4/SGP4-XP elements and related data
public func ExtEphemToEGP( _ extEphFile: UnsafeMutablePointer<CChar>,
                           _ xa_egpCtrl: UnsafeMutablePointer<Double>,
                           _ xai_dcElts: UnsafeMutablePointer<Int32>,
                           _ xar_dcElts: UnsafeMutablePointer<Double>,
                           _ xas_dcElts: UnsafeMutablePointer<CChar> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<CChar> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "ExtEphemToEGP"), to: FunctionSignature.self)

    return function(extEphFile, xa_egpCtrl, xai_dcElts, xar_dcElts, xas_dcElts)
}

// Performs IOMOD/IODET and then batch-least-square differential corrections on the input observations via their obsKeys (Thread-Safe) 
public func IomodDC( _ numObs: Int32,
                     _ obsKeys: UnsafeMutablePointer<Int64>,
                     _ xa_iomdc: UnsafeMutablePointer<Double>,
                     _ xai_dcElts: UnsafeMutablePointer<Int32>,
                     _ xar_dcElts: UnsafeMutablePointer<Double>,
                     _ xas_dcElts: UnsafeMutablePointer<CChar> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int32,
                                                   UnsafeMutablePointer<Int64>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<CChar> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "IomodDC"), to: FunctionSignature.self)

    return function(numObs, obsKeys, xa_iomdc, xai_dcElts, xar_dcElts, xas_dcElts)
}
// Different DC propagation method
//DC propagator method is GP
public let DCPROPTYPE_GP =  0
//DC propagator method is SGP4-XP
public let DCPROPTYPE_XP =  4
//DC propagator method is SP
public let DCPROPTYPE_SP = 99

// DC iterating returned code
//DC was successful
public let ITERCODE_DONE      = 0
//DC has error
public let ITERCODE_ERROR     = 1
//DC is still iterating
public let ITERCODE_ITERATING = 2
//DC diverged but trying to recover
public let ITERCODE_DIVERGED  = 3

// indexes represent epoch placement options
//Nodal crossing nearest latest obs
public let EPFLG_NODALXINGLATESTOB = 0
//Exact time of latest obs
public let EPFLG_LATESTOB          = 1
//Nodal crossing closest to specified time
public let EPFLG_NODALXINGATTIME   = 2
//Do not change epoch
public let EPFLG_ATEPOCH           = 3
//Exact at specified time
public let EPFLG_ATSPECIFIEDTIME   = 4
//Middle of obs span
public let EPFLG_MIDDLEOBSSPAN     = 5
//Exact time of earliest obs
public let EPFLG_EARLIESTOB        = 6
//Beginning of day of Epoch, good for eGP
public let EPFLG_BEGINDAYEPOCH     = 7
//Beginning of day of Last obs
public let EPFLG_BEGINDAYLATESTOB  = 8
//Nodal crossing nearest epoch, good for eGP
public let EPFLG_NODALXINGEPOCH    = 9

// Different correction types
public let CORT_TIME   = 0
public let CORT_PLANE  = 1
public let CORT_7ELT   = 2
public let CORT_INTRK  = 3
public let CORT_8ELT   = 4
public let CORT_SUBELT = 5

// Different element correction order
//7-element only [default]
public let CORORD_7ELT       = 0
//time (SP: L, n, B), then 7-element
public let CORORD_TIM7ELT    = 1
//time, plane, then 7-element (SGP4) or 7-elt only; pht/pi vs Af/Ag (SP)
public let CORORD_TIMPLN7ELT = 2
//plane, time, then 7-element (SGP4) or 7-elt only; e/pi vs Af/Ag (SP)
public let CORORD_PLNTIM7ELT = 3
//plane, then 7-element (SGP4) or L, n, B, then 7-elt, with pht/pi vs Af/Ag (SP)
public let CORORD_PLN7ELT    = 4
//n-only, then 7-element
public let CORORD_N7ELT      = 5
//L-only, then 7-element
public let CORORD_L7ELT      = 6
//L & n only, then 7-element
public let CORORD_LN7ELT     = 7
//Af/Ag, L, n only, then 7-element
public let CORORD_AFAGLN7ELT = 8
//6-element, then 7-element
public let CORORD_6ELT7ELT   = 9


// indexes for EGP control parameters for input VCM/SPVEC-typed elsets or external ephemeris file
//Not being used yet
public let XA_EGPCTRL_OPTION     =  0
//DC element type: 0=SPG4, 4=SGP4-XP
public let XA_EGPCTRL_DCELTTYPE  =  1
//Fit span start time (minutes since VCM's epoch/specified new epoch) (set start/stop = 0 to auto select)
public let XA_EGPCTRL_STARTMSE   =  2
//Fit span stop time (minutes since VCM's epoch/specified new epoch) (set start/stop = 0 to auto select)
public let XA_EGPCTRL_STOPMSE    =  3
//Step size in minutes (how often obs are generated) (set to zero to auto select and then actual step size will be returned)
public let XA_EGPCTRL_STEPMIN    =  4
//Drag correction: 0=no correction, 1=correct BStar(SGP4)/BTerm(SGP4-XP), 2=correct X(SGP4 only)
public let XA_EGPCTRL_DRAGCOR    =  5
//agom correction: 0=no correction, 1=correct agom (only when DC element = SGP4-XP)
public let XA_EGPCTRL_AGOMCOR    =  6
//Epoch placement flag - see EPFLG_? for available options
public let XA_EGPCTRL_EPFLG      =  7
//Time of specified Epoch in Ds50UTC (only for XA_EGPCTRL_EPFLG = 2 or 4)                 *
public let XA_EGPCTRL_NEWEPOCH   =  8

//Addtional option if input is external ephemeris file - BStar(SGP4)/BTerm(SGP4-XP) if XA_EGPCTRL_DRAGCOR is set (= 1)
public let XA_EGPCTRL_BVAL       =  9
//Addtional option if input is external ephemeris file - agom value if XA_EGPCTRL_AGOMCOR is set (= 1)
public let XA_EGPCTRL_AGOMVAL    = 10

//correction order
public let XA_EGPCTRL_ORDERCOR   = 11
//Max # of iterations before declaring divergence [10]
public let XA_EGPCTRL_MAXOFITERS = 12

//satellite number
public let XA_EGPCTRL_SATNUM     = 63

public let XA_EGPCTRL_SIZE       = 64



// DC setting parameters

public let MAX_PARAMS = 256


// DC print options
//print first and last iteration
public let DC_PRINT_FIRSTBEST   =  0
//print every pass and summary
public let DC_PRINT_ALLPASS     =  1
//print summary only
public let DC_PRINT_SUMONLY     =  2
//print output elemenets only
public let DC_PRINT_ELTONLY     =  3
//do not print anything
public let DC_PRINT_NONE        =  4

// Iteration summary options
//print summary every iteration in Keplerian elts
public let ITER_SUM_KEP         =  1
//print summary every iteration in Equinoctial elts
public let ITER_SUM_EQNX        =  2

// indexes for integer data fields
//DC print option
public let XAI_CTRL_PRINTOPTION  =  0
//Apply biases from sensor file
public let XAI_CTRL_DEBIASOBS    =  1
//Weighed DC flag
public let XAI_CTRL_WEIGHTEDDC   =  2
//Epoch placement flag - see EPFLG_? for available options
public let XAI_CTRL_EPOCHOPTION  =  3
//Element correction flag - Ag
public let XAI_CTRL_CORRECT_AG   =  4
//Element correction flag - Af
public let XAI_CTRL_CORRECT_AF   =  5
//Element correction flag - Psi
public let XAI_CTRL_CORRECT_PSI  =  6
//Element correction flag - Chi
public let XAI_CTRL_CORRECT_CHI  =  7
//Element correction flag - L
public let XAI_CTRL_CORRECT_L    =  8
//Element correction flag - N
public let XAI_CTRL_CORRECT_N    =  9
//Element correction flag - B* (SGP4) B (SP)
public let XAI_CTRL_CORRECT_B    = 10
//Element correction flag - Agom (SP)
public let XAI_CTRL_CORRECT_AGOM = 11
//Correction order
public let XAI_CTRL_CORRECTORDER = 12
//Correct by the specified correction order for 1 iteration only
public let XAI_CTRL_FOR1ITERONLY = 13
//Flag specifies which residuals are used for RMS calculation and convergence
public let XAI_CTRL_RESIDSELECT  = 14
//Flag; if set, produce sensor performance analysis summary
public let XAI_CTRL_SENPERFORM   = 15
//Flag; if set, deweight according to # of obs per track
public let XAI_CTRL_DWOBSPERTRCK = 16
//Iteration summary control
public let XAI_CTRL_ITERSUMOPT   = 17
//Partials method
public let XAI_CTRL_PARTIALMETH  = 18
//Light time correction control
public let XAI_CTRL_LTC          = 19
//Number of iteration to allow no auto rejection of residuals
public let XAI_CTRL_BRUCE        = 20
//Propagation method - GP=0, XP=4, SP=99
public let XAI_CTRL_PROPMETHOD   = 21
//Flag; if set, correct B* vs X
public let XAI_CTRL_CORRECTBVSX  = 22
//Max # of iterations before declaring divergence
public let XAI_CTRL_MAXOFITERS   = 23
//Use predicted RMS versus previous RMS for convergence testing
public let XAI_CTRL_USEPREDRMS   = 24
//Residual computation method (GP only): DELTA/427M=1, SPADOC4=2
public let XAI_CTRL_RESCOMPMETH  = 25
//Flag; if set, use angle rates (obstypes = 4, 11)
public let XAI_CTRL_USEANGRATES  = 26

public let XAI_CTRL_SIZE         = 256



// indexes for real data fields
//RMS multiplier
public let XAR_CTRL_RMSMULT        =   0
//Time of specified epoch
public let XAR_CTRL_USEREPOCH      =   1
//Convergence criteria on time correction (%)
public let XAR_CTRL_CNVCRITONT     =   2
//First pass delta-t rejection criteria
public let XAR_CTRL_1STPASDELTAT   =   3
//Convergence criteria on 7-elt correction (%)
public let XAR_CTRL_CNVCRITON7ELT  =   4
//reset value for B term in subset correction
public let XAR_CTRL_BRESET         =   5
public let XAR_CTRL_SIZE           = 256


// indexes for accessing DC's integer data
//satellite number
public let XAI_DCELTS_SATNUM       =   0
//elset number
public let XAI_DCELTS_ELSETNUM     =   1
//elset's orbital/element type - see ELTTYPE_ constants for a list of possible values
public let XAI_DCELTS_ORBTYPE      =   2
//propagation method - see PROPTYPE_ constants for a list of possible values (GP=1, SP=2, External Ephemeris=3)
public let XAI_DCELTS_PROPTYPE     =   3
//spectr mode
public let XAI_DCELTS_SPECTR       =   4
//epoch revolution number
public let XAI_DCELTS_REVNUM       =   5
//correction type: 0=TIME, 1=PLANE", 2=7-ELT, 3=IN-TRK, 4=8-ELT, 5=SUBELT; see CORT_? for available values
public let XAI_DCELTS_CORRTYPE     =   6

//total iteration count
public let XAI_DCELTS_ITERCOUNT    =  10
//sub iteration count
public let XAI_DCELTS_SUBITER      =  11
//# residual accepted
public let XAI_DCELTS_RESACC       =  12
//# residual rejected
public let XAI_DCELTS_RESREJ       =  13

//20-28 correction element flags
public let XAI_DCELTS_CORRFLGS     =  20

public let XAI_DCELTS_SIZE         = 256

// indexes for accessing DC's real data
//elset's epoch time in days since 1950 UTC
public let XAR_DCELTS_EPOCHDS50UTC =   0
//n-dot/2  (for SGP, eph-type = 0)
public let XAR_DCELTS_NDOT         =   1
//n-double-dot/6  (for SGP, eph-type = 0)
public let XAR_DCELTS_N2DOT        =   2
//either SGP4 bStar (1/er) or SGP4-XP/SP bTerm (m2/kg)
public let XAR_DCELTS_BFIELD       =   3
//SGP4-XP/SP agom (m**2/kg)
public let XAR_DCELTS_AGOM         =   4
//SP outgassing parameter (km/s**2)
public let XAR_DCELTS_OGPARM       =   5
//semi major axis (km)
public let XAR_DCELTS_KEP_A        =   6
//eccentricity
public let XAR_DCELTS_KEP_E        =   7
//inclination (deg)
public let XAR_DCELTS_KEP_INCLI    =   8
//mean anamoly (deg)
public let XAR_DCELTS_KEP_MA       =   9
//right ascension of the ascending node (deg)
public let XAR_DCELTS_KEP_NODE     =  10
//argument of perigee (deg)
public let XAR_DCELTS_KEP_OMEGA    =  11
//AF
public let XAR_DCELTS_EQNX_AF      =  12
//AG
public let XAR_DCELTS_EQNX_AG      =  13
//CHI
public let XAR_DCELTS_EQNX_CHI     =  14
//PSI
public let XAR_DCELTS_EQNX_PSI     =  15
//mean longitude (deg)
public let XAR_DCELTS_EQNX_L       =  16
//mean motion (revs/day)
public let XAR_DCELTS_EQNX_N       =  17
//ECI posX (km)
public let XAR_DCELTS_POSX         =  18
//ECI posY (km)
public let XAR_DCELTS_POSY         =  19
//ECI posZ (km)
public let XAR_DCELTS_POSZ         =  20
//ECI velX (km/s)
public let XAR_DCELTS_VELX         =  21
//ECI velY (km/s)
public let XAR_DCELTS_VELY         =  22
//ECI velZ (km/s)
public let XAR_DCELTS_VELZ         =  23

//RMS (km)
public let XAR_DCELTS_RMS          =  40
//unweighted RMS (km)
public let XAR_DCELTS_RMSUNWTD     =  41
//delta T RMS (min)
public let XAR_DCELTS_DELTATRMS    =  42
//beta RMS (deg)
public let XAR_DCELTS_BETARMS      =  43
//delta height RMS (km)
public let XAR_DCELTS_DELTAHTRMS   =  44
//convergence value (km)
public let XAR_DCELTS_CONVQLTY     =  45
//predicted RMS (km)
public let XAR_DCELTS_RMSPD        =  46

//covariance diagonal L
public let XAR_DCELTS_COVL         =  60
//covariance diagonal N
public let XAR_DCELTS_COVN         =  61
//covariance diagonal CHI
public let XAR_DCELTS_COVCHI       =  62
//covariance diagonal PSI
public let XAR_DCELTS_COVPSI       =  63
//covariance diagonal AF
public let XAR_DCELTS_COVAF        =  64
//covariance diagonal AG
public let XAR_DCELTS_COVAG        =  65
//covariance diagonal BTERM
public let XAR_DCELTS_COVBTERM     =  66
//covariance not used
public let XAR_DCELTS_COVNA        =  67
//covariance diagonal AGOM
public let XAR_DCELTS_COVAGOM      =  68

//max partial residual (km)
public let XAR_DCELTS_XMAX         =  70
//max velocity resid (km/sec)
public let XAR_DCELTS_XMAX2        =  71
//max beta residual (deg)
public let XAR_DCELTS_XMAX3        =  72
//max delta-t residual (min)
public let XAR_DCELTS_XMAX4        =  73
//low argument of latitude coverage (deg)
public let XAR_DCELTS_PATCL        =  74
//high argument of latitude coverage (deg)
public let XAR_DCELTS_PATCH        =  75

//equinoctial covariance matrix - the lower triangular half 200-244
public let XAR_DCELTS_EQNXCOVMTX   = 200

public let XAR_DCELTS_SIZE         = 256

// indexes for accessing obs rejection flags
//satellite has decayed at the time of obs
public let XA_REJFLG_DECAYED      =   0
//obs residual computation error code
public let XA_REJFLG_ERROR        =   1
//right ascension residual rejected
public let XA_REJFLG_RA           =   2
//beta residual rejected
public let XA_REJFLG_BETA         =   3
//declination residual rejected
public let XA_REJFLG_DEC          =   4
//delta h residual rejected
public let XA_REJFLG_HEIGHT       =   5
//range residual rejected
public let XA_REJFLG_RANGE        =   6
//range rate residual rejected
public let XA_REJFLG_RR           =   7
//delta t residual rejected
public let XA_REJFLG_TIME         =   8

public let XA_REJFLG_SIZE         =  32

// indexes for accessing DC's acceptance criteria data
//standard - days from epoch
public let XA_AC_STD_EPOCH    =   0
//standard - number of residuals
public let XA_AC_STD_NORES    =   1
//standard - percent residual
public let XA_AC_STD_PRCNTRES =   2
//standard - RMS (km)
public let XA_AC_STD_RMS      =   3
//standard - obs span (days)
public let XA_AC_STD_OBSSPAN  =   4
//standard - change in plan (deg)
public let XA_AC_STD_DELTAW   =   5
//standard - change in abar
public let XA_AC_STD_DELTAABAR =   6
//standard - change in N (rev/day)
public let XA_AC_STD_DELTAN   =   7
//standard - change in B term
public let XA_AC_STD_DELTAB   =   8

//actual - days from epoch
public let XA_AC_ACT_EPOCH    =  20
//actual - number of residuals
public let XA_AC_ACT_NORES    =  21
//actual - percent residual
public let XA_AC_ACT_PRCNTRES =  22
//actual - RMS (km)
public let XA_AC_ACT_RMS      =  23
//actual - obs span (days)
public let XA_AC_ACT_OBSSPAN  =  24
//actual - change in plan (deg)
public let XA_AC_ACT_DELTAW   =  25
//actual - change in abar
public let XA_AC_ACT_DELTAABAR =  26
//actual - change in N (rev/day)
public let XA_AC_ACT_DELTAN   =  27
//actual - change in B term
public let XA_AC_ACT_DELTAB   =  28

public let XA_AC_SIZE         =  64


// indexes for accessing DC's string character data - index to index of a substring
//satellite's international designator
public let XAS_DCELTS_SATNAME_0TO7 =   0

public let XAS_DCELTS_SIZE         = 512

// Different DC control modes
//Use DC global settings settings
public let DCCTRL_MODE_GLOBAL   = 0
//Use provided/local DC settings
public let DCCTRL_MODE_LOCAL    = 1


// indexes of DC control parameters
//DC control mode: 0= use global settings (ignore the rest), 1= use the provided/local settings (thread-safe) - N/A for BatchDC(Get/Set)CtrlArr()
public let XA_DCCTRL_MODE             =  0
//propagation method: SGP4 = 0, SP = 99, XP = 4, or see DCPROPTYPE_? for available options
public let XA_DCCTRL_PROPMETHOD 		=  1
//debias obs flag: 0= do not debias obs, 1= debias obs
public let XA_DCCTRL_DEBIASOBS    		=  2
//element correction order
public let XA_DCCTRL_CORRECTORDER		=  3
//epoch placement flag - see EPFLG_? for available options
public let XA_DCCTRL_EPOCHOPTION  		=  4
//use predicted RMS versus previous RMS for convergenece testing
public let XA_DCCTRL_USEPREDRMS		   =  5
//residual computation selection
public let XA_DCCTRL_RESIDSELECT      =  6
//correct by the specified correction order for 1 iteration only
public let XA_DCCTRL_FOR1ITERONLY		=  7
//max # of iterations before declaring divergence
public let XA_DCCTRL_MAXOFITERS       =  8
//apply weighed DC flag
public let XA_DCCTRL_WEIGHTEDDC		   =  9
//light time correction control
public let XA_DCCTRL_LTC              = 10
//number of iteration to allow no auto rejection of residuals
public let XA_DCCTRL_BRUCE            = 11
//flag; if set, deweight according to # of obs per track
public let XA_DCCTRL_DWOBSPERTRCK     = 12
//partials method
public let XA_DCCTRL_PARTIALMETH      = 13
//Element correction flag - Ag
public let XA_DCCTRL_CORRECT_AG    	= 20
//Element correction flag - Af
public let XA_DCCTRL_CORRECT_AF    	= 21
//Element correction flag - Psi
public let XA_DCCTRL_CORRECT_PSI   	= 22
//Element correction flag - Chi
public let XA_DCCTRL_CORRECT_CHI   	= 23
//Element correction flag - L
public let XA_DCCTRL_CORRECT_L     	= 24
//Element correction flag - N
public let XA_DCCTRL_CORRECT_N     	= 25
//Element correction flag - B* (SGP4) B (SP)
public let XA_DCCTRL_CORRECT_B     	= 26
//Element correction flag - Agom (SP)
public let XA_DCCTRL_CORRECT_AGOM  	= 27
//Convergence criteria on time (%) [5.0%]
public let XA_DCCTRL_CNVCRITONT       = 30
//First pass delta-t rejection criteria Convergence criteria on time correction (min) [20 minutes]
public let XA_DCCTRL_1STPASDELTAT     = 31
//Convergence criteria on 7-elt correction (%) [1.0%]
public let XA_DCCTRL_CNVCRITON7ELT    = 32
//RMS multiplier [4.0]
public let XA_DCCTRL_RMSMULT          = 33
//reset value for B term in subset correction [0.01]
public let XA_DCCTRL_BRESET           = 34
//user's specified epoch - only when epoch placement option = 4 exact at specified time
public let XA_DCCTRL_USEREPOCH        = 35
//SP only - density consider parameter
public let XA_DCCTRL_CONSIDER         = 40
//GP only - residual computation method
public let XA_DCCTRL_GPRCM 			   = 40
//GP only - SGP4: correct B* vs X, SGP4-XP: correct B
public let XA_DCCTRL_CORRECTBVSX		= 41

public let XA_DCCTRL_SIZE             = 64

// Indexes of paramters using in IomodDC()
//Iomod/DC control mode (not yet used)
public let XA_IOMDC_MODE           =  0
//DC element type, see DCPROPTYPE_? for available options
public let XA_IOMDC_DCELTTYPE      =  1
//Epoch placement flag - see EPFLG_? for available options
public let XA_IOMDC_EPFLG          =  2
//Time of specified Epoch in Ds50UTC (only for XA_EGPCTRL_EPFLG = 2 or 4)
public let XA_IOMDC_NEWEPOCH       =  3
//Correction order
public let XA_IOMDC_ORDERCOR       =  4
//IOMOD obs selection mode: 0= auto select, 1= use first 3 obs in the provided list of obs (see OBSSELMODE_? for available options)
public let XA_IOMDC_OBSSELMODE     =  5
//residual computation selection
public let XA_IOMDC_RESIDSELECT    =  6
//correct by the specified correction order for 1 iteration only
public let XA_IOMDC_FOR1ITERONLY   =  7
//max # of iterations before declaring divergence
public let XA_IOMDC_MAXOFITERS     =  8
//apply weighed DC flag
public let XA_IOMDC_WEIGHTEDDC		=  9
//light time correction control
public let XA_IOMDC_LTC            = 10
//number of iteration to allow no auto rejection of residuals
public let XA_IOMDC_BRUCE          = 11
//flag; if set, deweight according to # of obs per track
public let XA_IOMDC_DWOBSPERTRCK   = 12
//partials method
public let XA_IOMDC_PARTIALMETH    = 13
//debias obs flag: 0= do not debias obs, 1= debias obs
public let XA_IOMDC_DEBIASOBS    	= 14
//use predicted RMS versus previous RMS for convergenece testing
public let XA_IOMDC_USEPREDRMS		= 15

//Element correction flag - Ag
public let XA_IOMDC_CORRECT_AG    	= 20
//Element correction flag - Af
public let XA_IOMDC_CORRECT_AF    	= 21
//Element correction flag - Psi
public let XA_IOMDC_CORRECT_PSI   	= 22
//Element correction flag - Chi
public let XA_IOMDC_CORRECT_CHI   	= 23
//Element correction flag - L
public let XA_IOMDC_CORRECT_L     	= 24
//Element correction flag - N
public let XA_IOMDC_CORRECT_N     	= 25
//Element correction flag - B* (SGP4) B (SP)
public let XA_IOMDC_CORRECT_B     	= 26
//Element correction flag - Agom (SP)
public let XA_IOMDC_CORRECT_AGOM  	= 27
//Convergence criteria on time (%) [5.0%]
public let XA_IOMDC_CNVCRITONT     = 30
//First pass delta-t rejection criteria Convergence criteria on time correction (min) [20 minutes]
public let XA_IOMDC_1STPASDELTAT   = 31
//Convergence criteria on 7-elt correction (%) [1.0%]
public let XA_IOMDC_CNVCRITON7ELT  = 32
//RMS multiplier [4.0]
public let XA_IOMDC_RMSMULT        = 33
//reset value for B term in subset correction [0.01]
public let XA_IOMDC_BRESET         = 34
//SP only - density consider parameter
public let XA_IOMDC_CONSIDER       = 40
//GP only - residual computation method
public let XA_IOMDC_GPRCM 			= 40
//GP only - SGP4: correct B* vs X, SGP4-XP: correct B
public let XA_IOMDC_CORRECTBVSX		= 41

//see IOMDC_METHOD_? for available options
public let XA_IOMDC_METHOD         = 50
// The below parameters only apply when XA_IOMDC_METHOD is set to 2 (use customized Gooding settings)
//number of half revolutions [0]
public let XA_IOMDC_NHREV          = 51
//solution number [0]
public let XA_IOMDC_IND            = 52
//maximum number of iterations [20]
public let XA_IOMDC_MAXIT          = 53
//the range guess to first observation (km) [36000]
public let XA_IOMDC_RNG1           = 54
//the range guess to third observation (km) [36000]
public let XA_IOMDC_RNG3           = 55
//partial derivative increment [1e-5]
public let XA_IOMDC_PDINC          = 56
//convergence criterion [1e-9]
public let XA_IOMDC_CONVCR         = 57

//IOMOD/DC parameter list size
public let XA_IOMDC_SIZE           = 64

// Different options for doing IOMOD/DC
//Default option which uses Herrick-Gibbs for all obs types
public let IOMDC_METHOD_HB      = 0
//Use Gooding (with default settings) for angle only type obs and Herrick-Gibbs for other obs types
public let IOMDC_METHOD_GDDEFLT = 1
//Use Gooding (with customized settings) for angle only type obs and Herrick-Gibbs for other obs types
public let IOMDC_METHOD_GDSPEC  = 2

// ========================= End of auto generated code ==========================
