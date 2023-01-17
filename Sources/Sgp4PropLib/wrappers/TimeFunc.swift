// This wrapper file was generated automatically by the GenDllWrappers program.
import Foundation
import Sgp4Prop_c

#if os(Linux)
fileprivate let libHandle = loadDll("libtimefunc.so")
#elseif os(Windows)
fileprivate let libHandle = loadDll("TimeFunc.dll")
#else
fileprivate let libHandle = loadDll("libtimefunc.dylib")
#endif

public func TimeFuncInit(_ apAddr: Int64) -> Int32 {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "TimeFuncInit"), to: fnPtrTimeFuncInit.self)

    return function(apAddr)
}

public func TimeFuncGetInfo(_ infoStr: UnsafeMutablePointer<CChar>) {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "TimeFuncGetInfo"), to: fnPtrTimeFuncGetInfo.self)

    function(infoStr)
}

public func TConLoadFile(_ tconFile: UnsafeMutablePointer<CChar>) -> Int32 {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "TConLoadFile"), to: fnPtrTConLoadFile.self)

    return function(tconFile)
}

public func TimeFuncLoadFile(_ tconFile: UnsafeMutablePointer<CChar>) -> Int32 {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "TimeFuncLoadFile"), to: fnPtrTimeFuncLoadFile.self)

    return function(tconFile)
}

public func IsTConFileLoaded() -> Int32 {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "IsTConFileLoaded"), to: fnPtrIsTConFileLoaded.self)

    return function()
}

public func TConSaveFile(_ tconFile: UnsafeMutablePointer<CChar>, _ saveMode: Int32, _ saveForm: Int32) -> Int32 {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "TConSaveFile"), to: fnPtrTConSaveFile.self)

    return function(tconFile, saveMode, saveForm)
}

public func TConAddARec(_ refDs50UTC: Double, _ leapDs50UTC: Double, _ taiMinusUTC: Double, _ ut1MinusUTC: Double, _ ut1Rate: Double, _ polarX: Double, _ polarY: Double) -> Int32 {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "TConAddARec"), to: fnPtrTConAddARec.self)

    return function(refDs50UTC, leapDs50UTC, taiMinusUTC, ut1MinusUTC, ut1Rate, polarX, polarY)
}

public func TConAddOne(_ refDs50UTC: Double, _ taiMinusUTC: Double, _ ut1MinusUTC: Double, _ ut1Rate: Double, _ polarX: Double, _ polarY: Double) -> Int32 {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "TConAddOne"), to: fnPtrTConAddOne.self)

    return function(refDs50UTC, taiMinusUTC, ut1MinusUTC, ut1Rate, polarX, polarY)
}

public func UTCToTConRec(_ ds50UTC: Double, _ taiMinusUTC: UnsafeMutablePointer<Double>, _ ut1MinusUTC: UnsafeMutablePointer<Double>, _ ut1Rate: UnsafeMutablePointer<Double>, _ polarX: UnsafeMutablePointer<Double>, _ polarY: UnsafeMutablePointer<Double>) {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "UTCToTConRec"), to: fnPtrUTCToTConRec.self)

    function(ds50UTC, taiMinusUTC, ut1MinusUTC, ut1Rate, polarX, polarY)
}

public func TConRemoveAll() -> Int32 {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "TConRemoveAll"), to: fnPtrTConRemoveAll.self)

    return function()
}

public func UTCToDTG20(_ ds50UTC: Double, _ dtg20: UnsafeMutablePointer<CChar>) {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "UTCToDTG20"), to: fnPtrUTCToDTG20.self)

    function(ds50UTC, dtg20)
}

public func UTCToDTG19(_ ds50UTC: Double, _ dtg19: UnsafeMutablePointer<CChar>) {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "UTCToDTG19"), to: fnPtrUTCToDTG19.self)

    function(ds50UTC, dtg19)
}

public func UTCToDTG17(_ ds50UTC: Double, _ dtg17: UnsafeMutablePointer<CChar>) {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "UTCToDTG17"), to: fnPtrUTCToDTG17.self)

    function(ds50UTC, dtg17)
}

public func UTCToDTG15(_ ds50UTC: Double, _ dtg15: UnsafeMutablePointer<CChar>) {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "UTCToDTG15"), to: fnPtrUTCToDTG15.self)

    function(ds50UTC, dtg15)
}

public func DTGToUTC(_ dtg: UnsafeMutablePointer<CChar>) -> Double {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "DTGToUTC"), to: fnPtrDTGToUTC.self)

    return function(dtg)
}

public func UTCToTAI(_ ds50UTC: Double) -> Double {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "UTCToTAI"), to: fnPtrUTCToTAI.self)

    return function(ds50UTC)
}

public func UTCToUT1(_ ds50UTC: Double) -> Double {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "UTCToUT1"), to: fnPtrUTCToUT1.self)

    return function(ds50UTC)
}

public func UTCToET(_ ds50UTC: Double) -> Double {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "UTCToET"), to: fnPtrUTCToET.self)

    return function(ds50UTC)
}

public func TAIToUTC(_ ds50TAI: Double) -> Double {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "TAIToUTC"), to: fnPtrTAIToUTC.self)

    return function(ds50TAI)
}

public func TAIToUT1(_ ds50TAI: Double) -> Double {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "TAIToUT1"), to: fnPtrTAIToUT1.self)

    return function(ds50TAI)
}

public func YrDaysToUTC(_ year: Int32, _ dayOfYear: Double) -> Double {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "YrDaysToUTC"), to: fnPtrYrDaysToUTC.self)

    return function(year, dayOfYear)
}

public func UTCToYrDays(_ ds50UTC: Double, _ year: UnsafeMutablePointer<Int32>, _ dayOfYear: UnsafeMutablePointer<Double>) {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "UTCToYrDays"), to: fnPtrUTCToYrDays.self)

    function(ds50UTC, year, dayOfYear)
}

public func TimeComps1ToUTC(_ year: Int32, _ dayOfYear: Int32, _ hh: Int32, _ mm: Int32, _ sss: Double) -> Double {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "TimeComps1ToUTC"), to: fnPtrTimeComps1ToUTC.self)

    return function(year, dayOfYear, hh, mm, sss)
}

public func UTCToTimeComps1(_ ds50UTC: Double, _ year: UnsafeMutablePointer<Int32>, _ dayOfYear: UnsafeMutablePointer<Int32>, _ hh: UnsafeMutablePointer<Int32>, _ mm: UnsafeMutablePointer<Int32>, _ sss: UnsafeMutablePointer<Double>) {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "UTCToTimeComps1"), to: fnPtrUTCToTimeComps1.self)

    function(ds50UTC, year, dayOfYear, hh, mm, sss)
}

public func TimeComps2ToUTC(_ year: Int32, _ mon: Int32, _ dayOfMonth: Int32, _ hh: Int32, _ mm: Int32, _ sss: Double) -> Double {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "TimeComps2ToUTC"), to: fnPtrTimeComps2ToUTC.self)

    return function(year, mon, dayOfMonth, hh, mm, sss)
}

public func UTCToTimeComps2(_ ds50UTC: Double, _ year: UnsafeMutablePointer<Int32>, _ month: UnsafeMutablePointer<Int32>, _ dayOfMonth: UnsafeMutablePointer<Int32>, _ hh: UnsafeMutablePointer<Int32>, _ mm: UnsafeMutablePointer<Int32>, _ sss: UnsafeMutablePointer<Double>) {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "UTCToTimeComps2"), to: fnPtrUTCToTimeComps2.self)

    function(ds50UTC, year, month, dayOfMonth, hh, mm, sss)
}

public func ThetaGrnwch(_ ds50UT1: Double, _ lenvFk: Int64) -> Double {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "ThetaGrnwch"), to: fnPtrThetaGrnwch.self)

    return function(ds50UT1, lenvFk)
}

public func ThetaGrnwchFK4(_ ds50UT1: Double) -> Double {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "ThetaGrnwchFK4"), to: fnPtrThetaGrnwchFK4.self)

    return function(ds50UT1)
}

public func ThetaGrnwchFK5(_ ds50UT1: Double) -> Double {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "ThetaGrnwchFK5"), to: fnPtrThetaGrnwchFK5.self)

    return function(ds50UT1)
}

public func TimeConvFrTo(_ funcIdx: Int32, _ frArr: UnsafeMutablePointer<Double>, _ toArr: UnsafeMutablePointer<Double>) {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "TimeConvFrTo"), to: fnPtrTimeConvFrTo.self)

    function(funcIdx, frArr, toArr)
}

public func Get6P(_ startFrEpoch: UnsafeMutablePointer<Int32>, _ stopFrEpoch: UnsafeMutablePointer<Int32>, _ startTime: UnsafeMutablePointer<Double>, _ stopTime: UnsafeMutablePointer<Double>, _ interval: UnsafeMutablePointer<Double>) {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "Get6P"), to: fnPtrGet6P.self)

    function(startFrEpoch, stopFrEpoch, startTime, stopTime, interval)
}

public func Set6P(_ startFrEpoch: Int32, _ stopFrEpoch: Int32, _ startTime: Double, _ stopTime: Double, _ interval: Double) {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "Set6P"), to: fnPtrSet6P.self)

    function(startFrEpoch, stopFrEpoch, startTime, stopTime, interval)
}

public func Get6PCardLine(_ card6PLine: UnsafeMutablePointer<CChar>) {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "Get6PCardLine"), to: fnPtrGet6PCardLine.self)

    function(card6PLine)
}
// ========================= End of auto generated code ==========================
