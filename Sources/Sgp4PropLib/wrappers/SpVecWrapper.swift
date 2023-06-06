// This wrapper file was generated automatically by the GenDllWrappers program.
import Foundation

#if os(Linux)
fileprivate let libHandle = loadDll("libspvec.so")
#elseif os(Windows)
fileprivate let libHandle = loadDll("SpVec.dll")
#else
fileprivate let libHandle = loadDll("libspvec.dylib")
#endif

// Notes: This function has been deprecated since v9.0. 
// Initializes SpVec DLL for use in the program
// If this function returns an error, it is recommended that the users stop the program immediately. The error occurs if the users forget to load and initialize all the prerequisite DLLs, as listed in the DLL Prerequisites section, before using this DLL.
public func SpVecInit( _ apAddr: Int64 ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64 ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SpVecInit"), to: FunctionSignature.self)

    return function(apAddr)
}

// Returns information about the current version of SpVec DLL. The information is placed in the string parameter you pass in
// The returned string provides information about the version number, build date, and the platform of the SpVec DLL. 
public func SpVecGetInfo( _ infoStr: UnsafeMutablePointer<CChar> ) {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SpVecGetInfo"), to: FunctionSignature.self)

    function(infoStr)
}

// Loads a text file containing SpVec's
// The users can use this function repeatedly to load B1P records from different input files. However, only unique satKeys are stored in the binary tree. Duplicated satKeys won't be stored. 
// 
// B1P records can be included directly in the main input file or they can be read from a separate file identified with "ELTFIL=[pathname\filename]" or "VECFIL=[path/filename]".
// 
// This function only reads B1P records from the main input file or B1P records from the file identified with ELTFIL or VECFIL in the input file. It won't read anything else.
public func SpVecLoadFile( _ spVecFile: UnsafeMutablePointer<CChar> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SpVecLoadFile"), to: FunctionSignature.self)

    return function(spVecFile)
}

// Saves the currently loaded SpVecs's to a file
// If the users call this routine immediately after SpVecLoadFile. The SPVECs contents in the two file should be the same (minus duplicated SPVECs or bad SPVECs).
// 
// The purpose of this function is to save the current state of the loaded SPVECs, usually used in GUI applications, for future use.
public func SpVecSaveFile( _ spVecFile: UnsafeMutablePointer<CChar>,
                           _ saveMode: Int32,
                           _ saveForm: Int32 ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar>,
                                                   Int32,
                                                   Int32 ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SpVecSaveFile"), to: FunctionSignature.self)

    return function(spVecFile, saveMode, saveForm)
}

// Removes an SpVec represented by the satKey from memory
// If the users enter an invalid satKey, a non-existing satKey in memory, the function will return a non-zero value indicating an error.
public func SpVecRemoveSat( _ satKey: Int64 ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64 ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SpVecRemoveSat"), to: FunctionSignature.self)

    return function(satKey)
}

// Removes all SpVec's from memory
public func SpVecRemoveAllSats(  ) -> Int32 {

    typealias FunctionSignature = @convention(c) (  ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SpVecRemoveAllSats"), to: FunctionSignature.self)

    return function()
}

// Retrieves all of the currently loaded satKeys. These satKeys can be used to access the internal data for the SpVec's
// See SpVecGetLoaded for example.
// This function is useful for dynamically allocating memory for the array that is passed to the function SpVecGetLoaded().
public func SpVecGetCount(  ) -> Int32 {

    typealias FunctionSignature = @convention(c) (  ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SpVecGetCount"), to: FunctionSignature.self)

    return function()
}

// Retrieves all of the currently loaded satKeys. These satKeys can be used to access the internal data for the SpVec's
// It is recommended that SpVecGetCount() is used to count how many satellites are currently loaded in the SpVec DLL's binary tree. The users then use this number to dynamically allocate the satKeys array and pass it to this function. 
// 
// If the users prefer to pass a static array to the function, make sure it is big enough to store all the satKeys in memory.
public func SpVecGetLoaded( _ order: Int32, _ satKeys: UnsafeMutablePointer<Int64> ) {

    typealias FunctionSignature = @convention(c) ( Int32,
                                                   UnsafeMutablePointer<Int64> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SpVecGetLoaded"), to: FunctionSignature.self)

    function(order, satKeys)
}

// Adds an SpVec using its directly specified first and second lines
// If the satellite was previously added to the SpVec DLL's binary tree, the function also returns a negative value indicating an error. 
// 
// The users can use this function repeatedly to add many satellites (one satellite at a time) to the SpVec DLL's binary tree. 
public func SpVecAddSatFrLines( _ line1: UnsafeMutablePointer<CChar>, _ line2: UnsafeMutablePointer<CChar> ) -> Int64 {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<CChar> ) -> Int64

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SpVecAddSatFrLines"), to: FunctionSignature.self)

    return function(line1, line2)
}

// Works like SpVecAddSatFrLines but designed for Matlab
public func SpVecAddSatFrLinesML( _ line1: UnsafeMutablePointer<CChar>,
                                  _ line2: UnsafeMutablePointer<CChar>,
                                  _ satKey: UnsafeMutablePointer<Int64> ) {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<Int64> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SpVecAddSatFrLinesML"), to: FunctionSignature.self)

    function(line1, line2, satKey)
}

// Adds an SpVec using its individually provided field values
public func SpVecAddSatFrFields( _ pos: UnsafeMutablePointer<Double>,
                                 _ vel: UnsafeMutablePointer<Double>,
                                 _ secClass: CChar,
                                 _ satNum: Int32,
                                 _ satName: UnsafeMutablePointer<CChar>,
                                 _ epochDtg: UnsafeMutablePointer<CChar>,
                                 _ revNum: Int32,
                                 _ elsetNum: Int32,
                                 _ bterm: Double,
                                 _ agom: Double,
                                 _ ogParm: Double,
                                 _ coordSys: UnsafeMutablePointer<CChar> ) -> Int64 {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   CChar,
                                                   Int32,
                                                   UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<CChar>,
                                                   Int32,
                                                   Int32,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   UnsafeMutablePointer<CChar> ) -> Int64

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SpVecAddSatFrFields"), to: FunctionSignature.self)

    return function(pos, vel, secClass, satNum, satName, epochDtg, revNum, elsetNum, bterm, agom, ogParm, coordSys)
}

// Works like SpVecAddSatFrFields but designed for Matlab 
public func SpVecAddSatFrFieldsML( _ pos: UnsafeMutablePointer<Double>,
                                   _ vel: UnsafeMutablePointer<Double>,
                                   _ secClass: CChar,
                                   _ satNum: Int32,
                                   _ satName: UnsafeMutablePointer<CChar>,
                                   _ epochDtg: UnsafeMutablePointer<CChar>,
                                   _ revNum: Int32,
                                   _ elsetNum: Int32,
                                   _ bterm: Double,
                                   _ agom: Double,
                                   _ ogParm: Double,
                                   _ coordSys: UnsafeMutablePointer<CChar>,
                                   _ satKey: UnsafeMutablePointer<Int64> ) {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   CChar,
                                                   Int32,
                                                   UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<CChar>,
                                                   Int32,
                                                   Int32,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<Int64> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SpVecAddSatFrFieldsML"), to: FunctionSignature.self)

    function(pos, vel, secClass, satNum, satName, epochDtg, revNum, elsetNum, bterm, agom, ogParm, coordSys, satKey)
}

// Updates an SpVec satellite's data in memory using individually provided field values. Note: satNum, epoch string can't be updated.
// The satellite's unique key will not be changed in this function call. 
public func SpVecUpdateSatFrFields( _ satKey: Int64,
                                    _ pos: UnsafeMutablePointer<Double>,
                                    _ vel: UnsafeMutablePointer<Double>,
                                    _ secClass: CChar,
                                    _ satName: UnsafeMutablePointer<CChar>,
                                    _ revNum: Int32,
                                    _ elsetNum: Int32,
                                    _ bterm: Double,
                                    _ agom: Double,
                                    _ ogParm: Double,
                                    _ coordSys: UnsafeMutablePointer<CChar> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   CChar,
                                                   UnsafeMutablePointer<CChar>,
                                                   Int32,
                                                   Int32,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   UnsafeMutablePointer<CChar> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SpVecUpdateSatFrFields"), to: FunctionSignature.self)

    return function(satKey, pos, vel, secClass, satName, revNum, elsetNum, bterm, agom, ogParm, coordSys)
}

// Retrieves the value of a specific field of an SpVec
// <br>
// The table below shows the values for the xf_SpVec parameter:
// <table summary="">
// <tr>
// <td><b>Index</b></td>
// <td><b>Index Interpretation</b></td>
// </tr>
// <tr><td> 1-3</td><td>First 3 elements of 1P</td></tr>
// <tr><td> 4-6</td><td>Second 3 elements of 1P</td></tr>
// <tr><td> 7</td><td>Security classification</td></tr>
// <tr><td> 9</td><td>Satellite number</td></tr>
// <tr><td>10</td><td>Satellite common name</td></tr>
// <tr><td>11</td><td>Epoch date</td></tr>
// <tr><td>12</td><td>Epoch revolution number</td></tr>
// <tr><td>13</td><td>Elset number</td></tr>
// <tr><td>14</td><td>Ballistic coefficient</td></tr>
// <tr><td>15</td><td>Radiation pressure coefficient</td></tr>
// <tr><td>16</td><td>Outgassing parameter</td></tr>
// <tr><td>17</td><td>Input coordinate system</td></tr>
// </table>
public func SpVecGetField( _ satKey: Int64,
                           _ xf_SpVec: Int32,
                           _ valueStr: UnsafeMutablePointer<CChar> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   Int32,
                                                   UnsafeMutablePointer<CChar> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SpVecGetField"), to: FunctionSignature.self)

    return function(satKey, xf_SpVec, valueStr)
}

// Updates the value of a field of an SpVec
// See SpVecGetField for a description of the xf_SpVec parameter.  satNum (9) and epoch date (11) cannot be altered.
// The set value type was intentionally chosen as a character string because it allows the users to set value for different data types.
public func SpVecSetField( _ satKey: Int64,
                           _ xf_SpVec: Int32,
                           _ valueStr: UnsafeMutablePointer<CChar> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   Int32,
                                                   UnsafeMutablePointer<CChar> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SpVecSetField"), to: FunctionSignature.self)

    return function(satKey, xf_SpVec, valueStr)
}

// Retrieves all of the data for an SpVec satellite in a single function call
public func SpVecGetAllFields( _ satKey: Int64,
                               _ pos: UnsafeMutablePointer<Double>,
                               _ vel: UnsafeMutablePointer<Double>,
                               _ secClass: UnsafeMutablePointer<CChar>,
                               _ satNum: UnsafeMutablePointer<Int32>,
                               _ satName: UnsafeMutablePointer<CChar>,
                               _ epochDtg: UnsafeMutablePointer<CChar>,
                               _ revNum: UnsafeMutablePointer<Int32>,
                               _ elsetNum: UnsafeMutablePointer<Int32>,
                               _ bterm: UnsafeMutablePointer<Double>,
                               _ agom: UnsafeMutablePointer<Double>,
                               _ ogParm: UnsafeMutablePointer<Double>,
                               _ coordSys: UnsafeMutablePointer<CChar> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<CChar> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SpVecGetAllFields"), to: FunctionSignature.self)

    return function(satKey, pos, vel, secClass, satNum, satName, epochDtg, revNum, elsetNum, bterm, agom, ogParm, coordSys)
}

// Retrieves all of the data for an SpVec satellite in a single function call
public func SpVecParse( _ line1: UnsafeMutablePointer<CChar>,
                        _ line2: UnsafeMutablePointer<CChar>,
                        _ pos: UnsafeMutablePointer<Double>,
                        _ vel: UnsafeMutablePointer<Double>,
                        _ secClass: UnsafeMutablePointer<CChar>,
                        _ satNum: UnsafeMutablePointer<Int32>,
                        _ satName: UnsafeMutablePointer<CChar>,
                        _ epochDtg: UnsafeMutablePointer<CChar>,
                        _ revNum: UnsafeMutablePointer<Int32>,
                        _ elsetNum: UnsafeMutablePointer<Int32>,
                        _ bterm: UnsafeMutablePointer<Double>,
                        _ agom: UnsafeMutablePointer<Double>,
                        _ ogParm: UnsafeMutablePointer<Double>,
                        _ coordSys: UnsafeMutablePointer<CChar> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<CChar> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SpVecParse"), to: FunctionSignature.self)

    return function(line1, line2, pos, vel, secClass, satNum, satName, epochDtg, revNum, elsetNum, bterm, agom, ogParm, coordSys)
}

// Parses SPVEC data from the input first and second lines of an 1P/2P state vector and store that data back into the output parameters.
// This function only parses data from the input SPVEC but DOES NOT load/add the input SPVEC to memory.
public func SpVecLinesToArray( _ line1: UnsafeMutablePointer<CChar>,
                               _ line2: UnsafeMutablePointer<CChar>,
                               _ xa_spVec: UnsafeMutablePointer<Double>,
                               _ xs_spVec: UnsafeMutablePointer<CChar> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<CChar> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SpVecLinesToArray"), to: FunctionSignature.self)

    return function(line1, line2, xa_spVec, xs_spVec)
}

// Returns the first and second lines of the 1P/2P representation of an SpVec
public func SpVecGetLines( _ satKey: Int64,
                           _ line1: UnsafeMutablePointer<CChar>,
                           _ line2: UnsafeMutablePointer<CChar> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<CChar> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SpVecGetLines"), to: FunctionSignature.self)

    return function(satKey, line1, line2)
}

// Constructs 1P/2P cards from individually provided SpVec data fields
// Returned line1 and line2 are empty if the function fails to construct the lines as requested.
public func SpVecFieldsToLines( _ pos: UnsafeMutablePointer<Double>,
                                _ vel: UnsafeMutablePointer<Double>,
                                _ secClass: CChar,
                                _ satNum: Int32,
                                _ satName: UnsafeMutablePointer<CChar>,
                                _ epochDtg: UnsafeMutablePointer<CChar>,
                                _ revNum: Int32,
                                _ elsetNum: Int32,
                                _ bterm: Double,
                                _ agom: Double,
                                _ ogParm: Double,
                                _ coordSys: UnsafeMutablePointer<CChar>,
                                _ line1: UnsafeMutablePointer<CChar>,
                                _ line2: UnsafeMutablePointer<CChar> ) {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   CChar,
                                                   Int32,
                                                   UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<CChar>,
                                                   Int32,
                                                   Int32,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<CChar> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SpVecFieldsToLines"), to: FunctionSignature.self)

    function(pos, vel, secClass, satNum, satName, epochDtg, revNum, elsetNum, bterm, agom, ogParm, coordSys, line1, line2)
}

// Constructs 1P/2P cards from SPVEC data stored in the input arrays.
// This function only parses data from the input data but DOES NOT load/add the SPVEC to memory.
// Returned line1 and line2 will be empty if the function fails to construct the lines as requested.
public func SpVecArrayToLines( _ xa_spVec: UnsafeMutablePointer<Double>,
                               _ xs_spVec: UnsafeMutablePointer<CChar>,
                               _ line1: UnsafeMutablePointer<CChar>,
                               _ line2: UnsafeMutablePointer<CChar> ) {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<CChar> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SpVecArrayToLines"), to: FunctionSignature.self)

    function(xa_spVec, xs_spVec, line1, line2)
}

// Returns the first satKey from the currently loaded set of SpVec's that contains the specified satellite number
// This function is useful when SpVec DLL is used in applications that requires only one record (one SpVec entry) for one satellite and the applications refer to that SpVec by its satellite number. However, the Standardized Astrodynamic Algorithms library is only working with satKeys, this function helps to return the associated satKey of that satellite.
public func SpVecGetSatKey( _ satNum: Int32 ) -> Int64 {

    typealias FunctionSignature = @convention(c) ( Int32 ) -> Int64

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SpVecGetSatKey"), to: FunctionSignature.self)

    return function(satNum)
}

// This function is similar to SpVecGetSatKey but designed to be used in Matlab. 
// This function is useful when SpVec DLL is used in applications that requires only one record (one SpVec entry) for one satellite and the applications refer to that SpVec by its satellite number. However, the Standardized Astrodynamic Algorithms library is only working with satKeys, this function helps to return the associated satKey of that satellite.
public func SpVecGetSatKeyML( _ satNum: Int32, _ satKey: UnsafeMutablePointer<Int64> ) {

    typealias FunctionSignature = @convention(c) ( Int32,
                                                   UnsafeMutablePointer<Int64> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SpVecGetSatKeyML"), to: FunctionSignature.self)

    function(satNum, satKey)
}

// Computes a satKey from the input data
// This is the proper way to reconstruct a satKey from its fields. If the users use their own routine to do this, the computed satKey might be different.
public func SpVecFieldsToSatKey( _ satNum: Int32, _ epochDtg: UnsafeMutablePointer<CChar> ) -> Int64 {

    typealias FunctionSignature = @convention(c) ( Int32,
                                                   UnsafeMutablePointer<CChar> ) -> Int64

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SpVecFieldsToSatKey"), to: FunctionSignature.self)

    return function(satNum, epochDtg)
}

// This function is similar to SpVecFieldsToSatKey but designed to be used in Matlab. 
// This is the proper way to reconstruct a satKey from its fields. If the users use their own routine to do this, the computed satKey might be different.
public func SpVecFieldsToSatKeyML( _ satNum: Int32,
                                   _ epochDtg: UnsafeMutablePointer<CChar>,
                                   _ satKey: UnsafeMutablePointer<Int64> ) {

    typealias FunctionSignature = @convention(c) ( Int32,
                                                   UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<Int64> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SpVecFieldsToSatKeyML"), to: FunctionSignature.self)

    function(satNum, epochDtg, satKey)
}

// Adds an SpVec using its individually provided field values
public func SpVecAddSatFrArray( _ xa_spVec: UnsafeMutablePointer<Double>, _ xs_spVec: UnsafeMutablePointer<CChar> ) -> Int64 {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<CChar> ) -> Int64

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SpVecAddSatFrArray"), to: FunctionSignature.self)

    return function(xa_spVec, xs_spVec)
}

// Adds an SpVec using its individually provided field values
public func SpVecAddSatFrArrayML( _ xa_spVec: UnsafeMutablePointer<Double>,
                                  _ xs_spVec: UnsafeMutablePointer<CChar>,
                                  _ satKey: UnsafeMutablePointer<Int64> ) {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<Int64> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SpVecAddSatFrArrayML"), to: FunctionSignature.self)

    function(xa_spVec, xs_spVec, satKey)
}

// Updates existing SPVEC data with the provided new data stored in the input parameters. Note: satNum, epoch string can't be updated.
public func SpVecUpdateSatFrArray( _ satKey: Int64,
                                   _ xa_spVec: UnsafeMutablePointer<Double>,
                                   _ xs_spVec: UnsafeMutablePointer<CChar> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<CChar> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SpVecUpdateSatFrArray"), to: FunctionSignature.self)

    return function(satKey, xa_spVec, xs_spVec)
}

// Retrieves SPVEC data and stored it in the passing parameters
public func SpVecDataToArray( _ satKey: Int64,
                              _ xa_spVec: UnsafeMutablePointer<Double>,
                              _ xs_spVec: UnsafeMutablePointer<CChar> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<CChar> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SpVecDataToArray"), to: FunctionSignature.self)

    return function(satKey, xa_spVec, xs_spVec)
}

// Indexes of SPVEC data fields
//X component of satellite's position (km)
public let XF_SPVEC_POS1     =  1
//Y component of satellite's position (km)
public let XF_SPVEC_POS2     =  2
//Z component of satellite's position (km)
public let XF_SPVEC_POS3     =  3
//X component of satellite's velocity (m/s)
public let XF_SPVEC_VEL1     =  4
//Y component of satellite's velocity (m/s)
public let XF_SPVEC_VEL2     =  5
//Z component of satellite's velocity (m/s)
public let XF_SPVEC_VEL3     =  6
//Security classification
public let XF_SPVEC_SECCLASS =  7
//Satellite number
public let XF_SPVEC_SATNUM   =  9
//Satellite common name
public let XF_SPVEC_SATNAME  = 10
//Epoch date
public let XF_SPVEC_EPOCH    = 11
//Epoch revolution number
public let XF_SPVEC_REVNUM   = 12
//Elset number
public let XF_SPVEC_ELSETNUM = 13
//Ballistic coefficient (m^2/kg)
public let XF_SPVEC_BTERM    = 14
//Radiation pressure coefficient (m^2/kg)
public let XF_SPVEC_AGOM     = 15
//Outgassing parameter (km/s^2)
public let XF_SPVEC_OGPARM   = 16
//Inpute coordinate system
public let XF_SPVEC_INPCOORD = 17


// Indexes of SPVEC numerical data in an array
//Satellite number
public let XA_SPVEC_SATNUM   =   0
//Epoch date in days since 1950 UTC
public let XA_SPVEC_EPOCH    =   1
//Epoch revolution number
public let XA_SPVEC_REVNUM   =   2
//Elset number
public let XA_SPVEC_ELSETNUM =   3
//Ballistic coefficient (m^2/kg)
public let XA_SPVEC_BTERM    =   4
//Radiation pressure coefficient (m^2/kg)
public let XA_SPVEC_AGOM     =   5
//Outgassing parameter (km/s^2)
public let XA_SPVEC_OGPARM   =   6
//Inpute coordinate systemm; see SPVEC_INPCOORD_? for available options
public let XA_SPVEC_INPCOORD =   7

//X component of satellite's position (km)
public let XA_SPVEC_POS1     =  20
//Y component of satellite's position (km)
public let XA_SPVEC_POS2     =  21
//Z component of satellite's position (km)
public let XA_SPVEC_POS3     =  22
//X component of satellite's velocity (m/s)
public let XA_SPVEC_VEL1     =  23
//Y component of satellite's velocity (m/s)
public let XA_SPVEC_VEL2     =  24
//Z component of satellite's velocity (m/s)
public let XA_SPVEC_VEL3     =  25

//Flag to indicate SP vec has its own numerical integration control (vs global 4P settings)
public let XA_SPVEC_HASOWNCRL =  70
//Geopotential model to use
public let XA_SPVEC_GEOIDX   =  71
//Earth gravity pertubations flag
public let XA_SPVEC_BULGEFLG =  72
//Drag pertubations flag
public let XA_SPVEC_DRAGFLG  =  73
//Radiation pressure pertubations flag
public let XA_SPVEC_RADFLG   =  74
//Lunar/Solar pertubations flag
public let XA_SPVEC_LUNSOLFLG =  75
//F10 value
public let XA_SPVEC_F10      =  76
//F10 average value
public let XA_SPVEC_F10AVG   =  77
//Ap value
public let XA_SPVEC_AP       =  78
//Geopotential truncation order/degree/zonals
public let XA_SPVEC_TRUNC    =  79
//Corrector step convergence criterion; exponent of 1/10; default = 10
public let XA_SPVEC_CONVERG  =  80
//Outgassing pertubations flag
public let XA_SPVEC_OGFLG    =  81
//Solid earth and ocean tide pertubations flag
public let XA_SPVEC_TIDESFLG =  82
//Nutation terms
public let XA_SPVEC_NTERMS   =  84
//Recompute pertubations at each corrector step
public let XA_SPVEC_REEVAL   =  85
//Variable of intergration control
public let XA_SPVEC_INTEGCTRL =  86
//Variable step size control
public let XA_SPVEC_VARSTEP  =  87
//Initial step size
public let XA_SPVEC_INITSTEP =  88

//weighted RM of last DC on the satellite
public let XA_SPVEC_RMS      =  99
//the lower triangle portion of the full cov matrix (100-120: 6x6 covmtx, ..., 100-154: 10x10 covmtx)
public let XA_SPVEC_COVELEMS = 100

public let XA_SPVEC_SIZE     = 512


// Indexes of SPVEC text data in an array of chars
//Security classification
public let XS_SPVEC_SECCLASS_1 =  0
//Satellite common name
public let XS_SPVEC_SATNAME_8  =  1

public let XS_SPVEC_SIZE       = 512

// Different input coordinate for SpVec
//Use input coordinate specified in 4P-card
public let SPVEC_INPCOORD_4P    =  0
//Input coordinate systems is coordinates of epoch
public let SPVEC_INPCOORD_TMDAT =  1
//Input coordinate systems is coordinates of J2000
public let SPVEC_INPCOORD_MMJ2K =  2

// ========================= End of auto generated code ==========================
