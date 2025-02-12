// This wrapper file was generated automatically by the GenDllWrappers program.
import Foundation

#if os(Linux)
fileprivate let libHandle = loadDll("libsensor.so")
#elseif os(Windows)
fileprivate let libHandle = loadDll("Sensor.dll")
#else
fileprivate let libHandle = loadDll("libsensor.dylib")
#endif

// Notes: This function has been deprecated since v9.0. 
// Initializes Sensor DLL for use in the program
// If this function returns an error, it is recommended that the users stop the program immediately. 
// The error occurs if the users forget to load and initialize all the prerequisite dlls, as listed 
// in the DLL Prerequisite section, before using this DLL.
public func SensorInit( _ apAddr: Int64 ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64 ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SensorInit"), to: FunctionSignature.self)

    return function(apAddr)
}

// Returns information about the current version of Sensor DLL. 
// The information is placed in the string parameter passed in.
// The returned string provides information about the version number, build date, and the platform of the Sensor DLL.
public func SensorGetInfo( _ infoStr: UnsafeMutablePointer<CChar> ) {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SensorGetInfo"), to: FunctionSignature.self)

    function(infoStr)
}

// Loads sensor data, contained in a text file, into the set of loaded sensors
// The users can use this function repeatedly to load sensor data from different input files. 
// However, only unique senKeys are stored in the binary tree.  New sensor data will overwrite the existing data. 
// 
// Sensor data can be included directly in the main input file or they can be read from a separate file 
// identified with "SENFIL=[pathname\filename]".
// 
// This function only reads sensor data from the main input file or the file identified with SENFIL in the input file. 
// It won't read anything else.
public func SensorLoadFile( _ senFile: UnsafeMutablePointer<CChar> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SensorLoadFile"), to: FunctionSignature.self)

    return function(senFile)
}

// Loads a single sensor-typed card
public func SensorLoadCard( _ card: UnsafeMutablePointer<CChar> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SensorLoadCard"), to: FunctionSignature.self)

    return function(card)
}

// Saves the currently loaded sensor data to a file
// If the users call this routine immediately after the SensorLoadFile(). 
// The sensor data contents in the two file should be the same (minus duplicated sensors or bad sensors).
// 
// The purpose of this function is to save the current state of the loaded sensors, usually used in GUI applications, for future use.
public func SensorSaveFile( _ sensorFile: UnsafeMutablePointer<CChar>,
                            _ saveMode: Int32,
                            _ saveForm: Int32 ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar>,
                                                   Int32,
                                                   Int32 ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SensorSaveFile"), to: FunctionSignature.self)

    return function(sensorFile, saveMode, saveForm)
}

// Removes a sensor, represented by the senKey, from the set of currently loaded sensors
// If the users enter an invalid senKey - a non-existing senKey, the function will return a non-zero value indicating an error.
public func SensorRemove( _ senKey: Int64 ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64 ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SensorRemove"), to: FunctionSignature.self)

    return function(senKey)
}

// Removes all currently loaded sensors from memory
// The function returns zero if all the loaded sensors are removed successfully from the SENSOR DLL's binary tree. Other values indicate an error.
public func SensorRemoveAll(  ) -> Int32 {

    typealias FunctionSignature = @convention(c) (  ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SensorRemoveAll"), to: FunctionSignature.self)

    return function()
}

// Returns the number of sensors currently loaded
// See SensorGetLoaded for example.
// This function is useful for dynamically allocating memory for the array that is passed to the function SensorGetLoaded().
public func SensorGetCount(  ) -> Int32 {

    typealias FunctionSignature = @convention(c) (  ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SensorGetCount"), to: FunctionSignature.self)

    return function()
}

// Retrieves all of the currently loaded senKeys. 
// These senKeys can be used to access the internal data for the sensors.
// It is recommended that SensorGetCount() is used to count how many sensors are currently loaded in the SENSOR DLL's binary tree. 
// The user can then use this number to dynamically allocate the senKeys array and pass it to this function. 
// 
// If the users prefer to pass a static array to the function, make sure it is big enough to store all the senKeys in memory.
public func SensorGetLoaded( _ order: Int32, _ senKeys: UnsafeMutablePointer<Int64> ) {

    typealias FunctionSignature = @convention(c) ( Int32,
                                                   UnsafeMutablePointer<Int64> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SensorGetLoaded"), to: FunctionSignature.self)

    function(order, senKeys)
}

// Retrieves sensor location data for a sensor
public func SensorGetLocAll( _ senKey: Int64,
                             _ astroLat: UnsafeMutablePointer<Double>,
                             _ astroLon: UnsafeMutablePointer<Double>,
                             _ senPos: UnsafeMutablePointer<Double>,
                             _ senDesc: UnsafeMutablePointer<CChar>,
                             _ orbSatNum: UnsafeMutablePointer<Int32>,
                             _ secClass: UnsafeMutablePointer<CChar> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<CChar> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SensorGetLocAll"), to: FunctionSignature.self)

    return function(senKey, astroLat, astroLon, senPos, senDesc, orbSatNum, secClass)
}

// Adds/updates sensor location data (non DMA) for a sensor using individually provided field values
// This function is shared between ground sensors and orbiting sensors. The users need to provide the proper data fields for each sensor type.
// 
// If the function is invoked with a senKey that already exists in the SENSOR DLL's binary tree, the senKey's associated data will be updated with the provided data.
// 
// If it is an orbiting sensor, the users need to provide the associated satellite number.
public func SensorSetLocAll( _ senKey: Int64,
                             _ astroLat: Double,
                             _ astroLon: Double,
                             _ senPos: UnsafeMutablePointer<Double>,
                             _ senDesc: UnsafeMutablePointer<CChar>,
                             _ orbSatNum: Int32,
                             _ secClass: CChar ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   Double,
                                                   Double,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<CChar>,
                                                   Int32,
                                                   CChar ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SensorSetLocAll"), to: FunctionSignature.self)

    return function(senKey, astroLat, astroLon, senPos, senDesc, orbSatNum, secClass)
}

// Retrieves the value of an individual field of sensor location data
// <br>
// Make sure to use the appropriate field index for ground sensors and orbiting sensors.
// <br>
// The table below shows the values for the xf_SenLoc parameter:
// <table>
// <caption>table</caption>
// <tr>
// <td><b>Index</b></td>
// <td><b>Index Interpretation</b></td>
// </tr>
// <tr><td>1</td><td>Sensor number</td></tr>
// <tr><td>2</td><td>Sensor astronomical latitude (deg)</td></tr>
// <tr><td>3</td><td>Sensor astronomical longitude (deg)</td></tr>
// <tr><td>4</td><td>Sensor position X (km)</td></tr>
// <tr><td>5</td><td>Sensor position Y (km)</td></tr>
// <tr><td>6</td><td>Sensor position Z (km)</td></tr>
// <tr><td>7</td><td>Sensor description</td></tr>
// <tr><td>8</td><td>Orbiting sensor's number (satNum)   </td></tr>
// <tr><td>9</td><td>Sensor classification </td></tr>   
// </table>   
public func SensorGetLocField( _ senKey: Int64,
                               _ xf_SenLoc: Int32,
                               _ strValue: UnsafeMutablePointer<CChar> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   Int32,
                                                   UnsafeMutablePointer<CChar> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SensorGetLocField"), to: FunctionSignature.self)

    return function(senKey, xf_SenLoc, strValue)
}

// Updates the value of an individual field of sensor location data
// See SensorGetLocField for a description of the xf_SenLoc values.
// The set value type was intentionally chosen as a character string because it allows the users to set value for different data types.
// 
// Make sure to use the appropriate field index for ground sensors and orbiting sensors.
public func SensorSetLocField( _ senKey: Int64,
                               _ xf_SenLoc: Int32,
                               _ strValue: UnsafeMutablePointer<CChar> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   Int32,
                                                   UnsafeMutablePointer<CChar> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SensorSetLocField"), to: FunctionSignature.self)

    return function(senKey, xf_SenLoc, strValue)
}

// Retrieves sensor limits data
// This function is shared between ground sensors and orbiting sensors. Make sure to interpret the data correctly.
public func SensorGet1L( _ senKey: Int64,
                         _ viewType: UnsafeMutablePointer<CChar>,
                         _ obsType: UnsafeMutablePointer<CChar>,
                         _ rngUnits: UnsafeMutablePointer<Int32>,
                         _ maxRngLim: UnsafeMutablePointer<Double>,
                         _ boresight1: UnsafeMutablePointer<CChar>,
                         _ elLim1: UnsafeMutablePointer<Double>,
                         _ elLim2: UnsafeMutablePointer<Double>,
                         _ azLim1: UnsafeMutablePointer<Double>,
                         _ azLim2: UnsafeMutablePointer<Double>,
                         _ interval: UnsafeMutablePointer<Double>,
                         _ visFlg: UnsafeMutablePointer<Int32>,
                         _ rngLimFlg: UnsafeMutablePointer<Int32>,
                         _ maxPPP: UnsafeMutablePointer<Int32>,
                         _ minRngLim: UnsafeMutablePointer<Double>,
                         _ plntryRes: UnsafeMutablePointer<Int32>,
                         _ rrLim: UnsafeMutablePointer<Double> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Double> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SensorGet1L"), to: FunctionSignature.self)

    return function(senKey, viewType, obsType, rngUnits, maxRngLim, boresight1, elLim1, elLim2, azLim1, azLim2, interval, visFlg, rngLimFlg, maxPPP, minRngLim, plntryRes, rrLim)
}

// Adds/updates sensor limits data (non DMA) via individually provided field values
// This function is shared between ground sensors and orbiting sensors. The users need to provide the proper data fields for each sensor type.
// 
// If the function is invoked with a senKey that already exists in the SENSOR DLL's binary tree, the senKey's associated data will be updated with the provided data.
// 
// If it is an orbiting sensor, the users need to provide the associated satellite number.
public func SensorSet1L( _ senKey: Int64,
                         _ viewType: CChar,
                         _ obsType: CChar,
                         _ rngUnits: Int32,
                         _ maxRngLim: Double,
                         _ boresight1: CChar,
                         _ elLim1: Double,
                         _ elLim2: Double,
                         _ azLim1: Double,
                         _ azLim2: Double,
                         _ interval: Double,
                         _ visFlg: Int32,
                         _ rngLimFlg: Int32,
                         _ maxPPP: Int32,
                         _ minRngLim: Double,
                         _ plntryRes: Int32,
                         _ rrLim: Double ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   CChar,
                                                   CChar,
                                                   Int32,
                                                   Double,
                                                   CChar,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   Int32,
                                                   Int32,
                                                   Int32,
                                                   Double,
                                                   Int32,
                                                   Double ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SensorSet1L"), to: FunctionSignature.self)

    return function(senKey, viewType, obsType, rngUnits, maxRngLim, boresight1, elLim1, elLim2, azLim1, azLim2, interval, visFlg, rngLimFlg, maxPPP, minRngLim, plntryRes, rrLim)
}

// Retrieves additional sensor limits data
// This function is shared between ground sensors and orbiting sensors. Make sure to interpret the data correctly.
public func SensorGet2L( _ senKey: Int64,
                         _ boresight2: UnsafeMutablePointer<CChar>,
                         _ elLim3: UnsafeMutablePointer<Double>,
                         _ elLim4: UnsafeMutablePointer<Double>,
                         _ azLim3: UnsafeMutablePointer<Double>,
                         _ azLim4: UnsafeMutablePointer<Double>,
                         _ earthBckgrnd: UnsafeMutablePointer<Int32>,
                         _ earthLimb: UnsafeMutablePointer<Double>,
                         _ solarXAngle: UnsafeMutablePointer<Double>,
                         _ lunarXAngle: UnsafeMutablePointer<Double>,
                         _ minIllum: UnsafeMutablePointer<Double>,
                         _ twilit: UnsafeMutablePointer<Double> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SensorGet2L"), to: FunctionSignature.self)

    return function(senKey, boresight2, elLim3, elLim4, azLim3, azLim4, earthBckgrnd, earthLimb, solarXAngle, lunarXAngle, minIllum, twilit)
}

// Adds/updates additional sensor limits data
// This function is shared between ground sensors and orbiting sensors. The users need to provide the proper data fields for each sensor type.
// 
// If the function is invoked with a senKey that already exists in the SENSOR DLL's binary tree, the senKey's associated data will be updated with the provided data.	
public func SensorSet2L( _ senKey: Int64,
                         _ boresight2: CChar,
                         _ elLim3: Double,
                         _ elLim4: Double,
                         _ azLim3: Double,
                         _ azLim4: Double,
                         _ earthBckgrnd: Int32,
                         _ earthLimb: Double,
                         _ solarXAngle: Double,
                         _ lunarXAngle: Double,
                         _ minIllum: Double,
                         _ twilit: Double ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   CChar,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   Int32,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   Double ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SensorSet2L"), to: FunctionSignature.self)

    return function(senKey, boresight2, elLim3, elLim4, azLim3, azLim4, earthBckgrnd, earthLimb, solarXAngle, lunarXAngle, minIllum, twilit)
}

// Retrieves an individual field of sensor limits data
// <br>
// Make sure to use the appropriate field index for ground sensors and orbiting sensors.
// <br>
// The table below shows the values for the xf_SenLim parameter:
// <table>
// <caption>table</caption>
// <tr>
// <td><b>Index</b></td>
// <td><b>Index Interpretation</b></td>
// </tr>
// <tr><td>11</td><td> Sensor view type</td></tr>
// <tr><td>12</td><td> Sensor observation type</td></tr>
// <tr><td>13</td><td> Unit on range/range rate</td></tr>
// <tr><td>14</td><td> Max observable range (km)</td></tr>
// <tr><td>15</td><td> Min observable range (km)</td></tr>
// <tr><td>16</td><td> Output interval (min)</td></tr>
// <tr><td>17</td><td> Visual pass control flag</td></tr>
// <tr><td>18</td><td> Range limit control flag </td></tr>
// <tr><td>19</td><td> Max number of points per pass</td></tr>
// <tr><td>20</td><td> Range rate/relative velocity limit (km/sec)</td></tr>
// <tr><td>31</td><td> Elevation limits (deg) 1, 2, 3, 4 or Sensor off-boresight angle (deg)</td></tr>
// <tr><td>32</td><td> </td></tr>
// <tr><td>33</td><td> </td></tr>
// <tr><td>34</td><td> </td></tr>
// <tr><td>35</td><td> Azimuth limits (deg) 1, 2,3, 4 or Sensor clock angle (deg)</td></tr>
// <tr><td>36</td><td> </td></tr>
// <tr><td>37</td><td> </td></tr>
// <tr><td>38</td><td> </td></tr>
// <tr><td>52</td><td> Orbiting sensor planetary restriction</td></tr>
// <tr><td>53</td><td> Orbiting sensor boresight vector 1</td></tr>
// <tr><td>54</td><td> Orbiting sensor boresight vector 2</td></tr>
// <tr><td>55</td><td> Allow orbiting sensor to view sat against earth background</td></tr>
// <tr><td>56</td><td> Orbiting sensor earth limb exclusion distance (km)</td></tr>
// <tr><td>57</td><td> Orbiting sensor solar exclusion angle (deg)   </td></tr>
// <tr><td>58</td><td> Orbiting sensor lunar exclusion angle (deg)</td></tr>
// <tr><td>59</td><td> Orbiting sensor min illumination angle (deg)</td></tr>
// <tr><td>60</td><td> Ground site twilight offset angle (deg)</td></tr>    
// </table>   
public func SensorGetLimField( _ senKey: Int64,
                               _ xf_SenLim: Int32,
                               _ strValue: UnsafeMutablePointer<CChar> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   Int32,
                                                   UnsafeMutablePointer<CChar> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SensorGetLimField"), to: FunctionSignature.self)

    return function(senKey, xf_SenLim, strValue)
}

// Updates an individual field of sensor limits data
// See SensorGetLimField for a description of the xf_SenLim parameter.
// The set value type was intentionally chosen as a character string because it allows the users to set value for different data types.
// 
// Make sure to use the appropriate field index for ground sensors and orbiting sensors.
public func SensorSetLimField( _ senKey: Int64,
                               _ xf_SenLim: Int32,
                               _ strValue: UnsafeMutablePointer<CChar> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   Int32,
                                                   UnsafeMutablePointer<CChar> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SensorSetLimField"), to: FunctionSignature.self)

    return function(senKey, xf_SenLim, strValue)
}

// Retrieves sensor sigma/bias data
public func SensorGetBS( _ senKey: Int64, _ xaf_senbs: UnsafeMutablePointer<Double> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   UnsafeMutablePointer<Double> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SensorGetBS"), to: FunctionSignature.self)

    return function(senKey, xaf_senbs)
}

// Adds/updates sensor sigma/bias data (non DMA)
public func SensorSetBS( _ senKey: Int64, _ xaf_senbs: UnsafeMutablePointer<Double> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   UnsafeMutablePointer<Double> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SensorSetBS"), to: FunctionSignature.self)

    return function(senKey, xaf_senbs)
}

// Retrieves an individual field of sensor sigma/bias data
public func SensorGetBSField( _ senKey: Int64,
                              _ xaf_senbs: Int32,
                              _ strValue: UnsafeMutablePointer<CChar> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   Int32,
                                                   UnsafeMutablePointer<CChar> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SensorGetBSField"), to: FunctionSignature.self)

    return function(senKey, xaf_senbs, strValue)
}

// Updates an individual field of sensor sigma/bias data
public func SensorSetBSField( _ senKey: Int64,
                              _ xaf_senbs: Int32,
                              _ strValue: UnsafeMutablePointer<CChar> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   Int32,
                                                   UnsafeMutablePointer<CChar> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SensorSetBSField"), to: FunctionSignature.self)

    return function(senKey, xaf_senbs, strValue)
}

// Retrieves the sensor data in form of S-Card, L1-Card, and L2-Card of the sensor
public func SensorGetLines( _ senKey: Int64,
                            _ sCard: UnsafeMutablePointer<CChar>,
                            _ l1Card: UnsafeMutablePointer<CChar>,
                            _ l2Card: UnsafeMutablePointer<CChar> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<CChar> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SensorGetLines"), to: FunctionSignature.self)

    return function(senKey, sCard, l1Card, l2Card)
}

// Gets sensor's orbiting satellite's satKey
public func SensorGetOrbSatKey( _ senKey: Int64, _ orbSatKey: UnsafeMutablePointer<Int64> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   UnsafeMutablePointer<Int64> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SensorGetOrbSatKey"), to: FunctionSignature.self)

    return function(senKey, orbSatKey)
}

// Sets sensor's orbiting satellite's satKey
public func SensorSetOrbSatKey( _ senKey: Int64, _ orbSatKey: Int64 ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   Int64 ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SensorSetOrbSatKey"), to: FunctionSignature.self)

    return function(senKey, orbSatKey)
}

// Loads Space Fence's detailed azimuth-elevation definition table
public func SensorLoadAzElTable( _ senKey: Int64, _ azElTableFile: UnsafeMutablePointer<CChar> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   UnsafeMutablePointer<CChar> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SensorLoadAzElTable"), to: FunctionSignature.self)

    return function(senKey, azElTableFile)
}

// Adds a new sensor segment whose limits defined by the input parameters - a cone or a dome portion 
public func SensorAddSegment( _ senKey: Int64,
                              _ segType: Int32,
                              _ xa_seg: UnsafeMutablePointer<Double> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   Int32,
                                                   UnsafeMutablePointer<Double> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SensorAddSegment"), to: FunctionSignature.self)

    return function(senKey, segType, xa_seg)
}

// Retrieves sensor segment data of the specified segment (segNum)
public func SensorGetSegment( _ senKey: Int64,
                              _ segNum: Int32,
                              _ segType: UnsafeMutablePointer<Int32>,
                              _ xa_seg: UnsafeMutablePointer<Double> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   Int32,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Double> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SensorGetSegment"), to: FunctionSignature.self)

    return function(senKey, segNum, segType, xa_seg)
}

// Sets sensor key mode
// This mode can also be turned on if the user loads an input text file that includes this line - "AS_DMA_SEN_ON" -
// and is currently calling any of these methods: DllMainLoadFile(), or SenLoadFile()
public func SetSenKeyMode( _ sen_keyMode: Int32 ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int32 ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SetSenKeyMode"), to: FunctionSignature.self)

    return function(sen_keyMode)
}

// Gets current sensor key mode
public func GetSenKeyMode(  ) -> Int32 {

    typealias FunctionSignature = @convention(c) (  ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "GetSenKeyMode"), to: FunctionSignature.self)

    return function()
}

// Returs the sensor number associated with the input senKey
public func SenNumOf( _ senKey: Int64 ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64 ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SenNumOf"), to: FunctionSignature.self)

    return function(senKey)
}

// Returns the first senKey from the currently loaded set of sensors that contains the specified sensor number.
// A negative value will be returned if there is an error.
public func SensorGetSenKey( _ senNum: Int32 ) -> Int64 {

    typealias FunctionSignature = @convention(c) ( Int32 ) -> Int64

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SensorGetSenKey"), to: FunctionSignature.self)

    return function(senNum)
}

// This function is similar to SensorGetSenKey but designed to be used in Matlab. 
// Matlab doesn't correctly return the 19-digit satellite key using SensorGetSenKey. This method is an alternative way to return the senKey output.
// A negative value will be returned in senKey if there is an error.
public func SensorGetSenKeyML( _ senNum: Int32, _ senKey: UnsafeMutablePointer<Int64> ) {

    typealias FunctionSignature = @convention(c) ( Int32,
                                                   UnsafeMutablePointer<Int64> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SensorGetSenKeyML"), to: FunctionSignature.self)

    function(senNum, senKey)
}

// Adds a sensor (location, limits, sigmas/biases), using its data stored in the input arrays.
public func SensorAddFrArray( _ xa_sen: UnsafeMutablePointer<Double>, _ xs_sen: UnsafeMutablePointer<CChar> ) -> Int64 {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<CChar> ) -> Int64

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SensorAddFrArray"), to: FunctionSignature.self)

    return function(xa_sen, xs_sen)
}

// Retrieves sensor data (location, limits, sigmas/biases) and stores it in the passing arrays.
public func SensorDataToArray( _ senKey: Int64,
                               _ xa_sen: UnsafeMutablePointer<Double>,
                               _ xs_sen: UnsafeMutablePointer<CChar> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<CChar> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SensorDataToArray"), to: FunctionSignature.self)

    return function(senKey, xa_sen, xs_sen)
}

// Sensor segment types
//bounded-cone-typed limit: Boresight Az/El, Min/Max halfcone angle/Range, minimum cut-off elevation
public let SEG_BCONE = 1
//dome-typed limit: Min/Max Az/El/Range
public let SEG_DOME  = 2



// Indexes of dome segment parameters
//start azimuth (deg)
public let XA_SEG_DOME_AZFR   =  0
//end azimuth (deg)
public let XA_SEG_DOME_AZTO   =  1
//lower-bound elevation (deg)
public let XA_SEG_DOME_ELFR   =  2
//higher-bound elevation (deg)
public let XA_SEG_DOME_ELTO   =  3
//minimum range (km)
public let XA_SEG_DOME_MINRNG =  4
//maximum range (km)
public let XA_SEG_DOME_MAXRNG =  5

public let XA_SEG_DOME_SIZE   = 16


// Indexes of bounded-cone segment parameters
//boresight azimuth (deg)
public let XA_SEG_BCONE_BSAZ   =  0
//boresight elevation (deg)
public let XA_SEG_BCONE_BSEL   =  1
//offboresight lower angle (deg)
public let XA_SEG_BCONE_ANGFR  =  2
//offboresight higher angle (deg)
public let XA_SEG_BCONE_ANGTO  =  3
//minimum range (km)
public let XA_SEG_BCONE_MINRNG =  4
//maximum range (km)
public let XA_SEG_BCONE_MAXRNG =  5
//minimum cut-off elevation (deg)
public let XA_SEG_BCONE_MINEL  =  6

public let XA_SEG_BCONE_SIZE   = 16


// Different key mode options for senKey
//Default - duplicate sensor can not be loaded in binary tree
public let SEN_KEYMODE_NODUP  = 0
//Allow duplicate obs to be loaded and have direct memory access (DMA - no duplication check and no binary tree)
public let SEN_KEYMODE_DMA    = 1

// sensor key possible errors
//Bad sensor key
public let BADSENKEY = -1
//Duplicate sensor key
public let DUPSENKEY =  0

// Different sensor types
//bounded-cone tracker
public let VT_BCT =   2
//conventional tracker
public let VT_CON =   3
//optical tracker
public let VT_OPT =   4
//constant azimuth fan sweeping vertical plane
public let VT_FAN =   7
//orbiting sensor (same as 'M' or 'O')
public let VT_ORB =   9
//space fence's field of regard FOR ('R' = 86)
public let VT_FOR  = 82
//space fence's surveillance fan FOV ('V' = 82)
public let VT_FOV  = 86

// Different sensor location types
//Sensor location is in ECR
public let SENLOC_TYPE_ECR =  1
//Sensor location is in EFG
public let SENLOC_TYPE_EFG =  2
//Sensor location is in LLH
public let SENLOC_TYPE_LLH =  3


// Sensor Data -
//*******************************************************************************
// generic data for all sensor types
//*******************************************************************************
//sensor number
public let XA_SEN_GEN_SENNUM    =  0
//sensor minimum range (km) (=0 no minimum range check)
public let XA_SEN_GEN_MINRNG    =  3
//sensor maxinmum range (km) (=0 no maximum range check)
public let XA_SEN_GEN_MAXRNG    =  4
//range rate/relative velocity limit (km/sec) (=0 no range rate check)
public let XA_SEN_GEN_RRLIM     =  5
//min/max range check (=0 apply min/max range limits, =1 accept all passes regardless of range)
public let XA_SEN_GEN_RNGLIMFLG =  6
//is special mobil sensor flag / column 9 in 1L card (=0 non mobile sensor, =1 mobile sensor)
public let XA_SEN_GEN_SMSEN     =  7


//*******************************************************************************

// sensor location - for all ground-based sensor types (non-orbiting)
//location type (see SENLOC_TYPE_? for available types)
public let XA_SEN_GRN_LOCTYPE   = 10
//sensor location ECR/EFG X component (km) or LLH/Lat (deg)
public let XA_SEN_GRN_POS1      = 11
//sensor location ECR/EFG Y component (km) or LLH/Lon (+: East/-: West) (deg)
public let XA_SEN_GRN_POS2      = 12
//sensor location ECR/EFG Z component (km) or LLH/Height (km)
public let XA_SEN_GRN_POS3      = 13
//astronomical latitude (deg) (+: North, -: South)
public let XA_SEN_GRN_ASTROLAT  = 14
//astronomical longitude (deg) (+: West, -: East)
public let XA_SEN_GRN_ASTROLON  = 15


//*******************************************************************************
// sensor limits - for LAMOD only (not needed by Rotas/BatchDC)
//*******************************************************************************
// Bounded cone tracker (conical sensor) (VT_BCT)
//conical sensor boresight azimuth angle (deg)
public let XA_SEN_BCT_BRSGHTAZ  = 20
//conical sensor boresight elevation angle (deg)
public let XA_SEN_BCT_BRSGHTEL  = 21
//coninal sensor off-boresight angle/half cone angle (deg)
public let XA_SEN_BCT_HALFANG   = 22
//conical sensor minimum elevation angle (deg)
public let XA_SEN_BCT_MINEL     = 23

//*******************************************************************************
// Conventinoal tracker (VT_CON)
//low elevation limit #1 (deg)
public let XA_SEN_CON_ELFR1     = 20
//hight elevation limit #1 (deg)
public let XA_SEN_CON_ELTO1     = 21
//low azimuth limit #1 (deg)
public let XA_SEN_CON_AZFR1     = 22
//hight azimuth limit #1 (deg)
public let XA_SEN_CON_AZTO1     = 23
//low elevation limit #2 (deg)
public let XA_SEN_CON_ELFR2     = 24
//hight elevation limit #2 (deg)
public let XA_SEN_CON_ELTO2     = 25
//low azimuth limit #2 (deg)
public let XA_SEN_CON_AZFR2     = 26
//hight azimuth limit #2 (deg)
public let XA_SEN_CON_AZTO2     = 27

//*******************************************************************************
// Optical tracker (VT_OPT)
//low elevation limit #1 (deg)
public let XA_SEN_OPT_ELFR1     = 20
//hight elevation limit #1 (deg)
public let XA_SEN_OPT_ELTO1     = 21
//low azimuth limit #1 (deg)
public let XA_SEN_OPT_AZFR1     = 22
//hight azimuth limit #1 (deg)
public let XA_SEN_OPT_AZTO1     = 23
//low elevation limit #2 (deg)
public let XA_SEN_OPT_ELFR2     = 24
//hight elevation limit #2 (deg)
public let XA_SEN_OPT_ELTO2     = 25
//low azimuth limit #2 (deg)
public let XA_SEN_OPT_AZFR2     = 26
//hight azimuth limit #2 (deg)
public let XA_SEN_OPT_AZTO2     = 27

//optical sensor solar exclusion angle (to check for solar aspect angle limit)
public let XA_SEN_OPT_SEA       = 40
//ground site twilight offset angle
public let XA_SEN_OPT_TWILGHT   = 41
//visual pass check (sensor in dark, satellite illuminated)
public let XA_SEN_OPT_VISCHK    = 42

//*******************************************************************************
// Constant azimuth fan (VT_FAN)
//fan's constant azimuth (deg) - fan sweeps a vertical plane  [0, 180)
public let XA_SEN_FAN_AZ        = 20
//fan's tilt angle (deg)  (-: North/West tilt, +: South/East tilt) [-90, 90]
public let XA_SEN_FAN_TILTANGLE = 21
//fan's off-boresight angle (deg) [0, 90]
public let XA_SEN_FAN_OBSANGLE  = 23


//*******************************************************************************
// Orbiting sensor (VT_ORB)
//orbiting sensor's satellite number
public let XA_SEN_ORB_SATNUM    = 10

//orbiting sensor's off-boresight angle - low elevation limit #1 (deg)
public let XA_SEN_ORB_ELMIN1    = 20
//orbiting sensor's off-boresight angle - hight elevation limit #1 (deg)
public let XA_SEN_ORB_ELMAX1    = 21
//orbiting sensor's off-boresight clock angle - low azimuth limit #1 (deg)
public let XA_SEN_ORB_AZMIN1    = 22
//orbiting sensor's off-boresight clock angle - hight azimuth limit #1 (deg)
public let XA_SEN_ORB_AZMAX1    = 23
//orbiting sensor's off-boresight angle - low elevation limit #2 (deg)
public let XA_SEN_ORB_ELMIN2    = 24
//orbiting sensor's off-boresight angle - hight elevation limit #2 (deg)
public let XA_SEN_ORB_ELMAX2    = 25
//orbiting sensor's off-boresight clock angle - low azimuth limit #2 (deg)
public let XA_SEN_ORB_AZMIN2    = 26
//orbiting sensor's off-boresight clock angle - hight azimuth limit #2 (deg)
public let XA_SEN_ORB_AZMAX2    = 27

//orbiting sensor earth limb exclusion distance (km)
public let XA_SEN_ORB_EARTHLIMB = 40
//orbiting sensor solar exclusion angle (deg)
public let XA_SEN_ORB_SEA       = 41
//orbiting sensor lunar exclusion angle (deg)
public let XA_SEN_ORB_LEA       = 42
//orbiting sensor minimum illumination angle (deg)
public let XA_SEN_ORB_MINILLUM  = 43
//orbiting sensor allow earth in the back ground
public let XA_SEN_ORB_EARTHBRND = 44
//orbiting sensor planetary restriction
public let XA_SEN_ORB_PLNTRYRES = 45

//*******************************************************************************

// Space fence Field Of Regard (VT_FOR)
// Sensor limits are defined in the az/el table file (using XS_SEN_FOR_AZFILE_255_256)


//*******************************************************************************

// Space fence Field Of View (VT_FOV)
//north/south beam width (deg)
public let XA_SEN_FOV_BEAMWIDTH = 20
//fence tilt angle (deg)
public let XA_SEN_FOV_TILTANGLE = 21


//*******************************************************************************

// Output control parameters (shouldn't be part of sensor data - just for backward compatibility)
//unit on range/range rate (0= km, km/sec; 1=nm, nm/sec)
public let XA_SEN_GEN_UNIT      = 90
//output interval (min)
public let XA_SEN_GEN_INTERVAL  = 91
//max number of points per pass
public let XA_SEN_GEN_PTSPERPAS = 92


// sensor sigmas/biases - ROTAS/BATCHDC
//azimuth sigma (deg)
public let XA_SEN_GEN_AZSIGMA =  110
//elevation sigma (deg)
public let XA_SEN_GEN_ELSIGMA =  111
//range sigma (km)
public let XA_SEN_GEN_RGSIGMA =  112
//range-rate sigma (km/sec)
public let XA_SEN_GEN_RRSIGMA =  113
//az rate sigma (deg/sec)
public let XA_SEN_GEN_ARSIGMA =  114
//el rate sigma (deg/sec)
public let XA_SEN_GEN_ERSIGMA =  115
//azimuth bias (deg)
public let XA_SEN_GEN_AZBIAS  =  116
//elevation bias (deg)
public let XA_SEN_GEN_ELBIAS  =  117
//range bias (km)
public let XA_SEN_GEN_RGBIAS  =  118
//range-rate bias (km/sec)
public let XA_SEN_GEN_RRBIAS  =  119
//time bias (sec)
public let XA_SEN_GEN_TIMEBIAS =  120


public let XA_SEN_SIZE          = 128

// Indexes of SENSOR text data in an array of chars
// The last two numbers in the field name are the zero-based starting character position and the number of characters in the text field
//sensor security classification (1-character length)
public let XS_SEN_SECCLASS_0_1      =   0
//sensor viewing type (1-character length)
public let XS_SEN_VIEWTYPE_1_1      =   1
//sensor observation type (1-character length)
public let XS_SEN_OBSTYPE_2_1       =   2
//sensor description/narrative/notes (24-character length)
public let XS_SEN_DSCRPTN_3_24      =   3
//orbiting sensor's boresight vector #1 (1-character length)
public let XS_SEN_ORB_BSVEC1_27_1   =  27
//orbiting sensor's boresight vector #2 (1-character length)
public let XS_SEN_ORB_BSVEC2_28_1   =  28
//for VT_FOR only, az/el table file path (256-character length)
public let XS_SEN_FOR_AZFILE_255_256 = 255

public let XS_SEN_LENGTH            = 512

// Indexes of Sensor data fields
//Sensor number
public let XF_SENLOC_NUM  = 1
//Sensor location - astronomical longitude (deg) (+=West/-=East)
public let XF_SENLOC_LAT  = 2
//Sensor location - astronomical latitude (deg)  (+=North/-=South)
public let XF_SENLOC_LON  = 3
//Sensor ECR position X (km)
public let XF_SENLOC_POSX = 4
//Sensor ECR position Y (km)
public let XF_SENLOC_POSY = 5
//Sensor ECR position Z (km)
public let XF_SENLOC_POSZ = 6
//Sensor description
public let XF_SENLOC_DESC = 7
//Orbiting sensor's number (satNum)
public let XF_SENLOC_ORBSATNUM = 8
//Sensor classification
public let XF_SENLOC_SECCLASS  = 9

//Sensor view type
public let XF_SENLIM_VIEWTYPE  = 11
//Sensor observation type
public let XF_SENLIM_OBSTYPE   = 12
//Unit on range/range rate
public let XF_SENLIM_UNIT      = 13
//Max observable range (km)
public let XF_SENLIM_MAXRNG    = 14
//Min observable range (km)
public let XF_SENLIM_MINRNG    = 15
//Output interval (min)
public let XF_SENLIM_INTERVAL  = 16
//Visual pass control flag
public let XF_SENLIM_OPTVISFLG = 17
//Range limit control flag
public let XF_SENLIM_RNGLIMFLG = 18
//Max number of points per pass
public let XF_SENLIM_PTSPERPAS = 19
//Range rate/relative velocity limit (km/sec)
public let XF_SENLIM_RRLIM     = 20

//Elevation limits #1 (low, deg) or orbiting sensor off-boresight angle (low, deg) or conical sensor boresight elvation (deg)
public let XF_SENLIM_ELLIM1    = 31
//Elevation limits #2 (high, deg) or orbiting sensor off-boresight angle (high, deg) or conical sensor boresight minimum angle (deg)
public let XF_SENLIM_ELLIM2    = 32
//Elevation limits #3 (low, deg) or orbiting sensor off-boresight angle (low, deg) or
public let XF_SENLIM_ELLIM3    = 33
//Elevation limits #4 (high, deg) or orbiting sensor off-boresight angle (high, deg)
public let XF_SENLIM_ELLIM4    = 34
//Azimuth limits #1 (low, deg) or orbiting sensor clock angle (from, deg) or conical sensor boresight azimuth (deg)
public let XF_SENLIM_AZLIM1    = 35
//Azimuth limits #2 (high, deg) or orbiting sensor clock angle (to, deg) or conical sensor off-boresight azimuth angle (deg)
public let XF_SENLIM_AZLIM2    = 36
//Azimuth limits #3 (low, deg) or orbiting sensor clock angle (from, deg)
public let XF_SENLIM_AZLIM3    = 37
//Azimuth limits #4 (high, deg) or orbiting sensor clock angle (to, deg)
public let XF_SENLIM_AZLIM4    = 38


//Orbiting sensor planetary restriction
public let XF_SENLIM_PLNTRYRES = 52
//Orbiting sensor boresight vector 1
public let XF_SENLIM_BOREVEC1  = 53
//Orbiting sensor boresight vector 2
public let XF_SENLIM_BOREVEC2  = 54
//Allow orbiting sensor to view sat against earth background
public let XF_SENLIM_KEARTH    = 55
//Orbiting sensor earth limb exclusion distance (km)
public let XF_SENLIM_ELIMB     = 56
//Orbiting sensor solar exclusion angle (deg)
public let XF_SENLIM_SOLEXCANG = 57
//Orbiting sensor lunar exclusion angle (deg)
public let XF_SENLIM_LUNEXCANG = 58


//Orbiting sensor min illumination angle (deg)
public let XF_SENLIM_MINIL     = 59
//Ground site twilight offset angle (deg)
public let XF_SENLIM_TWILIT    = 60
//Is special mobil sensor flag / column 9 in 1L card
public let XF_SENLIM_SMSEN     = 61
//Number of additional segments added to sensor limits
public let XF_SENLIM_NUMSEGS   = 62
//Space fence FOR's Az/El table file name
public let XF_SENLIM_FILE      = 63
//Number of rows in space fence FOR's Az/El table
public let XF_SENLIM_AZELROWS  = 64

//*******************************************************************************

// Indexes of sensor location data
//Sensor nubmer
public let XA_SENLOC_NUM     =  0
//Sensor location - astronomical latitude (deg)  (+=North/-=South)
public let XA_SENLOC_LAT     =  1
//Sensor location - astronomical longitude (deg) (+=West/-=East)
public let XA_SENLOC_LON     =  2
//Sensor ECR position X (km)
public let XA_SENLOC_POSX    =  3
//Sensor ECR position Y (km)
public let XA_SENLOC_POSY    =  4
//Sensor ECR position Z (km)
public let XA_SENLOC_POSZ    =  5

public let XA_SENLOC_SIZE    = 16

//*******************************************************************************

// Indexes of Sensor's sigmas & biases data fields
//azimuth sigma (deg)
public let XAF_SENBS_AZSIGMA =  0
//elevation sigma (deg)
public let XAF_SENBS_ELSIGMA =  1
//range sigma (km)
public let XAF_SENBS_RGSIGMA =  2
//range-rate sigma (km/sec)
public let XAF_SENBS_RRSIGMA =  3
//az rate sigma (deg/sec)
public let XAF_SENBS_ARSIGMA =  4
//el rate sigma (deg/sec)
public let XAF_SENBS_ERSIGMA =  5

//azimuth bias (deg)
public let XAF_SENBS_AZBIAS  =  8
//elevation bias (deg)
public let XAF_SENBS_ELBIAS  =  9
//range bias (km)
public let XAF_SENBS_RGBIAS  = 10
//range-rate bias (km/sec)
public let XAF_SENBS_RRBIAS  = 11
//time bias (sec)
public let XAF_SENBS_TIMEBIAS = 15

public let XAF_SENBS_SIZE    = 16

// Named constants for different obs types
//obs contains range rate only data
public let OT_RRATE          =  0
//obs contains azimuth, elevation data
public let OT_AZEL           =  1
//obs contains azimuth, elevation, and range data
public let OT_AZEL_RNG       =  2
//obs contains azimuth, elevation, range, and range rate data
public let OT_AZEL_RNGRRATE  =  3
//obs contains azimuth, elevation, range, range rate, azimuth rate, elevation rate, and range acceleration data
public let OT_AZEL_ALL       =  4
//obs contains right ascention and declination data
public let OT_RADEC          =  5
//obs contains range only data
public let OT_RNGONLY        =  6
//obs contains azimuth, elevation, and sensor location data
public let OT_AZEL_SENPOS    =  8
//obs contains right ascension, declination, and sensor location data
public let OT_RADEC_SENPOS   =  9
//obs contains ECI position and velocity data
public let OT_VEL            = 10
//obs contains ECI position data
public let OT_POS            = 11
//internal use only - new obs type for RA/Dec or Star to be used in FOV/targets
public let OT_STAR           = 12
//obs contains TDOA/FDOA data
public let OT_RF             = 13
//obs contains Satellite Laser Ranging (SLR) - range only, with tropospheric refraction term data
public let OT_SLR            = 16
//obs contains azimuth, elevation, sensor location, and range data
public let OT_M              = 18
//obs contains right ascension, declination, sensor location, and range data
public let OT_O              = 19
//obs contains range rate only data - for use in obs selection criteria
public let OT_RRATE_SELOB    = 999


// ========================= End of auto generated code ==========================
