// This wrapper file was generated automatically by the GenDllWrappers program.
import Foundation

#if os(Linux)
fileprivate let libHandle = loadDll("libobs.so")
#elseif os(Windows)
fileprivate let libHandle = loadDll("Obs.dll")
#else
fileprivate let libHandle = loadDll("libobs.dylib")
#endif

// Notes: This function has been deprecated since v9.0. 
// Initializes Obs DLL for use in the program
public func ObsInit( _ apAddr: Int64 ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64 ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "ObsInit"), to: FunctionSignature.self)

    return function(apAddr)
}

// Returns information about the current version of Obs DLL. 
// The information is placed in the string parameter passed in.
public func ObsGetInfo( _ infoStr: UnsafeMutablePointer<CChar> ) {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "ObsGetInfo"), to: FunctionSignature.self)

    function(infoStr)
}

// Sets the year for transmission observation format (TTY) input files
public func ObsSetTTYYear( _ ttyYear: Int32 ) {

    typealias FunctionSignature = @convention(c) ( Int32 ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "ObsSetTTYYear"), to: FunctionSignature.self)

    function(ttyYear)
}

// Loads observation data from an input text file
public func ObsLoadFile( _ obsFile: UnsafeMutablePointer<CChar> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "ObsLoadFile"), to: FunctionSignature.self)

    return function(obsFile)
}

// Saves the currently loaded obs data to a file
public func ObsSaveFile( _ obsFile: UnsafeMutablePointer<CChar>,
                         _ saveMode: Int32,
                         _ obsForm: Int32 ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar>,
                                                   Int32,
                                                   Int32 ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "ObsSaveFile"), to: FunctionSignature.self)

    return function(obsFile, saveMode, obsForm)
}

// Removes an obs, represented by the obsKey, from the set of currently loaded observations
public func ObsRemove( _ obsKey: Int64 ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64 ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "ObsRemove"), to: FunctionSignature.self)

    return function(obsKey)
}

// Removes all currently loaded observations from memory
public func ObsRemoveAll(  ) -> Int32 {

    typealias FunctionSignature = @convention(c) (  ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "ObsRemoveAll"), to: FunctionSignature.self)

    return function()
}

// Returns the number of observations currently loaded
public func ObsGetCount(  ) -> Int32 {

    typealias FunctionSignature = @convention(c) (  ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "ObsGetCount"), to: FunctionSignature.self)

    return function()
}

// Retrieves all of the currently loaded obsKeys. These obsKeys can be used to access the internal data for the observations
// Sort options (order):
// (+/-)1 = (descending/ascending) time, sensor, obsType, elev
// (+/-)2 = (descending/ascending) time, elevation
// (+/-)3 = (descending/ascending) time, sensor, otype, el, satno
// (+/-)4 = (descending/ascending) sensor, satno, time, elev
// (+/-)5 = (descending/ascending) sensor, time, elevation
// (+/-)6 = (descending/ascending) sensor, satno, obsType, time, elev
// (+/-)7 = (descending/ascending) satno, time, sensor, otype, el
// (+/-)8 = (reversed/same)        order as obs were read
// 9 : as is in the tree
public func ObsGetLoaded( _ order: Int32, _ obsKeys: UnsafeMutablePointer<Int64> ) {

    typealias FunctionSignature = @convention(c) ( Int32,
                                                   UnsafeMutablePointer<Int64> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "ObsGetLoaded"), to: FunctionSignature.self)

    function(order, obsKeys)
}

// Loads a single observation-typed card
public func ObsLoadCard( _ card: UnsafeMutablePointer<CChar> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "ObsLoadCard"), to: FunctionSignature.self)

    return function(card)
}

// Loads a one-line or two-line observation 
public func ObsLoadTwoCards( _ card1: UnsafeMutablePointer<CChar>, _ card2: UnsafeMutablePointer<CChar> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<CChar> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "ObsLoadTwoCards"), to: FunctionSignature.self)

    return function(card1, card2)
}

// Adds an observation from a string in B3 observation format
public func ObsAddFrB3Card( _ card: UnsafeMutablePointer<CChar> ) -> Int64 {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar> ) -> Int64

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "ObsAddFrB3Card"), to: FunctionSignature.self)

    return function(card)
}

// Works like ObsAddFrB3Card but designed for Matlab
public func ObsAddFrB3CardML( _ card: UnsafeMutablePointer<CChar>, _ obsKey: UnsafeMutablePointer<Int64> ) {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<Int64> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "ObsAddFrB3CardML"), to: FunctionSignature.self)

    function(card, obsKey)
}

// Converts B3 format to csv format without loading B3 obs into memory
public func ObsB3ToCsv( _ card: UnsafeMutablePointer<CChar>, _ csvLine: UnsafeMutablePointer<CChar> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<CChar> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "ObsB3ToCsv"), to: FunctionSignature.self)

    return function(card, csvLine)
}

// Converts CSV format to B3 format without loading CSV obs into memory
public func ObsCsvToB3( _ csvLine: UnsafeMutablePointer<CChar>,
                        _ newSatno: Int32,
                        _ card: UnsafeMutablePointer<CChar> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar>,
                                                   Int32,
                                                   UnsafeMutablePointer<CChar> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "ObsCsvToB3"), to: FunctionSignature.self)

    return function(csvLine, newSatno, card)
}

// Adds an observation from a TTY (1 line or 2 lines) observation format
public func ObsAddFrTTYCards( _ card1: UnsafeMutablePointer<CChar>, _ card2: UnsafeMutablePointer<CChar> ) -> Int64 {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<CChar> ) -> Int64

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "ObsAddFrTTYCards"), to: FunctionSignature.self)

    return function(card1, card2)
}

// Works like ObsAddFrTTYCards but designed for Matlab
public func ObsAddFrTTYCardsML( _ card1: UnsafeMutablePointer<CChar>,
                                _ card2: UnsafeMutablePointer<CChar>,
                                _ obsKey: UnsafeMutablePointer<Int64> ) {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<Int64> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "ObsAddFrTTYCardsML"), to: FunctionSignature.self)

    function(card1, card2, obsKey)
}

// Converts TTY format to CSV format without loading TTY obs into memory
public func ObsTTYToCsv( _ card1: UnsafeMutablePointer<CChar>,
                         _ card2: UnsafeMutablePointer<CChar>,
                         _ csvLine: UnsafeMutablePointer<CChar> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<CChar> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "ObsTTYToCsv"), to: FunctionSignature.self)

    return function(card1, card2, csvLine)
}

// Converts CSV format to TTY format without loading CSV obs into memory
public func ObsCsvToTTY( _ csvLine: UnsafeMutablePointer<CChar>,
                         _ newSatno: Int32,
                         _ card1: UnsafeMutablePointer<CChar>,
                         _ card2: UnsafeMutablePointer<CChar> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar>,
                                                   Int32,
                                                   UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<CChar> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "ObsCsvToTTY"), to: FunctionSignature.self)

    return function(csvLine, newSatno, card1, card2)
}

// Adds one observation using csv obs string 
public func ObsAddFrCsv( _ csvLine: UnsafeMutablePointer<CChar> ) -> Int64 {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar> ) -> Int64

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "ObsAddFrCsv"), to: FunctionSignature.self)

    return function(csvLine)
}

// Adds one observation using csv obs string - for MatLab
public func ObsAddFrCsvML( _ csvLine: UnsafeMutablePointer<CChar>, _ obsKey: UnsafeMutablePointer<Int64> ) {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<Int64> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "ObsAddFrCsvML"), to: FunctionSignature.self)

    function(csvLine, obsKey)
}

// Adds one observation using its input data. Depending on the observation type, some input data might be unavailable and left blank
public func ObsAddFrFields( _ secClass: CChar,
                            _ satNum: Int32,
                            _ senNum: Int32,
                            _ obsTimeDs50utc: Double,
                            _ elOrDec: Double,
                            _ azOrRA: Double,
                            _ range: Double,
                            _ rangeRate: Double,
                            _ elRate: Double,
                            _ azRate: Double,
                            _ rangeAccel: Double,
                            _ obsType: CChar,
                            _ trackInd: Int32,
                            _ ASTAT: Int32,
                            _ siteTag: Int32,
                            _ spadocTag: Int32,
                            _ pos: UnsafeMutablePointer<Double>,
                            _ vel: UnsafeMutablePointer<Double>,
                            _ extArr: UnsafeMutablePointer<Double> ) -> Int64 {

    typealias FunctionSignature = @convention(c) ( CChar,
                                                   Int32,
                                                   Int32,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   CChar,
                                                   Int32,
                                                   Int32,
                                                   Int32,
                                                   Int32,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Int64

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "ObsAddFrFields"), to: FunctionSignature.self)

    return function(secClass, satNum, senNum, obsTimeDs50utc, elOrDec, azOrRA, range, rangeRate, elRate, azRate, rangeAccel, obsType, trackInd, ASTAT, siteTag, spadocTag, pos, vel, extArr)
}

// Works like ObsAddFrFields but designed for Matlab
public func ObsAddFrFieldsML( _ secClass: CChar,
                              _ satNum: Int32,
                              _ senNum: Int32,
                              _ obsTimeDs50utc: Double,
                              _ elOrDec: Double,
                              _ azOrRA: Double,
                              _ range: Double,
                              _ rangeRate: Double,
                              _ elRate: Double,
                              _ azRate: Double,
                              _ rangeAccel: Double,
                              _ obsType: CChar,
                              _ trackInd: Int32,
                              _ ASTAT: Int32,
                              _ siteTag: Int32,
                              _ spadocTag: Int32,
                              _ pos: UnsafeMutablePointer<Double>,
                              _ vel: UnsafeMutablePointer<Double>,
                              _ extArr: UnsafeMutablePointer<Double>,
                              _ obsKey: UnsafeMutablePointer<Int64> ) {

    typealias FunctionSignature = @convention(c) ( CChar,
                                                   Int32,
                                                   Int32,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   CChar,
                                                   Int32,
                                                   Int32,
                                                   Int32,
                                                   Int32,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Int64> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "ObsAddFrFieldsML"), to: FunctionSignature.self)

    function(secClass, satNum, senNum, obsTimeDs50utc, elOrDec, azOrRA, range, rangeRate, elRate, azRate, rangeAccel, obsType, trackInd, ASTAT, siteTag, spadocTag, pos, vel, extArr, obsKey)
}

// Adds one observation using its input data stored in an array. Depending on the observation type, some input data might be unavailable and left blank
public func ObsAddFrArray( _ xa_obs: UnsafeMutablePointer<Double> ) -> Int64 {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<Double> ) -> Int64

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "ObsAddFrArray"), to: FunctionSignature.self)

    return function(xa_obs)
}

// Works like ObsAddFrArray but designed for Matlab
public func ObsAddFrArrayML( _ xa_obs: UnsafeMutablePointer<Double>, _ obsKey: UnsafeMutablePointer<Int64> ) {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Int64> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "ObsAddFrArrayML"), to: FunctionSignature.self)

    function(xa_obs, obsKey)
}

// Retrieves all observation data in a single function call. Depending on the observation type, some input data might be unavailable
public func ObsGetAllFields( _ obsKey: Int64,
                             _ secClass: UnsafeMutablePointer<CChar>,
                             _ satNum: UnsafeMutablePointer<Int32>,
                             _ senNum: UnsafeMutablePointer<Int32>,
                             _ obsTimeDs50utc: UnsafeMutablePointer<Double>,
                             _ elOrDec: UnsafeMutablePointer<Double>,
                             _ azOrRA: UnsafeMutablePointer<Double>,
                             _ range: UnsafeMutablePointer<Double>,
                             _ rangeRate: UnsafeMutablePointer<Double>,
                             _ elRate: UnsafeMutablePointer<Double>,
                             _ azRate: UnsafeMutablePointer<Double>,
                             _ rangeAccel: UnsafeMutablePointer<Double>,
                             _ obsType: UnsafeMutablePointer<CChar>,
                             _ trackInd: UnsafeMutablePointer<Int32>,
                             _ ASTAT: UnsafeMutablePointer<Int32>,
                             _ siteTag: UnsafeMutablePointer<Int32>,
                             _ spadocTag: UnsafeMutablePointer<Int32>,
                             _ pos: UnsafeMutablePointer<Double>,
                             _ vel: UnsafeMutablePointer<Double>,
                             _ extArr: UnsafeMutablePointer<Double> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "ObsGetAllFields"), to: FunctionSignature.self)

    return function(obsKey, secClass, satNum, senNum, obsTimeDs50utc, elOrDec, azOrRA, range, rangeRate, elRate, azRate, rangeAccel, obsType, trackInd, ASTAT, siteTag, spadocTag, pos, vel, extArr)
}

// Retrieves observation data and stored it in the passing array. Depending on the observation type, some data fields might be unavailable
// See ObsGetField for description of xa_obs elements
public func ObsDataToArray( _ obsKey: Int64, _ xa_obs: UnsafeMutablePointer<Double> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   UnsafeMutablePointer<Double> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "ObsDataToArray"), to: FunctionSignature.self)

    return function(obsKey, xa_obs)
}

// Updates existing observation data with the provided new data
public func ObsUpdateFrFields( _ obsKey: Int64,
                               _ secClass: CChar,
                               _ elOrDec: Double,
                               _ azOrRA: Double,
                               _ range: Double,
                               _ rangeRate: Double,
                               _ elRate: Double,
                               _ azRate: Double,
                               _ rangeAccel: Double,
                               _ obsType: CChar,
                               _ trackInd: Int32,
                               _ ASTAT: Int32,
                               _ siteTag: Int32,
                               _ spadocTag: Int32,
                               _ pos: UnsafeMutablePointer<Double>,
                               _ vel: UnsafeMutablePointer<Double>,
                               _ extArr: UnsafeMutablePointer<Double> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   CChar,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   CChar,
                                                   Int32,
                                                   Int32,
                                                   Int32,
                                                   Int32,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "ObsUpdateFrFields"), to: FunctionSignature.self)

    return function(obsKey, secClass, elOrDec, azOrRA, range, rangeRate, elRate, azRate, rangeAccel, obsType, trackInd, ASTAT, siteTag, spadocTag, pos, vel, extArr)
}

// Retrieves the value of a specific field of an observation
public func ObsGetField( _ obsKey: Int64,
                         _ xf_Obs: Int32,
                         _ strValue: UnsafeMutablePointer<CChar> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   Int32,
                                                   UnsafeMutablePointer<CChar> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "ObsGetField"), to: FunctionSignature.self)

    return function(obsKey, xf_Obs, strValue)
}

// Updates the value of a field of an observation
// See ObsGetField for a description of the xf_Obs parameter.
// Satellite number, sensor number, and observation time are not allowed to be updated.
public func ObsSetField( _ obsKey: Int64,
                         _ xf_Obs: Int32,
                         _ strValue: UnsafeMutablePointer<CChar> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   Int32,
                                                   UnsafeMutablePointer<CChar> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "ObsSetField"), to: FunctionSignature.self)

    return function(obsKey, xf_Obs, strValue)
}

// Returns observation in B3-card string
public func ObsGetB3Card( _ obsKey: Int64, _ b3Card: UnsafeMutablePointer<CChar> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   UnsafeMutablePointer<CChar> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "ObsGetB3Card"), to: FunctionSignature.self)

    return function(obsKey, b3Card)
}

// Returns observation in TTY-card string
public func ObsGetTTYCard( _ obsKey: Int64,
                           _ ttyCard1: UnsafeMutablePointer<CChar>,
                           _ ttyCard2: UnsafeMutablePointer<CChar> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<CChar> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "ObsGetTTYCard"), to: FunctionSignature.self)

    return function(obsKey, ttyCard1, ttyCard2)
}

// Returns observation in CSV-format string
public func ObsGetCsv( _ obsKey: Int64, _ csvline: UnsafeMutablePointer<CChar> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   UnsafeMutablePointer<CChar> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "ObsGetCsv"), to: FunctionSignature.self)

    return function(obsKey, csvline)
}

// Constructs a B3-card string from the input observation data fields
public func ObsFieldsToB3Card( _ secClass: CChar,
                               _ satNum: Int32,
                               _ senNum: Int32,
                               _ obsTimeDs50utc: Double,
                               _ elOrDec: Double,
                               _ azOrRA: Double,
                               _ range: Double,
                               _ rangeRate: Double,
                               _ elRate: Double,
                               _ azRate: Double,
                               _ rangeAccel: Double,
                               _ obsType: CChar,
                               _ trackInd: Int32,
                               _ ASTAT: Int32,
                               _ siteTag: Int32,
                               _ spadocTag: Int32,
                               _ pos: UnsafeMutablePointer<Double>,
                               _ b3Card: UnsafeMutablePointer<CChar> ) {

    typealias FunctionSignature = @convention(c) ( CChar,
                                                   Int32,
                                                   Int32,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   CChar,
                                                   Int32,
                                                   Int32,
                                                   Int32,
                                                   Int32,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<CChar> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "ObsFieldsToB3Card"), to: FunctionSignature.self)

    function(secClass, satNum, senNum, obsTimeDs50utc, elOrDec, azOrRA, range, rangeRate, elRate, azRate, rangeAccel, obsType, trackInd, ASTAT, siteTag, spadocTag, pos, b3Card)
}

// Constructs a csv string from the input observation data fields
public func ObsFieldsToCsv( _ secClass: CChar,
                            _ satNum: Int32,
                            _ senNum: Int32,
                            _ obsTimeDs50utc: Double,
                            _ elOrDec: Double,
                            _ azOrRA: Double,
                            _ range: Double,
                            _ rangeRate: Double,
                            _ elRate: Double,
                            _ azRate: Double,
                            _ rangeAccel: Double,
                            _ obsType: CChar,
                            _ trackInd: Int32,
                            _ ASTAT: Int32,
                            _ siteTag: Int32,
                            _ spadocTag: Int32,
                            _ pos: UnsafeMutablePointer<Double>,
                            _ csvLine: UnsafeMutablePointer<CChar> ) {

    typealias FunctionSignature = @convention(c) ( CChar,
                                                   Int32,
                                                   Int32,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   CChar,
                                                   Int32,
                                                   Int32,
                                                   Int32,
                                                   Int32,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<CChar> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "ObsFieldsToCsv"), to: FunctionSignature.self)

    function(secClass, satNum, senNum, obsTimeDs50utc, elOrDec, azOrRA, range, rangeRate, elRate, azRate, rangeAccel, obsType, trackInd, ASTAT, siteTag, spadocTag, pos, csvLine)
}

// Constructs a TTY-card string from the input observation data fields
public func ObsFieldsToTTYCard( _ secClass: CChar,
                                _ satNum: Int32,
                                _ senNum: Int32,
                                _ obsTimeDs50utc: Double,
                                _ elOrDec: Double,
                                _ azOrRA: Double,
                                _ range: Double,
                                _ rangeRate: Double,
                                _ elRate: Double,
                                _ azRate: Double,
                                _ rangeAccel: Double,
                                _ obsType: CChar,
                                _ pos: UnsafeMutablePointer<Double>,
                                _ ttyCard1: UnsafeMutablePointer<CChar>,
                                _ ttyCard2: UnsafeMutablePointer<CChar> ) {

    typealias FunctionSignature = @convention(c) ( CChar,
                                                   Int32,
                                                   Int32,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   CChar,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<CChar> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "ObsFieldsToTTYCard"), to: FunctionSignature.self)

    function(secClass, satNum, senNum, obsTimeDs50utc, elOrDec, azOrRA, range, rangeRate, elRate, azRate, rangeAccel, obsType, pos, ttyCard1, ttyCard2)
}

// Computes an obsKey from individually provided fields
public func ObsFieldsToObsKey( _ satNum: Int32,
                               _ senNum: Int32,
                               _ obsTimeDs50utc: Double ) -> Int64 {

    typealias FunctionSignature = @convention(c) ( Int32,
                                                   Int32,
                                                   Double ) -> Int64

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "ObsFieldsToObsKey"), to: FunctionSignature.self)

    return function(satNum, senNum, obsTimeDs50utc)
}

// Works like ObsFieldsToObsKey but designed for Matlab
public func ObsFieldsToObsKeyML( _ satNum: Int32,
                                 _ senNum: Int32,
                                 _ obsTimeDs50utc: Double,
                                 _ obsKey: UnsafeMutablePointer<Int64> ) {

    typealias FunctionSignature = @convention(c) ( Int32,
                                                   Int32,
                                                   Double,
                                                   UnsafeMutablePointer<Int64> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "ObsFieldsToObsKeyML"), to: FunctionSignature.self)

    function(satNum, senNum, obsTimeDs50utc, obsKey)
}

// Parses observation data from a B3-card (or B3E) string / one-line TTY / or CSV - Converts obs data to TEME of Date if neccessary
public func ObsB3Parse( _ b3ObsCard: UnsafeMutablePointer<CChar>,
                        _ secClass: UnsafeMutablePointer<CChar>,
                        _ satNum: UnsafeMutablePointer<Int32>,
                        _ senNum: UnsafeMutablePointer<Int32>,
                        _ obsTimeDs50utc: UnsafeMutablePointer<Double>,
                        _ elOrDec: UnsafeMutablePointer<Double>,
                        _ azOrRA: UnsafeMutablePointer<Double>,
                        _ range: UnsafeMutablePointer<Double>,
                        _ rangeRate: UnsafeMutablePointer<Double>,
                        _ elRate: UnsafeMutablePointer<Double>,
                        _ azRate: UnsafeMutablePointer<Double>,
                        _ rangeAccel: UnsafeMutablePointer<Double>,
                        _ obsType: UnsafeMutablePointer<CChar>,
                        _ trackInd: UnsafeMutablePointer<Int32>,
                        _ ASTAT: UnsafeMutablePointer<Int32>,
                        _ siteTag: UnsafeMutablePointer<Int32>,
                        _ spadocTag: UnsafeMutablePointer<Int32>,
                        _ pos: UnsafeMutablePointer<Double> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Double> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "ObsB3Parse"), to: FunctionSignature.self)

    return function(b3ObsCard, secClass, satNum, senNum, obsTimeDs50utc, elOrDec, azOrRA, range, rangeRate, elRate, azRate, rangeAccel, obsType, trackInd, ASTAT, siteTag, spadocTag, pos)
}

// Parses any observation data format (B3-card (or B3E) string / one or two line TTY / CSV - No conversion takes place
public func ObsParse( _ line1: UnsafeMutablePointer<CChar>,
                      _ line2: UnsafeMutablePointer<CChar>,
                      _ xa_obs: UnsafeMutablePointer<Double> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<Double> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "ObsParse"), to: FunctionSignature.self)

    return function(line1, line2, xa_obs)
}

// Loads observation data from an input text file and group them together in the specified groupd id (gid).
// This allows the users to easily manage (load/retrieve/remove/save) a group of observations using the group id (gid)
public func ObsLoadFileGID( _ obsFile: UnsafeMutablePointer<CChar>, _ gid: Int32 ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar>,
                                                   Int32 ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "ObsLoadFileGID"), to: FunctionSignature.self)

    return function(obsFile, gid)
}

// Saves the currently loaded obs data belong to the specified group id (gid) to a file 
public func ObsSaveFileGID( _ obsFile: UnsafeMutablePointer<CChar>,
                            _ gid: Int32,
                            _ saveMode: Int32,
                            _ obsForm: Int32 ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar>,
                                                   Int32,
                                                   Int32,
                                                   Int32 ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "ObsSaveFileGID"), to: FunctionSignature.self)

    return function(obsFile, gid, saveMode, obsForm)
}

// Removes all observations belong to the specified group id (gid) from the set of currently loaded observations
public func ObsRemoveGID( _ gid: Int32 ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int32 ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "ObsRemoveGID"), to: FunctionSignature.self)

    return function(gid)
}

// Returns the number of observations currently loaded that have the same gid
public func ObsGetCountGID( _ gid: Int32 ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int32 ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "ObsGetCountGID"), to: FunctionSignature.self)

    return function(gid)
}

// Retrieves all of the currently loaded obsKeys that have the same gid. These obsKeys can be used to access the internal data for the observations
// Sort options (order):
// (+/-)1 = (descending/ascending) time, sensor, obsType, elev
// (+/-)2 = (descending/ascending) time, elevation
// (+/-)3 = (descending/ascending) time, sensor, otype, el, satno
// (+/-)4 = (descending/ascending) sensor, satno, time, elev
// (+/-)5 = (descending/ascending) sensor, time, elevation
// (+/-)6 = (descending/ascending) sensor, satno, obsType, time, elev
// (+/-)7 = (descending/ascending) satno, time, sensor, otype, el
// (+/-)8 = (reversed/same)        order as obs were read
// 9 : as is in the tree
public func ObsGetLoadedGID( _ gid: Int32,
                             _ order: Int32,
                             _ obsKeys: UnsafeMutablePointer<Int64> ) {

    typealias FunctionSignature = @convention(c) ( Int32,
                                                   Int32,
                                                   UnsafeMutablePointer<Int64> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "ObsGetLoadedGID"), to: FunctionSignature.self)

    function(gid, order, obsKeys)
}

// Converts obs type from character to integer
public func ObsTypeCToI( _ obsTypeChar: CChar ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( CChar ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "ObsTypeCToI"), to: FunctionSignature.self)

    return function(obsTypeChar)
}

// Converts obs type from integer to character
public func ObsTypeIToC( _ obsTypeInt: Int32 ) -> CChar {

    typealias FunctionSignature = @convention(c) ( Int32 ) -> CChar

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "ObsTypeIToC"), to: FunctionSignature.self)

    return function(obsTypeInt)
}

// Resets obs selection settings
public func ObsResetSelObs(  ) {

    typealias FunctionSignature = @convention(c) (  ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "ObsResetSelObs"), to: FunctionSignature.self)

    function()
}

// Computes other states of the input observation
// <br>
// The table below indicates which index values correspond to which fields in the xa_obState array.
// <table>
// <caption>table</caption>
// <tr>
// <td><b>Index</b></td>
// <td><b>Index Interpretation</b></td>
// </tr>
// <tr><td>0</td><td>Satellite number</td></tr>
// <tr><td>1</td><td>Sensor number</td></tr>
// <tr><td>2</td><td>Observation time in DS50UTC</td></tr>
// <tr><td>10</td><td>Position X/ECI (km)</td></tr>
// <tr><td>11</td><td>Position Y/ECI (km)</td></tr>
// <tr><td>12</td><td>Position Z/ECI (km)</td></tr>
// <tr><td>13</td><td>Velocity X/ECI (km/s)</td></tr>
// <tr><td>14</td><td>Velocity Y/ECI (km/s)</td></tr>
// <tr><td>15</td><td>Velocity Z/ECI (km/s)</td></tr>
// <tr><td>16</td><td>Geodetic latitude (deg)</td></tr>
// <tr><td>17</td><td>Geodetic longitude (deg)</td></tr>
// <tr><td>18</td><td>Geodetic height (km)</td></tr>
// <tr><td>19</td><td>Position X/EFG (km)</td></tr>
// <tr><td>20</td><td>Position Y/EFG (km)</td></tr>
// <tr><td>21</td><td>Position Z/EFG (km)</td></tr>
// </table>
public func ObsGetStates( _ obsKey: Int64,
                          _ range_km: Double,
                          _ xa_obState: UnsafeMutablePointer<Double> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   Double,
                                                   UnsafeMutablePointer<Double> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "ObsGetStates"), to: FunctionSignature.self)

    return function(obsKey, range_km, xa_obState)
}

// Computes observation states from the observation data
// See ObsGetStates for a list of the values for the xa_obState parameter.
public func ObsDataToStates( _ xa_obs: UnsafeMutablePointer<Double>, _ xa_obState: UnsafeMutablePointer<Double> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "ObsDataToStates"), to: FunctionSignature.self)

    return function(xa_obs, xa_obState)
}

// Reconstructs obs string (B3-card/one or two line TTY/CSV) from obs data in the input array xa_obs
public func ObsArrToLines( _ xa_obs: UnsafeMutablePointer<Double>,
                           _ obsForm: Int32,
                           _ line1: UnsafeMutablePointer<CChar>,
                           _ line2: UnsafeMutablePointer<CChar> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<Double>,
                                                   Int32,
                                                   UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<CChar> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "ObsArrToLines"), to: FunctionSignature.self)

    return function(xa_obs, obsForm, line1, line2)
}

// Sets OBS key mode
// This mode can also be turned on if the user loads an input text file that includes this line - "AS_DMA_OBS_ON" -
// and is currently calling any of these methods: DllMainLoadFile(), or ObsLoadFile()
public func SetObsKeyMode( _ obs_keyMode: Int32 ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int32 ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SetObsKeyMode"), to: FunctionSignature.self)

    return function(obs_keyMode)
}

// Gets current OBS key mode
public func GetObsKeyMode(  ) -> Int32 {

    typealias FunctionSignature = @convention(c) (  ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "GetObsKeyMode"), to: FunctionSignature.self)

    return function()
}

// Returs the satellite number associated with the input obsKey
public func SatNumFrObsKey( _ obsKey: Int64 ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64 ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SatNumFrObsKey"), to: FunctionSignature.self)

    return function(obsKey)
}

// Returs the sensor number associated with the input obsKey
public func SenNumFrObsKey( _ obsKey: Int64 ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64 ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SenNumFrObsKey"), to: FunctionSignature.self)

    return function(obsKey)
}

// Equinox indicator
//time of observation
public let EQUINOX_OBSTIME = 0
//time @ 0 Jan Year of Date
public let EQUINOX_OBSYEAR = 1
//J2000
public let EQUINOX_J2K     = 2
//B1950
public let EQUINOX_B1950   = 3

// Indexes for sorting ob
// Sort options:
// (+/-) 1 = (descending/ascending) time, sensor, obsType, elev
// (+/-) 2 = (descending/ascending) time, elevation
// (+/-) 3 = (descending/ascending) time, sensor, otype, el, satno
// (+/-) 4 = (descending/ascending) sensor, satno, time, elev
// (+/-) 5 = (descending/ascending) sensor, time, elevation
// (+/-) 6 = (descending/ascending) sensor, satno, obsType, time, elev
// (+/-) 7 = (descending/ascending) satno, time, sensor, otype, el
// (+/-)10 = (descending/ascending) satno, sensor, time

//sort order is time, sensor, obsType, elev (negative value for reverse order)
public let SORT_TIMESENTYPEEL      =  1
//sort order is time, elevation (negative value for reverse order)
public let SORT_TIMEEL             =  2
//sort order is time, sensor, otype, el, satno (negative value for reverse order)
public let SORT_TIMESENTYPEELSAT   =  3
//sort order is sensor, satno, time, elev (negative value for reverse order)
public let SORT_SENSATTIMEEL       =  4
//sort order is sensor, time, elevation (negative value for reverse order)
public let SORT_SENTIMEEL          =  5
//sort order is sensor, satno, obsType, time, elev (negative value for reverse order)
public let SORT_SENSATTYPETIMEEL   =  6
//sort order is satno, time, sensor, otype, el (negative value for reverse order)
public let SORT_SATTIMESENTYPEEL   =  7
//sort order is the order of obs when they were loaded
public let SORT_ORDERASREAD        =  8
//sort order is satno, sensor, time (negative value for reverse order)
public let SORT_SATSENTIME         = 10


// Indexes of different obs file format
//B3 obs format
public let OBSFORM_B3   = 0
//Transmission obs format
public let OBSFORM_TTY  = 1
//CSV obs format
public let OBSFORM_CSV  = 2
//Radio Frequency (TDOA/FDOA) observations
public let OBSFORM_RF   = 3

public let BADOBSKEY = -1
public let DUPOBSKEY = 0


// Different key mode options for obsKey
//Default - duplicate obs can not be loaded in binary tree
public let OBS_KEYMODE_NODUP  = 0
//Allow duplicate obs to be loaded and have direct memory access (DMA - no duplication check and no binary tree)
public let OBS_KEYMODE_DMA    = 1

// CSV sigma type indicator
public let CSVSIGMATYPE = 7

// Indexes of Observation data fields
//security classification
public let XF_OBS_SECCLASS     =  1
//satellite number
public let XF_OBS_SATNUM       =  2
//sensor number
public let XF_OBS_SENNUM       =  3
//observation time in days since 1950 UTC
public let XF_OBS_DS50UTC      =  4
//elevation (deg)
public let XF_OBS_ELEVATION    =  5
//declination (deg)
public let XF_OBS_DECLINATION  =  6
//azimuth (deg)
public let XF_OBS_AZIMUTH      =  7
//right-ascension (deg)
public let XF_OBS_RA           =  8
//range (km)
public let XF_OBS_RANGE        =  9
//range rate (km/s)
public let XF_OBS_RANGERATE    = 10
//elevation rate (deg/s)
public let XF_OBS_ELRATE       = 11
//azimuth rate (deg/s)
public let XF_OBS_AZRATE       = 12
//range acceleration (km/s^2)
public let XF_OBS_RANGEACCEL   = 13
//observation type
public let XF_OBS_OBSTYPE      = 14
//track position indicator (3=start track ob, 4=in track ob, 5=end track ob)
public let XF_OBS_TRACKIND     = 15
//association status assigned by SPADOC
public let XF_OBS_ASTAT        = 16
//original satellite number
public let XF_OBS_SITETAG      = 17
//SPADOC-asssigned tag number
public let XF_OBS_SPADOCTAG    = 18
//position X/EFG (km)
public let XF_OBS_POSE         = 19
//position Y/EFG (km)
public let XF_OBS_POSF         = 20
//position Z/EFG (km)
public let XF_OBS_POSG         = 21
//position X/ECI (km)
public let XF_OBS_POSX         = 22
//position Y/ECI (km)
public let XF_OBS_POSY         = 23
//position Z/ECI (km)
public let XF_OBS_POSZ         = 24

//Principal Polarization RCS
public let XF_OBS_RCS_PP       = 25
//Orthogonal Polarization RCS
public let XF_OBS_RCS_OP       = 26
//Principal Polarization RCS sigma
public let XF_OBS_RCS_PPS      = 27
//Orthogonal Polarization RCS sigma
public let XF_OBS_RCS_OPS      = 28
//Radar Signal to Noise Ratio
public let XF_OBS_SNR          = 29
//Azimuth of Boresite
public let XF_OBS_BORE_AZ      = 30
//Elevation of Boresite
public let XF_OBS_BORE_EL      = 31
//Apparent Visual magnitude
public let XF_OBS_VISMAG       = 32
//GEO Normalized Visual magnitude
public let XF_OBS_VISMAG_NORM  = 33
//Solar Phase Angle
public let XF_OBS_SOL_PHASE    = 34
//Frame Number
public let XF_OBS_FRAME        = 35
//Aberration correction indicator (0=YES, 1=NO)
public let XF_OBS_ABERRATION   = 36
//Either R" or T; ROTAS=General Perturbations, TRACK=Special Perturbations
public let XF_OBS_ASTAT_METHOD = 37

// Indexes of observation data in an array
//security classification, 1 = Unclassified, 2 = Confidential, 3 = Secret
public let XA_OBS_SECCLASS     =  0
//satellite number
public let XA_OBS_SATNUM       =  1
//sensor number
public let XA_OBS_SENNUM       =  2
//observation time in days since 1950 UTC
public let XA_OBS_DS50UTC      =  3
//elevation (for ob type 1, 2, 3, 4, 8) or declination (for ob type 5, 9) (deg)
public let XA_OBS_ELORDEC      =  4
//azimuth (for ob type 1, 2, 3, 4, 8) or right ascesion (for ob type 5, 9) (deg)
public let XA_OBS_AZORRA       =  5
//range (km)
public let XA_OBS_RANGE        =  6
//range rate (km/s) for non-optical obs type
public let XA_OBS_RANGERATE    =  7
//elevation rate (deg/s)
public let XA_OBS_ELRATE       =  8
//azimuth rate (deg/s)
public let XA_OBS_AZRATE       =  9
//range acceleration (km/s^2)
public let XA_OBS_RANGEACCEL   = 10
//observation type
public let XA_OBS_OBSTYPE      = 11
//track position indicator (3=start track ob, 4=in track ob, 5=end track ob)
public let XA_OBS_TRACKIND     = 12
//association status assigned by SPADOC
public let XA_OBS_ASTAT        = 13
//original satellite number
public let XA_OBS_SITETAG      = 14
//SPADOC-asssigned tag number
public let XA_OBS_SPADOCTAG    = 15
//position X/ECI or X/EFG (km)
public let XA_OBS_POSX         = 16
//position Y/ECI or Y/EFG (km)
public let XA_OBS_POSY         = 17
//position Z/ECI or Z/EFG (km)
public let XA_OBS_POSZ         = 18
//velocity X/ECI (km/s)  (or Edot/EFG (km) for ob type 7 TTY)
public let XA_OBS_VELX         = 19
//velocity Y/ECI (km/s)  (or Fdot/EFG (km) for ob type 7 TTY)
public let XA_OBS_VELY         = 20
//velocity Z/ECI (km/s)  (or Gdot/EFG (km) for ob type 7 TTY)
public let XA_OBS_VELZ         = 21
//year of equinox indicator for obs type 5/9 (0= Time of obs, 1= 0 Jan of date, 2= J2000, 3= B1950)
public let XA_OBS_YROFEQNX     = 22
//aberration indicator, 0-not corrected, 1-corrceted
public let XA_OBS_ABERRATION   = 23

//AZ/RA bias (deg)
public let XA_OBS_AZORRABIAS   = 33
//EL/DEC bias (deg)
public let XA_OBS_ELORDECBIAS  = 34
//Range bias (km)
public let XA_OBS_RGBIAS       = 35
//Range-rate bias (km/sec)
public let XA_OBS_RRBIAS       = 36
//Time bias (sec)
public let XA_OBS_TIMEBIAS     = 37
//AZ/RA rate bias (deg/sec)
public let XA_OBS_RAZORRABIAS  = 38
//EL/DEC rate bias (deg/sec)
public let XA_OBS_RELORDECBIAS = 39

//individual obs's sigmas type (0: N/A, 6: 6 elements, 21: 21 elements, 7: this is CSV obs)
public let XA_OBS_SIGMATYPE    = 40
//sigma - covariance element 1 - 6 elemens - Az sigma
public let XA_OBS_SIGMAEL1     = 41
//sigma - covariance element 2 - 6 elemens - El sigma
public let XA_OBS_SIGMAEL2     = 42
//sigma - covariance element 3 - 6 elemens - Range sigma
public let XA_OBS_SIGMAEL3     = 43
//sigma - covariance element 4 - 6 elemens - Range rate sigma
public let XA_OBS_SIGMAEL4     = 44
//sigma - covariance element 5 - 6 elemens - Az rate sigma
public let XA_OBS_SIGMAEL5     = 45
//sigma - covariance element 6 - 6 elemens - El rate sigma
public let XA_OBS_SIGMAEL6     = 46
//sigma - covariance element 7
public let XA_OBS_SIGMAEL7     = 47
//sigma - covariance element 8
public let XA_OBS_SIGMAEL8     = 48
//sigma - covariance element 9
public let XA_OBS_SIGMAEL9     = 49
//sigma - covariance element 10
public let XA_OBS_SIGMAEL10    = 50
//sigma - covariance element 11
public let XA_OBS_SIGMAEL11    = 51
//sigma - covariance element 12
public let XA_OBS_SIGMAEL12    = 52
//sigma - covariance element 13
public let XA_OBS_SIGMAEL13    = 53
//sigma - covariance element 14
public let XA_OBS_SIGMAEL14    = 54
//sigma - covariance element 15
public let XA_OBS_SIGMAEL15    = 55
//sigma - covariance element 16
public let XA_OBS_SIGMAEL16    = 56
//sigma - covariance element 17
public let XA_OBS_SIGMAEL17    = 57
//sigma - covariance element 18
public let XA_OBS_SIGMAEL18    = 58
//sigma - covariance element 19
public let XA_OBS_SIGMAEL19    = 59
//sigma - covariance element 20
public let XA_OBS_SIGMAEL20    = 60
//sigma - covariance element 21
public let XA_OBS_SIGMAEL21    = 61

public let XA_OBS_SIZE         = 64

// Indexes of observation data in an array (Obs Type CSV specific)
//security classification, 1 = Unclassified, 2 = Confidential, 3 = Secret
public let XA_OTCSV_SECCLASS     =  0
//satellite number
public let XA_OTCSV_SATNUM       =  1
//sensor number
public let XA_OTCSV_SENNUM       =  2
//observation time in days since 1950 UTC
public let XA_OTCSV_DS50UTC      =  3
//elevation (for ob type 1, 2, 3, 4, 8) or declination (for ob type 5, 9) (deg)
public let XA_OTCSV_ELORDEC      =  4
//azimuth (for ob type 1, 2, 3, 4, 8) or right ascesion (for ob type 5, 9) (deg)
public let XA_OTCSV_AZORRA       =  5
//range (km)
public let XA_OTCSV_RANGE        =  6
//range rate (km/s) for non-optical obs type
public let XA_OTCSV_RANGERATE    =  7
//elevation rate (deg/s)
public let XA_OTCSV_ELRATE       =  8
//azimuth rate (deg/s)
public let XA_OTCSV_AZRATE       =  9
//range acceleration (km/s^2)
public let XA_OTCSV_RANGEACCEL   = 10
//observation type
public let XA_OTCSV_OBSTYPE      = 11
//track position indicator (3=start track ob, 4=in track ob, 5=end track ob)
public let XA_OTCSV_TRACKIND     = 12
//association status assigned by SPADOC
public let XA_OTCSV_ASTAT        = 13
//original satellite number
public let XA_OTCSV_SITETAG      = 14
//SPADOC-asssigned tag number
public let XA_OTCSV_SPADOCTAG    = 15
//position X/ECI or X/EFG (km)
public let XA_OTCSV_POSX         = 16
//position Y/ECI or Y/EFG (km)
public let XA_OTCSV_POSY         = 17
//position Z/ECI or Z/EFG (km)
public let XA_OTCSV_POSZ         = 18
//velocity X/ECI (km/s)  (or Edot/EFG (km) for ob type 7 TTY)
public let XA_OTCSV_VELX         = 19
//velocity Y/ECI (km/s)  (or Fdot/EFG (km) for ob type 7 TTY)
public let XA_OTCSV_VELY         = 20
//velocity Z/ECI (km/s)  (or Gdot/EFG (km) for ob type 7 TTY)
public let XA_OTCSV_VELZ         = 21
//year of equinox indicator for obs type 5/9 (0= Time of obs, 1= 0 Jan of date, 2= J2000, 3= B1950)
public let XA_OTCSV_YROFEQNX     = 22

//Principal Polarization RCS
public let XA_OTCSV_RCS_PP       = 23
//Orthogonal Polarization RCS
public let XA_OTCSV_RCS_OP       = 24
//Principal Polarization RCS sigma
public let XA_OTCSV_RCS_PPS      = 25
//Orthogonal Polarization RCS sigma
public let XA_OTCSV_RCS_OPS      = 26
//Radar Signal to Noise Ratio
public let XA_OTCSV_SNR          = 27
//Azimuth of Boresite
public let XA_OTCSV_BORE_AZ      = 28
//Elevation of Boresite
public let XA_OTCSV_BORE_EL      = 29
//Apparent Visual magnitude
public let XA_OTCSV_VISMAG       = 30
//GEO Normalized Visual magnitude
public let XA_OTCSV_VISMAG_NORM  = 31
//Solar Phase Angle
public let XA_OTCSV_SOL_PHASE    = 32
//Frame Number
public let XA_OTCSV_FRAME        = 33
//Aberration correction indicator (0=YES, 1=NO)
public let XA_OTCSV_ABERRATION   = 34
//0 = ROTAS, 1 = TRACK
public let XA_OTCSV_ASTAT_METHOD = 35

//must equal to 7 to signify this is CSV format
public let XA_OTCSV_SIGMATYPE    = 40
//sigma - covariance element 1 - Az sigma
public let XA_OTCSV_SIGMAEL1     = 41
//sigma - covariance element 2 - El sigma
public let XA_OTCSV_SIGMAEL2     = 42
//sigma - covariance element 3 - Range sigma
public let XA_OTCSV_SIGMAEL3     = 43
//sigma - covariance element 4 - Range rate sigma
public let XA_OTCSV_SIGMAEL4     = 44
//sigma - covariance element 5 - Az rate sigma
public let XA_OTCSV_SIGMAEL5     = 45
//sigma - covariance element 6 - El rate sigma
public let XA_OTCSV_SIGMAEL6     = 46
//sigma - covariance element 7 - Time sigma
public let XA_OTCSV_SIGMAEL7     = 47
//AZ/RA bias
public let XA_OTCSV_BIAS1        = 48
//EL/DEC bias
public let XA_OTCSV_BIAS2        = 49
//Range bias
public let XA_OTCSV_BIAS3        = 50
//Range-rate bias
public let XA_OTCSV_BIAS4        = 51
//Time bias
public let XA_OTCSV_BIAS5        = 52


public let XA_OTCSV_SIZE         = 64

// Indexes of observation data in an array
//satellite number
public let XA_OBSTATE_SATNUM       =  0
//sensor number
public let XA_OBSTATE_SENNUM       =  1
//observation time in days since 1950 UTC
public let XA_OBSTATE_DS50UTC      =  2

//position X/ECI (km)
public let XA_OBSTATE_POSX         = 10
//position Y/ECI (km)
public let XA_OBSTATE_POSY         = 11
//position Z/ECI (km)
public let XA_OBSTATE_POSZ         = 12
//velocity X/ECI (km/s)
public let XA_OBSTATE_VELX         = 13
//velocity Y/ECI (km/s)
public let XA_OBSTATE_VELY         = 14
//velocity Z/ECI (km/s)
public let XA_OBSTATE_VELZ         = 15
//geodetic latitude (deg)
public let XA_OBSTATE_LAT          = 16
//geodetic longitude (deg)
public let XA_OBSTATE_LON          = 17
//geodetic height (km)
public let XA_OBSTATE_HGHT         = 18
//position X/EFG (km)
public let XA_OBSTATE_POSE         = 19
//position Y/EFG (km)
public let XA_OBSTATE_POSF         = 20
//position Z/EFG (km)
public let XA_OBSTATE_POSG         = 21


public let XA_OBSTATE_SIZE         = 64

// Indexes of observation data available for each obs type (OT0: obs type 0, OT1: obs type 1, ...)
// All obs types have these common data fields  XA_OBS_SECCLASS = 0, XA_OBS_SATNUM = 1, and  XA_OBS_SENNUM = 2
//observation time in days since 1950 UTC
public let XA_OT0_DS50UTC   =  3
//range rate (km/s)
public let XA_OT0_RANGERATE =  7

//observation time in days since 1950 UTC
public let XA_OT1_DS50UTC   =  3
//elevation (deg)
public let XA_OT1_ELEVATION =  4
//azimuth (deg)
public let XA_OT1_AZIMUTH   =  5

//observation time in days since 1950 UTC
public let XA_OT2_DS50UTC   =  3
//elevation (deg)
public let XA_OT2_ELEVATION =  4
//azimuth (deg)
public let XA_OT2_AZIMUTH   =  5
//range (km)
public let XA_OT2_RANGE     =  6

//observation time in days since 1950 UTC
public let XA_OT3_DS50UTC   =  3
//elevation (deg)
public let XA_OT3_ELEVATION =  4
//azimuth (deg)
public let XA_OT3_AZIMUTH   =  5
//range (km)
public let XA_OT3_RANGE     =  6
//range rate (km/s)
public let XA_OT3_RANGERATE =  7

//observation time in days since 1950 UTC
public let XA_OT4_DS50UTC   =  3
//elevation (deg)
public let XA_OT4_ELEVATION =  4
//azimuth (deg)
public let XA_OT4_AZIMUTH   =  5
//range (km)
public let XA_OT4_RANGE     =  6
//range rate (km/s)
public let XA_OT4_RANGERATE =  7
//elevation rate (deg/s)
public let XA_OT4_ELRATE    =  8
//azimuth rate (deg/s)
public let XA_OT4_AZRATE    =  9
//range acceleration (km/s^2)
public let XA_OT4_RANGEACCEL = 10

//observation time in days since 1950 UTC
public let XA_OT5_DS50UTC   =  3
//declination (deg)
public let XA_OT5_DECL      =  4
//right ascesion (deg)
public let XA_OT5_RIGHTASC  =  5
//year of equinox indicator (0= Time of obs, 1= 0 Jan of date, 2= J2000, 3= B1950)
public let XA_OT5_YROFEQNX  = 22
//ABERRATION INDICATOR, 0-NOT CORRECTED, 1-CORRCETED
public let XA_OT5_ABERRATION = 23

//observation time in days since 1950 UTC
public let XA_OT6_DS50UTC   =  3
//range (km)
public let XA_OT6_RANGE     =  6

//observation time in days since 1950 UTC
public let XA_OT8_DS50UTC   =  3
//elevation (deg)
public let XA_OT8_ELEVATION =  4
//azimuth (deg)
public let XA_OT8_AZIMUTH   =  5
//optional - range (km)
public let XA_OT8_RANGE     =  6
//orbiting sensor position X/EFG (km)
public let XA_OT8_POSE      = 16
//orbiting sensor position Y/EFG (km)
public let XA_OT8_POSF      = 17
//orbiting sensor position Z/EFG (km)
public let XA_OT8_POSG      = 18

//observation time in days since 1950 UTC
public let XA_OT9_DS50UTC   =  3
//declination (deg)
public let XA_OT9_DECL      =  4
//right ascesion (deg)
public let XA_OT9_RIGHTASC  =  5
//optional - range (km)
public let XA_OT9_RANGE     =  6
//orbiting sensor position X/EFG (km)
public let XA_OT9_POSE      = 16
//orbiting sensor position Y/EFG (km)
public let XA_OT9_POSF      = 17
//orbiting sensor position Z/EFG (km)
public let XA_OT9_POSG      = 18
//year of equinox indicator (0= Time of obs, 1= 0 Jan of date, 2= J2000, 3= B1950)
public let XA_OT9_YROFEQNX  = 22
//ABERRATION INDICATOR, 0-NOT CORRECTED, 1-CORRCETED
public let XA_OT9_ABERRATION = 23

//observation time in days since 1950 UTC
public let XA_OTP_DS50UTC   =  3
//position X/ECI or X/EFG (km)
public let XA_OTP_POSX      = 16
//position Y/ECI or Y/EFG (km)
public let XA_OTP_POSY      = 17
//position Z/ECI or Z/EFG (km)
public let XA_OTP_POSZ      = 18

//observation time in days since 1950 UTC
public let XA_OTV_DS50UTC   =  3
//position X/ECI or X/EFG (km)
public let XA_OTV_POSX      = 16
//position Y/ECI or Y/EFG (km)
public let XA_OTV_POSY      = 17
//position Z/ECI or Z/EFG (km)
public let XA_OTV_POSZ      = 18
//velocity X/ECI (km/s)  (or Edot/EFG (km) for ob type 7 TTY)
public let XA_OTV_VELX      = 19
//velocity Y/ECI (km/s)  (or Fdot/EFG (km) for ob type 7 TTY)
public let XA_OTV_VELY      = 20
//velocity Z/ECI (km/s)  (or Gdot/EFG (km) for ob type 7 TTY)
public let XA_OTV_VELZ      = 21

public let XA_OT_SIZE         = 64

// ========================= End of auto generated code ==========================
