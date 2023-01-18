// This wrapper file was generated automatically by the GenDllWrappers program.
import Foundation
import AstroStds_c

#if os(Linux)
fileprivate let libHandle = loadDll("libastrofunc.so")
#elseif os(Windows)
fileprivate let libHandle = loadDll("AstroFunc.dll")
#else
fileprivate let libHandle = loadDll("libastrofunc.dylib")
#endif

public func AstroFuncInit(_ apAddr: Int64) -> Int32 {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "AstroFuncInit"), to: fnPtrAstroFuncInit.self)

    return function(apAddr)
}

public func AstroFuncGetInfo(_ infoStr: UnsafeMutablePointer<CChar>) {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "AstroFuncGetInfo"), to: fnPtrAstroFuncGetInfo.self)

    function(infoStr)
}

public func KepToEqnx(_ metricKep: UnsafeMutablePointer<Double>, _ metricEqnx: UnsafeMutablePointer<Double>) {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "KepToEqnx"), to: fnPtrKepToEqnx.self)

    function(metricKep, metricEqnx)
}

public func KepToPosVel(_ metricKep: UnsafeMutablePointer<Double>, _ pos: UnsafeMutablePointer<Double>, _ vel: UnsafeMutablePointer<Double>) {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "KepToPosVel"), to: fnPtrKepToPosVel.self)

    function(metricKep, pos, vel)
}

public func KepToUVW(_ metricKep: UnsafeMutablePointer<Double>, _ uBar: UnsafeMutablePointer<Double>, _ vBar: UnsafeMutablePointer<Double>, _ wBar: UnsafeMutablePointer<Double>) {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "KepToUVW"), to: fnPtrKepToUVW.self)

    function(metricKep, uBar, vBar, wBar)
}

public func ClassToEqnx(_ metricClass: UnsafeMutablePointer<Double>, _ metricEqnx: UnsafeMutablePointer<Double>) {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "ClassToEqnx"), to: fnPtrClassToEqnx.self)

    function(metricClass, metricEqnx)
}

public func EqnxToClass(_ metricEqnx: UnsafeMutablePointer<Double>, _ metricClass: UnsafeMutablePointer<Double>) {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "EqnxToClass"), to: fnPtrEqnxToClass.self)

    function(metricEqnx, metricClass)
}

public func EqnxToKep(_ metricEqnx: UnsafeMutablePointer<Double>, _ metricKep: UnsafeMutablePointer<Double>) {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "EqnxToKep"), to: fnPtrEqnxToKep.self)

    function(metricEqnx, metricKep)
}

public func EqnxToPosVel(_ metricEqnx: UnsafeMutablePointer<Double>, _ pos: UnsafeMutablePointer<Double>, _ vel: UnsafeMutablePointer<Double>) {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "EqnxToPosVel"), to: fnPtrEqnxToPosVel.self)

    function(metricEqnx, pos, vel)
}

public func PosVelToEqnx(_ pos: UnsafeMutablePointer<Double>, _ vel: UnsafeMutablePointer<Double>, _ metricEqnx: UnsafeMutablePointer<Double>) {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "PosVelToEqnx"), to: fnPtrPosVelToEqnx.self)

    function(pos, vel, metricEqnx)
}

public func PosVelMuToEqnx(_ pos: UnsafeMutablePointer<Double>, _ vel: UnsafeMutablePointer<Double>, _ mu: Double, _ metricEqnx: UnsafeMutablePointer<Double>) {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "PosVelMuToEqnx"), to: fnPtrPosVelMuToEqnx.self)

    function(pos, vel, mu, metricEqnx)
}

public func PosVelToKep(_ pos: UnsafeMutablePointer<Double>, _ vel: UnsafeMutablePointer<Double>, _ metricKep: UnsafeMutablePointer<Double>) {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "PosVelToKep"), to: fnPtrPosVelToKep.self)

    function(pos, vel, metricKep)
}

public func PosVelMuToKep(_ pos: UnsafeMutablePointer<Double>, _ vel: UnsafeMutablePointer<Double>, _ mu: Double, _ metricKep: UnsafeMutablePointer<Double>) {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "PosVelMuToKep"), to: fnPtrPosVelMuToKep.self)

    function(pos, vel, mu, metricKep)
}

public func PosVelToUUVW(_ pos: UnsafeMutablePointer<Double>, _ vel: UnsafeMutablePointer<Double>, _ uvec: UnsafeMutablePointer<Double>, _ vVec: UnsafeMutablePointer<Double>, _ wVec: UnsafeMutablePointer<Double>) {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "PosVelToUUVW"), to: fnPtrPosVelToUUVW.self)

    function(pos, vel, uvec, vVec, wVec)
}

public func PosVelToPTW(_ pos: UnsafeMutablePointer<Double>, _ vel: UnsafeMutablePointer<Double>, _ uvec: UnsafeMutablePointer<Double>, _ vVec: UnsafeMutablePointer<Double>, _ wVec: UnsafeMutablePointer<Double>) {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "PosVelToPTW"), to: fnPtrPosVelToPTW.self)

    function(pos, vel, uvec, vVec, wVec)
}

public func SolveKepEqtn(_ metricKep: UnsafeMutablePointer<Double>) -> Double {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "SolveKepEqtn"), to: fnPtrSolveKepEqtn.self)

    return function(metricKep)
}

public func CompTrueAnomaly(_ metricKep: UnsafeMutablePointer<Double>) -> Double {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "CompTrueAnomaly"), to: fnPtrCompTrueAnomaly.self)

    return function(metricKep)
}

public func NToA(_ n: Double) -> Double {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "NToA"), to: fnPtrNToA.self)

    return function(n)
}

public func AToN(_ a: Double) -> Double {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "AToN"), to: fnPtrAToN.self)

    return function(a)
}

public func KozaiToBrouwer(_ eccen: Double, _ incli: Double, _ nKozai: Double) -> Double {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "KozaiToBrouwer"), to: fnPtrKozaiToBrouwer.self)

    return function(eccen, incli, nKozai)
}

public func BrouwerToKozai(_ eccen: Double, _ incli: Double, _ nBrouwer: Double) -> Double {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "BrouwerToKozai"), to: fnPtrBrouwerToKozai.self)

    return function(eccen, incli, nBrouwer)
}

public func KepOscToMean(_ metricOscKep: UnsafeMutablePointer<Double>, _ metricMeanKep: UnsafeMutablePointer<Double>) {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "KepOscToMean"), to: fnPtrKepOscToMean.self)

    function(metricOscKep, metricMeanKep)
}

public func XYZToLLH(_ thetaG: Double, _ metricPos: UnsafeMutablePointer<Double>, _ metricLLH: UnsafeMutablePointer<Double>) {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "XYZToLLH"), to: fnPtrXYZToLLH.self)

    function(thetaG, metricPos, metricLLH)
}

public func XYZToLLHTime(_ ds50UTC: Double, _ metricPos: UnsafeMutablePointer<Double>, _ metricLLH: UnsafeMutablePointer<Double>) {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "XYZToLLHTime"), to: fnPtrXYZToLLHTime.self)

    function(ds50UTC, metricPos, metricLLH)
}

public func LLHToXYZ(_ thetaG: Double, _ metricLLH: UnsafeMutablePointer<Double>, _ metricXYZ: UnsafeMutablePointer<Double>) {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "LLHToXYZ"), to: fnPtrLLHToXYZ.self)

    function(thetaG, metricLLH, metricXYZ)
}

public func LLHToXYZTime(_ ds50UTC: Double, _ metricLLH: UnsafeMutablePointer<Double>, _ metricXYZ: UnsafeMutablePointer<Double>) {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "LLHToXYZTime"), to: fnPtrLLHToXYZTime.self)

    function(ds50UTC, metricLLH, metricXYZ)
}

public func EFGToECI(_ thetaG: Double, _ posEFG: UnsafeMutablePointer<Double>, _ velEFG: UnsafeMutablePointer<Double>, _ posECI: UnsafeMutablePointer<Double>, _ velECI: UnsafeMutablePointer<Double>) {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "EFGToECI"), to: fnPtrEFGToECI.self)

    function(thetaG, posEFG, velEFG, posECI, velECI)
}

public func EFGToECITime(_ ds50UTC: Double, _ posEFG: UnsafeMutablePointer<Double>, _ velEFG: UnsafeMutablePointer<Double>, _ posECI: UnsafeMutablePointer<Double>, _ velECI: UnsafeMutablePointer<Double>) {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "EFGToECITime"), to: fnPtrEFGToECITime.self)

    function(ds50UTC, posEFG, velEFG, posECI, velECI)
}

public func ECIToEFG(_ thetaG: Double, _ posECI: UnsafeMutablePointer<Double>, _ velECI: UnsafeMutablePointer<Double>, _ posEFG: UnsafeMutablePointer<Double>, _ velEFG: UnsafeMutablePointer<Double>) {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "ECIToEFG"), to: fnPtrECIToEFG.self)

    function(thetaG, posECI, velECI, posEFG, velEFG)
}

public func ECIToEFGTime(_ ds50UTC: Double, _ posECI: UnsafeMutablePointer<Double>, _ velECI: UnsafeMutablePointer<Double>, _ posEFG: UnsafeMutablePointer<Double>, _ velEFG: UnsafeMutablePointer<Double>) {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "ECIToEFGTime"), to: fnPtrECIToEFGTime.self)

    function(ds50UTC, posECI, velECI, posEFG, velEFG)
}

public func ECRToEFG(_ polarX: Double, _ polarY: Double, _ posECR: UnsafeMutablePointer<Double>, _ velECR: UnsafeMutablePointer<Double>, _ posEFG: UnsafeMutablePointer<Double>, _ velEFG: UnsafeMutablePointer<Double>) {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "ECRToEFG"), to: fnPtrECRToEFG.self)

    function(polarX, polarY, posECR, velECR, posEFG, velEFG)
}

public func ECRToEFGTime(_ ds50UTC: Double, _ posECR: UnsafeMutablePointer<Double>, _ velECR: UnsafeMutablePointer<Double>, _ posEFG: UnsafeMutablePointer<Double>, _ velEFG: UnsafeMutablePointer<Double>) {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "ECRToEFGTime"), to: fnPtrECRToEFGTime.self)

    function(ds50UTC, posECR, velECR, posEFG, velEFG)
}

public func EFGToECR(_ polarX: Double, _ polarY: Double, _ posEFG: UnsafeMutablePointer<Double>, _ velEFG: UnsafeMutablePointer<Double>, _ posECR: UnsafeMutablePointer<Double>, _ velECR: UnsafeMutablePointer<Double>) {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "EFGToECR"), to: fnPtrEFGToECR.self)

    function(polarX, polarY, posEFG, velEFG, posECR, velECR)
}

public func EFGToECRTime(_ ds50UTC: Double, _ posEFG: UnsafeMutablePointer<Double>, _ velEFG: UnsafeMutablePointer<Double>, _ posECR: UnsafeMutablePointer<Double>, _ velECR: UnsafeMutablePointer<Double>) {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "EFGToECRTime"), to: fnPtrEFGToECRTime.self)

    function(ds50UTC, posEFG, velEFG, posECR, velECR)
}

public func EFGPosToLLH(_ posEFG: UnsafeMutablePointer<Double>, _ metricLLH: UnsafeMutablePointer<Double>) {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "EFGPosToLLH"), to: fnPtrEFGPosToLLH.self)

    function(posEFG, metricLLH)
}

public func LLHToEFGPos(_ metricLLH: UnsafeMutablePointer<Double>, _ posEFG: UnsafeMutablePointer<Double>) {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "LLHToEFGPos"), to: fnPtrLLHToEFGPos.self)

    function(metricLLH, posEFG)
}

public func RotJ2KToDate(_ spectr: Int32, _ nutationTerms: Int32, _ ds50TAI: Double, _ posJ2K: UnsafeMutablePointer<Double>, _ velJ2K: UnsafeMutablePointer<Double>, _ posDate: UnsafeMutablePointer<Double>, _ velDate: UnsafeMutablePointer<Double>) {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "RotJ2KToDate"), to: fnPtrRotJ2KToDate.self)

    function(spectr, nutationTerms, ds50TAI, posJ2K, velJ2K, posDate, velDate)
}

public func RotDateToJ2K(_ spectr: Int32, _ nutationTerms: Int32, _ ds50TAI: Double, _ posDate: UnsafeMutablePointer<Double>, _ velDate: UnsafeMutablePointer<Double>, _ posJ2K: UnsafeMutablePointer<Double>, _ velJ2K: UnsafeMutablePointer<Double>) {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "RotDateToJ2K"), to: fnPtrRotDateToJ2K.self)

    function(spectr, nutationTerms, ds50TAI, posDate, velDate, posJ2K, velJ2K)
}

public func CompSunMoonPos(_ ds50ET: Double, _ uvecSun: UnsafeMutablePointer<Double>, _ sunVecMag: UnsafeMutablePointer<Double>, _ uvecMoon: UnsafeMutablePointer<Double>, _ moonVecMag: UnsafeMutablePointer<Double>) {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "CompSunMoonPos"), to: fnPtrCompSunMoonPos.self)

    function(ds50ET, uvecSun, sunVecMag, uvecMoon, moonVecMag)
}

public func CompSunPos(_ ds50ET: Double, _ uvecSun: UnsafeMutablePointer<Double>, _ sunVecMag: UnsafeMutablePointer<Double>) {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "CompSunPos"), to: fnPtrCompSunPos.self)

    function(ds50ET, uvecSun, sunVecMag)
}

public func CompMoonPos(_ ds50ET: Double, _ uvecMoon: UnsafeMutablePointer<Double>, _ moonVecMag: UnsafeMutablePointer<Double>) {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "CompMoonPos"), to: fnPtrCompMoonPos.self)

    function(ds50ET, uvecMoon, moonVecMag)
}

public func AstroConvFrTo(_ xf_Conv: Int32, _ frArr: UnsafeMutablePointer<Double>, _ toArr: UnsafeMutablePointer<Double>) {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "AstroConvFrTo"), to: fnPtrAstroConvFrTo.self)

    function(xf_Conv, frArr, toArr)
}

public func RADecToLAD(_ RA: Double, _ dec: Double, _ L: UnsafeMutablePointer<Double>, _ A_Tilde: UnsafeMutablePointer<Double>, _ D_Tilde: UnsafeMutablePointer<Double>) {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "RADecToLAD"), to: fnPtrRADecToLAD.self)

    function(RA, dec, L, A_Tilde, D_Tilde)
}

public func AzElToLAD(_ az: Double, _ el: Double, _ Lh: UnsafeMutablePointer<Double>, _ Ah: UnsafeMutablePointer<Double>, _ Dh: UnsafeMutablePointer<Double>) {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "AzElToLAD"), to: fnPtrAzElToLAD.self)

    function(az, el, Lh, Ah, Dh)
}

public func ECIToTopoComps(_ theta: Double, _ lat: Double, _ senPos: UnsafeMutablePointer<Double>, _ satPos: UnsafeMutablePointer<Double>, _ satVel: UnsafeMutablePointer<Double>, _ xa_topo: UnsafeMutablePointer<Double>) {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "ECIToTopoComps"), to: fnPtrECIToTopoComps.self)

    function(theta, lat, senPos, satPos, satVel, xa_topo)
}

public func RaDecToAzEl(_ thetaG: Double, _ lat: Double, _ lon: Double, _ RA: Double, _ dec: Double, _ az: UnsafeMutablePointer<Double>, _ el: UnsafeMutablePointer<Double>) {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "RaDecToAzEl"), to: fnPtrRaDecToAzEl.self)

    function(thetaG, lat, lon, RA, dec, az, el)
}

public func RaDecToAzElTime(_ ds50UTC: Double, _ lat: Double, _ lon: Double, _ RA: Double, _ dec: Double, _ az: UnsafeMutablePointer<Double>, _ el: UnsafeMutablePointer<Double>) {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "RaDecToAzElTime"), to: fnPtrRaDecToAzElTime.self)

    function(ds50UTC, lat, lon, RA, dec, az, el)
}

public func AzElToRaDec(_ thetaG: Double, _ lat: Double, _ lon: Double, _ az: Double, _ el: Double, _ RA: UnsafeMutablePointer<Double>, _ dec: UnsafeMutablePointer<Double>) {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "AzElToRaDec"), to: fnPtrAzElToRaDec.self)

    function(thetaG, lat, lon, az, el, RA, dec)
}

public func AzElToRaDecTime(_ ds50UTC: Double, _ lat: Double, _ lon: Double, _ az: Double, _ el: Double, _ RA: UnsafeMutablePointer<Double>, _ dec: UnsafeMutablePointer<Double>) {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "AzElToRaDecTime"), to: fnPtrAzElToRaDecTime.self)

    function(ds50UTC, lat, lon, az, el, RA, dec)
}

public func RAEToECI(_ theta: Double, _ astroLat: Double, _ xa_rae: UnsafeMutablePointer<Double>, _ senPos: UnsafeMutablePointer<Double>, _ satPos: UnsafeMutablePointer<Double>, _ satVel: UnsafeMutablePointer<Double>) {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "RAEToECI"), to: fnPtrRAEToECI.self)

    function(theta, astroLat, xa_rae, senPos, satPos, satVel)
}

public func GetInitialDrag(_ semiMajorAxis: Double, _ eccen: Double, _ nDot: UnsafeMutablePointer<Double>, _ bstar: UnsafeMutablePointer<Double>) {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "GetInitialDrag"), to: fnPtrGetInitialDrag.self)

    function(semiMajorAxis, eccen, nDot, bstar)
}

public func CovMtxPTWToUVW(_ pos: UnsafeMutablePointer<Double>, _ vel: UnsafeMutablePointer<Double>, _ ptwCovMtx: UnsafeMutablePointer<(Double, Double, Double, Double, Double, Double)>, _ uvwCovMtx: UnsafeMutablePointer<(Double, Double, Double, Double, Double, Double)>) {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "CovMtxPTWToUVW"), to: fnPtrCovMtxPTWToUVW.self)

    function(pos, vel, ptwCovMtx, uvwCovMtx)
}

public func CovMtxUVWToPTW(_ pos: UnsafeMutablePointer<Double>, _ vel: UnsafeMutablePointer<Double>, _ uvwCovMtx: UnsafeMutablePointer<(Double, Double, Double, Double, Double, Double)>, _ ptwCovMtx: UnsafeMutablePointer<(Double, Double, Double, Double, Double, Double)>) {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "CovMtxUVWToPTW"), to: fnPtrCovMtxUVWToPTW.self)

    function(pos, vel, uvwCovMtx, ptwCovMtx)
}

public func EarthObstructionAngles(_ earthLimb: Double, _ satECI: UnsafeMutablePointer<Double>, _ senECI: UnsafeMutablePointer<Double>, _ earthSenLimb: UnsafeMutablePointer<Double>, _ earthSenSat: UnsafeMutablePointer<Double>, _ satEarthSen: UnsafeMutablePointer<Double>) {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "EarthObstructionAngles"), to: fnPtrEarthObstructionAngles.self)

    function(earthLimb, satECI, senECI, earthSenLimb, earthSenSat, satEarthSen)
}

public func IsPointSunlit(_ ds50ET: Double, _ ptEci: UnsafeMutablePointer<Double>) -> Int32 {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "IsPointSunlit"), to: fnPtrIsPointSunlit.self)

    return function(ds50ET, ptEci)
}

public func RotRADecl(_ nutationTerms: Int32, _ dir: Int32, _ ds50UTCIn: Double, _ RAIn: Double, _ declIn: Double, _ ds50UTCOut: Double, _ RAOut: UnsafeMutablePointer<Double>, _ declOut: UnsafeMutablePointer<Double>) {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "RotRADecl"), to: fnPtrRotRADecl.self)

    function(nutationTerms, dir, ds50UTCIn, RAIn, declIn, ds50UTCOut, RAOut, declOut)
}

public func RotRADec_DateToEqnx(_ nutationTerms: Int32, _ yrOfEqnx: Int32, _ ds50UTCIn: Double, _ RAIn: Double, _ declIn: Double, _ RAOut: UnsafeMutablePointer<Double>, _ declOut: UnsafeMutablePointer<Double>) -> Int32 {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "RotRADec_DateToEqnx"), to: fnPtrRotRADec_DateToEqnx.self)

    return function(nutationTerms, yrOfEqnx, ds50UTCIn, RAIn, declIn, RAOut, declOut)
}

public func RotRADec_EqnxToDate(_ nutationTerms: Int32, _ yrOfEqnx: Int32, _ ds50UTCIn: Double, _ RAIn: Double, _ declIn: Double, _ RAOut: UnsafeMutablePointer<Double>, _ declOut: UnsafeMutablePointer<Double>) -> Int32 {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "RotRADec_EqnxToDate"), to: fnPtrRotRADec_EqnxToDate.self)

    return function(nutationTerms, yrOfEqnx, ds50UTCIn, RAIn, declIn, RAOut, declOut)
}

public func CovMtxEqnxToUVW(_ pos: UnsafeMutablePointer<Double>, _ vel: UnsafeMutablePointer<Double>, _ covMtxEqnx: UnsafeMutablePointer<(Double, Double, Double, Double, Double, Double)>, _ covMtxUVW: UnsafeMutablePointer<(Double, Double, Double, Double, Double, Double)>) {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "CovMtxEqnxToUVW"), to: fnPtrCovMtxEqnxToUVW.self)

    function(pos, vel, covMtxEqnx, covMtxUVW)
}

public func CovMtxUVWToEqnx(_ pos: UnsafeMutablePointer<Double>, _ vel: UnsafeMutablePointer<Double>, _ covMtxUVW: UnsafeMutablePointer<(Double, Double, Double, Double, Double, Double)>, _ covMtxEqnx: UnsafeMutablePointer<(Double, Double, Double, Double, Double, Double)>) {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "CovMtxUVWToEqnx"), to: fnPtrCovMtxUVWToEqnx.self)

    function(pos, vel, covMtxUVW, covMtxEqnx)
}

public func CovMtxECIToUVW(_ pos: UnsafeMutablePointer<Double>, _ vel: UnsafeMutablePointer<Double>, _ covMtxECI: UnsafeMutablePointer<(Double, Double, Double, Double, Double, Double)>, _ covMtxUVW: UnsafeMutablePointer<(Double, Double, Double, Double, Double, Double)>) {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "CovMtxECIToUVW"), to: fnPtrCovMtxECIToUVW.self)

    function(pos, vel, covMtxECI, covMtxUVW)
}

public func CovMtxUVWToECI(_ pos: UnsafeMutablePointer<Double>, _ vel: UnsafeMutablePointer<Double>, _ covMtxUVW: UnsafeMutablePointer<(Double, Double, Double, Double, Double, Double)>, _ covMtxECI: UnsafeMutablePointer<(Double, Double, Double, Double, Double, Double)>) {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "CovMtxUVWToECI"), to: fnPtrCovMtxUVWToECI.self)

    function(pos, vel, covMtxUVW, covMtxECI)
}
// ========================= End of auto generated code ==========================
