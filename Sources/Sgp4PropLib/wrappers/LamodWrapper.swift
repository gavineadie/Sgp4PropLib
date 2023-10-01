// This wrapper file was generated automatically by the GenDllWrappers program.
import Foundation

#if os(Linux)
fileprivate let libHandle = loadDll("liblamod.so")
#elseif os(Windows)
fileprivate let libHandle = loadDll("Lamod.dll")
#else
fileprivate let libHandle = loadDll("liblamod.dylib")
#endif

// Notes: This function has been deprecated since v9.0. 
// Initializes Lamod dll for use in the program
// If this function returns an error, it is recommended that the users stop the program immediately. The error occurs if the users forget to load and initialize all the prerequisite DLLs, as listed in the DLL Prerequisite section, before using this DLL.
public func LamodInit( _ apAddr: Int64 ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64 ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "LamodInit"), to: FunctionSignature.self)

    return function(apAddr)
}

// Returns information about the current version of Lamod.dll. The information is placed in the string parameter you pass in
// The returned string provides information about the version number, build date, and the platform of the Lamod DLL. 
public func LamodGetInfo( _ infoStr: UnsafeMutablePointer<CChar> ) {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "LamodGetInfo"), to: FunctionSignature.self)

    function(infoStr)
}

// Loads Lamod-related parameters (1P/2P/3P cards, and Lamod parameter free format) from an input text file
// Returns zero indicating the file has been read successfully. Other values indicate an error.
public func LamodLoadFile( _ lamodInputFile: UnsafeMutablePointer<CChar> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "LamodLoadFile"), to: FunctionSignature.self)

    return function(lamodInputFile)
}

// Loads Lamod control parameters and all Lamod related data (environment, time, elsets, sensors) from an input text file
public func LamodLoadFileAll( _ lamodInputFile: UnsafeMutablePointer<CChar> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "LamodLoadFileAll"), to: FunctionSignature.self)

    return function(lamodInputFile)
}

// Loads a single Lamod-typed card
public func LamodLoadCard( _ card: UnsafeMutablePointer<CChar> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "LamodLoadCard"), to: FunctionSignature.self)

    return function(card)
}

// Saves any currently loaded Lamod-related settings to a file
// The purpose of this function is to save the current Lamod-related settings, usually used in GUI applications, for future use.
public func LamodSaveFile( _ lamodFile: UnsafeMutablePointer<CChar>,
                           _ saveMode: Int32,
                           _ saveForm: Int32 ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar>,
                                                   Int32,
                                                   Int32 ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "LamodSaveFile"), to: FunctionSignature.self)

    return function(lamodFile, saveMode, saveForm)
}

// Returns number of sensors/satellites entered via 1P/2P cards
// See LamodGetSenNums for example.
public func LamodGetNumOfSensSats( _ numSens: UnsafeMutablePointer<Int32>, _ numSats: UnsafeMutablePointer<Int32> ) {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Int32> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "LamodGetNumOfSensSats"), to: FunctionSignature.self)

    function(numSens, numSats)
}

// Retrieves all of the input sensor numbers that were entered via 1P-card  (column 38-44), 2P-card, or Lamod parameter free format (SENNO=)
public func LamodGetSenNums( _ senNums: UnsafeMutablePointer<Int32> ) {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<Int32> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "LamodGetSenNums"), to: FunctionSignature.self)

    function(senNums)
}

// Retrieves all of the input satellite numbers that were entered via 1P-card (column 40-62), 2P-card, or Lamod parameter free format (SATNO=)
// See LamodGetSenNums for example.
public func LamodGetSatNums( _ satNums: UnsafeMutablePointer<Int32> ) {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<Int32> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "LamodGetSatNums"), to: FunctionSignature.self)

    function(satNums)
}

// Builds and returns the Lamod parameter card (1P-Card) from the current Lamod settings
public func LamodGet1pCard( _ lamod1PCard: UnsafeMutablePointer<CChar> ) {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "LamodGet1pCard"), to: FunctionSignature.self)

    function(lamod1PCard)
}

// Retrieves all Lamod control parameters with a single function call
public func LamodGet1pAll( _ timeFlg: UnsafeMutablePointer<Int32>,
                           _ startTime: UnsafeMutablePointer<Double>,
                           _ stopTime: UnsafeMutablePointer<Double>,
                           _ interval: UnsafeMutablePointer<Double>,
                           _ prtOpt: UnsafeMutablePointer<Int32>,
                           _ punchObs: UnsafeMutablePointer<Int32>,
                           _ visFlg: UnsafeMutablePointer<Int32>,
                           _ stepMode: UnsafeMutablePointer<Int32>,
                           _ schedMode: UnsafeMutablePointer<CChar>,
                           _ diagMode: UnsafeMutablePointer<Int32>,
                           _ solAspAngle: UnsafeMutablePointer<Double> ) {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "LamodGet1pAll"), to: FunctionSignature.self)

    function(timeFlg, startTime, stopTime, interval, prtOpt, punchObs, visFlg, stepMode, schedMode, diagMode, solAspAngle)
}

// Sets all Lamod control parameters with a single function call
// The values of <i>visFlg</i> have been changed to match those of sensor limits. <i>VisFlg</i> = 9 now means using limits record value (from V5.4.2 and earlier versions, this used to be <i>visFlg</i> = 0).
// 
// There are cases when the program switches to step mode even though the users have requested culmination mode:
// <ul>
// <li>When the sensor is an orbiting sensor</li>
// <li>When the target satellite orbit has large period (&gt; 960 minutes)</li>
// <li>When the last pass's culmination time passes the requested stopTime (culmination time == 0 and setTime == 0)</li>
// <li>When a pass has multiple maximum elevations (culmination time == -1.0)</li>
// </ul>
public func LamodSet1pAll( _ timeFlg: Int32,
                           _ startTime: Double,
                           _ stopTime: Double,
                           _ interval: Double,
                           _ prtOpt: Int32,
                           _ punchObs: Int32,
                           _ visFlg: Int32,
                           _ stepMode: Int32,
                           _ schedMode: CChar,
                           _ diagMode: Int32,
                           _ solAspAngle: Double ) {

    typealias FunctionSignature = @convention(c) ( Int32,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   Int32,
                                                   Int32,
                                                   Int32,
                                                   Int32,
                                                   CChar,
                                                   Int32,
                                                   Double ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "LamodSet1pAll"), to: FunctionSignature.self)

    function(timeFlg, startTime, stopTime, interval, prtOpt, punchObs, visFlg, stepMode, schedMode, diagMode, solAspAngle)
}

// Retrieves the value of a specified Lamod control parameter (1P-card field) 
// <br>
// Remember to convert <i>valueStr</i> to the correct data type that it represents.
// <br>
// The table below shows the values for the xf_1P parameter:
// <table>
// <caption>table</caption>
// <tr>
// <td><b>Index</b></td>
// <td><b>Index Interpretation</b></td>
// </tr>
// <tr><td>1  </td><td> Input time format : 0: Minutes since epoch, 1: UTC</td></tr>
// <tr><td>2  </td><td> Begin time</td></tr>
// <tr><td>3  </td><td> End time</td></tr>
// <tr><td>4  </td><td> Ouput interval</td></tr>
// <tr><td>5  </td><td> Print options: 0: print look angles, 1: print look angle and initial conditions</td></tr>
// <tr><td>6  </td><td> Generate obs from look angles flag</td></tr>
// <tr><td>7  </td><td> Compute optical visibility flag: 0: use limits record value, 1: output optically visible passes only,
// 2: output pass only if solar aspect angle &lt; masx solar aspect angle</td></tr>
// <tr><td>8  </td><td> Step mode flag: 0: use culmination mode; 1: use step mode</td></tr>
// <tr><td>9  </td><td> Processing mode: 'O': obsched mode; 'P':P ASCHED mode</td></tr>
// <tr><td>10 </td><td> Diagnostic mode: 0: none, 1: print sensor/sat position at each look, 2: print pass by pass diagnostics,
// 3: both 1 and 2</td></tr>
// <tr><td>11 </td><td> Max solar aspect for optical sites</td></tr>   
// </table>	
public func LamodGet1pField( _ xf_1P: Int32, _ retVal: UnsafeMutablePointer<CChar> ) {

    typealias FunctionSignature = @convention(c) ( Int32,
                                                   UnsafeMutablePointer<CChar> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "LamodGet1pField"), to: FunctionSignature.self)

    function(xf_1P, retVal)
}

// Sets the value of a specified Lamod control parameter (1P-card field)
// See LamodGet1pField for description of the xf_1P parameter values.
public func LamodSet1pField( _ xf_1P: Int32, _ valueStr: UnsafeMutablePointer<CChar> ) {

    typealias FunctionSignature = @convention(c) ( Int32,
                                                   UnsafeMutablePointer<CChar> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "LamodSet1pField"), to: FunctionSignature.self)

    function(xf_1P, valueStr)
}

// Retrieves the concurrent viewing options read from the input 3P Parameter card
// The concurrent viewing implementation is used to be totally in the LamodDll.dll. Now, the Lamod library provides the users the capability to implement the concurrent viewing from their driver programs. There is no limit on the number of satellites/sensors being use in concurrent viewing in the new library.
public func LamodGet3pAll( _ concurrFlg: UnsafeMutablePointer<Int32>, _ concurrSens: UnsafeMutablePointer<Int32> ) {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Int32> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "LamodGet3pAll"), to: FunctionSignature.self)

    function(concurrFlg, concurrSens)
}

// Sets concurrent viewing options similar to what is entered in the input 3P Parameter card
// The concurrent viewing implementation is used to be totally in the LamodDll.dll. Now, the Lamod library provides the users the capability to implement the concurrent viewing from their driver programs. There is no limit on the number of satellites/sensors being use in concurrent viewing in the new library.
public func LamodSet3pAll( _ concurrFlg: Int32, _ concurrSens: UnsafeMutablePointer<Int32> ) {

    typealias FunctionSignature = @convention(c) ( Int32,
                                                   UnsafeMutablePointer<Int32> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "LamodSet3pAll"), to: FunctionSignature.self)

    function(concurrFlg, concurrSens)
}

// Returns the full file name of the output obs file that was specified using "OBSOUT = " in the main input file or using the LamodSetObsFileName() function call
// The users need to make sure they have turned on the flag to generate obs from look angles. Otherwise, this function will return an empty string to the obsFile.
public func LamodGetObsFileName( _ obsFile: UnsafeMutablePointer<CChar> ) {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "LamodGetObsFileName"), to: FunctionSignature.self)

    function(obsFile)
}

// Sets the full file name of the output obs file which will be used to store the generated obs data
// Another way to set the output obs file name is entering "OBSOUT = obsFileName" in the input file. 
// 
// The users need to make sure they have also turned on the flag to generate obs from look angles.
public func LamodSetObsFileName( _ obsFile: UnsafeMutablePointer<CChar> ) {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "LamodSetObsFileName"), to: FunctionSignature.self)

    function(obsFile)
}

// Checks to see whether the input satellite will ever be viewable to the input sensor
// This function is for the initial visibility check which screens out sensors that can't possibly acquire the satellite. Internally, the LamodInitSenSat() also calls this function to do the screening.
// 
// If the satellite is an EXTEPHEM (see External Ephemerides document), it will always pass this visibility check (assume the satellite is viewable to the sensor).
public func LamodSenSatVisible( _ senKey: Int64, _ satKey: Int64 ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   Int64 ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "LamodSenSatVisible"), to: FunctionSignature.self)

    return function(senKey, satKey)
}

// Initializes a sensor/satellite pair in preparation for computing look angles
// It's a good practice to initialize the satellite (SatState.SatStateInitSat) before calling this routine.
// 
// The users need to call this routine only once for each sensor/satellite pair they want to compute the look angles. The function however can be called again when the sensor and/or the satellite data is changed.
// 
// Internally, this function does the initial visibility check to see if the sensor can possibly acquire the satellite. However, if the satellite is an EXTEPHEM (see External Ephemerides document), it will always pass this visibility check (assume the satellite is viewable to the sensor).
public func LamodInitSenSat( _ senKey: Int64, _ satKey: Int64 ) -> Int64 {

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   Int64 ) -> Int64

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "LamodInitSenSat"), to: FunctionSignature.self)

    return function(senKey, satKey)
}

// Initializes a sensor/satellite pair in preparation for computing look angles using its own LAMOD parameters - suitable for multithread application
// This function is similar to LamodInitSenSat but allows the user to enter separate LAMOD parameters for each call which is suitable for multithread application
// It's a good practice to initialize the satellite (SatState.SatStateInitSat) before calling this routine.
// 
// The users need to call this routine only once for each sensor/satellite pair they want to compute the look angles. The function however can be called again when the sensor and/or the satellite data is changed.
// 
// Internally, this function does the initial visibility check to see if the sensor can possibly acquire the satellite. However, if the satellite is an EXTEPHEM (see External Ephemerides document), it will always pass this visibility check (assume the satellite is viewable to the sensor).
public func LamodInitSenSat_MT( _ xa_la_parms: UnsafeMutablePointer<Double>,
                                _ senKey: Int64,
                                _ satKey: Int64 ) -> Int64 {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<Double>,
                                                   Int64,
                                                   Int64 ) -> Int64

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "LamodInitSenSat_MT"), to: FunctionSignature.self)

    return function(xa_la_parms, senKey, satKey)
}

// Retrieves all of the data for an initialized sensor/satellite pair with a single function call
public func LamodGetSenSatDataAll( _ senSatKey: Int64,
                                   _ stepMode: UnsafeMutablePointer<Int32>,
                                   _ optVisFlg: UnsafeMutablePointer<Int32>,
                                   _ startDs50TAI: UnsafeMutablePointer<Double>,
                                   _ stopDs50TAI: UnsafeMutablePointer<Double>,
                                   _ interval: UnsafeMutablePointer<Double>,
                                   _ period: UnsafeMutablePointer<Double> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "LamodGetSenSatDataAll"), to: FunctionSignature.self)

    return function(senSatKey, stepMode, optVisFlg, startDs50TAI, stopDs50TAI, interval, period)
}

// Retrieves an individual field of data for an initialized sensor/satellite pair
// <br>
// Remember to convert <i>valueStr</i> to the correct data type that it represents.
// <br>
// The table below shows the values for the xf_SenSat parameter:
// <table>
// <caption>table</caption>
// <tr>
// <td><b>Index</b></td>
// <td><b>Index Interpretation</b></td>
// </tr>
// <tr><td> 1 </td><td> Step mode</td></tr>
// <tr><td> 2 </td><td> Optical visibility flag</td></tr>
// <tr><td> 3 </td><td> Begin time in ds50TAI</td></tr>
// <tr><td> 4 </td><td> End time in ds50TAI</td></tr>
// <tr><td> 5 </td><td> Print interval </td></tr>
// <tr><td> 6 </td><td> Satellite's period</td></tr>
// </table>
public func LamodGetSenSatDataField( _ senSatKey: Int64,
                                     _ xf_SenSat: Int32,
                                     _ retVal: UnsafeMutablePointer<CChar> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   Int32,
                                                   UnsafeMutablePointer<CChar> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "LamodGetSenSatDataField"), to: FunctionSignature.self)

    return function(senSatKey, xf_SenSat, retVal)
}

// Retrieves all data fields belonging to the sensor/satellite pair via its senSatKey and store them in the passing array xa_senSat
public func LamodSenSatDataToArray( _ senSatKey: Int64, _ xa_senSat: UnsafeMutablePointer<Double> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   UnsafeMutablePointer<Double> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "LamodSenSatDataToArray"), to: FunctionSignature.self)

    return function(senSatKey, xa_senSat)
}

// Returns the number of possible passes of the sensor/satellite pair in the requested time span which pass 
// the horizontal limit test. This function only applies when the culmination mode was selected
// This is an estimated number of passes. Each pass might not return any valid look angles due to the sensor limits settings.
public func LamodGetNumPasses( _ senSatKey: Int64 ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64 ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "LamodGetNumPasses"), to: FunctionSignature.self)

    return function(senSatKey)
}

// Returns an array of rise, culmination, and set times of all possible passes of a sensor/satellite pair during the requested time span
// See LamodGetNumPasses for example.
// If a possible culmination time of the last pass is after the requested stop time, only the rise time is returned. The culmination and set times are set to zeros. Since there is no culmination time in this case, the host program should switch to step mode to compute look angles.
// There are cases when multiple maximum elevations are detected in one pass. In these cases, the culmination times will be set to -1.0. The users need to check for this condition and switch to step mode.
// For external ephemeris files, if the provided ephemerides don't cover the requested time span, the possible rise and set times will not be available and will be set to -1.0.
// Note: For Fence/Fan typed sensors this function returns enter/penetration-cross/exit times in place of rise/culmination/set times
public func LamodGetRiseCulmSetTimes( _ senSatKey: Int64, _ rcsTimeArr: UnsafeMutablePointer<(Double, Double, Double)> ) -> Int32 {

    let _rcsTimeArr = UnsafeMutableRawPointer(rcsTimeArr).bindMemory(to: Double.self, capacity: 0)

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   UnsafeMutablePointer<Double> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "LamodGetRiseCulmSetTimes"), to: FunctionSignature.self)

    return function(senSatKey, _rcsTimeArr)
}

// Computes a single look angle of the sensor/satellite pair at the specified time
public func LamodComputeLookAngle( _ senSatKey: Int64,
                                   _ currDs50TAI: Double,
                                   _ lookCode: UnsafeMutablePointer<Int32>,
                                   _ xa_look: UnsafeMutablePointer<Double>,
                                   _ senElts: UnsafeMutablePointer<Double>,
                                   _ satElts: UnsafeMutablePointer<Double> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   Double,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "LamodComputeLookAngle"), to: FunctionSignature.self)

    return function(senSatKey, currDs50TAI, lookCode, xa_look, senElts, satElts)
}

// Computes at once look and view data of the sensor/satellite pair at the specified time
// <br>
// Note: This function is a thread safe alternative to LamodComputeLookAngle(), LamodGetOrbSenViewdata(), and LamodGetViewDataField()
public func LamodComputeLookView( _ senSatKey: Int64,
                                  _ currDs50TAI: Double,
                                  _ xa_lv: UnsafeMutablePointer<Double> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   Double,
                                                   UnsafeMutablePointer<Double> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "LamodComputeLookView"), to: FunctionSignature.self)

    return function(senSatKey, currDs50TAI, xa_lv)
}

// Finds exact time when satellite is IN or OUT of sensor's coverage
// <br>
// Note: The start and end times must have different look values (valid and invalid looks or vice versa)
public func LamodFindExactIOTime( _ senSatKey: Int64,
                                  _ t1Ds50TAI: Double,
                                  _ t2Ds50TAI: Double ) -> Double {

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   Double,
                                                   Double ) -> Double

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "LamodFindExactIOTime"), to: FunctionSignature.self)

    return function(senSatKey, t1Ds50TAI, t2Ds50TAI)
}

// Returns viewing and geometric data for orbiting sensors
// <br>
// Note: This function is not thread safe, please use LamodComputeLookView() instead   
public func LamodGetOrbSenViewdata( _ senSatKey: Int64,
                                    _ uvSun: UnsafeMutablePointer<Double>,
                                    _ uvMoon: UnsafeMutablePointer<Double>,
                                    _ xa_angle: UnsafeMutablePointer<Double>,
                                    _ nBore1: UnsafeMutablePointer<Int32>,
                                    _ nBore2: UnsafeMutablePointer<Int32>,
                                    _ xa_offBore: UnsafeMutablePointer<Double> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Double> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "LamodGetOrbSenViewdata"), to: FunctionSignature.self)

    return function(senSatKey, uvSun, uvMoon, xa_angle, nBore1, nBore2, xa_offBore)
}

// Retrieves a single field of look angle viewing data
// <br>
// See LamodCompRaDec for an example.
// <br>
// Note: This function is not thread safe, please use LamodComputeLookView() instead    
// <br>
// When the users pass the <i>retArray</i> to this function, make sure it has the proper size as shown in the <i>retArray</i> size column.
// <br>
// The <i>retArray</i> Arrangement column lists the order of the elements in the array. It is not necessarily the subscript of the element in the array since this is language-dependent. For example, in C/C++ the first element in every array is the zero-subscripted element.
// <br>
// The table below shows the values for the xf_View parameter:
// <table>
// <caption>table</caption>
// <tr>
// <td><b>Index</b></td>
// <td><b>Index Interpretation</b></td>
// </tr>
// <tr><td> 1 </td><td> computed U-vector to object</td></tr>
// <tr><td> 2 </td><td> range unit vector</td></tr>
// <tr><td> 3 </td><td> topocentric L unit vector</td></tr>
// <tr><td> 4 </td><td> station zenith vector</td></tr>
// <tr><td> 5 </td><td> computed range vector (km)</td></tr>
// <tr><td> 6 </td><td> computed range-rate vector/relative velocity vector (er/kem)</td></tr>
// <tr><td> 7 </td><td> vector to sun  (km)</td></tr>
// <tr><td> 8 </td><td> vector to moon (km)</td></tr>
// <tr><td> 9 </td><td> angle array (1:moon/sen/sat, 2:sun/earth/sat, 3:sun/earth/sen, 4:sun/sen/sat, 5:solar aspect
// angle)</td></tr>
// <tr><td>10 </td><td> illumination result</td></tr>
// <tr><td>11 </td><td> Relative velocity (km/sec)</td></tr>
// <tr><td>12 </td><td> sensor position EFG</td></tr>
// <tr><td>13 </td><td> limit check flags</td></tr>
// <tr><td>14 </td><td> azimuth and elevation rates (deg/sec)</td></tr>
// <tr><td>15 </td><td> moon angles (1:moon/earth/sat in deg, 2:moon/earth/sen in deg)</td></tr>
// </table>	
// <br>
// The table below shows the values for the limit check flags (xf_View = 13):
// <table>
// <caption>table</caption>
// <tr>
// <td><b>Index</b></td>
// <td><b>Index Interpretation</b></td>
// </tr>
// <tr><td>  0</td><td> az limits test flag</td></tr>
// <tr><td>  1</td><td> el limits test flag</td></tr>
// <tr><td>  2</td><td> earth in background flag</td></tr>
// <tr><td>  3</td><td> earth obstructed flag</td></tr>
// <tr><td>  4</td><td> lunar exclusion angle fl</td></tr>
// <tr><td>  5</td><td> max range test flag</td></tr>
// <tr><td>  6</td><td> min range test flag</td></tr>
// <tr><td>  7</td><td> penumb eclipse test flag</td></tr>
// <tr><td>  8</td><td> relative velocity test fl</td></tr>
// <tr><td>  9</td><td> solar aspect angle test</td></tr>
// <tr><td> 10</td><td> solar exclusion angle fl</td></tr>
// <tr><td> 11</td><td> umbral eclipse test flag</td></tr>
// </table>	
public func LamodGetViewDataField( _ senSatKey: Int64,
                                   _ xf_View: Int32,
                                   _ retVal: UnsafeMutablePointer<Double> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   Int32,
                                                   UnsafeMutablePointer<Double> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "LamodGetViewDataField"), to: FunctionSignature.self)

    return function(senSatKey, xf_View, retVal)
}

// Computes right-ascension and declination from the input sensor's range unit vector (also called local horizon vector)
// The users need to be careful when -1 &lt; decDeg &lt; 0 because they might easily display it incorrectly (missing the negative sign of its value).
public func LamodCompRaDec( _ xlPos: UnsafeMutablePointer<Double>,
                            _ rasc: UnsafeMutablePointer<Double>,
                            _ decl: UnsafeMutablePointer<Double>,
                            _ raHr: UnsafeMutablePointer<Int32>,
                            _ raMin: UnsafeMutablePointer<Int32>,
                            _ raSec: UnsafeMutablePointer<Double>,
                            _ decDeg: UnsafeMutablePointer<Int32>,
                            _ decMin: UnsafeMutablePointer<Int32>,
                            _ decSec: UnsafeMutablePointer<Double> ) {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "LamodCompRaDec"), to: FunctionSignature.self)

    function(xlPos, rasc, decl, raHr, raMin, raSec, decDeg, decMin, decSec)
}

// Retrieves the formatted observation strings, either in B3 or transmission format, generated from the most recent look angle data
// Note: This function is not thread safe, please use LamodGenObsAtTime() instead 
// The function returns one-line or two-line formatted obs string depending on the input <i>punchObs</i> and the sensor's observation type.  The users need to check the returned value of <i>numLines</i> to see what type of the output strings they are.
public func LamodGenObs( _ senSatKey: Int64,
                         _ punchObs: Int32,
                         _ obsClass: CChar,
                         _ obsLine1: UnsafeMutablePointer<CChar>,
                         _ obsLine2: UnsafeMutablePointer<CChar>,
                         _ numLines: UnsafeMutablePointer<Int32> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   Int32,
                                                   CChar,
                                                   UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<Int32> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "LamodGenObs"), to: FunctionSignature.self)

    return function(senSatKey, punchObs, obsClass, obsLine1, obsLine2, numLines)
}

// Generates formatted observation strings, either in B3 or transmission format, from a VALID look angle obtained at the requested time 
// Note: This is a thread-safe version of the LamodGenObs
public func LamodGenObsAtTime( _ senSatKey: Int64,
                               _ currDs50TAI: Double,
                               _ punchObs: Int32,
                               _ obsClass: CChar,
                               _ obsLine1: UnsafeMutablePointer<CChar>,
                               _ obsLine2: UnsafeMutablePointer<CChar>,
                               _ numLines: UnsafeMutablePointer<Int32> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   Double,
                                                   Int32,
                                                   CChar,
                                                   UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<Int32> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "LamodGenObsAtTime"), to: FunctionSignature.self)

    return function(senSatKey, currDs50TAI, punchObs, obsClass, obsLine1, obsLine2, numLines)
}

// Removes a sensor/satellite pair from Lamod.dll's set of loaded sensor/satellite pairs
public func LamodRemoveSenSat( _ senSatKey: Int64 ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64 ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "LamodRemoveSenSat"), to: FunctionSignature.self)

    return function(senSatKey)
}

// Removes all sensor/satellite pairs from Lamod.dll's set of sensor/satellite pairs
public func LamodRemoveAllSenSats(  ) -> Int32 {

    typealias FunctionSignature = @convention(c) (  ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "LamodRemoveAllSenSats"), to: FunctionSignature.self)

    return function()
}

// Resets all Lamod-related parameters back to their default values
// See LamodRemoveAllSenSats for example.
public func LamodReset(  ) {

    typealias FunctionSignature = @convention(c) (  ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "LamodReset"), to: FunctionSignature.self)

    function()
}

// Indexes of SenSatData fields
//Step mode flag: 0= use culmination mode, 1= use step mode, 2= use task mode
public let XF_SENSAT_STEPMODE     = 1
//Optical visibility flag (old name XF_SENSAT_VISPASSONLY)
public let XF_SENSAT_OPTVISFLAG   = 2
//Obsolete - should use new name XF_SENSAT_OPTVISFLAG instead
public let XF_SENSAT_VISPASSONLY  = 2
//Begin time in ds50TAI
public let XF_SENSAT_BEGDS50TAI   = 3
//End time in ds50TAI
public let XF_SENSAT_ENDDS50TAI   = 4
//Print interval
public let XF_SENSAT_INTERVAL     = 5
//Satellite's period
public let XF_SENSAT_PERIOD       = 6


//*******************************************************************************
// Indexes of lookCode
//Valid look
public let LOOK_VALID   = 0
//Failed horizon break test
public let LOOK_HTEST   = 1
//Failed limit tests
public let LOOK_SENLIMS = 2

//*******************************************************************************

// Indexes of look angle data output
//Look time in ds50UTC
public let XA_LOOK_DS50UTC = 0
//Look time in minutes since epoch
public let XA_LOOK_MSE    = 1
//Elevation (deg)
public let XA_LOOK_ELEV   = 2
//Azimuth (deg)
public let XA_LOOK_AZIM   = 3
//Range (km) or ? for optical sensor
public let XA_LOOK_RNG    = 4
//Range rate (km/sec) or ? for optical sensor
public let XA_LOOK_RNGRT  = 5
public let XA_LOOK_SIZE   = 6

//*******************************************************************************

// Indexes of viewing data output
//computed U-vector to object
public let XF_VIEW_UVEC      =  1
//range unit vector
public let XF_VIEW_RUVEC     =  2
//topocentric L unit vector
public let XF_VIEW_LVEC      =  3
//station zenith vector
public let XF_VIEW_ZVEC      =  4
//computed range vector (km)
public let XF_VIEW_RNGVEC    =  5
//computed range-rate vector/relative velocity vector (km/sec)
public let XF_VIEW_RRTVEC    =  6
//unit vector of sun
public let XF_VIEW_SUNVEC    =  7
//unit vector of moon
public let XF_VIEW_MOONVEC   =  8
//angle array (1:moon/sen/sat, 2:sun/earth/sat, 3:sun/earth/sen, 4:sun/sen/sat, 5:solar aspect angle)
public let XF_VIEW_ANGARR    =  9
//illumination result
public let XF_VIEW_CVIS      = 10
//Relative velocity (km/sec)
public let XF_VIEW_RELVEL    = 11
//sensor position EFG
public let XF_VIEW_SENEFG    = 12
//limit check flags
public let XF_VIEW_LIMFLGS   = 13
//azimuth and elevation rates (deg/sec)
public let XF_VIEW_AZELRATES = 14
//moon angles (1:moon/earth/sat in deg, 2:moon/earth/sen in deg)
public let XF_VIEW_MOONANGLES = 15


//*******************************************************************************

// Indexes of angle array
//moon/sen/sat angle (deg)
public let XA_ANGLE_MOONSENSAT  = 0
//sun/earth/sat angle (deg)
public let XA_ANGLE_SUNEARTHSAT = 1
//sun/earth/sen angle (deg)
public let XA_ANGLE_SUNEARTHSEN = 2
//sun/sen/sat angle (deg) - solar exclusion angle
public let XA_ANGLE_SUNSENSAT   = 3
//earth/sat/sun angle (deg) - solar aspect angle/solar phase angle
public let XA_ANGLE_SOLARASPECT = 4
public let XA_ANGLE_SIZE        = 5

// Indexes of moon angle array
// DHN 18Jan13 - Add moon/earth/sat, moon/earth/sen  angles
//moon/earth/sat angle (deg)
public let XA_ANGLE_MOONEARTHSAT = 0
//moon/earth/sen angle (deg)
public let XA_ANGLE_MOONEARTHSEN = 1


//*******************************************************************************

// Indexes of orbiting sensor's off-boresight/clock  array
//off-boresight angle 1
public let XA_OFFBORE_EL1 = 0
//off-boresight clock 1
public let XA_OFFBORE_AZ1 = 1
//off-boresight angle 2
public let XA_OFFBORE_EL2 = 2
//off-boresight clock 2
public let XA_OFFBORE_AZ2 = 3
public let XA_OFFBORE_SIZE = 4

//*******************************************************************************

// Indexes of LAMOD 1P-card data
//Input time format: 0=Minutes since epoch, 1=UTC
public let XF_1P_TIMEFRM = 1
//Begin time
public let XF_1P_BEGTIME = 2
//End time
public let XF_1P_ENDTIME = 3
//Ouput interval
public let XF_1P_INTERVAL = 4
//Print options: 0: print look angles, 1: print look angle and initial conditions
public let XF_1P_PRTOPT  = 5
//Generate obs from look angles flag
public let XF_1P_GENOBS  = 6
//Compute optical visibility flag: 0: use sen limits,  1: optically visible passes only, 2: output pass only if SAA less than max SAA
public let XF_1P_VISFLG  = 7
//Step mode flag: 0= use culmination mode, 1= use step mode, 2= use task mode
public let XF_1P_STEPMODE = 8
//Processing mode: 'O': obsched mode; 'P': P ASCHED mode
public let XF_1P_PROCMODE = 9
//Diagnostic mode: 0: none, 1: print sen/sat pos at each look, 2: print pass by pass diagnostics, 3: both 1 and 2
public let XF_1P_DIAGNOST = 10
//Max solar aspect for optical sites
public let XF_1P_MAXSAA   = 11

//*******************************************************************************

// Indexes of limit test flags in the returned array
//az limits test flag (0=failed, 1=passed)
public let XA_LIMFLG_AZLIM    =  0
//el limits test flag (0=failed, 1=passed)
public let XA_LIMFLG_ELLIM    =  1
//earth in background flag (0=failed, 1=passed)
public let XA_LIMFLG_EARTHBK  =  2
//earth obstructed flag (0=failed, 1=passed)
public let XA_LIMFLG_EARTHOB  =  3
//lunar exclusion angle flag (0=failed, 1=passed)
public let XA_LIMFLG_LUNEXCL  =  4
//max range test flag (0=failed, 1=passed)
public let XA_LIMFLG_MAXRANGE =  5
//min range test flag (0=failed, 1=passed)
public let XA_LIMFLG_MINRANGE =  6
//penumb eclipse test flag (0=failed, 1=passed)
public let XA_LIMFLG_PENECLIP =  7
//relative velocity test flag (0=failed, 1=passed)
public let XA_LIMFLG_RVELLIM  =  8
//solar aspect angle test flag (0=failed, 1=passed)
public let XA_LIMFLG_SAALIM   =  9
//solar exclusion angle flag (0=failed, 1=passed)
public let XA_LIMFLG_SOLEXCL  = 10
//umbral eclipse test flag (0=failed, 1=passed)
public let XA_LIMFLG_UMBECLIP = 11
public let XA_LIMFLG_SIZE     = 12


// Generate obs options
//Don't generate obs
public let GENOBS_NONE      =  0
//Generate B3 obs
public let GENOBS_B3        =  1
//Generate TYY obs
public let GENOBS_TTY       =  2
//Generate SP TASKER V obsType
public let GENOBS_SPTASKER  =  3
//Generate CSV obs
public let GENOBS_CSV       =  4


// indexes of look and view data in an array
//look code: 0=valid look; 1=Fail horizon break test; 2=Fail sensor's limit tests
public let XA_LV_LOOKCODE =   0
//time in ds50UTC when the look angle is computed
public let XA_LV_DS50UTC  =   1
//time mse when the look angle is computed
public let XA_LV_MSE      =   2
//elevation (deg)
public let XA_LV_ELEV     =   3
//azimuth (deg)
public let XA_LV_AZIM     =   4
//range (km)
public let XA_LV_RNG      =   5
//range rate (km/s)
public let XA_LV_RNGRT    =   6
//right ascension (deg)
public let XA_LV_RA       =   7
//declination (deg)
public let XA_LV_DEC      =   8
//azimuth rate (deg/s)
public let XA_LV_AZRATE   =   9
//elevation rate (deg/s)
public let XA_LV_ELRATE   =  10

//sensor ECI position (X) (km)
public let XA_LV_SENPOSX  =  11
//sensor ECI position (Y) (km)
public let XA_LV_SENPOSY  =  12
//sensor ECI position (Z) (km)
public let XA_LV_SENPOSZ  =  13
//sensor ECI velocity (X) (km/s)
public let XA_LV_SENVELX  =  14
//sensor ECI velocity (Y) (km/s)
public let XA_LV_SENVELY  =  15
//sensor ECI velocity (Z) (km/s)
public let XA_LV_SENVELZ  =  16
//sensor latitude (deg)
public let XA_LV_SENLAT   =  17
//sensor longitude (deg)
public let XA_LV_SENLON   =  18
//sensor height (km)
public let XA_LV_SENHEIGHT =  19

//satellite ECI position (X) (km)
public let XA_LV_SATPOSX  =  20
//satellite ECI position (Y) (km)
public let XA_LV_SATPOSY  =  21
//satellite ECI position (Z) (km)
public let XA_LV_SATPOSZ  =  22
//satellite ECI velocity (X) (km/s)
public let XA_LV_SATVELX  =  23
//satellite ECI velocity (Y) (km/s)
public let XA_LV_SATVELY  =  24
//satellite ECI velocity (Z) (km/s)
public let XA_LV_SATVELZ  =  25
//satellite latitude (deg)
public let XA_LV_SATLAT   =  26
//satellite longitude (deg)
public let XA_LV_SATLON   =  27
//satellite height (km)
public let XA_LV_SATHEIGHT =  28

//computed U-vector to object (X)
public let XA_LV_UVECX    =  31
//computed U-vector to object (Y)
public let XA_LV_UVECY    =  32
//computed U-vector to object (Z)
public let XA_LV_UVECZ    =  33
//slant range unit vector (X)- vector from the sensor to the satellite
public let XA_LV_RUVECX   =  34
//slant range unit vector (Y)- vector from the sensor to the satellite
public let XA_LV_RUVECY   =  35
//slant range unit vector (Z)- vector from the sensor to the satellite
public let XA_LV_RUVECZ   =  36
//station unit vector (X) - vector directed from the center of the earth to the sensor
public let XA_LV_LVECX    =  37
//station unit vector (Y) - vector directed from the center of the earth to the sensor
public let XA_LV_LVECY    =  38
//station unit vector (Z) - vector directed from the center of the earth to the sensor
public let XA_LV_LVECZ    =  39
//station zenith vector (X)
public let XA_LV_ZVECX    =  40
//station zenith vector (Y)
public let XA_LV_ZVECY    =  41
//station zenith vector (Z)
public let XA_LV_ZVECZ    =  42
//slant range vector (X) (km) - vector from the sensor to the satellite
public let XA_LV_RNGVECX  =  43
//slant range vector (Y) (km) - vector from the sensor to the satellite
public let XA_LV_RNGVECY  =  44
//slant range vector (Z) (km) - vector from the sensor to the satellite
public let XA_LV_RNGVECZ  =  45
//range-rate vector - relative velocity vector (X) (km/s)
public let XA_LV_RRTVECX  =  46
//range-rate vector - relative velocity vector (Y) (km/s)
public let XA_LV_RRTVECY  =  47
//range-rate vector - relative velocity vector (Z) (km/s)
public let XA_LV_RRTVECZ  =  48
//unit vector to sun (X)
public let XA_LV_USUNX    =  49
//unit vector to sun (Y)
public let XA_LV_USUNY    =  50
//unit vector to sun (Z)
public let XA_LV_USUNZ    =  51
//unit vector to moon (X)
public let XA_LV_UMOONX   =  52
//unit vector to moon (Y)
public let XA_LV_UMOONY   =  53
//unit vector to moon (Z)
public let XA_LV_UMOONZ   =  54
//moon/sensor/satellite angle (deg)
public let XA_LV_MOSESA   =  55
//moon/earth/satellite angle (deg)
public let XA_LV_MOEASA   =  56
//moon/earth/sensor angle (deg)
public let XA_LV_MOEASE   =  57
//sun/sensor/satellite angle (deg)
public let XA_LV_SUSESA   =  58
//sun/earth/satellite angle (deg)
public let XA_LV_SUEASA   =  59
//sun/earth/sensor angle (deg)
public let XA_LV_SUEASE   =  60
//solar aspect angle (deg)
public let XA_LV_SOLAA    =  61
//illumination result
public let XA_LV_VIS      =  62
//relative velocity (km/s)
public let XA_LV_RELVEL   =  63

//pass azimuth check (0=failed, 1=passed)
public let XA_LV_AZLIM    =  70
//pass elevation check (0=failed, 1=passed)
public let XA_LV_ELLIM    =  71
//pass earth in background check (0=failed, 1=passed)
public let XA_LV_EARTHBK  =  72
//pass earth obstruction check (0=failed, 1=passed)
public let XA_LV_EARTHOB  =  73
//pass lunar exclusion check (0=failed, 1=passed)
public let XA_LV_LUNEXCL  =  74
//pass maximum range check (0=failed, 1=passed)
public let XA_LV_MAXRANGE =  75
//pass minimum range check (0=failed, 1=passed)
public let XA_LV_MINRANGE =  76
//pass penum eclipse check (0=failed, 1=passed)
public let XA_LV_PENECLIP =  77
//pass relative velocity check (0=failed, 1=passed)
public let XA_LV_RVELLIM  =  78
//pass solar aspect angle check (0=failed, 1=passed)
public let XA_LV_SAALIM   =  79
//pass solar exclusion angle check (0=failed, 1=passed)
public let XA_LV_SOLEXCL  =  80
//pass umbral eclipse check (0=failed, 1=passed)
public let XA_LV_UMBECLIP =  81
//pass visibility check for optical sensor (0=failed, 1=passed)
public let XA_LV_OPTVIS   =  82

//orbiting sensor EFG position (X) (km)
public let XA_LV_SENPOSE  =  90
//orbiting sensor EFG position (Y) (km)
public let XA_LV_SENPOSF  =  91
//orbiting sensor EFG position (Z) (km)
public let XA_LV_SENPOSG  =  92
//orbiting sensor boresight vector #1 (1='D', 2='U', 3='B', 4='A', 5='R', 6='L', 7=no limits)
public let XA_LV_NBORE1   =  93
//orbiting sensor boresight vector #2 (1='D', 2='U', 3='B', 4='A', 5='R', 6='L', 7=no limits)
public let XA_LV_NBORE2   =  94
//orbiting sensor off boresight elevation #1 (deg)
public let XA_LV_OBEL1    =  95
//orbiting sensor off boresight azimuth #1 (deg)
public let XA_LV_OBAZ1    =  96
//orbiting sensor off boresight elevation #2 (deg)
public let XA_LV_OBAZ2    =  97
//orbiting sensor off boresight azimuth #2 (deg)
public let XA_LV_OBEL2    =  98

public let XA_LV_SIZE     = 128


// indexes of sensor/satellite data in an array
//Sensor number
public let XA_SENSAT_SENNUM     =  0
//Satellite number
public let XA_SENSAT_SATNUM     =  1
//Sensor view type
public let XA_SENSAT_VIEWTYPE   =  2
//Sensor observation type
public let XA_SENSAT_OBSTYPE    =  3
//Max number of points per pass
public let XA_SENSAT_PTSPERPAS  =  4
//Step mode flag: 0= use culmination mode, 1= use step mode, 2= use task mode
public let XA_SENSAT_STEPMODE   =  5
//Optical visibility flag (old name XA_SENSAT_VISPASSONLY)
public let XA_SENSAT_OPTVISFLAG =  6
//Obsolete - should use new name XA_SENSAT_OPTVISFLAG instead
public let XA_SENSAT_VISPASSONLY =  6
//Start time in ds50TAI
public let XA_SENSAT_STARTAI    =  7
//Stop time in ds50TAI
public let XA_SENSAT_STOPTAI    =  8
//Output interval (min)
public let XA_SENSAT_INTERVAL   =  9
//Satellite's period (min)
public let XA_SENSAT_PERIOD     = 10
//Sensor number
public let XA_SENSAT_SENKEY     = 11

public let XA_SENSAT_SIZE       = 32


// LAMOD control parameters in input array xa_la_parms that is used in LamodInitSenSat_MT()
//input format for begin and end times (0: minutes since epoch, 1: days since 1950 UTC)
public let XA_LA_PARMS_TIMEFLG     =  1
//begin time
public let XA_LA_PARMS_STARTTIME   =  2
//end time
public let XA_LA_PARMS_STOPTIME    =  3
//Step mode flag: 0= use culmination mode, 1= use step mode, 2= use task mode
public let XA_LA_PARMS_STEPMODE    =  4
//optical visibility flag:	0=Accept all passes, 1=Accept optically visual pass only, 2=Same as 1 w/ SAA restrictions, 3=For IR sensors, 9=Use limits record
public let XA_LA_PARMS_VISFLG      =  5
//max solar aspect angle (deg) for optical sites
public let XA_LA_PARMS_XMSAA       =  6

public let XA_LA_PARMS_SIZE        = 16


// ========================= End of auto generated code ==========================
