//
//  tle.swift
//  Sgp4Swift
//
//  Created by Gavin Eadie on 10/17/22.
//

import Foundation
import obj_c

#if os(Linux)
fileprivate let libHandle = loadDll("libtle.so")
#elseif os(Windows)
fileprivate let libHandle = loadDll("Tle.dll")
#else
fileprivate let libHandle = loadDll("libtle.dylib")
#endif

// -------------------------------- TLEINIT
// ORIGINAL:     int TleInit((in-Long) apPtr)

public func TleInit(_ apPtr: Int64) -> Int32 {
    
    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "TleInit"),
                                 to: fnPtrTleInit.self)
    
    return function(apPtr)
}

// -------------------------------- TLEGETINFO
// ORIGINAL:     void TleGetInfo((out-Character[128]) infoStr)

public func TleGetInfo(_ infoStr: UnsafeMutablePointer<CChar>) {
    
    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "TleGetInfo"),
                                 to: fnPtrTleGetInfo.self)
    
    function(infoStr)
}

// -------------------------------- TLELOADFILE
// ORIGINAL:     int TleLoadFile((in-Character[512]) tleFile)

public func TleLoadFile(_ tleFile: UnsafeMutablePointer<CChar>) -> Int32 {
    
    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "TleLoadFile"),
                                 to: fnPtrTleLoadFile.self)
    
    return function(tleFile)
}

// -------------------------------- TLESAVEFILE
// ORIGINAL:     int TleSaveFile((in-Character[512]) tleFile, (in-Integer) saveMode, (in-Integer) xf_tleForm)

public func TleSaveFile(_ tleFile: UnsafeMutablePointer<CChar>, _ saveMode: Int32, _ xf_tleForm: Int32) -> Int32 {
    
    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "TleSaveFile"),
                                 to: fnPtrTleSaveFile.self)
    
    return function(tleFile, saveMode, xf_tleForm)
}

// -------------------------------- TLEREMOVESAT
// ORIGINAL:     int TleRemoveSat((in-Long) satKey)

public func TleRemoveSat(_ satKey: Int64) -> Int32 {
    
    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "TleRemoveSat"),
                                 to: fnPtrTleRemoveSat.self)
    
    return function(satKey)
}

// -------------------------------- TLEREMOVEALLSATS
// ORIGINAL:     int TleRemoveAllSats()

public func TleRemoveAllSats() -> Int32 {
    
    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "TleRemoveAllSats"),
                                 to: fnPtrTleRemoveAllSats.self)
    
    return function()
}

// -------------------------------- TLEGETCOUNT
// ORIGINAL:     int TleGetCount()

public func TleGetCount() -> Int32 {
    
    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "TleGetCount"),
                                 to: fnPtrTleGetCount.self)
    
    return function()
}

// -------------------------------- TLEADDSATFRLINES
// ORIGINAL:     __int64 TleAddSatFrLines((in-Character[512]) line1, (in-Character[512]) line2)

public func TleAddSatFrLines(_ line1: UnsafeMutablePointer<CChar>, _ line2: UnsafeMutablePointer<CChar>) -> Int64 {
    
    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "TleAddSatFrLines"),
                                 to: fnPtrTleAddSatFrLines.self)
    
    return function(line1, line2)
}

// -------------------------------- TLEADDSATFRLINESML
// ORIGINAL:     void TleAddSatFrLinesML((in-Character[512]) line1, (in-Character[512]) line2, (out-Long) satKey)

public func TleAddSatFrLinesML(_ line1: UnsafeMutablePointer<CChar>, _ line2: UnsafeMutablePointer<CChar>, _ satKey: UnsafeMutablePointer<Int64>) {
    
    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "TleAddSatFrLinesML"),
                                 to: fnPtrTleAddSatFrLinesML.self)
    
    function(line1, line2, satKey)
}

// -------------------------------- TLEADDSATFRCSV
// ORIGINAL:     __int64 TleAddSatFrCsv((in-Character[512]) csvLine)

public func TleAddSatFrCsv(_ csvLine: UnsafeMutablePointer<CChar>) -> Int64 {
    
    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "TleAddSatFrCsv"),
                                 to: fnPtrTleAddSatFrCsv.self)
    
    return function(csvLine)
}

// -------------------------------- TLEADDSATFRCSVML
// ORIGINAL:     void TleAddSatFrCsvML((in-Character[512]) csvLine, (out-Long) satKey)

public func TleAddSatFrCsvML(_ csvLine: UnsafeMutablePointer<CChar>, _ satKey: UnsafeMutablePointer<Int64>) {
    
    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "TleAddSatFrCsvML"),
                                 to: fnPtrTleAddSatFrCsvML.self)
    
    function(csvLine, satKey)
}

// -------------------------------- TLEADDSATFRFIELDSGP
// ORIGINAL:     __int64 TleAddSatFrFieldsGP((in-Integer) satNum, (in-Character) secClass, (in-Character[8]) satName, (in-Integer) epochYr, (in-Double) epochDays, (in-Double) bstar, (in-Integer) ephType, (in-Integer) elsetNum, (in-Double) incli, (in-Double) node, (in-Double) eccen, (in-Double) omega, (in-Double) mnAnomaly, (in-Double) mnMotion, (in-Integer) revNum)

public func TleAddSatFrFieldsGP(_ satNum: Int32, _ secClass: CChar, _ satName: UnsafeMutablePointer<CChar>, _ epochYr: Int32, _ epochDays: Double, _ bstar: Double, _ ephType: Int32, _ elsetNum: Int32, _ incli: Double, _ node: Double, _ eccen: Double, _ omega: Double, _ mnAnomaly: Double, _ mnMotion: Double, _ revNum: Int32) -> Int64 {
    
    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "TleAddSatFrFieldsGP"),
                                 to: fnPtrTleAddSatFrFieldsGP.self)
    
    return function(satNum, secClass, satName, epochYr, epochDays, bstar, ephType, elsetNum, incli, node, eccen, omega, mnAnomaly, mnMotion, revNum)
}

// -------------------------------- TLEADDSATFRFIELDSGP2
// ORIGINAL:     __int64 TleAddSatFrFieldsGP2((in-Integer) satNum, (in-Character) secClass, (in-Character[8]) satName, (in-Integer) epochYr, (in-Double) epochDays, (in-Double) bstar, (in-Integer) ephType, (in-Integer) elsetNum, (in-Double) incli, (in-Double) node, (in-Double) eccen, (in-Double) omega, (in-Double) mnAnomaly, (in-Double) mnMotion, (in-Integer) revNum, (in-Double) nDotO2, (in-Double) n2DotO6)

public func TleAddSatFrFieldsGP2(_ satNum: Int32, _ secClass: CChar, _ satName: UnsafeMutablePointer<CChar>, _ epochYr: Int32, _ epochDays: Double, _ bstar: Double, _ ephType: Int32, _ elsetNum: Int32, _ incli: Double, _ node: Double, _ eccen: Double, _ omega: Double, _ mnAnomaly: Double, _ mnMotion: Double, _ revNum: Int32, _ nDotO2: Double, _ n2DotO6: Double) -> Int64 {
    
    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "TleAddSatFrFieldsGP2"),
                                 to: fnPtrTleAddSatFrFieldsGP2.self)
    
    return function(satNum, secClass, satName, epochYr, epochDays, bstar, ephType, elsetNum, incli, node, eccen, omega, mnAnomaly, mnMotion, revNum, nDotO2, n2DotO6)
}

// -------------------------------- TLEADDSATFRFIELDSGP2ML
// ORIGINAL:     void TleAddSatFrFieldsGP2ML((in-Integer) satNum, (in-Character) secClass, (in-Character[8]) satName, (in-Integer) epochYr, (in-Double) epochDays, (in-Double) bstar, (in-Integer) ephType, (in-Integer) elsetNum, (in-Double) incli, (in-Double) node, (in-Double) eccen, (in-Double) omega, (in-Double) mnAnomaly, (in-Double) mnMotion, (in-Integer) revNum, (in-Double) nDotO2, (in-Double) n2DotO6, (out-Long) satKey)

public func TleAddSatFrFieldsGP2ML(_ satNum: Int32, _ secClass: CChar, _ satName: UnsafeMutablePointer<CChar>, _ epochYr: Int32, _ epochDays: Double, _ bstar: Double, _ ephType: Int32, _ elsetNum: Int32, _ incli: Double, _ node: Double, _ eccen: Double, _ omega: Double, _ mnAnomaly: Double, _ mnMotion: Double, _ revNum: Int32, _ nDotO2: Double, _ n2DotO6: Double, _ satKey: UnsafeMutablePointer<Int64>) {
    
    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "TleAddSatFrFieldsGP2ML"),
                                 to: fnPtrTleAddSatFrFieldsGP2ML.self)
    
    function(satNum, secClass, satName, epochYr, epochDays, bstar, ephType, elsetNum, incli, node, eccen, omega, mnAnomaly, mnMotion, revNum, nDotO2, n2DotO6, satKey)
}

// -------------------------------- TLEUPDATESATFRFIELDSGP
// ORIGINAL:     int TleUpdateSatFrFieldsGP((in-Long) satKey, (in-Character) secClass, (in-Character[8]) satName, (in-Double) bstar, (in-Integer) elsetNum, (in-Double) incli, (in-Double) node, (in-Double) eccen, (in-Double) omega, (in-Double) mnAnomaly, (in-Double) mnMotion, (in-Integer) revNum)

public func TleUpdateSatFrFieldsGP(_ satKey: Int64, _ secClass: CChar, _ satName: UnsafeMutablePointer<CChar>, _ bstar: Double, _ elsetNum: Int32, _ incli: Double, _ node: Double, _ eccen: Double, _ omega: Double, _ mnAnomaly: Double, _ mnMotion: Double, _ revNum: Int32) -> Int32 {
    
    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "TleUpdateSatFrFieldsGP"),
                                 to: fnPtrTleUpdateSatFrFieldsGP.self)
    
    return function(satKey, secClass, satName, bstar, elsetNum, incli, node, eccen, omega, mnAnomaly, mnMotion, revNum)
}

// -------------------------------- TLEUPDATESATFRFIELDSGP2
// ORIGINAL:     int TleUpdateSatFrFieldsGP2((in-Long) satKey, (in-Character) secClass, (in-Character[8]) satName, (in-Double) bstar, (in-Integer) elsetNum, (in-Double) incli, (in-Double) node, (in-Double) eccen, (in-Double) omega, (in-Double) mnAnomaly, (in-Double) mnMotion, (in-Integer) revNum, (in-Double) nDotO2, (in-Double) n2DotO6)

public func TleUpdateSatFrFieldsGP2(_ satKey: Int64, _ secClass: CChar, _ satName: UnsafeMutablePointer<CChar>, _ bstar: Double, _ elsetNum: Int32, _ incli: Double, _ node: Double, _ eccen: Double, _ omega: Double, _ mnAnomaly: Double, _ mnMotion: Double, _ revNum: Int32, _ nDotO2: Double, _ n2DotO6: Double) -> Int32 {
    
    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "TleUpdateSatFrFieldsGP2"),
                                 to: fnPtrTleUpdateSatFrFieldsGP2.self)
    
    return function(satKey, secClass, satName, bstar, elsetNum, incli, node, eccen, omega, mnAnomaly, mnMotion, revNum, nDotO2, n2DotO6)
}

// -------------------------------- TLEADDSATFRFIELDSSP
// ORIGINAL:     __int64 TleAddSatFrFieldsSP((in-Integer) satNum, (in-Character) secClass, (in-Character[8]) satName, (in-Integer) epochYr, (in-Double) epochDays, (in-Double) bTerm, (in-Double) ogParm, (in-Double) agom, (in-Integer) elsetNum, (in-Double) incli, (in-Double) node, (in-Double) eccen, (in-Double) omega, (in-Double) mnAnomaly, (in-Double) mnMotion, (in-Integer) revNum)

public func TleAddSatFrFieldsSP(_ satNum: Int32, _ secClass: CChar, _ satName: UnsafeMutablePointer<CChar>, _ epochYr: Int32, _ epochDays: Double, _ bTerm: Double, _ ogParm: Double, _ agom: Double, _ elsetNum: Int32, _ incli: Double, _ node: Double, _ eccen: Double, _ omega: Double, _ mnAnomaly: Double, _ mnMotion: Double, _ revNum: Int32) -> Int64 {
    
    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "TleAddSatFrFieldsSP"),
                                 to: fnPtrTleAddSatFrFieldsSP.self)
    
    return function(satNum, secClass, satName, epochYr, epochDays, bTerm, ogParm, agom, elsetNum, incli, node, eccen, omega, mnAnomaly, mnMotion, revNum)
}

// -------------------------------- TLEADDSATFRFIELDSSPML
// ORIGINAL:     void TleAddSatFrFieldsSPML((in-Integer) satNum, (in-Character) secClass, (in-Character[8]) satName, (in-Integer) epochYr, (in-Double) epochDays, (in-Double) bTerm, (in-Double) ogParm, (in-Double) agom, (in-Integer) elsetNum, (in-Double) incli, (in-Double) node, (in-Double) eccen, (in-Double) omega, (in-Double) mnAnomaly, (in-Double) mnMotion, (in-Integer) revNum, (out-Long) satKey)

public func TleAddSatFrFieldsSPML(_ satNum: Int32, _ secClass: CChar, _ satName: UnsafeMutablePointer<CChar>, _ epochYr: Int32, _ epochDays: Double, _ bTerm: Double, _ ogParm: Double, _ agom: Double, _ elsetNum: Int32, _ incli: Double, _ node: Double, _ eccen: Double, _ omega: Double, _ mnAnomaly: Double, _ mnMotion: Double, _ revNum: Int32, _ satKey: UnsafeMutablePointer<Int64>) {
    
    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "TleAddSatFrFieldsSPML"),
                                 to: fnPtrTleAddSatFrFieldsSPML.self)
    
    function(satNum, secClass, satName, epochYr, epochDays, bTerm, ogParm, agom, elsetNum, incli, node, eccen, omega, mnAnomaly, mnMotion, revNum, satKey)
}

// -------------------------------- TLEUPDATESATFRFIELDSSP
// ORIGINAL:     int TleUpdateSatFrFieldsSP((in-Long) satKey, (in-Character) secClass, (in-Character[8]) satName, (in-Double) bterm, (in-Double) ogParm, (in-Double) agom, (in-Integer) elsetNum, (in-Double) incli, (in-Double) node, (in-Double) eccen, (in-Double) omega, (in-Double) mnAnomaly, (in-Double) mnMotion, (in-Integer) revNum)

public func TleUpdateSatFrFieldsSP(_ satKey: Int64, _ secClass: CChar, _ satName: UnsafeMutablePointer<CChar>, _ bterm: Double, _ ogParm: Double, _ agom: Double, _ elsetNum: Int32, _ incli: Double, _ node: Double, _ eccen: Double, _ omega: Double, _ mnAnomaly: Double, _ mnMotion: Double, _ revNum: Int32) -> Int32 {
    
    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "TleUpdateSatFrFieldsSP"),
                                 to: fnPtrTleUpdateSatFrFieldsSP.self)
    
    return function(satKey, secClass, satName, bterm, ogParm, agom, elsetNum, incli, node, eccen, omega, mnAnomaly, mnMotion, revNum)
}

// -------------------------------- TLESETFIELD
// ORIGINAL:     int TleSetField((in-Long) satKey, (in-Integer) xf_Tle, (in-Character[512]) valueStr)

public func TleSetField(_ satKey: Int64, _ xf_Tle: Int32, _ valueStr: UnsafeMutablePointer<CChar>) -> Int32 {
    
    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "TleSetField"),
                                 to: fnPtrTleSetField.self)
    
    return function(satKey, xf_Tle, valueStr)
}

// -------------------------------- TLEGETFIELD
// ORIGINAL:     int TleGetField((in-Long) satKey, (in-Integer) xf_Tle, (out-Character[512]) valueStr)

public func TleGetField(_ satKey: Int64, _ xf_Tle: Int32, _ valueStr: UnsafeMutablePointer<CChar>) -> Int32 {
    
    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "TleGetField"),
                                 to: fnPtrTleGetField.self)
    
    return function(satKey, xf_Tle, valueStr)
}

// -------------------------------- TLEGETALLFIELDSGP
// ORIGINAL:     int TleGetAllFieldsGP((in-Long) satKey, (out-Integer) satNum, (out-Character) secClass, (out-Character[8]) satName, (out-Integer) epochYr, (out-Double) epochDays, (out-Double) bstar, (out-Integer) ephType, (out-Integer) elsetNum, (out-Double) incli, (out-Double) node, (out-Double) eccen, (out-Double) omega, (out-Double) mnAnomaly, (out-Double) mnMotion, (out-Integer) revNum)

public func TleGetAllFieldsGP(_ satKey: Int64, _ satNum: UnsafeMutablePointer<Int32>, _ secClass: UnsafeMutablePointer<CChar>, _ satName: UnsafeMutablePointer<CChar>, _ epochYr: UnsafeMutablePointer<Int32>, _ epochDays: UnsafeMutablePointer<Double>, _ bstar: UnsafeMutablePointer<Double>, _ ephType: UnsafeMutablePointer<Int32>, _ elsetNum: UnsafeMutablePointer<Int32>, _ incli: UnsafeMutablePointer<Double>, _ node: UnsafeMutablePointer<Double>, _ eccen: UnsafeMutablePointer<Double>, _ omega: UnsafeMutablePointer<Double>, _ mnAnomaly: UnsafeMutablePointer<Double>, _ mnMotion: UnsafeMutablePointer<Double>, _ revNum: UnsafeMutablePointer<Int32>) -> Int32 {
    
    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "TleGetAllFieldsGP"),
                                 to: fnPtrTleGetAllFieldsGP.self)
    
    return function(satKey, satNum, secClass, satName, epochYr, epochDays, bstar, ephType, elsetNum, incli, node, eccen, omega, mnAnomaly, mnMotion, revNum)
}

// -------------------------------- TLEGETALLFIELDSGP2
// ORIGINAL:     int TleGetAllFieldsGP2((in-Long) satKey, (out-Integer) satNum, (out-Character) secClass, (out-Character[8]) satName, (out-Integer) epochYr, (out-Double) epochDays, (out-Double) bstar, (out-Integer) ephType, (out-Integer) elsetNum, (out-Double) incli, (out-Double) node, (out-Double) eccen, (out-Double) omega, (out-Double) mnAnomaly, (out-Double) mnMotion, (out-Integer) revNum, (out-Double) nDotO2, (out-Double) n2DotO6)

public func TleGetAllFieldsGP2(_ satKey: Int64, _ satNum: UnsafeMutablePointer<Int32>, _ secClass: UnsafeMutablePointer<CChar>, _ satName: UnsafeMutablePointer<CChar>, _ epochYr: UnsafeMutablePointer<Int32>, _ epochDays: UnsafeMutablePointer<Double>, _ bstar: UnsafeMutablePointer<Double>, _ ephType: UnsafeMutablePointer<Int32>, _ elsetNum: UnsafeMutablePointer<Int32>, _ incli: UnsafeMutablePointer<Double>, _ node: UnsafeMutablePointer<Double>, _ eccen: UnsafeMutablePointer<Double>, _ omega: UnsafeMutablePointer<Double>, _ mnAnomaly: UnsafeMutablePointer<Double>, _ mnMotion: UnsafeMutablePointer<Double>, _ revNum: UnsafeMutablePointer<Int32>, _ nDotO2: UnsafeMutablePointer<Double>, _ n2DotO6: UnsafeMutablePointer<Double>) -> Int32 {
    
    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "TleGetAllFieldsGP2"),
                                 to: fnPtrTleGetAllFieldsGP2.self)
    
    return function(satKey, satNum, secClass, satName, epochYr, epochDays, bstar, ephType, elsetNum, incli, node, eccen, omega, mnAnomaly, mnMotion, revNum, nDotO2, n2DotO6)
}

// -------------------------------- TLEGETALLFIELDSSP
// ORIGINAL:     int TleGetAllFieldsSP((in-Long) satKey, (out-Integer) satNum, (out-Character) secClass, (out-Character[8]) satName, (out-Integer) epochYr, (out-Double) epochDays, (out-Double) bTerm, (out-Double) ogParm, (out-Double) agom, (out-Integer) elsetNum, (out-Double) incli, (out-Double) node, (out-Double) eccen, (out-Double) omega, (out-Double) mnAnomaly, (out-Double) mnMotion, (out-Integer) revNum)

public func TleGetAllFieldsSP(_ satKey: Int64, _ satNum: UnsafeMutablePointer<Int32>, _ secClass: UnsafeMutablePointer<CChar>, _ satName: UnsafeMutablePointer<CChar>, _ epochYr: UnsafeMutablePointer<Int32>, _ epochDays: UnsafeMutablePointer<Double>, _ bTerm: UnsafeMutablePointer<Double>, _ ogParm: UnsafeMutablePointer<Double>, _ agom: UnsafeMutablePointer<Double>, _ elsetNum: UnsafeMutablePointer<Int32>, _ incli: UnsafeMutablePointer<Double>, _ node: UnsafeMutablePointer<Double>, _ eccen: UnsafeMutablePointer<Double>, _ omega: UnsafeMutablePointer<Double>, _ mnAnomaly: UnsafeMutablePointer<Double>, _ mnMotion: UnsafeMutablePointer<Double>, _ revNum: UnsafeMutablePointer<Int32>) -> Int32 {
    
    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "TleGetAllFieldsSP"),
                                 to: fnPtrTleGetAllFieldsSP.self)
    
    return function(satKey, satNum, secClass, satName, epochYr, epochDays, bTerm, ogParm, agom, elsetNum, incli, node, eccen, omega, mnAnomaly, mnMotion, revNum)
}

// -------------------------------- TLEPARSEGP
// ORIGINAL:     int TleParseGP((in-Character[512]) line1, (in-Character[512]) line2, (out-Integer) satNum, (out-Character) secClass, (out-Character[8]) satName, (out-Integer) epochYr, (out-Double) epochDays, (out-Double) nDotO2, (out-Double) n2DotO6, (out-Double) bstar, (out-Integer) ephType, (out-Integer) elsetNum, (out-Double) incli, (out-Double) node, (out-Double) eccen, (out-Double) omega, (out-Double) mnAnomaly, (out-Double) mnMotion, (out-Integer) revNum)

public func TleParseGP(_ line1: UnsafeMutablePointer<CChar>, _ line2: UnsafeMutablePointer<CChar>, _ satNum: UnsafeMutablePointer<Int32>, _ secClass: UnsafeMutablePointer<CChar>, _ satName: UnsafeMutablePointer<CChar>, _ epochYr: UnsafeMutablePointer<Int32>, _ epochDays: UnsafeMutablePointer<Double>, _ nDotO2: UnsafeMutablePointer<Double>, _ n2DotO6: UnsafeMutablePointer<Double>, _ bstar: UnsafeMutablePointer<Double>, _ ephType: UnsafeMutablePointer<Int32>, _ elsetNum: UnsafeMutablePointer<Int32>, _ incli: UnsafeMutablePointer<Double>, _ node: UnsafeMutablePointer<Double>, _ eccen: UnsafeMutablePointer<Double>, _ omega: UnsafeMutablePointer<Double>, _ mnAnomaly: UnsafeMutablePointer<Double>, _ mnMotion: UnsafeMutablePointer<Double>, _ revNum: UnsafeMutablePointer<Int32>) -> Int32 {
    
    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "TleParseGP"),
                                 to: fnPtrTleParseGP.self)
    
    return function(line1, line2, satNum, secClass, satName, epochYr, epochDays, nDotO2, n2DotO6, bstar, ephType, elsetNum, incli, node, eccen, omega, mnAnomaly, mnMotion, revNum)
}

// -------------------------------- TLELINESTOARRAY
// ORIGINAL:     int TleLinesToArray((in-Character[512]) line1, (in-Character[512]) line2, (out-Double[64]) xa_tle, (out-Character[512]) xs_tle)

public func TleLinesToArray(_ line1: UnsafeMutablePointer<CChar>, _ line2: UnsafeMutablePointer<CChar>, _ xa_tle: UnsafeMutablePointer<Double>, _ xs_tle: UnsafeMutablePointer<CChar>) -> Int32 {
    
    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "TleLinesToArray"),
                                 to: fnPtrTleLinesToArray.self)
    
    return function(line1, line2, xa_tle, xs_tle)
}

// -------------------------------- TLEPARSESP
// ORIGINAL:     int TleParseSP((in-Character[512]) line1, (in-Character[512]) line2, (out-Integer) satNum, (out-Character) secClass, (out-Character[8]) satName, (out-Integer) epochYr, (out-Double) epochDays, (out-Double) bTerm, (out-Double) ogParm, (out-Double) agom, (out-Integer) elsetNum, (out-Double) incli, (out-Double) node, (out-Double) eccen, (out-Double) omega, (out-Double) mnAnomaly, (out-Double) mnMotion, (out-Integer) revNum)

public func TleParseSP(_ line1: UnsafeMutablePointer<CChar>, _ line2: UnsafeMutablePointer<CChar>, _ satNum: UnsafeMutablePointer<Int32>, _ secClass: UnsafeMutablePointer<CChar>, _ satName: UnsafeMutablePointer<CChar>, _ epochYr: UnsafeMutablePointer<Int32>, _ epochDays: UnsafeMutablePointer<Double>, _ bTerm: UnsafeMutablePointer<Double>, _ ogParm: UnsafeMutablePointer<Double>, _ agom: UnsafeMutablePointer<Double>, _ elsetNum: UnsafeMutablePointer<Int32>, _ incli: UnsafeMutablePointer<Double>, _ node: UnsafeMutablePointer<Double>, _ eccen: UnsafeMutablePointer<Double>, _ omega: UnsafeMutablePointer<Double>, _ mnAnomaly: UnsafeMutablePointer<Double>, _ mnMotion: UnsafeMutablePointer<Double>, _ revNum: UnsafeMutablePointer<Int32>) -> Int32 {
    
    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "TleParseSP"),
                                 to: fnPtrTleParseSP.self)
    
    return function(line1, line2, satNum, secClass, satName, epochYr, epochDays, bTerm, ogParm, agom, elsetNum, incli, node, eccen, omega, mnAnomaly, mnMotion, revNum)
}

// -------------------------------- TLEGETLINES
// ORIGINAL:     int TleGetLines((in-Long) satKey, (out-Character[512]) line1, (out-Character[512]) line2)

public func TleGetLines(_ satKey: Int64, _ line1: UnsafeMutablePointer<CChar>, _ line2: UnsafeMutablePointer<CChar>) -> Int32 {
    
    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "TleGetLines"),
                                 to: fnPtrTleGetLines.self)
    
    return function(satKey, line1, line2)
}

// -------------------------------- TLEGETCSV
// ORIGINAL:     int TleGetCsv((in-Long) satKey, (out-Character[512]) csvLine)

public func TleGetCsv(_ satKey: Int64, _ csvLine: UnsafeMutablePointer<CChar>) -> Int32 {
    
    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "TleGetCsv"),
                                 to: fnPtrTleGetCsv.self)
    
    return function(satKey, csvLine)
}

// -------------------------------- TLEGPFIELDSTOLINES
// ORIGINAL:     void TleGPFieldsToLines((in-Integer) satNum, (in-Character) secClass, (in-Character[8]) satName, (in-Integer) epochYr, (in-Double) epochDays, (in-Double) nDotO2, (in-Double) n2DotO6, (in-Double) bstar, (in-Integer) ephType, (in-Integer) elsetNum, (in-Double) incli, (in-Double) node, (in-Double) eccen, (in-Double) omega, (in-Double) mnAnomaly, (in-Double) mnMotion, (in-Integer) revNum, (out-Character[512]) line1, (out-Character[512]) line2)

public func TleGPFieldsToLines(_ satNum: Int32, _ secClass: CChar, _ satName: UnsafeMutablePointer<CChar>, _ epochYr: Int32, _ epochDays: Double, _ nDotO2: Double, _ n2DotO6: Double, _ bstar: Double, _ ephType: Int32, _ elsetNum: Int32, _ incli: Double, _ node: Double, _ eccen: Double, _ omega: Double, _ mnAnomaly: Double, _ mnMotion: Double, _ revNum: Int32, _ line1: UnsafeMutablePointer<CChar>, _ line2: UnsafeMutablePointer<CChar>) {
    
    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "TleGPFieldsToLines"),
                                 to: fnPtrTleGPFieldsToLines.self)
    
    function(satNum, secClass, satName, epochYr, epochDays, nDotO2, n2DotO6, bstar, ephType, elsetNum, incli, node, eccen, omega, mnAnomaly, mnMotion, revNum, line1, line2)
}

// -------------------------------- TLEGPFIELDSTOCSV
// ORIGINAL:     void TleGPFieldsToCsv((in-Integer) satNum, (in-Character) secClass, (in-Character[8]) satName, (in-Integer) epochYr, (in-Double) epochDays, (in-Double) nDotO2, (in-Double) n2DotO6, (in-Double) bstar, (in-Integer) ephType, (in-Integer) elsetNum, (in-Double) incli, (in-Double) node, (in-Double) eccen, (in-Double) omega, (in-Double) mnAnomaly, (in-Double) mnMotion, (in-Integer) revNum, (out-Character[512]) csvLine)

public func TleGPFieldsToCsv(_ satNum: Int32, _ secClass: CChar, _ satName: UnsafeMutablePointer<CChar>, _ epochYr: Int32, _ epochDays: Double, _ nDotO2: Double, _ n2DotO6: Double, _ bstar: Double, _ ephType: Int32, _ elsetNum: Int32, _ incli: Double, _ node: Double, _ eccen: Double, _ omega: Double, _ mnAnomaly: Double, _ mnMotion: Double, _ revNum: Int32, _ csvLine: UnsafeMutablePointer<CChar>) {
    
    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "TleGPFieldsToCsv"),
                                 to: fnPtrTleGPFieldsToCsv.self)
    
    function(satNum, secClass, satName, epochYr, epochDays, nDotO2, n2DotO6, bstar, ephType, elsetNum, incli, node, eccen, omega, mnAnomaly, mnMotion, revNum, csvLine)
}

// -------------------------------- TLEGPARRAYTOLINES
// ORIGINAL:     void TleGPArrayToLines((in-Double[64]) xa_tle, (in-Character[512]) xs_tle, (out-Character[512]) line1, (out-Character[512]) line2)

public func TleGPArrayToLines(_ xa_tle: UnsafeMutablePointer<Double>, _ xs_tle: UnsafeMutablePointer<CChar>, _ line1: UnsafeMutablePointer<CChar>, _ line2: UnsafeMutablePointer<CChar>) {
    
    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "TleGPArrayToLines"),
                                 to: fnPtrTleGPArrayToLines.self)
    
    function(xa_tle, xs_tle, line1, line2)
}

// -------------------------------- TLEGPARRAYTOCSV
// ORIGINAL:     void TleGPArrayToCsv((in-Double[64]) xa_tle, (in-Character[512]) xs_tle, (out-Character[512]) csvline)

public func TleGPArrayToCsv(_ xa_tle: UnsafeMutablePointer<Double>, _ xs_tle: UnsafeMutablePointer<CChar>, _ csvline: UnsafeMutablePointer<CChar>) {
    
    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "TleGPArrayToCsv"),
                                 to: fnPtrTleGPArrayToCsv.self)
    
    function(xa_tle, xs_tle, csvline)
}

// -------------------------------- TLESPFIELDSTOLINES
// ORIGINAL:     void TleSPFieldsToLines((in-Integer) satNum, (in-Character) secClass, (in-Character[8]) satName, (in-Integer) epochYr, (in-Double) epochDays, (in-Double) bTerm, (in-Double) ogParm, (in-Double) agom, (in-Integer) elsetNum, (in-Double) incli, (in-Double) node, (in-Double) eccen, (in-Double) omega, (in-Double) mnAnomaly, (in-Double) mnMotion, (in-Integer) revNum, (out-Character[512]) line1, (out-Character[512]) line2)

public func TleSPFieldsToLines(_ satNum: Int32, _ secClass: CChar, _ satName: UnsafeMutablePointer<CChar>, _ epochYr: Int32, _ epochDays: Double, _ bTerm: Double, _ ogParm: Double, _ agom: Double, _ elsetNum: Int32, _ incli: Double, _ node: Double, _ eccen: Double, _ omega: Double, _ mnAnomaly: Double, _ mnMotion: Double, _ revNum: Int32, _ line1: UnsafeMutablePointer<CChar>, _ line2: UnsafeMutablePointer<CChar>) {
    
    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "TleSPFieldsToLines"),
                                 to: fnPtrTleSPFieldsToLines.self)
    
    function(satNum, secClass, satName, epochYr, epochDays, bTerm, ogParm, agom, elsetNum, incli, node, eccen, omega, mnAnomaly, mnMotion, revNum, line1, line2)
}

// -------------------------------- TLEGETSATKEY
// ORIGINAL:     __int64 TleGetSatKey((in-Integer) satNum)

public func TleGetSatKey(_ satNum: Int32) -> Int64 {
    
    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "TleGetSatKey"),
                                 to: fnPtrTleGetSatKey.self)
    
    return function(satNum)
}

// -------------------------------- TLEGETSATKEYML
// ORIGINAL:     void TleGetSatKeyML((in-Integer) satNum, (out-Long) satKey)

public func TleGetSatKeyML(_ satNum: Int32, _ satKey: UnsafeMutablePointer<Int64>) {
    
    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "TleGetSatKeyML"),
                                 to: fnPtrTleGetSatKeyML.self)
    
    function(satNum, satKey)
}

// -------------------------------- TLEFIELDSTOSATKEY
// ORIGINAL:     __int64 TleFieldsToSatKey((in-Integer) satNum, (in-Integer) epochYr, (in-Double) epochDays, (in-Integer) ephType)

public func TleFieldsToSatKey(_ satNum: Int32, _ epochYr: Int32, _ epochDays: Double, _ ephType: Int32) -> Int64 {
    
    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "TleFieldsToSatKey"),
                                 to: fnPtrTleFieldsToSatKey.self)
    
    return function(satNum, epochYr, epochDays, ephType)
}

// -------------------------------- TLEFIELDSTOSATKEYML
// ORIGINAL:     void TleFieldsToSatKeyML((in-Integer) satNum, (in-Integer) epochYr, (in-Double) epochDays, (in-Integer) ephType, (out-Long) satKey)

public func TleFieldsToSatKeyML(_ satNum: Int32, _ epochYr: Int32, _ epochDays: Double, _ ephType: Int32, _ satKey: UnsafeMutablePointer<Int64>) {
    
    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "TleFieldsToSatKeyML"),
                                 to: fnPtrTleFieldsToSatKeyML.self)
    
    function(satNum, epochYr, epochDays, ephType, satKey)
}

// -------------------------------- TLEADDSATFRARRAY
// ORIGINAL:     __int64 TleAddSatFrArray((in-Double[64]) xa_tle, (in-Character[512]) xs_tle)

public func TleAddSatFrArray(_ xa_tle: UnsafeMutablePointer<Double>, _ xs_tle: UnsafeMutablePointer<CChar>) -> Int64 {
    
    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "TleAddSatFrArray"),
                                 to: fnPtrTleAddSatFrArray.self)
    
    return function(xa_tle, xs_tle)
}

// -------------------------------- TLEADDSATFRARRAYML
// ORIGINAL:     void TleAddSatFrArrayML((in-Double[64]) xa_tle, (in-Character[512]) xs_tle, (out-Long) satKey)

public func TleAddSatFrArrayML(_ xa_tle: UnsafeMutablePointer<Double>, _ xs_tle: UnsafeMutablePointer<CChar>, _ satKey: UnsafeMutablePointer<Int64>) {
    
    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "TleAddSatFrArrayML"),
                                 to: fnPtrTleAddSatFrArrayML.self)
    
    function(xa_tle, xs_tle, satKey)
}

// -------------------------------- TLEUPDATESATFRARRAY
// ORIGINAL:     int TleUpdateSatFrArray((in-Long) satKey, (in-Double[64]) xa_tle, (in-Character[512]) xs_tle)

public func TleUpdateSatFrArray(_ satKey: Int64, _ xa_tle: UnsafeMutablePointer<Double>, _ xs_tle: UnsafeMutablePointer<CChar>) -> Int32 {
    
    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "TleUpdateSatFrArray"),
                                 to: fnPtrTleUpdateSatFrArray.self)
    
    return function(satKey, xa_tle, xs_tle)
}

// -------------------------------- TLEDATATOARRAY
// ORIGINAL:     int TleDataToArray((in-Long) satKey, (out-Double[64]) xa_tle, (out-Character[512]) xs_tle)

public func TleDataToArray(_ satKey: Int64, _ xa_tle: UnsafeMutablePointer<Double>, _ xs_tle: UnsafeMutablePointer<CChar>) -> Int32 {
    
    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "TleDataToArray"),
                                 to: fnPtrTleDataToArray.self)
    
    return function(satKey, xa_tle, xs_tle)
}

// -------------------------------- TLELINESTOCSV
// ORIGINAL:     int TleLinesToCsv((in-Character[512]) line1, (in-Character[512]) line2, (out-Character[512]) csvline)

public func TleLinesToCsv(_ line1: UnsafeMutablePointer<CChar>, _ line2: UnsafeMutablePointer<CChar>, _ csvline: UnsafeMutablePointer<CChar>) -> Int32 {
    
    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "TleLinesToCsv"),
                                 to: fnPtrTleLinesToCsv.self)
    
    return function(line1, line2, csvline)
}

// -------------------------------- TLECSVTOLINES
// ORIGINAL:     int TleCsvToLines((in-Character[512]) csvLine, (in-Integer) newSatno, (out-Character[512]) line1, (out-Character[512]) line2)

public func TleCsvToLines(_ csvLine: UnsafeMutablePointer<CChar>, _ newSatno: Int32, _ line1: UnsafeMutablePointer<CChar>, _ line2: UnsafeMutablePointer<CChar>) -> Int32 {
    
    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "TleCsvToLines"),
                                 to: fnPtrTleCsvToLines.self)
    
    return function(csvLine, newSatno, line1, line2)
}

// -------------------------------- SETTLEKEYMODE
// ORIGINAL:     int SetTleKeyMode((in-Integer) tle_keyMode)

public func SetTleKeyMode(_ tle_keyMode: Int32) -> Int32 {
    
    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "SetTleKeyMode"),
                                 to: fnPtrSetTleKeyMode.self)
    
    return function(tle_keyMode)
}

// -------------------------------- GETTLEKEYMODE
// ORIGINAL:     int GetTleKeyMode()

public func GetTleKeyMode() -> Int32 {
    
    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "GetTleKeyMode"),
                                 to: fnPtrGetTleKeyMode.self)
    
    return function()
}

// -------------------------------- TLEGETLOADED
// ORIGINAL:     void TleGetLoaded((in-Integer) order, (out-Long[*]) satKeys)

public func TleGetLoaded(_ order: Int32, _ satKeys: UnsafeMutablePointer<Int64>) {

    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "TleGetLoaded"),
                          to: fnPtrTleGetLoaded.self)

    function(order, satKeys)
}
