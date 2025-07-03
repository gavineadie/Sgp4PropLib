// This wrapper file was generated automatically by the GenDllWrappers program.
import Foundation

#if os(Linux)
fileprivate let libHandle = loadDll("libtle.so")
#elseif os(Windows)
fileprivate let libHandle = loadDll("Tle.dll")
#else
fileprivate let libHandle = loadDll("libtle.dylib")
#endif

// Notes: This function has been deprecated since v9.0.    
// Initializes Tle DLL for use in the program.
// If this function returns an error, it is recommended that you stop the program immediately.
// 
// An error will occur if you forget to load and initialize all the prerequisite DLLs, as listed in the DLL Prerequisites section of the accompanying documentation, before using this DLL.
public func TleInit( _ apAddr: Int64 ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64 ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "TleInit"), to: FunctionSignature.self)

    return function(apAddr)
}

// Returns the information about the Tle DLL.
// The returned string provides information about the version number, build date, and the platform of the Tle DLL. 
public func TleGetInfo( _ infoStr: UnsafeMutablePointer<CChar> ) {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "TleGetInfo"), to: FunctionSignature.self)

    function(infoStr)
}

// Loads TLEs (satellites) contained in a text file into the TLE DLL's binary tree.
// You may use this function repeatedly to load TLEs from different input files. However, only unique satKeys are loaded. Duplicated TLEs won't be stored. 
// 
// TLEs can be included directly in the specified file, or they can be read from a separate file identified with "ELTFIL=[path\filename]" or "VECFIL=[path\filename]".
// 
// The input file is read in two passes. The function first looks for "ELTFIL=" and "VECFIL=" lines, then it looks for TLEs which were included directly. The result of this is that data entered using both methods will be processed, but the "ELTFIL=" and "VECFIL=" data will be processed first.
public func TleLoadFile( _ tleFile: UnsafeMutablePointer<CChar> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "TleLoadFile"), to: FunctionSignature.self)

    return function(tleFile)
}

// Saves currently loaded TLEs to a file. 
// In append mode, if the specified file does not exist it will be created.
// If you call this routine immediately after TleLoadFile(), the TLE contents in the two files should be the same (minus duplicated TLE's or bad TLE's).
// 
// The purpose of this function is to save the current state of the loaded TLE's, usually used in GUI applications, for future use.
public func TleSaveFile( _ tleFile: UnsafeMutablePointer<CChar>,
                         _ saveMode: Int32,
                         _ xf_tleForm: Int32 ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar>,
                                                   Int32,
                                                   Int32 ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "TleSaveFile"), to: FunctionSignature.self)

    return function(tleFile, saveMode, xf_tleForm)
}

// Removes a TLE represented by the satKey from memory. 
// If the users enter an invalid satKey (a non-existing satKey), the function will return a non-zero value indicating an error.
public func TleRemoveSat( _ satKey: Int64 ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64 ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "TleRemoveSat"), to: FunctionSignature.self)

    return function(satKey)
}

// Removes all the TLEs from memory.
public func TleRemoveAllSats(  ) -> Int32 {

    typealias FunctionSignature = @convention(c) (  ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "TleRemoveAllSats"), to: FunctionSignature.self)

    return function()
}

// Returns the number of TLEs currently loaded. 
// See TleGetLoaded for an example.
// This function is useful for dynamically allocating memory for the array that is passed to the function TleGetLoaded().
public func TleGetCount(  ) -> Int32 {

    typealias FunctionSignature = @convention(c) (  ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "TleGetCount"), to: FunctionSignature.self)

    return function()
}

// Retrieves all of the currently loaded satKeys. These satKeys can be used to access the internal data for the TLE's.
// It is recommended that TleGetCount() be  used to determine how many satellites are currently loaded. This value can then be used to dynamically allocate an array to hold the satKeys.
// 
// If you are going to pass a statically allocated array to this function, ensure it is large enough to hold all of the returned satKeys.
public func TleGetLoaded( _ order: Int32, _ satKeys: UnsafeMutablePointer<Int64> ) {

    typealias FunctionSignature = @convention(c) ( Int32,
                                                   UnsafeMutablePointer<Int64> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "TleGetLoaded"), to: FunctionSignature.self)

    function(order, satKeys)
}

// Adds a TLE (satellite), using its directly specified first and second lines. 
// The function will indicate an error if the specified two line element set corresponds to a satellite that is already in memory.
// 
// This function can be called repeatedly to add many TLEs, one at a time.
public func TleAddSatFrLines( _ line1: UnsafeMutablePointer<CChar>, _ line2: UnsafeMutablePointer<CChar> ) -> Int64 {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<CChar> ) -> Int64

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "TleAddSatFrLines"), to: FunctionSignature.self)

    return function(line1, line2)
}

// This function is similar to TleAddSatFrLines but designed to be used in Matlab.
// Matlab doesn't correctly return the 19-digit satellite key using TleAddSatFrLines. This method is an alternative way to return the satKey output.
public func TleAddSatFrLinesML( _ line1: UnsafeMutablePointer<CChar>,
                                _ line2: UnsafeMutablePointer<CChar>,
                                _ satKey: UnsafeMutablePointer<Int64> ) {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<Int64> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "TleAddSatFrLinesML"), to: FunctionSignature.self)

    function(line1, line2, satKey)
}

// Adds a TLE (satellite), using its CSV string format. 
public func TleAddSatFrCsv( _ csvLine: UnsafeMutablePointer<CChar> ) -> Int64 {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar> ) -> Int64

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "TleAddSatFrCsv"), to: FunctionSignature.self)

    return function(csvLine)
}

// This function is similar to TleAddSatFrCsv but designed to be used in Matlab.
public func TleAddSatFrCsvML( _ csvLine: UnsafeMutablePointer<CChar>, _ satKey: UnsafeMutablePointer<Int64> ) {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<Int64> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "TleAddSatFrCsvML"), to: FunctionSignature.self)

    function(csvLine, satKey)
}

// Adds a GP TLE using its individually provided field values. 
// The function will indicate an error if the specified two line element set corresponds to a satellite that is already in memory.
// 
// This function can be called repeatedly to add many satellites (one satellite at a time).
// 
// SGP satellites (ephType = 0) use Kozai mean motion. SGP4 satellites (ephType = 2) use Brouwer mean motion.
public func TleAddSatFrFieldsGP( _ satNum: Int32,
                                 _ secClass: CChar,
                                 _ satName: UnsafeMutablePointer<CChar>,
                                 _ epochYr: Int32,
                                 _ epochDays: Double,
                                 _ bstar: Double,
                                 _ ephType: Int32,
                                 _ elsetNum: Int32,
                                 _ incli: Double,
                                 _ node: Double,
                                 _ eccen: Double,
                                 _ omega: Double,
                                 _ mnAnomaly: Double,
                                 _ mnMotion: Double,
                                 _ revNum: Int32 ) -> Int64 {

    typealias FunctionSignature = @convention(c) ( Int32,
                                                   CChar,
                                                   UnsafeMutablePointer<CChar>,
                                                   Int32,
                                                   Double,
                                                   Double,
                                                   Int32,
                                                   Int32,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   Int32 ) -> Int64

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "TleAddSatFrFieldsGP"), to: FunctionSignature.self)

    return function(satNum, secClass, satName, epochYr, epochDays, bstar, ephType, elsetNum, incli, node, eccen, omega, mnAnomaly, mnMotion, revNum)
}

// This function is similar to TleAddSatFrFieldsGP but includes nDotO2 and n2DotO6. 
// nDotO2 and n2DotO6 values are not used in the SGP4 propagator. However, some users still want to preserve the integrity of all input data.
public func TleAddSatFrFieldsGP2( _ satNum: Int32,
                                  _ secClass: CChar,
                                  _ satName: UnsafeMutablePointer<CChar>,
                                  _ epochYr: Int32,
                                  _ epochDays: Double,
                                  _ bstar: Double,
                                  _ ephType: Int32,
                                  _ elsetNum: Int32,
                                  _ incli: Double,
                                  _ node: Double,
                                  _ eccen: Double,
                                  _ omega: Double,
                                  _ mnAnomaly: Double,
                                  _ mnMotion: Double,
                                  _ revNum: Int32,
                                  _ nDotO2: Double,
                                  _ n2DotO6: Double ) -> Int64 {

    typealias FunctionSignature = @convention(c) ( Int32,
                                                   CChar,
                                                   UnsafeMutablePointer<CChar>,
                                                   Int32,
                                                   Double,
                                                   Double,
                                                   Int32,
                                                   Int32,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   Int32,
                                                   Double,
                                                   Double ) -> Int64

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "TleAddSatFrFieldsGP2"), to: FunctionSignature.self)

    return function(satNum, secClass, satName, epochYr, epochDays, bstar, ephType, elsetNum, incli, node, eccen, omega, mnAnomaly, mnMotion, revNum, nDotO2, n2DotO6)
}

// This function is similar to TleAddSatFrFieldsGP2 but designed to be used in Matlab. 
// Matlab doesn't seem to correctly return the 19-digit satellite key using TleAddSatFrFieldsGP2. This method is an alternative way to return the satKey output.
public func TleAddSatFrFieldsGP2ML( _ satNum: Int32,
                                    _ secClass: CChar,
                                    _ satName: UnsafeMutablePointer<CChar>,
                                    _ epochYr: Int32,
                                    _ epochDays: Double,
                                    _ bstar: Double,
                                    _ ephType: Int32,
                                    _ elsetNum: Int32,
                                    _ incli: Double,
                                    _ node: Double,
                                    _ eccen: Double,
                                    _ omega: Double,
                                    _ mnAnomaly: Double,
                                    _ mnMotion: Double,
                                    _ revNum: Int32,
                                    _ nDotO2: Double,
                                    _ n2DotO6: Double,
                                    _ satKey: UnsafeMutablePointer<Int64> ) {

    typealias FunctionSignature = @convention(c) ( Int32,
                                                   CChar,
                                                   UnsafeMutablePointer<CChar>,
                                                   Int32,
                                                   Double,
                                                   Double,
                                                   Int32,
                                                   Int32,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   Int32,
                                                   Double,
                                                   Double,
                                                   UnsafeMutablePointer<Int64> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "TleAddSatFrFieldsGP2ML"), to: FunctionSignature.self)

    function(satNum, secClass, satName, epochYr, epochDays, bstar, ephType, elsetNum, incli, node, eccen, omega, mnAnomaly, mnMotion, revNum, nDotO2, n2DotO6, satKey)
}

// Updates a GP satellite's data in memory by providing its individual field values. Note: satNum, year, day, and ephtype can't be updated.
// The satellite's unique key will not be changed by this function. If you specify a satKey that does not correspond to a currently loaded satellite, the function will indicate an error.
// 
// Remember to use the correct mean motion depending on the satellite's ephType.
public func TleUpdateSatFrFieldsGP( _ satKey: Int64,
                                    _ secClass: CChar,
                                    _ satName: UnsafeMutablePointer<CChar>,
                                    _ bstar: Double,
                                    _ elsetNum: Int32,
                                    _ incli: Double,
                                    _ node: Double,
                                    _ eccen: Double,
                                    _ omega: Double,
                                    _ mnAnomaly: Double,
                                    _ mnMotion: Double,
                                    _ revNum: Int32 ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   CChar,
                                                   UnsafeMutablePointer<CChar>,
                                                   Double,
                                                   Int32,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   Int32 ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "TleUpdateSatFrFieldsGP"), to: FunctionSignature.self)

    return function(satKey, secClass, satName, bstar, elsetNum, incli, node, eccen, omega, mnAnomaly, mnMotion, revNum)
}

// This function is similar to TleUpdateSatFrFieldsGP but includes nDotO2 and n2DotO6. Note: satNum, year, day, and ephtype can't be updated.
// nDotO2 and n2DotO6 values are not used in the SGP4 propagator. However, some users still want to preserve the integrity of all input data.
public func TleUpdateSatFrFieldsGP2( _ satKey: Int64,
                                     _ secClass: CChar,
                                     _ satName: UnsafeMutablePointer<CChar>,
                                     _ bstar: Double,
                                     _ elsetNum: Int32,
                                     _ incli: Double,
                                     _ node: Double,
                                     _ eccen: Double,
                                     _ omega: Double,
                                     _ mnAnomaly: Double,
                                     _ mnMotion: Double,
                                     _ revNum: Int32,
                                     _ nDotO2: Double,
                                     _ n2DotO6: Double ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   CChar,
                                                   UnsafeMutablePointer<CChar>,
                                                   Double,
                                                   Int32,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   Int32,
                                                   Double,
                                                   Double ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "TleUpdateSatFrFieldsGP2"), to: FunctionSignature.self)

    return function(satKey, secClass, satName, bstar, elsetNum, incli, node, eccen, omega, mnAnomaly, mnMotion, revNum, nDotO2, n2DotO6)
}

// Adds an SP satellite using the individually provided field values.
// Only applies to SP propagator.
public func TleAddSatFrFieldsSP( _ satNum: Int32,
                                 _ secClass: CChar,
                                 _ satName: UnsafeMutablePointer<CChar>,
                                 _ epochYr: Int32,
                                 _ epochDays: Double,
                                 _ bTerm: Double,
                                 _ ogParm: Double,
                                 _ agom: Double,
                                 _ elsetNum: Int32,
                                 _ incli: Double,
                                 _ node: Double,
                                 _ eccen: Double,
                                 _ omega: Double,
                                 _ mnAnomaly: Double,
                                 _ mnMotion: Double,
                                 _ revNum: Int32 ) -> Int64 {

    typealias FunctionSignature = @convention(c) ( Int32,
                                                   CChar,
                                                   UnsafeMutablePointer<CChar>,
                                                   Int32,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   Int32,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   Int32 ) -> Int64

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "TleAddSatFrFieldsSP"), to: FunctionSignature.self)

    return function(satNum, secClass, satName, epochYr, epochDays, bTerm, ogParm, agom, elsetNum, incli, node, eccen, omega, mnAnomaly, mnMotion, revNum)
}

// This function is similar to TleAddSatFrFieldsSP but designed to be used in Matlab.
// Only applies to SP propagator.
// Matlab doesn't correctly return the 19-digit satellite key using TleAddSatFrFieldsSP. This method is an alternative way to return the satKey output.
public func TleAddSatFrFieldsSPML( _ satNum: Int32,
                                   _ secClass: CChar,
                                   _ satName: UnsafeMutablePointer<CChar>,
                                   _ epochYr: Int32,
                                   _ epochDays: Double,
                                   _ bTerm: Double,
                                   _ ogParm: Double,
                                   _ agom: Double,
                                   _ elsetNum: Int32,
                                   _ incli: Double,
                                   _ node: Double,
                                   _ eccen: Double,
                                   _ omega: Double,
                                   _ mnAnomaly: Double,
                                   _ mnMotion: Double,
                                   _ revNum: Int32,
                                   _ satKey: UnsafeMutablePointer<Int64> ) {

    typealias FunctionSignature = @convention(c) ( Int32,
                                                   CChar,
                                                   UnsafeMutablePointer<CChar>,
                                                   Int32,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   Int32,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   Int32,
                                                   UnsafeMutablePointer<Int64> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "TleAddSatFrFieldsSPML"), to: FunctionSignature.self)

    function(satNum, secClass, satName, epochYr, epochDays, bTerm, ogParm, agom, elsetNum, incli, node, eccen, omega, mnAnomaly, mnMotion, revNum, satKey)
}

// Updates an SP satellite's data in memory using its individually provided field values. Note: satNum, year, day, and ephtype can't be updated.
// Only applies to SP propagator.
// The satellite's unique key will not be changed by this function. If you specify a satKey that does not correspond to a currently loaded TLE, the function will indicate an error. 
public func TleUpdateSatFrFieldsSP( _ satKey: Int64,
                                    _ secClass: CChar,
                                    _ satName: UnsafeMutablePointer<CChar>,
                                    _ bterm: Double,
                                    _ ogParm: Double,
                                    _ agom: Double,
                                    _ elsetNum: Int32,
                                    _ incli: Double,
                                    _ node: Double,
                                    _ eccen: Double,
                                    _ omega: Double,
                                    _ mnAnomaly: Double,
                                    _ mnMotion: Double,
                                    _ revNum: Int32 ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   CChar,
                                                   UnsafeMutablePointer<CChar>,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   Int32,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   Int32 ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "TleUpdateSatFrFieldsSP"), to: FunctionSignature.self)

    return function(satKey, secClass, satName, bterm, ogParm, agom, elsetNum, incli, node, eccen, omega, mnAnomaly, mnMotion, revNum)
}

// Updates the value of a field of a TLE. This function can be used for both GP and SP satellites.
// <br>
// The table below indicates which index values correspond to which fields. Make sure to use the appropriate field index for GP TLEs and SP TLEs.  For indexes 5, 15 and 16, the interpretation depends on the ephemeris type of the TLE.
// satNum (1), Epoch (4), and Ephemeris Type (5) cannot be altered.
// <table>
// <caption>table</caption>
// <tr>
// 	<td>index</td>
// 	<td>index Interpretation</td>
// </tr>
// <tr><td>1</td><td>Satellite number</td></tr>
// <tr><td>2</td><td>Security classification</td></tr>
// <tr><td>3</td><td>Satellite international designator</td></tr>
// <tr><td>4</td><td>Epoch</td></tr>
// <tr><td>5</td><td>Ephemeris type = 0,2: B* drag term (1/er) <br>Ephemeris type = 6   : SP radiation pressure
// coefficient agom (m2/kg)</td></tr>
// <tr><td>6</td><td>Ephemeris type</td></tr>
// <tr><td>7</td><td>Element set number</td></tr>
// <tr><td>8</td><td>Orbit inclination (degrees)</td></tr>
// <tr><td>9</td><td>Right ascension of ascending node (degrees)</td></tr>
// <tr><td>10</td><td>Eccentricity</td></tr>
// <tr><td>11</td><td>Argument of perigee (degrees)</td></tr>
// <tr><td>12</td><td>Mean anomaly (degrees)</td></tr>
// <tr><td>13</td><td>Mean motion (rev/day)</td></tr>
// <tr><td>14</td><td>Revolution number at epoch</td></tr>
// <tr><td>15</td><td>Ephemeris type = 0: SGP mean motion derivative (rev/day /2) or <br>Ephemeris type = 6: SP
// ballistic coefficient (m2/kg)</td></tr>
// <tr><td>16</td><td>Ephemeris type = 0: SGP mean motion second derivative (rev/day**2 /6) or <br>Ephemeris type = 6:
// SP Outgassing parameter/Thrust Acceleration (km/s2)</td></tr>
// </table>
public func TleSetField( _ satKey: Int64,
                         _ xf_Tle: Int32,
                         _ valueStr: UnsafeMutablePointer<CChar> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   Int32,
                                                   UnsafeMutablePointer<CChar> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "TleSetField"), to: FunctionSignature.self)

    return function(satKey, xf_Tle, valueStr)
}

// Retrieves the value of a specific field of a TLE. 
// <br>
// The table below indicates which index values correspond to which fields. Make sure to use the appropriate field index for GP TLEs and SP TLEs.  For indexes 5, 15 and 16, the interpretation depends on the ephemeris type of the TLE.
// <table>
// <caption>table</caption>
// <tr>
// 	<td>index</td>
// 	<td>index Interpretation</td>
// </tr>
// <tr><td>1</td><td>Satellite number</td></tr>
// <tr><td>2</td><td>Security classification</td></tr>
// <tr><td>3</td><td>Satellite international designator</td></tr>
// <tr><td>4</td><td>Epoch</td></tr>
// <tr><td>5</td><td>Ephemeris type = 0,2: B* drag term (1/er) <br>Ephemeris type = 6   : SP radiation pressure
// coefficient agom (m2/kg)</td></tr>
// <tr><td>6</td><td>Ephemeris type</td></tr>
// <tr><td>7</td><td>Element set number</td></tr>
// <tr><td>8</td><td>Orbit inclination (degrees)</td></tr>
// <tr><td>9</td><td>Right ascension of ascending node (degrees)</td></tr>
// <tr><td>10</td><td>Eccentricity</td></tr>
// <tr><td>11</td><td>Argument of perigee (degrees)</td></tr>
// <tr><td>12</td><td>Mean anomaly (degrees)</td></tr>
// <tr><td>13</td><td>Mean motion (rev/day)</td></tr>
// <tr><td>14</td><td>Revolution number at epoch</td></tr>
// <tr><td>15</td><td>Ephemeris type = 0: SGP mean motion derivative (rev/day /2) or <br>Ephemeris type = 6: SP
// ballistic coefficient (m2/kg)</td></tr>
// <tr><td>16</td><td>Ephemeris type = 0: SGP mean motion second derivative (rev/day**2 /6) or <br>Ephemeris type = 6:
// SP Outgassing parameter/Thrust Acceleration (km/s2)</td></tr>
// </table>
public func TleGetField( _ satKey: Int64,
                         _ xf_Tle: Int32,
                         _ valueStr: UnsafeMutablePointer<CChar> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   Int32,
                                                   UnsafeMutablePointer<CChar> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "TleGetField"), to: FunctionSignature.self)

    return function(satKey, xf_Tle, valueStr)
}

// Retrieves all of the data for a GP satellite in a single function call. 
// This function only works for GP satellites. The field values are placed in the corresponding parameters of the function. 
public func TleGetAllFieldsGP( _ satKey: Int64,
                               _ satNum: UnsafeMutablePointer<Int32>,
                               _ secClass: UnsafeMutablePointer<CChar>,
                               _ satName: UnsafeMutablePointer<CChar>,
                               _ epochYr: UnsafeMutablePointer<Int32>,
                               _ epochDays: UnsafeMutablePointer<Double>,
                               _ bstar: UnsafeMutablePointer<Double>,
                               _ ephType: UnsafeMutablePointer<Int32>,
                               _ elsetNum: UnsafeMutablePointer<Int32>,
                               _ incli: UnsafeMutablePointer<Double>,
                               _ node: UnsafeMutablePointer<Double>,
                               _ eccen: UnsafeMutablePointer<Double>,
                               _ omega: UnsafeMutablePointer<Double>,
                               _ mnAnomaly: UnsafeMutablePointer<Double>,
                               _ mnMotion: UnsafeMutablePointer<Double>,
                               _ revNum: UnsafeMutablePointer<Int32> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Int32> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "TleGetAllFieldsGP"), to: FunctionSignature.self)

    return function(satKey, satNum, secClass, satName, epochYr, epochDays, bstar, ephType, elsetNum, incli, node, eccen, omega, mnAnomaly, mnMotion, revNum)
}

// Retrieves all of the data (including nDotO2 and n2DotO6) for a GP satellite in a single function call. 
// This function is similar to TleGetAllFieldsGP but also includes nDotO2 and n2DotO6. 
// This function only works for GP satellites. The field values are placed in the corresponding parameters of the function. 
public func TleGetAllFieldsGP2( _ satKey: Int64,
                                _ satNum: UnsafeMutablePointer<Int32>,
                                _ secClass: UnsafeMutablePointer<CChar>,
                                _ satName: UnsafeMutablePointer<CChar>,
                                _ epochYr: UnsafeMutablePointer<Int32>,
                                _ epochDays: UnsafeMutablePointer<Double>,
                                _ bstar: UnsafeMutablePointer<Double>,
                                _ ephType: UnsafeMutablePointer<Int32>,
                                _ elsetNum: UnsafeMutablePointer<Int32>,
                                _ incli: UnsafeMutablePointer<Double>,
                                _ node: UnsafeMutablePointer<Double>,
                                _ eccen: UnsafeMutablePointer<Double>,
                                _ omega: UnsafeMutablePointer<Double>,
                                _ mnAnomaly: UnsafeMutablePointer<Double>,
                                _ mnMotion: UnsafeMutablePointer<Double>,
                                _ revNum: UnsafeMutablePointer<Int32>,
                                _ nDotO2: UnsafeMutablePointer<Double>,
                                _ n2DotO6: UnsafeMutablePointer<Double> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "TleGetAllFieldsGP2"), to: FunctionSignature.self)

    return function(satKey, satNum, secClass, satName, epochYr, epochDays, bstar, ephType, elsetNum, incli, node, eccen, omega, mnAnomaly, mnMotion, revNum, nDotO2, n2DotO6)
}

// Retrieves all of the data for an SP satellite in a single function call.
// Only applies to SP propagator.
// This function only works for SP satellites. The field values are placed in the corresponding parameters of the function. 
public func TleGetAllFieldsSP( _ satKey: Int64,
                               _ satNum: UnsafeMutablePointer<Int32>,
                               _ secClass: UnsafeMutablePointer<CChar>,
                               _ satName: UnsafeMutablePointer<CChar>,
                               _ epochYr: UnsafeMutablePointer<Int32>,
                               _ epochDays: UnsafeMutablePointer<Double>,
                               _ bTerm: UnsafeMutablePointer<Double>,
                               _ ogParm: UnsafeMutablePointer<Double>,
                               _ agom: UnsafeMutablePointer<Double>,
                               _ elsetNum: UnsafeMutablePointer<Int32>,
                               _ incli: UnsafeMutablePointer<Double>,
                               _ node: UnsafeMutablePointer<Double>,
                               _ eccen: UnsafeMutablePointer<Double>,
                               _ omega: UnsafeMutablePointer<Double>,
                               _ mnAnomaly: UnsafeMutablePointer<Double>,
                               _ mnMotion: UnsafeMutablePointer<Double>,
                               _ revNum: UnsafeMutablePointer<Int32> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Int32> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "TleGetAllFieldsSP"), to: FunctionSignature.self)

    return function(satKey, satNum, secClass, satName, epochYr, epochDays, bTerm, ogParm, agom, elsetNum, incli, node, eccen, omega, mnAnomaly, mnMotion, revNum)
}

// Parses GP data from the input first and second lines of a two line element set or a CSV Tle.
// This function only parses data from the input TLE but DOES NOT load/add the input TLE to memory.
public func TleParseGP( _ line1: UnsafeMutablePointer<CChar>,
                        _ line2: UnsafeMutablePointer<CChar>,
                        _ satNum: UnsafeMutablePointer<Int32>,
                        _ secClass: UnsafeMutablePointer<CChar>,
                        _ satName: UnsafeMutablePointer<CChar>,
                        _ epochYr: UnsafeMutablePointer<Int32>,
                        _ epochDays: UnsafeMutablePointer<Double>,
                        _ nDotO2: UnsafeMutablePointer<Double>,
                        _ n2DotO6: UnsafeMutablePointer<Double>,
                        _ bstar: UnsafeMutablePointer<Double>,
                        _ ephType: UnsafeMutablePointer<Int32>,
                        _ elsetNum: UnsafeMutablePointer<Int32>,
                        _ incli: UnsafeMutablePointer<Double>,
                        _ node: UnsafeMutablePointer<Double>,
                        _ eccen: UnsafeMutablePointer<Double>,
                        _ omega: UnsafeMutablePointer<Double>,
                        _ mnAnomaly: UnsafeMutablePointer<Double>,
                        _ mnMotion: UnsafeMutablePointer<Double>,
                        _ revNum: UnsafeMutablePointer<Int32> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Int32> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "TleParseGP"), to: FunctionSignature.self)

    return function(line1, line2, satNum, secClass, satName, epochYr, epochDays, nDotO2, n2DotO6, bstar, ephType, elsetNum, incli, node, eccen, omega, mnAnomaly, mnMotion, revNum)
}

// Parses GP data from the input first and second lines of a two line element set or a CSV tle and store that data back into the output parameters.
// This function only parses data from the input TLE but DOES NOT load/add the input TLE to memory.
public func TleLinesToArray( _ line1: UnsafeMutablePointer<CChar>,
                             _ line2: UnsafeMutablePointer<CChar>,
                             _ xa_tle: UnsafeMutablePointer<Double>,
                             _ xs_tle: UnsafeMutablePointer<CChar> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<CChar> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "TleLinesToArray"), to: FunctionSignature.self)

    return function(line1, line2, xa_tle, xs_tle)
}

// Parses SP data from the input first and second lines of a two line element set.
// Only applies to SP propagator.
// This function only parses data from the input TLE but DOES NOT load/add the input TLE to memory.
public func TleParseSP( _ line1: UnsafeMutablePointer<CChar>,
                        _ line2: UnsafeMutablePointer<CChar>,
                        _ satNum: UnsafeMutablePointer<Int32>,
                        _ secClass: UnsafeMutablePointer<CChar>,
                        _ satName: UnsafeMutablePointer<CChar>,
                        _ epochYr: UnsafeMutablePointer<Int32>,
                        _ epochDays: UnsafeMutablePointer<Double>,
                        _ bTerm: UnsafeMutablePointer<Double>,
                        _ ogParm: UnsafeMutablePointer<Double>,
                        _ agom: UnsafeMutablePointer<Double>,
                        _ elsetNum: UnsafeMutablePointer<Int32>,
                        _ incli: UnsafeMutablePointer<Double>,
                        _ node: UnsafeMutablePointer<Double>,
                        _ eccen: UnsafeMutablePointer<Double>,
                        _ omega: UnsafeMutablePointer<Double>,
                        _ mnAnomaly: UnsafeMutablePointer<Double>,
                        _ mnMotion: UnsafeMutablePointer<Double>,
                        _ revNum: UnsafeMutablePointer<Int32> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Int32> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "TleParseSP"), to: FunctionSignature.self)

    return function(line1, line2, satNum, secClass, satName, epochYr, epochDays, bTerm, ogParm, agom, elsetNum, incli, node, eccen, omega, mnAnomaly, mnMotion, revNum)
}

// Returns the first and second lines representation of a TLE of a satellite. 
public func TleGetLines( _ satKey: Int64,
                         _ line1: UnsafeMutablePointer<CChar>,
                         _ line2: UnsafeMutablePointer<CChar> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<CChar> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "TleGetLines"), to: FunctionSignature.self)

    return function(satKey, line1, line2)
}

// Returns the CSV string representation of a TLE of a satellite. 
public func TleGetCsv( _ satKey: Int64, _ csvLine: UnsafeMutablePointer<CChar> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   UnsafeMutablePointer<CChar> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "TleGetCsv"), to: FunctionSignature.self)

    return function(satKey, csvLine)
}

// Constructs a TLE from individually provided GP data fields.
// This function only parses data from the input fields but DOES NOT load/add the TLE to memory.
// Returned line1 and line2 will be empty if the function fails to construct the lines as requested.
public func TleGPFieldsToLines( _ satNum: Int32,
                                _ secClass: CChar,
                                _ satName: UnsafeMutablePointer<CChar>,
                                _ epochYr: Int32,
                                _ epochDays: Double,
                                _ nDotO2: Double,
                                _ n2DotO6: Double,
                                _ bstar: Double,
                                _ ephType: Int32,
                                _ elsetNum: Int32,
                                _ incli: Double,
                                _ node: Double,
                                _ eccen: Double,
                                _ omega: Double,
                                _ mnAnomaly: Double,
                                _ mnMotion: Double,
                                _ revNum: Int32,
                                _ line1: UnsafeMutablePointer<CChar>,
                                _ line2: UnsafeMutablePointer<CChar> ) {

    typealias FunctionSignature = @convention(c) ( Int32,
                                                   CChar,
                                                   UnsafeMutablePointer<CChar>,
                                                   Int32,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   Int32,
                                                   Int32,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   Int32,
                                                   UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<CChar> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "TleGPFieldsToLines"), to: FunctionSignature.self)

    function(satNum, secClass, satName, epochYr, epochDays, nDotO2, n2DotO6, bstar, ephType, elsetNum, incli, node, eccen, omega, mnAnomaly, mnMotion, revNum, line1, line2)
}

// Constructs a TLE from individually provided GP data fields.
// This function only parses data from the input fields but DOES NOT load/add the TLE to memory.
// Returned line1 and line2 will be empty if the function fails to construct the lines as requested.
public func TleGPFieldsToCsv( _ satNum: Int32,
                              _ secClass: CChar,
                              _ satName: UnsafeMutablePointer<CChar>,
                              _ epochYr: Int32,
                              _ epochDays: Double,
                              _ nDotO2: Double,
                              _ n2DotO6: Double,
                              _ bstar: Double,
                              _ ephType: Int32,
                              _ elsetNum: Int32,
                              _ incli: Double,
                              _ node: Double,
                              _ eccen: Double,
                              _ omega: Double,
                              _ mnAnomaly: Double,
                              _ mnMotion: Double,
                              _ revNum: Int32,
                              _ csvLine: UnsafeMutablePointer<CChar> ) {

    typealias FunctionSignature = @convention(c) ( Int32,
                                                   CChar,
                                                   UnsafeMutablePointer<CChar>,
                                                   Int32,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   Int32,
                                                   Int32,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   Int32,
                                                   UnsafeMutablePointer<CChar> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "TleGPFieldsToCsv"), to: FunctionSignature.self)

    function(satNum, secClass, satName, epochYr, epochDays, nDotO2, n2DotO6, bstar, ephType, elsetNum, incli, node, eccen, omega, mnAnomaly, mnMotion, revNum, csvLine)
}

// Constructs a TLE from GP data stored in the input parameters.
// This function only parses data from the input data but DOES NOT load/add the TLE to memory.
// <br>
// Returned line1 and line2 will be empty if the function fails to construct the lines as requested.
public func TleGPArrayToLines( _ xa_tle: UnsafeMutablePointer<Double>,
                               _ xs_tle: UnsafeMutablePointer<CChar>,
                               _ line1: UnsafeMutablePointer<CChar>,
                               _ line2: UnsafeMutablePointer<CChar> ) {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<CChar> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "TleGPArrayToLines"), to: FunctionSignature.self)

    function(xa_tle, xs_tle, line1, line2)
}

// Constructs a TLE from GP data stored in the input parameters.
// This function only parses data from the input data but DOES NOT load/add the TLE to memory.
// Returned line1 and line2 will be empty if the function fails to construct the lines as requested.
public func TleGPArrayToCsv( _ xa_tle: UnsafeMutablePointer<Double>,
                             _ xs_tle: UnsafeMutablePointer<CChar>,
                             _ csvline: UnsafeMutablePointer<CChar> ) {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<CChar> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "TleGPArrayToCsv"), to: FunctionSignature.self)

    function(xa_tle, xs_tle, csvline)
}

// Constructs a TLE from individually provided SP data fields.
// Only applies to SP propagator.
// This function only parses data from the input fields but DOES NOT load/add the TLE to memory.
// Returned line1 and line2 will be empty if the function fails to construct the lines as requested.
public func TleSPFieldsToLines( _ satNum: Int32,
                                _ secClass: CChar,
                                _ satName: UnsafeMutablePointer<CChar>,
                                _ epochYr: Int32,
                                _ epochDays: Double,
                                _ bTerm: Double,
                                _ ogParm: Double,
                                _ agom: Double,
                                _ elsetNum: Int32,
                                _ incli: Double,
                                _ node: Double,
                                _ eccen: Double,
                                _ omega: Double,
                                _ mnAnomaly: Double,
                                _ mnMotion: Double,
                                _ revNum: Int32,
                                _ line1: UnsafeMutablePointer<CChar>,
                                _ line2: UnsafeMutablePointer<CChar> ) {

    typealias FunctionSignature = @convention(c) ( Int32,
                                                   CChar,
                                                   UnsafeMutablePointer<CChar>,
                                                   Int32,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   Int32,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   Int32,
                                                   UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<CChar> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "TleSPFieldsToLines"), to: FunctionSignature.self)

    function(satNum, secClass, satName, epochYr, epochDays, bTerm, ogParm, agom, elsetNum, incli, node, eccen, omega, mnAnomaly, mnMotion, revNum, line1, line2)
}

// Returns the first satKey from the currently loaded set of TLEs that contains the specified satellite number.
// This function is useful when Tle.dll is used in applications that require only one record (one TLE entry) for one satellite, and which refer to that TLE by its satellite number. This function can be used to retrieve a satKey in that situation, which is useful since the Standardized Astrodynamic Algorithms library works only with satKeys.
// A negative value will be returned if there is an error.
public func TleGetSatKey( _ satNum: Int32 ) -> Int64 {

    typealias FunctionSignature = @convention(c) ( Int32 ) -> Int64

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "TleGetSatKey"), to: FunctionSignature.self)

    return function(satNum)
}

// This function is similar to TleGetSatKey but designed to be used in Matlab. 
// Matlab doesn't correctly return the 19-digit satellite key using TleGetSatKey. This method is an alternative way to return the satKey output.
// This function is useful when Tle.dll is used in applications that require only one record (one TLE entry) for one satellite, and which refer to that TLE by its satellite number. This function can be used to retrieve a satKey in that situation, which is useful since the Standardized Astrodynamic Algorithms library works only with satKeys.
// A negative value will be returned in satKey if there is an error.
public func TleGetSatKeyML( _ satNum: Int32, _ satKey: UnsafeMutablePointer<Int64> ) {

    typealias FunctionSignature = @convention(c) ( Int32,
                                                   UnsafeMutablePointer<Int64> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "TleGetSatKeyML"), to: FunctionSignature.self)

    function(satNum, satKey)
}

// Computes a satKey from the input data.
// There is no need for a matching satellite to be loaded prior to using this function. The function simply computes the satKey from the provided fields.
// 
// This is the proper way to reconstruct a satKey from its fields. If you use your own routine to do this, the computed satKey might be different. 
// A negative value will be returned if there is an error.
public func TleFieldsToSatKey( _ satNum: Int32,
                               _ epochYr: Int32,
                               _ epochDays: Double,
                               _ ephType: Int32 ) -> Int64 {

    typealias FunctionSignature = @convention(c) ( Int32,
                                                   Int32,
                                                   Double,
                                                   Int32 ) -> Int64

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "TleFieldsToSatKey"), to: FunctionSignature.self)

    return function(satNum, epochYr, epochDays, ephType)
}

// This function is similar to TleFieldsToSatKey but designed to be used in Matlab. 
// Matlab doesn't correctly return the 19-digit satellite key using TleFieldsToSatKey. This method is an alternative way to return the satKey output.
// There is no need for a matching satellite to be loaded prior to using this function. The function simply computes the satKey from the provided fields.
// 
// This is the proper way to reconstruct a satKey from its fields. If you use your own routine to do this, the computed satKey might be different.
// A negative value will be returned in satKey if there is an error.
public func TleFieldsToSatKeyML( _ satNum: Int32,
                                 _ epochYr: Int32,
                                 _ epochDays: Double,
                                 _ ephType: Int32,
                                 _ satKey: UnsafeMutablePointer<Int64> ) {

    typealias FunctionSignature = @convention(c) ( Int32,
                                                   Int32,
                                                   Double,
                                                   Int32,
                                                   UnsafeMutablePointer<Int64> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "TleFieldsToSatKeyML"), to: FunctionSignature.self)

    function(satNum, epochYr, epochDays, ephType, satKey)
}

// Adds a TLE (satellite), using its data stored in the input parameters.
public func TleAddSatFrArray( _ xa_tle: UnsafeMutablePointer<Double>, _ xs_tle: UnsafeMutablePointer<CChar> ) -> Int64 {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<CChar> ) -> Int64

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "TleAddSatFrArray"), to: FunctionSignature.self)

    return function(xa_tle, xs_tle)
}

// This function is similar to TleAddSatFrArray but designed to be used in Matlab. 
public func TleAddSatFrArrayML( _ xa_tle: UnsafeMutablePointer<Double>,
                                _ xs_tle: UnsafeMutablePointer<CChar>,
                                _ satKey: UnsafeMutablePointer<Int64> ) {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<Int64> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "TleAddSatFrArrayML"), to: FunctionSignature.self)

    function(xa_tle, xs_tle, satKey)
}

// Updates existing TLE data with the provided new data stored in the input parameters. Note: satNum, year, day, and ephtype can't be updated.
// nDotO2 and n2DotO6 values are not used in the SGP4 propagator. However, some users still want to preserve the integrity of all input data.
public func TleUpdateSatFrArray( _ satKey: Int64,
                                 _ xa_tle: UnsafeMutablePointer<Double>,
                                 _ xs_tle: UnsafeMutablePointer<CChar> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<CChar> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "TleUpdateSatFrArray"), to: FunctionSignature.self)

    return function(satKey, xa_tle, xs_tle)
}

// Retrieves TLE data and stored it in the passing parameters
public func TleDataToArray( _ satKey: Int64,
                            _ xa_tle: UnsafeMutablePointer<Double>,
                            _ xs_tle: UnsafeMutablePointer<CChar> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<CChar> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "TleDataToArray"), to: FunctionSignature.self)

    return function(satKey, xa_tle, xs_tle)
}

// Converts TLE two line format to CSV format
public func TleLinesToCsv( _ line1: UnsafeMutablePointer<CChar>,
                           _ line2: UnsafeMutablePointer<CChar>,
                           _ csvline: UnsafeMutablePointer<CChar> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<CChar> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "TleLinesToCsv"), to: FunctionSignature.self)

    return function(line1, line2, csvline)
}

// Converts TLE CSV format to two line format
public func TleCsvToLines( _ csvLine: UnsafeMutablePointer<CChar>,
                           _ newSatno: Int32,
                           _ line1: UnsafeMutablePointer<CChar>,
                           _ line2: UnsafeMutablePointer<CChar> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar>,
                                                   Int32,
                                                   UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<CChar> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "TleCsvToLines"), to: FunctionSignature.self)

    return function(csvLine, newSatno, line1, line2)
}

// Sets TLE key mode - This function was deprecated, please use DllMain/SetElsetKeyMode() instead
public func SetTleKeyMode( _ tle_keyMode: Int32 ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int32 ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SetTleKeyMode"), to: FunctionSignature.self)

    return function(tle_keyMode)
}

// Gets current TLE key mode - This function was deprecated, please use DllMain/GetElsetKeyMode() instead
public func GetTleKeyMode(  ) -> Int32 {

    typealias FunctionSignature = @convention(c) (  ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "GetTleKeyMode"), to: FunctionSignature.self)

    return function()
}

// Finds the check sums of TLE lines
public func GetCheckSums( _ line1: UnsafeMutablePointer<CChar>,
                          _ line2: UnsafeMutablePointer<CChar>,
                          _ chkSum1: UnsafeMutablePointer<Int32>,
                          _ chkSum2: UnsafeMutablePointer<Int32>,
                          _ errCode: UnsafeMutablePointer<Int32> ) {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Int32> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "GetCheckSums"), to: FunctionSignature.self)

    function(line1, line2, chkSum1, chkSum2, errCode)
}

// TLE types (TLE ephemeris types) - They are different than ELTTYPE
//TLE SGP elset (Kozai mean motion)
public let TLETYPE_SGP  = 0
//TLE SGP4 elset (Brouwer mean motion)
public let TLETYPE_SGP4 = 2
//TLE PPT3 elset (Kozai mean motion)
public let TLETYPE_PPT3 = 3
//TLE SGP4-XP elset (Brouwer mean motion)
public let TLETYPE_XP   = 4
//TLE SP elset (osculating elements)
public let TLETYPE_SP   = 6

// Indexes of TLE data fields
//Satellite number
public let XF_TLE_SATNUM     =  1
//Security classification U: unclass, C: confidential, S: Secret
public let XF_TLE_CLASS      =  2
//Satellite name A8
public let XF_TLE_SATNAME    =  3
//Satellite's epoch time "YYYYJJJ.jjjjjjjj"
public let XF_TLE_EPOCH      =  4
//GP B* drag term (1/er)  (not the same as XF_TLE_BTERM)
public let XF_TLE_BSTAR      =  5
//Satellite ephemeris type: 0=SGP, 2=SGP4, 4=SGP4-XP, 6=SP
public let XF_TLE_EPHTYPE    =  6
//Element set number
public let XF_TLE_ELSETNUM   =  7
//Orbit inclination (deg)
public let XF_TLE_INCLI      =  8
//Right ascension of asending node (deg)
public let XF_TLE_NODE       =  9
//Eccentricity
public let XF_TLE_ECCEN      = 10
//Argument of perigee (deg)
public let XF_TLE_OMEGA      = 11
//Mean anomaly (deg)
public let XF_TLE_MNANOM     = 12
//Mean motion (rev/day) (ephType=0: Kozai, ephType=2: Brouwer)
public let XF_TLE_MNMOTN     = 13
//Revolution number at epoch
public let XF_TLE_REVNUM     = 14

//GP Mean motion derivative (rev/day**2 /2)
public let XF_TLE_NDOT       = 15
//GP Mean motion second derivative (rev/day**3 /6)
public let XF_TLE_NDOTDOT    = 16
//Solar radiation pressure GP (m2/kg)
public let XF_TLE_AGOMGP     = 16

//SP Radiation Pressure Coefficient
public let XF_TLE_SP_AGOM    =  5
//SP ballistic coefficient (m2/kg)
public let XF_TLE_SP_BTERM   = 15
//SP outgassing parameter (km/s2)
public let XF_TLE_SP_OGPARM  = 16

//Original satellite number
public let XF_TLE_ORGSATNUM  = 17
//GP ballistic coefficient (m2/kg) (not the same as XF_TLE_BSTAR)
public let XF_TLE_BTERM      = 18
//Time of last observation relative to epoch +/- fractional days
public let XF_TLE_OBSTIME    = 19
//Last calculated error growth rate (km/day)
public let XF_TLE_EGR        = 20
//Last calculated energy dissipation rate (w/kg)
public let XF_TLE_EDR        = 21
//Median Vismag
public let XF_TLE_VISMAG     = 22
//Median RCS - diameter in centimeters (cm)
public let XF_TLE_RCS        = 23
//Object Type (Payload, Rocket Body, Platform, Debris, Unknown)
public let XF_TLE_OBJTYPE    = 24
//Satellite name A12 (upto 12 character long)
public let XF_TLE_SATNAME_12 = 25


// Indexes of TLE numerical data in an array
// Line 1
//Satellite number
public let XA_TLE_SATNUM        =  0
//Satellite's epoch time in DS50UTC
public let XA_TLE_EPOCH         =  1
//GP Mean motion derivative (rev/day**2 /2)
public let XA_TLE_NDOT          =  2
//GP Mean motion second derivative (rev/day**3 /6)
public let XA_TLE_NDOTDOT       =  3
//GP B* drag term (1/er)
public let XA_TLE_BSTAR         =  4
//Satellite ephemeris type: 0=SGP, 2=SGP4, 4=SGP4-XP, 6=SP
public let XA_TLE_EPHTYPE       =  5

// Line 2
//Orbit inclination (deg)
public let XA_TLE_INCLI         = 20
//Right ascension of asending node (deg)
public let XA_TLE_NODE          = 21
//Eccentricity
public let XA_TLE_ECCEN         = 22
//Argument of perigee (deg)
public let XA_TLE_OMEGA         = 23
//Mean anomaly (deg)
public let XA_TLE_MNANOM        = 24
//Mean motion (rev/day) (ephType=0, 4: Kozai, ephType=2: Brouwer)
public let XA_TLE_MNMOTN        = 25
//Revolution number at epoch
public let XA_TLE_REVNUM        = 26
//Element set number
public let XA_TLE_ELSETNUM      = 30

// CSV (or TLE-XP, ephemType=4) specific fields
//Original satellite number
public let XA_TLE_ORGSATNUM     = 31
//SP/SGP4-XP ballistic coefficient (m2/kg)
public let XA_TLE_BTERM         = 32
//Time of last observation relative to epoch +/- fractional days
public let XA_TLE_OBSTIME       = 33
//Last calculated error growth rate (km/day)
public let XA_TLE_EGR           = 34
//Last calculated energy dissipation rate (w/kg)
public let XA_TLE_EDR           = 35
//Median Vismag
public let XA_TLE_VISMAG        = 36
//Median RCS - diameter in centimeters (cm)
public let XA_TLE_RCS           = 37

// CSV (or TLE-XP, ephemType=4)
//Solar Radiation Pressure Coefficient GP (m2/kg)
public let XA_TLE_AGOMGP        = 38


// SP specific fields
//SP ballistic coefficient (m2/kg)
public let XA_TLE_SP_BTERM      =  2
//SP outgassing parameter (km/s2)
public let XA_TLE_SP_OGPARM     =  3
//SP Radiation Pressure Coefficient
public let XA_TLE_SP_AGOM       =  4

public let XA_TLE_SIZE          = 64

// Indexes of TLE text data in an array of chars
//Security classification of line 1 and line 2
public let XS_TLE_SECCLASS_1   =  0
//Satellite name
public let XS_TLE_SATNAME_12   =  1
//Object Type (Payload, Rocket Body, Platform, Debris, Unknown) - csv only
public let XS_TLE_OBJTYPE_11   = 13

public let XS_TLE_SIZE         = 512

// TLE's text data fields - new convention (start index, string length)
//Security classification of line 1 and line 2
public let XS_TLE_SECCLASS_0_1  =  0
//Satellite name
public let XS_TLE_SATNAME_1_12  =  1
//Object Type (Payload, Rocket Body, Platform, Debris, Unknown) - csv only
public let XS_TLE_OBJTYPE_13_1  = 13

public let XS_TLE_LENGTH        = 512

// Indexes of different TLE file's formats
//Original TLE format
public let XF_TLEFORM_ORG    =  0
//CSV format
public let XF_TLEFORM_CSV    =  1


// ========================= End of auto generated code ==========================
