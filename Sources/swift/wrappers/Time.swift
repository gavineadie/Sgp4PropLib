//
//  Time.swift
//  Sgp4Swift
//
//  Created by Gavin Eadie on 10/17/22.
//

import Foundation
import obj_c

#if os(Linux)
fileprivate let libHandle = loadDll("libtimefunc.so")
#elseif os(Windows)
fileprivate let libHandle = loadDll("Timefunc.dll")
#else
fileprivate let libHandle = loadDll("libtimefunc.dylib")
#endif

// -------------------------------- TIMEFUNCINIT
// ORIGINAL:     int TimeFuncInit((in-Long) apPtr)

public func TimeFuncInit(_ apPtr: Int64) -> Int32 {

    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "TimeFuncInit"),
                                 to: fnPtrTimeFuncInit.self)

    return function(apPtr)
}

// -------------------------------- TIMEFUNCGETINFO
// ORIGINAL:     void TimeFuncGetInfo((out-Character[128]) infoStr)

public func TimeFuncGetInfo(_ infoStr: UnsafeMutablePointer<CChar>) {

    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "TimeFuncGetInfo"),
                                 to: fnPtrTimeFuncGetInfo.self)

    function(infoStr)
}

// -------------------------------- TCONLOADFILE
// ORIGINAL:     int TConLoadFile((in-Character[512]) tconFile)

public func TConLoadFile(_ tconFile: UnsafeMutablePointer<CChar>) -> Int32 {

    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "TConLoadFile"),
                                 to: fnPtrTConLoadFile.self)

    return function(tconFile)
}

// -------------------------------- TIMEFUNCLOADFILE
// ORIGINAL:     int TimeFuncLoadFile((in-Character[512]) tconFile)

public func TimeFuncLoadFile(_ tconFile: UnsafeMutablePointer<CChar>) -> Int32 {

    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "TimeFuncLoadFile"),
                                 to: fnPtrTimeFuncLoadFile.self)

    return function(tconFile)
}

// -------------------------------- ISTCONFILELOADED
// ORIGINAL:     int IsTConFileLoaded()

public func IsTConFileLoaded() -> Int32 {

    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "IsTConFileLoaded"),
                                 to: fnPtrIsTConFileLoaded.self)

    return function()
}

// -------------------------------- TCONSAVEFILE
// ORIGINAL:     int TConSaveFile((in-Character[512]) tconFile, (in-Integer) saveMode, (in-Integer) saveForm)

public func TConSaveFile(_ tconFile: UnsafeMutablePointer<CChar>, _ saveMode: Int32, _ saveForm: Int32) -> Int32 {

    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "TConSaveFile"),
                                 to: fnPtrTConSaveFile.self)

    return function(tconFile, saveMode, saveForm)
}

// -------------------------------- TCONADDAREC
// ORIGINAL:     int TConAddARec((in-Double) refDs50UTC, (in-Double) leapDs50UTC, (in-Double) taiMinusUTC, (in-Double) ut1MinusUTC, (in-Double) ut1Rate, (in-Double) polarX, (in-Double) polarY)

public func TConAddARec(_ refDs50UTC: Double, _ leapDs50UTC: Double, _ taiMinusUTC: Double,
                        _ ut1MinusUTC: Double, _ ut1Rate: Double, _ polarX: Double, _ polarY: Double) -> Int32 {

    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "TConAddARec"),
                                 to: fnPtrTConAddARec.self)

    return function(refDs50UTC, leapDs50UTC, taiMinusUTC, ut1MinusUTC, ut1Rate, polarX, polarY)
}

// -------------------------------- TCONADDONE
// ORIGINAL:     int TConAddOne((in-Double) refDs50UTC, (in-Double) taiMinusUTC, (in-Double) ut1MinusUTC, (in-Double) ut1Rate, (in-Double) polarX, (in-Double) polarY)

public func TConAddOne(_ refDs50UTC: Double, _ taiMinusUTC: Double, _ ut1MinusUTC: Double,
                       _ ut1Rate: Double, _ polarX: Double, _ polarY: Double) -> Int32 {

    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "TConAddOne"),
                                 to: fnPtrTConAddOne.self)

    return function(refDs50UTC, taiMinusUTC, ut1MinusUTC, ut1Rate, polarX, polarY)
}

// -------------------------------- UTCTOTCONREC
// ORIGINAL:     void UTCToTConRec((in-Double) ds50UTC, (out-Double) taiMinusUTC, (out-Double) ut1MinusUTC, (out-Double) ut1Rate, (out-Double) polarX, (out-Double) polarY)

public func UTCToTConRec(_ ds50UTC: Double, _ taiMinusUTC: UnsafeMutablePointer<Double>,
                         _ ut1MinusUTC: UnsafeMutablePointer<Double>,
                         _ ut1Rate: UnsafeMutablePointer<Double>,
                         _ polarX: UnsafeMutablePointer<Double>, _ polarY: UnsafeMutablePointer<Double>) {

    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "UTCToTConRec"),
                                 to: fnPtrUTCToTConRec.self)

    function(ds50UTC, taiMinusUTC, ut1MinusUTC, ut1Rate, polarX, polarY)
}

// -------------------------------- TCONREMOVEALL
// ORIGINAL:     int TConRemoveAll()

public func TConRemoveAll() -> Int32 {

    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "TConRemoveAll"),
                                 to: fnPtrTConRemoveAll.self)

    return function()
}

// -------------------------------- UTCTODTG20
// ORIGINAL:     void UTCToDTG20((in-Double) ds50UTC, (out-Character[20]) dtg20)

public func UTCToDTG20(_ ds50UTC: Double, _ dtg20: UnsafeMutablePointer<CChar>) {

    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "UTCToDTG20"),
                                 to: fnPtrUTCToDTG20.self)

    function(ds50UTC, dtg20)
}

// -------------------------------- UTCTODTG19
// ORIGINAL:     void UTCToDTG19((in-Double) ds50UTC, (out-Character[19]) dtg19)

public func UTCToDTG19(_ ds50UTC: Double, _ dtg19: UnsafeMutablePointer<CChar>) {

    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "UTCToDTG19"),
                                 to: fnPtrUTCToDTG19.self)

    function(ds50UTC, dtg19)
}

// -------------------------------- UTCTODTG17
// ORIGINAL:     void UTCToDTG17((in-Double) ds50UTC, (out-Character[17]) dtg17)

public func UTCToDTG17(_ ds50UTC: Double, _ dtg17: UnsafeMutablePointer<CChar>) {

    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "UTCToDTG17"),
                                 to: fnPtrUTCToDTG17.self)

    function(ds50UTC, dtg17)
}

// -------------------------------- UTCTODTG15
// ORIGINAL:     void UTCToDTG15((in-Double) ds50UTC, (out-Character[15]) dtg15)

public func UTCToDTG15(_ ds50UTC: Double, _ dtg15: UnsafeMutablePointer<CChar>) {

    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "UTCToDTG15"),
                                 to: fnPtrUTCToDTG15.self)

    function(ds50UTC, dtg15)
}

// -------------------------------- DTGTOUTC
// ORIGINAL:     double DTGToUTC((in-Character[20]) dtg)

public func DTGToUTC(_ dtg: UnsafeMutablePointer<CChar>) -> Double {

    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "DTGToUTC"),
                                 to: fnPtrDTGToUTC.self)

    return function(dtg)
}

// -------------------------------- UTCTOTAI
// ORIGINAL:     double UTCToTAI((in-Double) ds50UTC)

public func UTCToTAI(_ ds50UTC: Double) -> Double {

    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "UTCToTAI"),
                                 to: fnPtrUTCToTAI.self)

    return function(ds50UTC)
}

// -------------------------------- UTCTOUT1
// ORIGINAL:     double UTCToUT1((in-Double) ds50UTC)

public func UTCToUT1(_ ds50UTC: Double) -> Double {

    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "UTCToUT1"),
                                 to: fnPtrUTCToUT1.self)

    return function(ds50UTC)
}

// -------------------------------- UTCTOET
// ORIGINAL:     double UTCToET((in-Double) ds50UTC)

public func UTCToET(_ ds50UTC: Double) -> Double {

    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "UTCToET"),
                                 to: fnPtrUTCToET.self)

    return function(ds50UTC)
}

// -------------------------------- TAITOUTC
// ORIGINAL:     double TAIToUTC((in-Double) ds50TAI)

public func TAIToUTC(_ ds50TAI: Double) -> Double {

    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "TAIToUTC"),
                                 to: fnPtrTAIToUTC.self)

    return function(ds50TAI)
}

// -------------------------------- TAITOUT1
// ORIGINAL:     double TAIToUT1((in-Double) ds50TAI)

public func TAIToUT1(_ ds50TAI: Double) -> Double {

    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "TAIToUT1"),
                                 to: fnPtrTAIToUT1.self)

    return function(ds50TAI)
}

// -------------------------------- YRDAYSTOUTC
// ORIGINAL:     double YrDaysToUTC((in-Integer) year, (in-Double) dayOfYear)

public func YrDaysToUTC(_ year: Int32, _ dayOfYear: Double) -> Double {

    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "YrDaysToUTC"),
                                 to: fnPtrYrDaysToUTC.self)

    return function(year, dayOfYear)
}

// -------------------------------- UTCTOYRDAYS
// ORIGINAL:     void UTCToYrDays((in-Double) ds50UTC, (out-Integer) year, (out-Double) dayOfYear)

public func UTCToYrDays(_ ds50UTC: Double, _ year: UnsafeMutablePointer<Int32>, _ dayOfYear: UnsafeMutablePointer<Double>) {

    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "UTCToYrDays"),
                                 to: fnPtrUTCToYrDays.self)

    function(ds50UTC, year, dayOfYear)
}

// -------------------------------- TIMECOMPS1TOUTC
// ORIGINAL:     double TimeComps1ToUTC((in-Integer) year, (in-Integer) dayOfYear, (in-Integer) hh, (in-Integer) mm, (in-Double) sss)

public func TimeComps1ToUTC(_ year: Int32, _ dayOfYear: Int32,
                            _ hh: Int32, _ mm: Int32, _ sss: Double) -> Double {

    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "TimeComps1ToUTC"),
                                 to: fnPtrTimeComps1ToUTC.self)

    return function(year, dayOfYear, hh, mm, sss)
}

// -------------------------------- UTCTOTIMECOMPS1
// ORIGINAL:     void UTCToTimeComps1((in-Double) ds50UTC, (out-Integer) year, (out-Integer) dayOfYear, (out-Integer) hh, (out-Integer) mm, (out-Double) sss)

public func UTCToTimeComps1(_ ds50UTC: Double,
                            _ year: UnsafeMutablePointer<Int32>,
                            _ dayOfYear: UnsafeMutablePointer<Int32>,
                            _ hh: UnsafeMutablePointer<Int32>,
                            _ mm: UnsafeMutablePointer<Int32>,
                            _ sss: UnsafeMutablePointer<Double>) {

    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "UTCToTimeComps1"),
                                 to: fnPtrUTCToTimeComps1.self)

    function(ds50UTC, year, dayOfYear, hh, mm, sss)
}

// -------------------------------- TIMECOMPS2TOUTC
// ORIGINAL:     double TimeComps2ToUTC((in-Integer) year, (in-Integer) mon, (in-Integer) dayOfMonth, (in-Integer) hh, (in-Integer) mm, (in-Double) sss)

public func TimeComps2ToUTC(_ year: Int32, _ mon: Int32, _ dayOfMonth: Int32,
                            _ hh: Int32, _ mm: Int32, _ sss: Double) -> Double {

    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "TimeComps2ToUTC"),
                                 to: fnPtrTimeComps2ToUTC.self)

    return function(year, mon, dayOfMonth, hh, mm, sss)
}

// -------------------------------- UTCTOTIMECOMPS2
// ORIGINAL:     void UTCToTimeComps2((in-Double) ds50UTC, (out-Integer) year, (out-Integer) month, (out-Integer) dayOfMonth, (out-Integer) hh, (out-Integer) mm, (out-Double) sss)

public func UTCToTimeComps2(_ ds50UTC: Double,
                            _ year: UnsafeMutablePointer<Int32>,
                            _ month: UnsafeMutablePointer<Int32>,
                            _ dayOfMonth: UnsafeMutablePointer<Int32>,
                            _ hh: UnsafeMutablePointer<Int32>,
                            _ mm: UnsafeMutablePointer<Int32>,
                            _ sss: UnsafeMutablePointer<Double>) {

    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "UTCToTimeComps2"),
                                 to: fnPtrUTCToTimeComps2.self)

    function(ds50UTC, year, month, dayOfMonth, hh, mm, sss)
}

// -------------------------------- THETAGRNWCH
// ORIGINAL:     double ThetaGrnwch((in-Double) ds50UT1, (in-Long) envFk)

public func ThetaGrnwch(_ ds50UT1: Double, _ envFk: Int64) -> Double {

    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "ThetaGrnwch"),
                                 to: fnPtrThetaGrnwch.self)

    return function(ds50UT1, envFk)
}

// -------------------------------- THETAGRNWCHFK4
// ORIGINAL:     double ThetaGrnwchFK4((in-Double) ds50UT1)

public func ThetaGrnwchFK4(_ ds50UT1: Double) -> Double {

    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "ThetaGrnwchFK4"),
                                 to: fnPtrThetaGrnwchFK4.self)

    return function(ds50UT1)
}

// -------------------------------- THETAGRNWCHFK5
// ORIGINAL:     double ThetaGrnwchFK5((in-Double) ds50UT1)

public func ThetaGrnwchFK5(_ ds50UT1: Double) -> Double {

    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "ThetaGrnwchFK5"),
                                 to: fnPtrThetaGrnwchFK5.self)

    return function(ds50UT1)
}

// -------------------------------- GET6P
// ORIGINAL:     void Get6P((out-Integer) startFrEpoch, (out-Integer) stopFrEpoch, (out-Double) startTime, (out-Double) stopTime, (out-Double) interval)

public func Get6P(_ startFrEpoch: UnsafeMutablePointer<Int32>,
                  _ stopFrEpoch: UnsafeMutablePointer<Int32>,
                  _ startTime: UnsafeMutablePointer<Double>,
                  _ stopTime: UnsafeMutablePointer<Double>,
                  _ Interval: UnsafeMutablePointer<Double>) {

    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "Get6P"),
                                 to: fnPtrGet6P.self)

    function(startFrEpoch, stopFrEpoch, startTime, stopTime, Interval)
}

// -------------------------------- SET6P
// ORIGINAL:     void Set6P((in-Integer) startFrEpoch, (in-Integer) stopFrEpoch, (in-Double) startTime, (in-Double) stopTime, (in-Double) interval)

public func Set6P(_ startFrEpoch: Int32, _ stopFrEpoch: Int32,
                  _ startTime: Double, _ stopTime: Double, _ Interval: Double) {

    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "Set6P"),
                                 to: fnPtrSet6P.self)

    function(startFrEpoch, stopFrEpoch, startTime, stopTime, Interval)
}

// -------------------------------- GET6PCARDLINE
// ORIGINAL:     void Get6PCardLine((out-Character[512]) card6PLine)

public func Get6PCardLine(_ card6PLine: UnsafeMutablePointer<CChar>) {

    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "Get6PCardLine"),
                                 to: fnPtrGet6PCardLine.self)

    function(card6PLine)
}

// -------------------------------- TIMECONVFRTO
// ORIGINAL:     void TimeConvFrTo((in-Integer) funcIdx, (in-Double[*]) frArr, (out-Double[*]) toArr)

public func TimeConvFrTo(_ funcIdx: Int32,
                         _ frArr: UnsafeMutablePointer<Double>,
                         _ toArr: UnsafeMutablePointer<Double>) {

    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "TimeConvFrTo"),
                                 to: fnPtrTimeConvFrTo.self)

    function(funcIdx, frArr, toArr)
}
