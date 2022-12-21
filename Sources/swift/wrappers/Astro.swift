//
//  Astro.swift
//  Sgp4Swift
//
//  Created by Gavin Eadie on 10/17/22.
//

import Foundation
import obj_c

#if os(Linux)
fileprivate let libHandle = loadDll("libastrofunc.so")
#elseif os(Windows)
fileprivate let libHandle = loadDll("Astrofunc.dll")
#else
fileprivate let libHandle = loadDll("libastrofunc.dylib")
#endif

// -------------------------------- ASTROFUNCINIT
// ORIGINAL:     int AstroFuncInit((in-Long) apPtr)

public func AstroFuncInit(_ apPtr: Int64) -> Int32 {
    
    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "AstroFuncInit"),
                                 to: fnPtrAstroFuncInit.self)
    
    return function(apPtr)
}

// -------------------------------- ASTROFUNCGETINFO
// ORIGINAL:     void AstroFuncGetInfo((out-Character[128]) infoStr)

public func AstroFuncGetInfo(_ infoStr: UnsafeMutablePointer<CChar>) {
    
    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "AstroFuncGetInfo"),
                                 to: fnPtrAstroFuncGetInfo.self)
    
    function(infoStr)
}

// -------------------------------- KEPTOEQNX
// ORIGINAL:     void KepToEqnx((in-Double[6]) metricKep, (out-Double[6]) metricEqnx)

public func KepToEqnx(_ metricKep: UnsafeMutablePointer<Double>, _ metricEqnx: UnsafeMutablePointer<Double>) {
    
    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "KepToEqnx"),
                                 to: fnPtrKepToEqnx.self)
    
    function(metricKep, metricEqnx)
}

// -------------------------------- KEPTOPOSVEL
// ORIGINAL:     void KepToPosVel((in-Double[6]) metricKep, (out-Double[3]) pos, (out-Double[3]) vel)

public func KepToPosVel(_ metricKep: UnsafeMutablePointer<Double>, _ pos: UnsafeMutablePointer<Double>, _ vel: UnsafeMutablePointer<Double>) {
    
    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "KepToPosVel"),
                                 to: fnPtrKepToPosVel.self)
    
    function(metricKep, pos, vel)
}

// -------------------------------- KEPTOUVW
// ORIGINAL:     void KepToUVW((in-Double[6]) metricKep, (out-Double[3]) uBar, (out-Double[3]) vBar, (out-Double[3]) wBar)

public func KepToUVW(_ metricKep: UnsafeMutablePointer<Double>, _ uBar: UnsafeMutablePointer<Double>, _ vBar: UnsafeMutablePointer<Double>, _ wBar: UnsafeMutablePointer<Double>) {
    
    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "KepToUVW"),
                                 to: fnPtrKepToUVW.self)
    
    function(metricKep, uBar, vBar, wBar)
}

// -------------------------------- CLASSTOEQNX
// ORIGINAL:     void ClassToEqnx((in-Double[6]) metricClass, (out-Double[6]) metricEqnx)

public func ClassToEqnx(_ metricClass: UnsafeMutablePointer<Double>, _ metricEqnx: UnsafeMutablePointer<Double>) {
    
    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "ClassToEqnx"),
                                 to: fnPtrClassToEqnx.self)
    
    function(metricClass, metricEqnx)
}

// -------------------------------- EQNXTOCLASS
// ORIGINAL:     void EqnxToClass((in-Double[6]) metricEqnx, (out-Double[6]) metricClass)

public func EqnxToClass(_ metricEqnx: UnsafeMutablePointer<Double>, _ metricClass: UnsafeMutablePointer<Double>) {
    
    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "EqnxToClass"),
                                 to: fnPtrEqnxToClass.self)
    
    function(metricEqnx, metricClass)
}

// -------------------------------- EQNXTOKEP
// ORIGINAL:     void EqnxToKep((in-Double[6]) metricEqnx, (out-Double[6]) metricKep)

public func EqnxToKep(_ metricEqnx: UnsafeMutablePointer<Double>, _ metricKep: UnsafeMutablePointer<Double>) {
    
    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "EqnxToKep"),
                                 to: fnPtrEqnxToKep.self)
    
    function(metricEqnx, metricKep)
}

// -------------------------------- EQNXTOPOSVEL
// ORIGINAL:     void EqnxToPosVel((in-Double[6]) metricEqnx, (out-Double[3]) pos, (out-Double[3]) vel)

public func EqnxToPosVel(_ metricEqnx: UnsafeMutablePointer<Double>, _ pos: UnsafeMutablePointer<Double>, _ vel: UnsafeMutablePointer<Double>) {
    
    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "EqnxToPosVel"),
                                 to: fnPtrEqnxToPosVel.self)
    
    function(metricEqnx, pos, vel)
}

// -------------------------------- POSVELTOEQNX
// ORIGINAL:     void PosVelToEqnx((in-Double[3]) pos, (in-Double[3]) vel, (out-Double[6]) metricEqnx)

public func PosVelToEqnx(_ pos: UnsafeMutablePointer<Double>, _ vel: UnsafeMutablePointer<Double>, _ metricEqnx: UnsafeMutablePointer<Double>) {
    
    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "PosVelToEqnx"),
                                 to: fnPtrPosVelToEqnx.self)
    
    function(pos, vel, metricEqnx)
}

// -------------------------------- POSVELMUTOEQNX
// ORIGINAL:     void PosVelMuToEqnx((in-Double[3]) pos, (in-Double[3]) vel, (in-Double) mu, (out-Double[6]) metricEqnx)

public func PosVelMuToEqnx(_ pos: UnsafeMutablePointer<Double>, _ vel: UnsafeMutablePointer<Double>, _ mu: Double, _ metricEqnx: UnsafeMutablePointer<Double>) {
    
    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "PosVelMuToEqnx"),
                                 to: fnPtrPosVelMuToEqnx.self)
    
    function(pos, vel, mu, metricEqnx)
}

// -------------------------------- POSVELTOKEP
// ORIGINAL:     void PosVelToKep((in-Double[3]) pos, (in-Double[3]) vel, (out-Double[6]) metricKep)

public func PosVelToKep(_ pos: UnsafeMutablePointer<Double>, _ vel: UnsafeMutablePointer<Double>, _ metricKep: UnsafeMutablePointer<Double>) {
    
    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "PosVelToKep"),
                                 to: fnPtrPosVelToKep.self)
    
    function(pos, vel, metricKep)
}

// -------------------------------- POSVELMUTOKEP
// ORIGINAL:     void PosVelMuToKep((in-Double[3]) pos, (in-Double[3]) vel, (in-Double) mu, (out-Double[6]) metricKep)

public func PosVelMuToKep(_ pos: UnsafeMutablePointer<Double>, _ vel: UnsafeMutablePointer<Double>, _ mu: Double, _ metricKep: UnsafeMutablePointer<Double>) {
    
    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "PosVelMuToKep"),
                                 to: fnPtrPosVelMuToKep.self)
    
    function(pos, vel, mu, metricKep)
}

// -------------------------------- POSVELTOUUVW
// ORIGINAL:     void PosVelToUUVW((in-Double[3]) pos, (in-Double[3]) vel, (out-Double[3]) uvec, (out-Double[3]) vVec, (out-Double[3]) wVec)

public func PosVelToUUVW(_ pos: UnsafeMutablePointer<Double>, _ vel: UnsafeMutablePointer<Double>, _ uvec: UnsafeMutablePointer<Double>, _ vVec: UnsafeMutablePointer<Double>, _ wVec: UnsafeMutablePointer<Double>) {
    
    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "PosVelToUUVW"),
                                 to: fnPtrPosVelToUUVW.self)
    
    function(pos, vel, uvec, vVec, wVec)
}

// -------------------------------- POSVELTOPTW
// ORIGINAL:     void PosVelToPTW((in-Double[3]) pos, (in-Double[3]) vel, (out-Double[3]) uvec, (out-Double[3]) vVec, (out-Double[3]) wVec)

public func PosVelToPTW(_ pos: UnsafeMutablePointer<Double>, _ vel: UnsafeMutablePointer<Double>, _ uvec: UnsafeMutablePointer<Double>, _ vVec: UnsafeMutablePointer<Double>, _ wVec: UnsafeMutablePointer<Double>) {
    
    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "PosVelToPTW"),
                                 to: fnPtrPosVelToPTW.self)
    
    function(pos, vel, uvec, vVec, wVec)
}

// -------------------------------- SOLVEKEPEQTN
// ORIGINAL:     double SolveKepEqtn((in-Double[6]) metricKep)

public func SolveKepEqtn(_ metricKep: UnsafeMutablePointer<Double>) -> Double {
    
    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "SolveKepEqtn"),
                                 to: fnPtrSolveKepEqtn.self)
    
    return function(metricKep)
}

// -------------------------------- COMPTRUEANOMALY
// ORIGINAL:     double CompTrueAnomaly((in-Double[6]) metricKep)

public func CompTrueAnomaly(_ metricKep: UnsafeMutablePointer<Double>) -> Double {
    
    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "CompTrueAnomaly"),
                                 to: fnPtrCompTrueAnomaly.self)
    
    return function(metricKep)
}

// -------------------------------- NTOA
// ORIGINAL:     double NToA((in-Double) n)

public func NToA(_ n: Double) -> Double {
    
    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "NToA"),
                                 to: fnPtrNToA.self)
    
    return function(n)
}

// -------------------------------- ATON
// ORIGINAL:     double AToN((in-Double) a)

public func AToN(_ a: Double) -> Double {
    
    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "AToN"),
                                 to: fnPtrAToN.self)
    
    return function(a)
}

// -------------------------------- KOZAITOBROUWER
// ORIGINAL:     double KozaiToBrouwer((in-Double) eccen, (in-Double) incli, (in-Double) nKozai)

public func KozaiToBrouwer(_ eccen: Double, _ incli: Double, _ nKozai: Double) -> Double {
    
    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "KozaiToBrouwer"),
                                 to: fnPtrKozaiToBrouwer.self)
    
    return function(eccen, incli, nKozai)
}

// -------------------------------- BROUWERTOKOZAI
// ORIGINAL:     double BrouwerToKozai((in-Double) eccen, (in-Double) incli, (in-Double) nBrouwer)

public func BrouwerToKozai(_ eccen: Double, _ incli: Double, _ nBrouwer: Double) -> Double {
    
    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "BrouwerToKozai"),
                                 to: fnPtrBrouwerToKozai.self)
    
    return function(eccen, incli, nBrouwer)
}

// -------------------------------- KEPOSCTOMEAN
// ORIGINAL:     void KepOscToMean((in-Double[6]) metricOscKep, (out-Double[6]) metricMeanKep)

public func KepOscToMean(_ metricOscKep: UnsafeMutablePointer<Double>, _ metricMeanKep: UnsafeMutablePointer<Double>) {
    
    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "KepOscToMean"),
                                 to: fnPtrKepOscToMean.self)
    
    function(metricOscKep, metricMeanKep)
}

// -------------------------------- XYZTOLLH
// ORIGINAL:     void XYZToLLH((in-Double) thetaG, (in-Double[3]) metricPos, (out-Double[3]) metricLLH)

public func XYZToLLH(_ thetaG: Double, _ metricPos: UnsafeMutablePointer<Double>, _ metricLLH: UnsafeMutablePointer<Double>) {
    
    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "XYZToLLH"),
                                 to: fnPtrXYZToLLH.self)
    
    function(thetaG, metricPos, metricLLH)
}

// -------------------------------- XYZTOLLHTIME
// ORIGINAL:     void XYZToLLHTime((in-Double) ds50UTC, (in-Double[3]) metricPos, (out-Double[3]) metricLLH)

public func XYZToLLHTime(_ ds50UTC: Double, _ metricPos: UnsafeMutablePointer<Double>, _ metricLLH: UnsafeMutablePointer<Double>) {
    
    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "XYZToLLHTime"),
                                 to: fnPtrXYZToLLHTime.self)
    
    function(ds50UTC, metricPos, metricLLH)
}

// -------------------------------- LLHTOXYZ
// ORIGINAL:     void LLHToXYZ((in-Double) thetaG, (in-Double[3]) metricLLH, (out-Double[3]) metricXYZ)

public func LLHToXYZ(_ thetaG: Double, _ metricLLH: UnsafeMutablePointer<Double>, _ metricXYZ: UnsafeMutablePointer<Double>) {
    
    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "LLHToXYZ"),
                                 to: fnPtrLLHToXYZ.self)
    
    function(thetaG, metricLLH, metricXYZ)
}

// -------------------------------- LLHTOXYZTIME
// ORIGINAL:     void LLHToXYZTime((in-Double) ds50UTC, (in-Double[3]) metricLLH, (out-Double[3]) metricXYZ)

public func LLHToXYZTime(_ ds50UTC: Double, _ metricLLH: UnsafeMutablePointer<Double>, _ metricXYZ: UnsafeMutablePointer<Double>) {
    
    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "LLHToXYZTime"),
                                 to: fnPtrLLHToXYZTime.self)
    
    function(ds50UTC, metricLLH, metricXYZ)
}

// -------------------------------- EFGTOECI
// ORIGINAL:     void EFGToECI((in-Double) thetaG, (in-Double[3]) posEFG, (in-Double[3]) velEFG, (out-Double[3]) posECI, (out-Double[3]) velECI)

public func EFGToECI(_ thetaG: Double, _ posEFG: UnsafeMutablePointer<Double>, _ velEFG: UnsafeMutablePointer<Double>, _ posECI: UnsafeMutablePointer<Double>, _ velECI: UnsafeMutablePointer<Double>) {
    
    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "EFGToECI"),
                                 to: fnPtrEFGToECI.self)
    
    function(thetaG, posEFG, velEFG, posECI, velECI)
}

// -------------------------------- EFGTOECITIME
// ORIGINAL:     void EFGToECITime((in-Double) ds50UTC, (in-Double[3]) posEFG, (in-Double[3]) velEFG, (out-Double[3]) posECI, (out-Double[3]) velECI)

public func EFGToECITime(_ ds50UTC: Double, _ posEFG: UnsafeMutablePointer<Double>, _ velEFG: UnsafeMutablePointer<Double>, _ posECI: UnsafeMutablePointer<Double>, _ velECI: UnsafeMutablePointer<Double>) {
    
    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "EFGToECITime"),
                                 to: fnPtrEFGToECITime.self)
    
    function(ds50UTC, posEFG, velEFG, posECI, velECI)
}

// -------------------------------- ECITOEFG
// ORIGINAL:     void ECIToEFG((in-Double) thetaG, (in-Double[3]) posECI, (in-Double[3]) velECI, (out-Double[3]) posEFG, (out-Double[3]) velEFG)

public func ECIToEFG(_ thetaG: Double, _ posECI: UnsafeMutablePointer<Double>, _ velECI: UnsafeMutablePointer<Double>, _ posEFG: UnsafeMutablePointer<Double>, _ velEFG: UnsafeMutablePointer<Double>) {
    
    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "ECIToEFG"),
                                 to: fnPtrECIToEFG.self)
    
    function(thetaG, posECI, velECI, posEFG, velEFG)
}

// -------------------------------- ECITOEFGTIME
// ORIGINAL:     void ECIToEFGTime((in-Double) ds50UTC, (in-Double[3]) posECI, (in-Double[3]) velECI, (out-Double[3]) posEFG, (out-Double[3]) velEFG)

public func ECIToEFGTime(_ ds50UTC: Double, _ posECI: UnsafeMutablePointer<Double>, _ velECI: UnsafeMutablePointer<Double>, _ posEFG: UnsafeMutablePointer<Double>, _ velEFG: UnsafeMutablePointer<Double>) {
    
    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "ECIToEFGTime"),
                                 to: fnPtrECIToEFGTime.self)
    
    function(ds50UTC, posECI, velECI, posEFG, velEFG)
}

// -------------------------------- ECRTOEFG
// ORIGINAL:     void ECRToEFG((in-Double) polarX, (in-Double) polarY, (in-Double[3]) posECR, (in-Double[3]) velECR, (out-Double[3]) posEFG, (out-Double[3]) velEFG)

public func ECRToEFG(_ polarX: Double, _ polarY: Double, _ posECR: UnsafeMutablePointer<Double>, _ velECR: UnsafeMutablePointer<Double>, _ posEFG: UnsafeMutablePointer<Double>, _ velEFG: UnsafeMutablePointer<Double>) {
    
    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "ECRToEFG"),
                                 to: fnPtrECRToEFG.self)
    
    function(polarX, polarY, posECR, velECR, posEFG, velEFG)
}

// -------------------------------- ECRTOEFGTIME
// ORIGINAL:     void ECRToEFGTime((in-Double) ds50UTC, (in-Double[3]) posECR, (in-Double[3]) velECR, (out-Double[3]) posEFG, (out-Double[3]) velEFG)

public func ECRToEFGTime(_ ds50UTC: Double, _ posECR: UnsafeMutablePointer<Double>, _ velECR: UnsafeMutablePointer<Double>, _ posEFG: UnsafeMutablePointer<Double>, _ velEFG: UnsafeMutablePointer<Double>) {
    
    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "ECRToEFGTime"),
                                 to: fnPtrECRToEFGTime.self)
    
    function(ds50UTC, posECR, velECR, posEFG, velEFG)
}

// -------------------------------- EFGTOECR
// ORIGINAL:     void EFGToECR((in-Double) polarX, (in-Double) polarY, (in-Double[3]) posEFG, (in-Double[3]) velEFG, (out-Double[3]) posECR, (out-Double[3]) velECR)

public func EFGToECR(_ polarX: Double, _ polarY: Double, _ posEFG: UnsafeMutablePointer<Double>, _ velEFG: UnsafeMutablePointer<Double>, _ posECR: UnsafeMutablePointer<Double>, _ velECR: UnsafeMutablePointer<Double>) {
    
    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "EFGToECR"),
                                 to: fnPtrEFGToECR.self)
    
    function(polarX, polarY, posEFG, velEFG, posECR, velECR)
}

// -------------------------------- EFGTOECRTIME
// ORIGINAL:     void EFGToECRTime((in-Double) ds50UTC, (in-Double[3]) posEFG, (in-Double[3]) velEFG, (out-Double[3]) posECR, (out-Double[3]) velECR)

public func EFGToECRTime(_ ds50UTC: Double, _ posEFG: UnsafeMutablePointer<Double>, _ velEFG: UnsafeMutablePointer<Double>, _ posECR: UnsafeMutablePointer<Double>, _ velECR: UnsafeMutablePointer<Double>) {
    
    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "EFGToECRTime"),
                                 to: fnPtrEFGToECRTime.self)
    
    function(ds50UTC, posEFG, velEFG, posECR, velECR)
}

// -------------------------------- EFGPOSTOLLH
// ORIGINAL:     void EFGPosToLLH((in-Double[3]) posEFG, (out-Double[3]) metricLLH)

public func EFGPosToLLH(_ posEFG: UnsafeMutablePointer<Double>, _ metricLLH: UnsafeMutablePointer<Double>) {
    
    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "EFGPosToLLH"),
                                 to: fnPtrEFGPosToLLH.self)
    
    function(posEFG, metricLLH)
}

// -------------------------------- LLHTOEFGPOS
// ORIGINAL:     void LLHToEFGPos((in-Double[3]) metricLLH, (out-Double[3]) posEFG)

public func LLHToEFGPos(_ metricLLH: UnsafeMutablePointer<Double>, _ posEFG: UnsafeMutablePointer<Double>) {
    
    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "LLHToEFGPos"),
                                 to: fnPtrLLHToEFGPos.self)
    
    function(metricLLH, posEFG)
}

// -------------------------------- ROTJ2KTODATE
// ORIGINAL:     void RotJ2KToDate((in-Integer) spectr, (in-Integer) nutationTerms, (in-Double) ds50TAI, (in-Double[3]) posJ2K, (in-Double[3]) velJ2K, (out-Double[3]) posDate, (out-Double[3]) velDate)

public func RotJ2KToDate(_ spectr: Int32, _ nutationTerms: Int32, _ ds50TAI: Double, _ posJ2K: UnsafeMutablePointer<Double>, _ velJ2K: UnsafeMutablePointer<Double>, _ posDate: UnsafeMutablePointer<Double>, _ velDate: UnsafeMutablePointer<Double>) {
    
    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "RotJ2KToDate"),
                                 to: fnPtrRotJ2KToDate.self)
    
    function(spectr, nutationTerms, ds50TAI, posJ2K, velJ2K, posDate, velDate)
}

// -------------------------------- ROTDATETOJ2K
// ORIGINAL:     void RotDateToJ2K((in-Integer) spectr, (in-Integer) nutationTerms, (in-Double) ds50TAI, (in-Double[3]) posDate, (in-Double[3]) velDate, (out-Double[3]) posJ2K, (out-Double[3]) velJ2K)

public func RotDateToJ2K(_ spectr: Int32, _ nutationTerms: Int32, _ ds50TAI: Double, _ posDate: UnsafeMutablePointer<Double>, _ velDate: UnsafeMutablePointer<Double>, _ posJ2K: UnsafeMutablePointer<Double>, _ velJ2K: UnsafeMutablePointer<Double>) {
    
    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "RotDateToJ2K"),
                                 to: fnPtrRotDateToJ2K.self)
    
    function(spectr, nutationTerms, ds50TAI, posDate, velDate, posJ2K, velJ2K)
}

// -------------------------------- COMPSUNMOONPOS
// ORIGINAL:     void CompSunMoonPos((in-Double) ds50ET, (out-Double[3]) uvecSun, (out-Double) sunVecMag, (out-Double[3]) uvecMoon, (out-Double) moonVecMag)

public func CompSunMoonPos(_ ds50ET: Double, _ uvecSun: UnsafeMutablePointer<Double>, _ sunVecMag: UnsafeMutablePointer<Double>, _ uvecMoon: UnsafeMutablePointer<Double>, _ moonVecMag: UnsafeMutablePointer<Double>) {
    
    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "CompSunMoonPos"),
                                 to: fnPtrCompSunMoonPos.self)
    
    function(ds50ET, uvecSun, sunVecMag, uvecMoon, moonVecMag)
}

// -------------------------------- COMPSUNPOS
// ORIGINAL:     void CompSunPos((in-Double) ds50ET, (out-Double[3]) uvecSun, (out-Double) sunVecMag)

public func CompSunPos(_ ds50ET: Double, _ uvecSun: UnsafeMutablePointer<Double>, _ sunVecMag: UnsafeMutablePointer<Double>) {
    
    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "CompSunPos"),
                                 to: fnPtrCompSunPos.self)
    
    function(ds50ET, uvecSun, sunVecMag)
}

// -------------------------------- COMPMOONPOS
// ORIGINAL:     void CompMoonPos((in-Double) ds50ET, (out-Double[3]) uvecMoon, (out-Double) moonVecMag)

public func CompMoonPos(_ ds50ET: Double, _ uvecMoon: UnsafeMutablePointer<Double>, _ moonVecMag: UnsafeMutablePointer<Double>) {
    
    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "CompMoonPos"),
                                 to: fnPtrCompMoonPos.self)
    
    function(ds50ET, uvecMoon, moonVecMag)
}

// -------------------------------- ASTROCONVFRTO
// ORIGINAL:     void AstroConvFrTo((in-Integer) xf_Conv, (in-Double[128]) frArr, (out-Double[128]) toArr)

public func AstroConvFrTo(_ xf_Conv: Int32, _ frArr: UnsafeMutablePointer<Double>, _ toArr: UnsafeMutablePointer<Double>) {
    
    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "AstroConvFrTo"),
                                 to: fnPtrAstroConvFrTo.self)
    
    function(xf_Conv, frArr, toArr)
}

// -------------------------------- RADECTOLAD
// ORIGINAL:     void RADecToLAD((in-Double) RA, (in-Double) dec, (out-Double[3]) L, (out-Double[3]) A_Tilde, (out-Double[3]) D_Tilde)

public func RADecToLAD(_ RA: Double, _ dec: Double, _ L: UnsafeMutablePointer<Double>, _ A_Tilde: UnsafeMutablePointer<Double>, _ D_Tilde: UnsafeMutablePointer<Double>) {
    
    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "RADecToLAD"),
                                 to: fnPtrRADecToLAD.self)
    
    function(RA, dec, L, A_Tilde, D_Tilde)
}

// -------------------------------- AZELTOLAD
// ORIGINAL:     void AzElToLAD((in-Double) az, (in-Double) el, (out-Double[3]) Lh, (out-Double[3]) Ah, (out-Double[3]) Dh)

public func AzElToLAD(_ az: Double, _ el: Double, _ Lh: UnsafeMutablePointer<Double>, _ Ah: UnsafeMutablePointer<Double>, _ Dh: UnsafeMutablePointer<Double>) {
    
    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "AzElToLAD"),
                                 to: fnPtrAzElToLAD.self)
    
    function(az, el, Lh, Ah, Dh)
}

// -------------------------------- ECITOTOPOCOMPS
// ORIGINAL:     void ECIToTopoComps((in-Double) theta, (in-Double) lat, (in-Double[3]) senPos, (in-Double[3]) satPos, (in-Double[3]) satVel, (out-Double[10]) xa_topo)

public func ECIToTopoComps(_ theta: Double, _ lat: Double, _ senPos: UnsafeMutablePointer<Double>, _ satPos: UnsafeMutablePointer<Double>, _ satVel: UnsafeMutablePointer<Double>, _ xa_topo: UnsafeMutablePointer<Double>) {
    
    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "ECIToTopoComps"),
                                 to: fnPtrECIToTopoComps.self)
    
    function(theta, lat, senPos, satPos, satVel, xa_topo)
}

// -------------------------------- RADECTOAZEL
// ORIGINAL:     void RaDecToAzEl((in-Double) thetaG, (in-Double) lat, (in-Double) lon, (in-Double) RA, (in-Double) dec, (out-Double) az, (out-Double) el)

public func RaDecToAzEl(_ thetaG: Double, _ lat: Double, _ lon: Double, _ RA: Double, _ dec: Double, _ az: UnsafeMutablePointer<Double>, _ el: UnsafeMutablePointer<Double>) {
    
    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "RaDecToAzEl"),
                                 to: fnPtrRaDecToAzEl.self)
    
    function(thetaG, lat, lon, RA, dec, az, el)
}

// -------------------------------- RADECTOAZELTIME
// ORIGINAL:     void RaDecToAzElTime((in-Double) ds50UTC, (in-Double) lat, (in-Double) lon, (in-Double) RA, (in-Double) dec, (out-Double) az, (out-Double) el)

public func RaDecToAzElTime(_ ds50UTC: Double, _ lat: Double, _ lon: Double, _ RA: Double, _ dec: Double, _ az: UnsafeMutablePointer<Double>, _ el: UnsafeMutablePointer<Double>) {
    
    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "RaDecToAzElTime"),
                                 to: fnPtrRaDecToAzElTime.self)
    
    function(ds50UTC, lat, lon, RA, dec, az, el)
}

// -------------------------------- AZELTORADEC
// ORIGINAL:     void AzElToRaDec((in-Double) thetaG, (in-Double) lat, (in-Double) lon, (in-Double) az, (in-Double) el, (out-Double) RA, (out-Double) dec)

public func AzElToRaDec(_ thetaG: Double, _ lat: Double, _ lon: Double, _ az: Double, _ el: Double, _ RA: UnsafeMutablePointer<Double>, _ dec: UnsafeMutablePointer<Double>) {
    
    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "AzElToRaDec"),
                                 to: fnPtrAzElToRaDec.self)
    
    function(thetaG, lat, lon, az, el, RA, dec)
}

// -------------------------------- AZELTORADECTIME
// ORIGINAL:     void AzElToRaDecTime((in-Double) ds50UTC, (in-Double) lat, (in-Double) lon, (in-Double) az, (in-Double) el, (out-Double) RA, (out-Double) dec)

public func AzElToRaDecTime(_ ds50UTC: Double, _ lat: Double, _ lon: Double, _ az: Double, _ el: Double, _ RA: UnsafeMutablePointer<Double>, _ dec: UnsafeMutablePointer<Double>) {
    
    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "AzElToRaDecTime"),
                                 to: fnPtrAzElToRaDecTime.self)
    
    function(ds50UTC, lat, lon, az, el, RA, dec)
}

// -------------------------------- RAETOECI
// ORIGINAL:     void RAEToECI((in-Double) theta, (in-Double) astroLat, (in-Double[6]) xa_rae, (in-Double[3]) senPos, (out-Double[3]) satPos, (out-Double[3]) satVel)

public func RAEToECI(_ theta: Double, _ astroLat: Double, _ xa_rae: UnsafeMutablePointer<Double>, _ senPos: UnsafeMutablePointer<Double>, _ satPos: UnsafeMutablePointer<Double>, _ satVel: UnsafeMutablePointer<Double>) {
    
    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "RAEToECI"),
                                 to: fnPtrRAEToECI.self)
    
    function(theta, astroLat, xa_rae, senPos, satPos, satVel)
}

// -------------------------------- GETINITIALDRAG
// ORIGINAL:     void GetInitialDrag((in-Double) semiMajorAxis, (in-Double) eccen, (out-Double) nDot, (out-Double) bstar)

public func GetInitialDrag(_ semiMajorAxis: Double, _ eccen: Double, _ nDot: UnsafeMutablePointer<Double>, _ bstar: UnsafeMutablePointer<Double>) {
    
    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "GetInitialDrag"),
                                 to: fnPtrGetInitialDrag.self)
    
    function(semiMajorAxis, eccen, nDot, bstar)
}

// -------------------------------- EARTHOBSTRUCTIONANGLES
// ORIGINAL:     void EarthObstructionAngles((in-Double) earthLimb, (in-Double[3]) satECI, (in-Double[3]) senECI, (out-Double) earthSenLimb, (out-Double) earthSenSat, (out-Double) satEarthSen)

public func EarthObstructionAngles(_ earthLimb: Double, _ satECI: UnsafeMutablePointer<Double>, _ senECI: UnsafeMutablePointer<Double>, _ earthSenLimb: UnsafeMutablePointer<Double>, _ earthSenSat: UnsafeMutablePointer<Double>, _ satEarthSen: UnsafeMutablePointer<Double>) {
    
    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "EarthObstructionAngles"),
                                 to: fnPtrEarthObstructionAngles.self)
    
    function(earthLimb, satECI, senECI, earthSenLimb, earthSenSat, satEarthSen)
}

// -------------------------------- ISPOINTSUNLIT
// ORIGINAL:     int IsPointSunlit((in-Double) ds50ET, (in-Double[3]) ptEci)

public func IsPointSunlit(_ ds50ET: Double, _ ptEci: UnsafeMutablePointer<Double>) -> Int32 {
    
    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "IsPointSunlit"),
                                 to: fnPtrIsPointSunlit.self)
    
    return function(ds50ET, ptEci)
}

// -------------------------------- ROTRADECL
// ORIGINAL:     void RotRADecl((in-Integer) nutationTerms, (in-Integer) dir, (in-Double) ds50UTCIn, (in-Double) RAIn, (in-Double) declIn, (in-Double) ds50UTCOut, (out-Double) RAOut, (out-Double) declOut)

public func RotRADecl(_ nutationTerms: Int32, _ dir: Int32, _ ds50UTCIn: Double, _ RAIn: Double, _ declIn: Double, _ ds50UTCOut: Double, _ RAOut: UnsafeMutablePointer<Double>, _ declOut: UnsafeMutablePointer<Double>) {
    
    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "RotRADecl"),
                                 to: fnPtrRotRADecl.self)
    
    function(nutationTerms, dir, ds50UTCIn, RAIn, declIn, ds50UTCOut, RAOut, declOut)
}

// -------------------------------- ROTRADEC_DATETOEQNX
// ORIGINAL:     int RotRADec_DateToEqnx((in-Integer) nutationTerms, (in-Integer) yrOfEqnx, (in-Double) ds50UTCIn, (in-Double) RAIn, (in-Double) declIn, (out-Double) RAOut, (out-Double) declOut)

public func RotRADec_DateToEqnx(_ nutationTerms: Int32, _ yrOfEqnx: Int32, _ ds50UTCIn: Double, _ RAIn: Double, _ declIn: Double, _ RAOut: UnsafeMutablePointer<Double>, _ declOut: UnsafeMutablePointer<Double>) -> Int32 {
    
    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "RotRADec_DateToEqnx"),
                                 to: fnPtrRotRADec_DateToEqnx.self)
    
    return function(nutationTerms, yrOfEqnx, ds50UTCIn, RAIn, declIn, RAOut, declOut)
}

// -------------------------------- ROTRADEC_EQNXTODATE
// ORIGINAL:     int RotRADec_EqnxToDate((in-Integer) nutationTerms, (in-Integer) yrOfEqnx, (in-Double) ds50UTCIn, (in-Double) RAIn, (in-Double) declIn, (out-Double) RAOut, (out-Double) declOut)

public func RotRADec_EqnxToDate(_ nutationTerms: Int32, _ yrOfEqnx: Int32, _ ds50UTCIn: Double, _ RAIn: Double, _ declIn: Double, _ RAOut: UnsafeMutablePointer<Double>, _ declOut: UnsafeMutablePointer<Double>) -> Int32 {
    
    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "RotRADec_EqnxToDate"),
                                 to: fnPtrRotRADec_EqnxToDate.self)
    
    return function(nutationTerms, yrOfEqnx, ds50UTCIn, RAIn, declIn, RAOut, declOut)
}
