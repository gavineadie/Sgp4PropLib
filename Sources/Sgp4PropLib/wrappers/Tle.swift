// This wrapper file was generated automatically by the GenDllWrappers program.
import Foundation
import Sgp4Prop_c

#if os(Linux)
fileprivate let libHandle = loadDll("libtle.so")
#elseif os(Windows)
fileprivate let libHandle = loadDll("Tle.dll")
#else
fileprivate let libHandle = loadDll("libtle.dylib")
#endif

public func TleInit(_ apAddr: Int64) -> Int32 {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "TleInit"), to: fnPtrTleInit.self)

    return function(apAddr)
}

public func TleGetInfo(_ infoStr: UnsafeMutablePointer<CChar>) {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "TleGetInfo"), to: fnPtrTleGetInfo.self)

    function(infoStr)
}

public func TleLoadFile(_ tleFile: UnsafeMutablePointer<CChar>) -> Int32 {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "TleLoadFile"), to: fnPtrTleLoadFile.self)

    return function(tleFile)
}

public func TleSaveFile(_ tleFile: UnsafeMutablePointer<CChar>, _ saveMode: Int32, _ xf_tleForm: Int32) -> Int32 {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "TleSaveFile"), to: fnPtrTleSaveFile.self)

    return function(tleFile, saveMode, xf_tleForm)
}

public func TleRemoveSat(_ satKey: Int64) -> Int32 {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "TleRemoveSat"), to: fnPtrTleRemoveSat.self)

    return function(satKey)
}

public func TleRemoveAllSats() -> Int32 {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "TleRemoveAllSats"), to: fnPtrTleRemoveAllSats.self)

    return function()
}

public func TleGetCount() -> Int32 {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "TleGetCount"), to: fnPtrTleGetCount.self)

    return function()
}

public func TleGetLoaded(_ order: Int32, _ satKeys: UnsafeMutablePointer<Int64>) {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "TleGetLoaded"), to: fnPtrTleGetLoaded.self)

    function(order, satKeys)
}

public func TleAddSatFrLines(_ line1: UnsafeMutablePointer<CChar>, _ line2: UnsafeMutablePointer<CChar>) -> Int64 {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "TleAddSatFrLines"), to: fnPtrTleAddSatFrLines.self)

    return function(line1, line2)
}

public func TleAddSatFrLinesML(_ line1: UnsafeMutablePointer<CChar>, _ line2: UnsafeMutablePointer<CChar>, _ satKey: UnsafeMutablePointer<Int64>) {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "TleAddSatFrLinesML"), to: fnPtrTleAddSatFrLinesML.self)

    function(line1, line2, satKey)
}

public func TleAddSatFrCsv(_ csvLine: UnsafeMutablePointer<CChar>) -> Int64 {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "TleAddSatFrCsv"), to: fnPtrTleAddSatFrCsv.self)

    return function(csvLine)
}

public func TleAddSatFrCsvML(_ csvLine: UnsafeMutablePointer<CChar>, _ satKey: UnsafeMutablePointer<Int64>) {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "TleAddSatFrCsvML"), to: fnPtrTleAddSatFrCsvML.self)

    function(csvLine, satKey)
}

public func TleAddSatFrFieldsGP(_ satNum: Int32, _ secClass: CChar, _ satName: UnsafeMutablePointer<CChar>, _ epochYr: Int32, _ epochDays: Double, _ bstar: Double, _ ephType: Int32, _ elsetNum: Int32, _ incli: Double, _ node: Double, _ eccen: Double, _ omega: Double, _ mnAnomaly: Double, _ mnMotion: Double, _ revNum: Int32) -> Int64 {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "TleAddSatFrFieldsGP"), to: fnPtrTleAddSatFrFieldsGP.self)

    return function(satNum, secClass, satName, epochYr, epochDays, bstar, ephType, elsetNum, incli, node, eccen, omega, mnAnomaly, mnMotion, revNum)
}

public func TleAddSatFrFieldsGP2(_ satNum: Int32, _ secClass: CChar, _ satName: UnsafeMutablePointer<CChar>, _ epochYr: Int32, _ epochDays: Double, _ bstar: Double, _ ephType: Int32, _ elsetNum: Int32, _ incli: Double, _ node: Double, _ eccen: Double, _ omega: Double, _ mnAnomaly: Double, _ mnMotion: Double, _ revNum: Int32, _ nDotO2: Double, _ n2DotO6: Double) -> Int64 {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "TleAddSatFrFieldsGP2"), to: fnPtrTleAddSatFrFieldsGP2.self)

    return function(satNum, secClass, satName, epochYr, epochDays, bstar, ephType, elsetNum, incli, node, eccen, omega, mnAnomaly, mnMotion, revNum, nDotO2, n2DotO6)
}

public func TleAddSatFrFieldsGP2ML(_ satNum: Int32, _ secClass: CChar, _ satName: UnsafeMutablePointer<CChar>, _ epochYr: Int32, _ epochDays: Double, _ bstar: Double, _ ephType: Int32, _ elsetNum: Int32, _ incli: Double, _ node: Double, _ eccen: Double, _ omega: Double, _ mnAnomaly: Double, _ mnMotion: Double, _ revNum: Int32, _ nDotO2: Double, _ n2DotO6: Double, _ satKey: UnsafeMutablePointer<Int64>) {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "TleAddSatFrFieldsGP2ML"), to: fnPtrTleAddSatFrFieldsGP2ML.self)

    function(satNum, secClass, satName, epochYr, epochDays, bstar, ephType, elsetNum, incli, node, eccen, omega, mnAnomaly, mnMotion, revNum, nDotO2, n2DotO6, satKey)
}

public func TleUpdateSatFrFieldsGP(_ satKey: Int64, _ secClass: CChar, _ satName: UnsafeMutablePointer<CChar>, _ bstar: Double, _ elsetNum: Int32, _ incli: Double, _ node: Double, _ eccen: Double, _ omega: Double, _ mnAnomaly: Double, _ mnMotion: Double, _ revNum: Int32) -> Int32 {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "TleUpdateSatFrFieldsGP"), to: fnPtrTleUpdateSatFrFieldsGP.self)

    return function(satKey, secClass, satName, bstar, elsetNum, incli, node, eccen, omega, mnAnomaly, mnMotion, revNum)
}

public func TleUpdateSatFrFieldsGP2(_ satKey: Int64, _ secClass: CChar, _ satName: UnsafeMutablePointer<CChar>, _ bstar: Double, _ elsetNum: Int32, _ incli: Double, _ node: Double, _ eccen: Double, _ omega: Double, _ mnAnomaly: Double, _ mnMotion: Double, _ revNum: Int32, _ nDotO2: Double, _ n2DotO6: Double) -> Int32 {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "TleUpdateSatFrFieldsGP2"), to: fnPtrTleUpdateSatFrFieldsGP2.self)

    return function(satKey, secClass, satName, bstar, elsetNum, incli, node, eccen, omega, mnAnomaly, mnMotion, revNum, nDotO2, n2DotO6)
}

public func TleAddSatFrFieldsSP(_ satNum: Int32, _ secClass: CChar, _ satName: UnsafeMutablePointer<CChar>, _ epochYr: Int32, _ epochDays: Double, _ bTerm: Double, _ ogParm: Double, _ agom: Double, _ elsetNum: Int32, _ incli: Double, _ node: Double, _ eccen: Double, _ omega: Double, _ mnAnomaly: Double, _ mnMotion: Double, _ revNum: Int32) -> Int64 {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "TleAddSatFrFieldsSP"), to: fnPtrTleAddSatFrFieldsSP.self)

    return function(satNum, secClass, satName, epochYr, epochDays, bTerm, ogParm, agom, elsetNum, incli, node, eccen, omega, mnAnomaly, mnMotion, revNum)
}

public func TleAddSatFrFieldsSPML(_ satNum: Int32, _ secClass: CChar, _ satName: UnsafeMutablePointer<CChar>, _ epochYr: Int32, _ epochDays: Double, _ bTerm: Double, _ ogParm: Double, _ agom: Double, _ elsetNum: Int32, _ incli: Double, _ node: Double, _ eccen: Double, _ omega: Double, _ mnAnomaly: Double, _ mnMotion: Double, _ revNum: Int32, _ satKey: UnsafeMutablePointer<Int64>) {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "TleAddSatFrFieldsSPML"), to: fnPtrTleAddSatFrFieldsSPML.self)

    function(satNum, secClass, satName, epochYr, epochDays, bTerm, ogParm, agom, elsetNum, incli, node, eccen, omega, mnAnomaly, mnMotion, revNum, satKey)
}

public func TleUpdateSatFrFieldsSP(_ satKey: Int64, _ secClass: CChar, _ satName: UnsafeMutablePointer<CChar>, _ bterm: Double, _ ogParm: Double, _ agom: Double, _ elsetNum: Int32, _ incli: Double, _ node: Double, _ eccen: Double, _ omega: Double, _ mnAnomaly: Double, _ mnMotion: Double, _ revNum: Int32) -> Int32 {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "TleUpdateSatFrFieldsSP"), to: fnPtrTleUpdateSatFrFieldsSP.self)

    return function(satKey, secClass, satName, bterm, ogParm, agom, elsetNum, incli, node, eccen, omega, mnAnomaly, mnMotion, revNum)
}

public func TleSetField(_ satKey: Int64, _ xf_Tle: Int32, _ valueStr: UnsafeMutablePointer<CChar>) -> Int32 {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "TleSetField"), to: fnPtrTleSetField.self)

    return function(satKey, xf_Tle, valueStr)
}

public func TleGetField(_ satKey: Int64, _ xf_Tle: Int32, _ valueStr: UnsafeMutablePointer<CChar>) -> Int32 {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "TleGetField"), to: fnPtrTleGetField.self)

    return function(satKey, xf_Tle, valueStr)
}

public func TleGetAllFieldsGP(_ satKey: Int64, _ satNum: UnsafeMutablePointer<Int32>, _ secClass: UnsafeMutablePointer<CChar>, _ satName: UnsafeMutablePointer<CChar>, _ epochYr: UnsafeMutablePointer<Int32>, _ epochDays: UnsafeMutablePointer<Double>, _ bstar: UnsafeMutablePointer<Double>, _ ephType: UnsafeMutablePointer<Int32>, _ elsetNum: UnsafeMutablePointer<Int32>, _ incli: UnsafeMutablePointer<Double>, _ node: UnsafeMutablePointer<Double>, _ eccen: UnsafeMutablePointer<Double>, _ omega: UnsafeMutablePointer<Double>, _ mnAnomaly: UnsafeMutablePointer<Double>, _ mnMotion: UnsafeMutablePointer<Double>, _ revNum: UnsafeMutablePointer<Int32>) -> Int32 {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "TleGetAllFieldsGP"), to: fnPtrTleGetAllFieldsGP.self)

    return function(satKey, satNum, secClass, satName, epochYr, epochDays, bstar, ephType, elsetNum, incli, node, eccen, omega, mnAnomaly, mnMotion, revNum)
}

public func TleGetAllFieldsGP2(_ satKey: Int64, _ satNum: UnsafeMutablePointer<Int32>, _ secClass: UnsafeMutablePointer<CChar>, _ satName: UnsafeMutablePointer<CChar>, _ epochYr: UnsafeMutablePointer<Int32>, _ epochDays: UnsafeMutablePointer<Double>, _ bstar: UnsafeMutablePointer<Double>, _ ephType: UnsafeMutablePointer<Int32>, _ elsetNum: UnsafeMutablePointer<Int32>, _ incli: UnsafeMutablePointer<Double>, _ node: UnsafeMutablePointer<Double>, _ eccen: UnsafeMutablePointer<Double>, _ omega: UnsafeMutablePointer<Double>, _ mnAnomaly: UnsafeMutablePointer<Double>, _ mnMotion: UnsafeMutablePointer<Double>, _ revNum: UnsafeMutablePointer<Int32>, _ nDotO2: UnsafeMutablePointer<Double>, _ n2DotO6: UnsafeMutablePointer<Double>) -> Int32 {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "TleGetAllFieldsGP2"), to: fnPtrTleGetAllFieldsGP2.self)

    return function(satKey, satNum, secClass, satName, epochYr, epochDays, bstar, ephType, elsetNum, incli, node, eccen, omega, mnAnomaly, mnMotion, revNum, nDotO2, n2DotO6)
}

public func TleGetAllFieldsSP(_ satKey: Int64, _ satNum: UnsafeMutablePointer<Int32>, _ secClass: UnsafeMutablePointer<CChar>, _ satName: UnsafeMutablePointer<CChar>, _ epochYr: UnsafeMutablePointer<Int32>, _ epochDays: UnsafeMutablePointer<Double>, _ bTerm: UnsafeMutablePointer<Double>, _ ogParm: UnsafeMutablePointer<Double>, _ agom: UnsafeMutablePointer<Double>, _ elsetNum: UnsafeMutablePointer<Int32>, _ incli: UnsafeMutablePointer<Double>, _ node: UnsafeMutablePointer<Double>, _ eccen: UnsafeMutablePointer<Double>, _ omega: UnsafeMutablePointer<Double>, _ mnAnomaly: UnsafeMutablePointer<Double>, _ mnMotion: UnsafeMutablePointer<Double>, _ revNum: UnsafeMutablePointer<Int32>) -> Int32 {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "TleGetAllFieldsSP"), to: fnPtrTleGetAllFieldsSP.self)

    return function(satKey, satNum, secClass, satName, epochYr, epochDays, bTerm, ogParm, agom, elsetNum, incli, node, eccen, omega, mnAnomaly, mnMotion, revNum)
}

public func TleParseGP(_ line1: UnsafeMutablePointer<CChar>, _ line2: UnsafeMutablePointer<CChar>, _ satNum: UnsafeMutablePointer<Int32>, _ secClass: UnsafeMutablePointer<CChar>, _ satName: UnsafeMutablePointer<CChar>, _ epochYr: UnsafeMutablePointer<Int32>, _ epochDays: UnsafeMutablePointer<Double>, _ nDotO2: UnsafeMutablePointer<Double>, _ n2DotO6: UnsafeMutablePointer<Double>, _ bstar: UnsafeMutablePointer<Double>, _ ephType: UnsafeMutablePointer<Int32>, _ elsetNum: UnsafeMutablePointer<Int32>, _ incli: UnsafeMutablePointer<Double>, _ node: UnsafeMutablePointer<Double>, _ eccen: UnsafeMutablePointer<Double>, _ omega: UnsafeMutablePointer<Double>, _ mnAnomaly: UnsafeMutablePointer<Double>, _ mnMotion: UnsafeMutablePointer<Double>, _ revNum: UnsafeMutablePointer<Int32>) -> Int32 {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "TleParseGP"), to: fnPtrTleParseGP.self)

    return function(line1, line2, satNum, secClass, satName, epochYr, epochDays, nDotO2, n2DotO6, bstar, ephType, elsetNum, incli, node, eccen, omega, mnAnomaly, mnMotion, revNum)
}

public func TleLinesToArray(_ line1: UnsafeMutablePointer<CChar>, _ line2: UnsafeMutablePointer<CChar>, _ xa_tle: UnsafeMutablePointer<Double>, _ xs_tle: UnsafeMutablePointer<CChar>) -> Int32 {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "TleLinesToArray"), to: fnPtrTleLinesToArray.self)

    return function(line1, line2, xa_tle, xs_tle)
}

public func TleParseSP(_ line1: UnsafeMutablePointer<CChar>, _ line2: UnsafeMutablePointer<CChar>, _ satNum: UnsafeMutablePointer<Int32>, _ secClass: UnsafeMutablePointer<CChar>, _ satName: UnsafeMutablePointer<CChar>, _ epochYr: UnsafeMutablePointer<Int32>, _ epochDays: UnsafeMutablePointer<Double>, _ bTerm: UnsafeMutablePointer<Double>, _ ogParm: UnsafeMutablePointer<Double>, _ agom: UnsafeMutablePointer<Double>, _ elsetNum: UnsafeMutablePointer<Int32>, _ incli: UnsafeMutablePointer<Double>, _ node: UnsafeMutablePointer<Double>, _ eccen: UnsafeMutablePointer<Double>, _ omega: UnsafeMutablePointer<Double>, _ mnAnomaly: UnsafeMutablePointer<Double>, _ mnMotion: UnsafeMutablePointer<Double>, _ revNum: UnsafeMutablePointer<Int32>) -> Int32 {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "TleParseSP"), to: fnPtrTleParseSP.self)

    return function(line1, line2, satNum, secClass, satName, epochYr, epochDays, bTerm, ogParm, agom, elsetNum, incli, node, eccen, omega, mnAnomaly, mnMotion, revNum)
}

public func TleGetLines(_ satKey: Int64, _ line1: UnsafeMutablePointer<CChar>, _ line2: UnsafeMutablePointer<CChar>) -> Int32 {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "TleGetLines"), to: fnPtrTleGetLines.self)

    return function(satKey, line1, line2)
}

public func TleGetCsv(_ satKey: Int64, _ csvLine: UnsafeMutablePointer<CChar>) -> Int32 {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "TleGetCsv"), to: fnPtrTleGetCsv.self)

    return function(satKey, csvLine)
}

public func TleGPFieldsToLines(_ satNum: Int32, _ secClass: CChar, _ satName: UnsafeMutablePointer<CChar>, _ epochYr: Int32, _ epochDays: Double, _ nDotO2: Double, _ n2DotO6: Double, _ bstar: Double, _ ephType: Int32, _ elsetNum: Int32, _ incli: Double, _ node: Double, _ eccen: Double, _ omega: Double, _ mnAnomaly: Double, _ mnMotion: Double, _ revNum: Int32, _ line1: UnsafeMutablePointer<CChar>, _ line2: UnsafeMutablePointer<CChar>) {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "TleGPFieldsToLines"), to: fnPtrTleGPFieldsToLines.self)

    function(satNum, secClass, satName, epochYr, epochDays, nDotO2, n2DotO6, bstar, ephType, elsetNum, incli, node, eccen, omega, mnAnomaly, mnMotion, revNum, line1, line2)
}

public func TleGPFieldsToCsv(_ satNum: Int32, _ secClass: CChar, _ satName: UnsafeMutablePointer<CChar>, _ epochYr: Int32, _ epochDays: Double, _ nDotO2: Double, _ n2DotO6: Double, _ bstar: Double, _ ephType: Int32, _ elsetNum: Int32, _ incli: Double, _ node: Double, _ eccen: Double, _ omega: Double, _ mnAnomaly: Double, _ mnMotion: Double, _ revNum: Int32, _ csvLine: UnsafeMutablePointer<CChar>) {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "TleGPFieldsToCsv"), to: fnPtrTleGPFieldsToCsv.self)

    function(satNum, secClass, satName, epochYr, epochDays, nDotO2, n2DotO6, bstar, ephType, elsetNum, incli, node, eccen, omega, mnAnomaly, mnMotion, revNum, csvLine)
}

public func TleGPArrayToLines(_ xa_tle: UnsafeMutablePointer<Double>, _ xs_tle: UnsafeMutablePointer<CChar>, _ line1: UnsafeMutablePointer<CChar>, _ line2: UnsafeMutablePointer<CChar>) {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "TleGPArrayToLines"), to: fnPtrTleGPArrayToLines.self)

    function(xa_tle, xs_tle, line1, line2)
}

public func TleGPArrayToCsv(_ xa_tle: UnsafeMutablePointer<Double>, _ xs_tle: UnsafeMutablePointer<CChar>, _ csvline: UnsafeMutablePointer<CChar>) {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "TleGPArrayToCsv"), to: fnPtrTleGPArrayToCsv.self)

    function(xa_tle, xs_tle, csvline)
}

public func TleSPFieldsToLines(_ satNum: Int32, _ secClass: CChar, _ satName: UnsafeMutablePointer<CChar>, _ epochYr: Int32, _ epochDays: Double, _ bTerm: Double, _ ogParm: Double, _ agom: Double, _ elsetNum: Int32, _ incli: Double, _ node: Double, _ eccen: Double, _ omega: Double, _ mnAnomaly: Double, _ mnMotion: Double, _ revNum: Int32, _ line1: UnsafeMutablePointer<CChar>, _ line2: UnsafeMutablePointer<CChar>) {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "TleSPFieldsToLines"), to: fnPtrTleSPFieldsToLines.self)

    function(satNum, secClass, satName, epochYr, epochDays, bTerm, ogParm, agom, elsetNum, incli, node, eccen, omega, mnAnomaly, mnMotion, revNum, line1, line2)
}

public func TleGetSatKey(_ satNum: Int32) -> Int64 {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "TleGetSatKey"), to: fnPtrTleGetSatKey.self)

    return function(satNum)
}

public func TleGetSatKeyML(_ satNum: Int32, _ satKey: UnsafeMutablePointer<Int64>) {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "TleGetSatKeyML"), to: fnPtrTleGetSatKeyML.self)

    function(satNum, satKey)
}

public func TleFieldsToSatKey(_ satNum: Int32, _ epochYr: Int32, _ epochDays: Double, _ ephType: Int32) -> Int64 {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "TleFieldsToSatKey"), to: fnPtrTleFieldsToSatKey.self)

    return function(satNum, epochYr, epochDays, ephType)
}

public func TleFieldsToSatKeyML(_ satNum: Int32, _ epochYr: Int32, _ epochDays: Double, _ ephType: Int32, _ satKey: UnsafeMutablePointer<Int64>) {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "TleFieldsToSatKeyML"), to: fnPtrTleFieldsToSatKeyML.self)

    function(satNum, epochYr, epochDays, ephType, satKey)
}

public func TleAddSatFrArray(_ xa_tle: UnsafeMutablePointer<Double>, _ xs_tle: UnsafeMutablePointer<CChar>) -> Int64 {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "TleAddSatFrArray"), to: fnPtrTleAddSatFrArray.self)

    return function(xa_tle, xs_tle)
}

public func TleAddSatFrArrayML(_ xa_tle: UnsafeMutablePointer<Double>, _ xs_tle: UnsafeMutablePointer<CChar>, _ satKey: UnsafeMutablePointer<Int64>) {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "TleAddSatFrArrayML"), to: fnPtrTleAddSatFrArrayML.self)

    function(xa_tle, xs_tle, satKey)
}

public func TleUpdateSatFrArray(_ satKey: Int64, _ xa_tle: UnsafeMutablePointer<Double>, _ xs_tle: UnsafeMutablePointer<CChar>) -> Int32 {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "TleUpdateSatFrArray"), to: fnPtrTleUpdateSatFrArray.self)

    return function(satKey, xa_tle, xs_tle)
}

public func TleDataToArray(_ satKey: Int64, _ xa_tle: UnsafeMutablePointer<Double>, _ xs_tle: UnsafeMutablePointer<CChar>) -> Int32 {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "TleDataToArray"), to: fnPtrTleDataToArray.self)

    return function(satKey, xa_tle, xs_tle)
}

public func TleLinesToCsv(_ line1: UnsafeMutablePointer<CChar>, _ line2: UnsafeMutablePointer<CChar>, _ csvline: UnsafeMutablePointer<CChar>) -> Int32 {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "TleLinesToCsv"), to: fnPtrTleLinesToCsv.self)

    return function(line1, line2, csvline)
}

public func TleCsvToLines(_ csvLine: UnsafeMutablePointer<CChar>, _ newSatno: Int32, _ line1: UnsafeMutablePointer<CChar>, _ line2: UnsafeMutablePointer<CChar>) -> Int32 {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "TleCsvToLines"), to: fnPtrTleCsvToLines.self)

    return function(csvLine, newSatno, line1, line2)
}

public func SetTleKeyMode(_ tle_keyMode: Int32) -> Int32 {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "SetTleKeyMode"), to: fnPtrSetTleKeyMode.self)

    return function(tle_keyMode)
}

public func GetTleKeyMode() -> Int32 {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "GetTleKeyMode"), to: fnPtrGetTleKeyMode.self)

    return function()
}

// ========================= End of auto generated code ==========================
