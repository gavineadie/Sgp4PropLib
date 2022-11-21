//
//  astro.swift
//  Sgp4Swift
//
//  Created by Gavin Eadie on 10/17/22.
//

import Foundation
import obj_c

fileprivate let libHandle = loadDll("libastrofunc.dylib")

public func astroFuncInit(_ dllHandle: Int64) -> Int32 {

    guard let astroFuncInitPointer = dlsym(libHandle, "AstroFuncInit") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    typealias AstroFuncInitFunction = fnPtrAstroFuncInit
    let astroFuncInit = unsafeBitCast(astroFuncInitPointer, to: AstroFuncInitFunction.self)
    return astroFuncInit(dllHandle)

}

public func astroFuncGetInfo() -> String {

    guard let astroFuncGetInfoPointer = dlsym(libHandle, "AstroFuncGetInfo") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    var info128 = Array(repeating: Int8(0), count: 128)

    typealias AstroFuncGetInfoFunction = fnPtrAstroFuncGetInfo
    let astroFuncGetInfo = unsafeBitCast(astroFuncGetInfoPointer, to: AstroFuncGetInfoFunction.self)
    astroFuncGetInfo(&info128); info128[127] = 0
    return String(cString: info128).trimRight()

}

// Converts a set of Keplerian elements to a set of equinoctial elements.
// metricKep          The set of Keplerian elements to be converted. (in-Double[6])
// metricEqnx         The resulting set of equinoctial elements. (out-Double[6])
//      typedef void (STDCALL *fnPtrKepToEqnx)(double metricKep[6], double metricEqnx[6]);

public func KepToEqnx() {

}

// ---------------- AUTO GENERATED #2 ----------------

//  typedef int (STDCALL *fnPtrAstroFuncInit)(__int64 apPtr);
//______________________________

//public func astroFuncInit(_ apPtr: Int64) -> Int32 {
//
//    guard let astroFuncInitPointer = dlsym(libHandle, "AstroFuncInit") else {
//        fatalError("dlsym failure: \(String(cString: dlerror()))")
//    }
//
//    typealias AstroFuncInitFunction = fnPtrAstroFuncInit
//    let astroFuncInit = unsafeBitCast(astroFuncInitPointer, to: AstroFuncInitFunction.self)
//
//    return astroFuncInit(apPtr)
//
//}


//  typedef void (STDCALL *fnPtrAstroFuncGetInfo)(char infoStr[128]);
//______________________________

public func astroFuncGetInfo(_ infoString: String) {

    guard let astroFuncGetInfoPointer = dlsym(libHandle, "AstroFuncGetInfo") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    typealias AstroFuncGetInfoFunction = fnPtrAstroFuncGetInfo
    let astroFuncGetInfo = unsafeBitCast(astroFuncGetInfoPointer, to: AstroFuncGetInfoFunction.self)

    astroFuncGetInfo(infoStr[128])

}


//  typedef void (STDCALL *fnPtrKepToEqnx)(double metricKep[6], double metricEqnx[6]);
//______________________________

public func kepToEqnx(_ metricKep[6]: Double, _ metricEqnx[6]: Double) {

    guard let kepToEqnxPointer = dlsym(libHandle, "KepToEqnx") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    typealias KepToEqnxFunction = fnPtrKepToEqnx
    let kepToEqnx = unsafeBitCast(kepToEqnxPointer, to: KepToEqnxFunction.self)

    kepToEqnx(metricKep[6], metricEqnx[6])

}


//  typedef void (STDCALL *fnPtrKepToPosVel)(double metricKep[6], double pos[3], double vel[3]);
//______________________________

public func kepToPosVel(_ metricKep[6]: Double, _ pos[3]: Double, _ vel[3]: Double) {

    guard let kepToPosVelPointer = dlsym(libHandle, "KepToPosVel") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    typealias KepToPosVelFunction = fnPtrKepToPosVel
    let kepToPosVel = unsafeBitCast(kepToPosVelPointer, to: KepToPosVelFunction.self)

    kepToPosVel(metricKep[6], pos[3], vel[3])

}


//  typedef void (STDCALL *fnPtrKepToUVW)(double metricKep[6], double uBar[3], double vBar[3], double wBar[3]);
//______________________________

public func kepToUVW(_ metricKep[6]: Double, _ uBar[3]: Double, _ vBar[3]: Double, _ wBar[3]: Double) {

    guard let kepToUVWPointer = dlsym(libHandle, "KepToUVW") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    typealias KepToUVWFunction = fnPtrKepToUVW
    let kepToUVW = unsafeBitCast(kepToUVWPointer, to: KepToUVWFunction.self)

    kepToUVW(metricKep[6], uBar[3], vBar[3], wBar[3])

}


//  typedef void (STDCALL *fnPtrClassToEqnx)(double metricClass[6], double metricEqnx[6]);
//______________________________

public func classToEqnx(_ metricClass[6]: Double, _ metricEqnx[6]: Double) {

    guard let classToEqnxPointer = dlsym(libHandle, "ClassToEqnx") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    typealias ClassToEqnxFunction = fnPtrClassToEqnx
    let classToEqnx = unsafeBitCast(classToEqnxPointer, to: ClassToEqnxFunction.self)

    classToEqnx(metricClass[6], metricEqnx[6])

}


//  typedef void (STDCALL *fnPtrEqnxToClass)(double metricEqnx[6], double metricClass[6]);
//______________________________

public func eqnxToClass(_ metricEqnx[6]: Double, _ metricClass[6]: Double) {

    guard let eqnxToClassPointer = dlsym(libHandle, "EqnxToClass") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    typealias EqnxToClassFunction = fnPtrEqnxToClass
    let eqnxToClass = unsafeBitCast(eqnxToClassPointer, to: EqnxToClassFunction.self)

    eqnxToClass(metricEqnx[6], metricClass[6])

}


//  typedef void (STDCALL *fnPtrEqnxToKep)(double metricEqnx[6], double metricKep[6]);
//______________________________

public func eqnxToKep(_ metricEqnx[6]: Double, _ metricKep[6]: Double) {

    guard let eqnxToKepPointer = dlsym(libHandle, "EqnxToKep") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    typealias EqnxToKepFunction = fnPtrEqnxToKep
    let eqnxToKep = unsafeBitCast(eqnxToKepPointer, to: EqnxToKepFunction.self)

    eqnxToKep(metricEqnx[6], metricKep[6])

}


//  typedef void (STDCALL *fnPtrEqnxToPosVel)(double metricEqnx[6], double pos[3], double vel[3]);
//______________________________

public func eqnxToPosVel(_ metricEqnx[6]: Double, _ pos[3]: Double, _ vel[3]: Double) {

    guard let eqnxToPosVelPointer = dlsym(libHandle, "EqnxToPosVel") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    typealias EqnxToPosVelFunction = fnPtrEqnxToPosVel
    let eqnxToPosVel = unsafeBitCast(eqnxToPosVelPointer, to: EqnxToPosVelFunction.self)

    eqnxToPosVel(metricEqnx[6], pos[3], vel[3])

}


//  typedef void (STDCALL *fnPtrPosVelToEqnx)(double pos[3], double vel[3], double metricEqnx[6]);
//______________________________

public func posVelToEqnx(_ pos[3]: Double, _ vel[3]: Double, _ metricEqnx[6]: Double) {

    guard let posVelToEqnxPointer = dlsym(libHandle, "PosVelToEqnx") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    typealias PosVelToEqnxFunction = fnPtrPosVelToEqnx
    let posVelToEqnx = unsafeBitCast(posVelToEqnxPointer, to: PosVelToEqnxFunction.self)

    posVelToEqnx(pos[3], vel[3], metricEqnx[6])

}


//  typedef void (STDCALL *fnPtrPosVelMuToEqnx)(double pos[3], double vel[3], double mu, double metricEqnx[6]);
//______________________________

public func posVelMuToEqnx(_ pos[3]: Double, _ vel[3]: Double, _ mu: Double, _ metricEqnx[6]: Double) {

    guard let posVelMuToEqnxPointer = dlsym(libHandle, "PosVelMuToEqnx") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    typealias PosVelMuToEqnxFunction = fnPtrPosVelMuToEqnx
    let posVelMuToEqnx = unsafeBitCast(posVelMuToEqnxPointer, to: PosVelMuToEqnxFunction.self)

    posVelMuToEqnx(pos[3], vel[3], mu, metricEqnx[6])

}


//  typedef void (STDCALL *fnPtrPosVelToKep)(double pos[3], double vel[3], double metricKep[6]);
//______________________________

public func posVelToKep(_ pos[3]: Double, _ vel[3]: Double, _ metricKep[6]: Double) {

    guard let posVelToKepPointer = dlsym(libHandle, "PosVelToKep") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    typealias PosVelToKepFunction = fnPtrPosVelToKep
    let posVelToKep = unsafeBitCast(posVelToKepPointer, to: PosVelToKepFunction.self)

    posVelToKep(pos[3], vel[3], metricKep[6])

}


//  typedef void (STDCALL *fnPtrPosVelMuToKep)(double pos[3], double vel[3], double mu, double metricKep[6]);
//______________________________

public func posVelMuToKep(_ pos[3]: Double, _ vel[3]: Double, _ mu: Double, _ metricKep[6]: Double) {

    guard let posVelMuToKepPointer = dlsym(libHandle, "PosVelMuToKep") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    typealias PosVelMuToKepFunction = fnPtrPosVelMuToKep
    let posVelMuToKep = unsafeBitCast(posVelMuToKepPointer, to: PosVelMuToKepFunction.self)

    posVelMuToKep(pos[3], vel[3], mu, metricKep[6])

}


//  typedef void (STDCALL *fnPtrPosVelToUUVW)(double pos[3], double vel[3], double uvec[3], double vVec[3], double wVec[3]);
//______________________________

public func posVelToUUVW(_ pos[3]: Double, _ vel[3]: Double, _ uvec[3]: Double, _ vVec[3]: Double, _ wVec[3]: Double) {

    guard let posVelToUUVWPointer = dlsym(libHandle, "PosVelToUUVW") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    typealias PosVelToUUVWFunction = fnPtrPosVelToUUVW
    let posVelToUUVW = unsafeBitCast(posVelToUUVWPointer, to: PosVelToUUVWFunction.self)

    posVelToUUVW(pos[3], vel[3], uvec[3], vVec[3], wVec[3])

}


//  typedef void (STDCALL *fnPtrPosVelToPTW)(double pos[3], double vel[3], double uvec[3], double vVec[3], double wVec[3]);
//______________________________

public func posVelToPTW(_ pos[3]: Double, _ vel[3]: Double, _ uvec[3]: Double, _ vVec[3]: Double, _ wVec[3]: Double) {

    guard let posVelToPTWPointer = dlsym(libHandle, "PosVelToPTW") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    typealias PosVelToPTWFunction = fnPtrPosVelToPTW
    let posVelToPTW = unsafeBitCast(posVelToPTWPointer, to: PosVelToPTWFunction.self)

    posVelToPTW(pos[3], vel[3], uvec[3], vVec[3], wVec[3])

}


//  typedef double (STDCALL *fnPtrSolveKepEqtn)(double metricKep[6]);
//______________________________

public func solveKepEqtn(_ metricKep[6]: Double) -> Double {

    guard let solveKepEqtnPointer = dlsym(libHandle, "SolveKepEqtn") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    typealias SolveKepEqtnFunction = fnPtrSolveKepEqtn
    let solveKepEqtn = unsafeBitCast(solveKepEqtnPointer, to: SolveKepEqtnFunction.self)

    return solveKepEqtn(metricKep[6])

}


//  typedef double (STDCALL *fnPtrCompTrueAnomaly)(double metricKep[6]);
//______________________________

public func compTrueAnomaly(_ metricKep[6]: Double) -> Double {

    guard let compTrueAnomalyPointer = dlsym(libHandle, "CompTrueAnomaly") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    typealias CompTrueAnomalyFunction = fnPtrCompTrueAnomaly
    let compTrueAnomaly = unsafeBitCast(compTrueAnomalyPointer, to: CompTrueAnomalyFunction.self)

    return compTrueAnomaly(metricKep[6])

}


//  typedef double (STDCALL *fnPtrNToA)(double n);
//______________________________

public func nToA(_ n: Double) -> Double {

    guard let nToAPointer = dlsym(libHandle, "NToA") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    typealias NToAFunction = fnPtrNToA
    let nToA = unsafeBitCast(nToAPointer, to: NToAFunction.self)

    return nToA(n)

}


//  typedef double (STDCALL *fnPtrAToN)(double a);
//______________________________

public func aToN(_ a: Double) -> Double {

    guard let aToNPointer = dlsym(libHandle, "AToN") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    typealias AToNFunction = fnPtrAToN
    let aToN = unsafeBitCast(aToNPointer, to: AToNFunction.self)

    return aToN(a)

}


//  typedef double (STDCALL *fnPtrKozaiToBrouwer)(double eccen, double incli, double nKozai);
//______________________________

public func kozaiToBrouwer(_ eccen: Double, _ incli: Double, _ nKozai: Double) -> Double {

    guard let kozaiToBrouwerPointer = dlsym(libHandle, "KozaiToBrouwer") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    typealias KozaiToBrouwerFunction = fnPtrKozaiToBrouwer
    let kozaiToBrouwer = unsafeBitCast(kozaiToBrouwerPointer, to: KozaiToBrouwerFunction.self)

    return kozaiToBrouwer(eccen, incli, nKozai)

}


//  typedef double (STDCALL *fnPtrBrouwerToKozai)(double eccen, double incli, double nBrouwer);
//______________________________

public func brouwerToKozai(_ eccen: Double, _ incli: Double, _ nBrouwer: Double) -> Double {

    guard let brouwerToKozaiPointer = dlsym(libHandle, "BrouwerToKozai") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    typealias BrouwerToKozaiFunction = fnPtrBrouwerToKozai
    let brouwerToKozai = unsafeBitCast(brouwerToKozaiPointer, to: BrouwerToKozaiFunction.self)

    return brouwerToKozai(eccen, incli, nBrouwer)

}


//  typedef void (STDCALL *fnPtrKepOscToMean)(double metricOscKep[6], double metricMeanKep[6]);
//______________________________

public func kepOscToMean(_ metricOscKep[6]: Double, _ metricMeanKep[6]: Double) {

    guard let kepOscToMeanPointer = dlsym(libHandle, "KepOscToMean") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    typealias KepOscToMeanFunction = fnPtrKepOscToMean
    let kepOscToMean = unsafeBitCast(kepOscToMeanPointer, to: KepOscToMeanFunction.self)

    kepOscToMean(metricOscKep[6], metricMeanKep[6])

}


//  typedef void (STDCALL *fnPtrXYZToLLH)(double thetaG, double metricPos[3], double metricLLH[3]);
//______________________________

public func xYZToLLH(_ thetaG: Double, _ metricPos[3]: Double, _ metricLLH[3]: Double) {

    guard let xYZToLLHPointer = dlsym(libHandle, "XYZToLLH") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    typealias XYZToLLHFunction = fnPtrXYZToLLH
    let xYZToLLH = unsafeBitCast(xYZToLLHPointer, to: XYZToLLHFunction.self)

    xYZToLLH(thetaG, metricPos[3], metricLLH[3])

}


//  typedef void (STDCALL *fnPtrXYZToLLHTime)(double ds50UTC, double metricPos[3], double metricLLH[3]);
//______________________________

public func xYZToLLHTime(_ ds50UTC: Double, _ metricPos[3]: Double, _ metricLLH[3]: Double) {

    guard let xYZToLLHTimePointer = dlsym(libHandle, "XYZToLLHTime") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    typealias XYZToLLHTimeFunction = fnPtrXYZToLLHTime
    let xYZToLLHTime = unsafeBitCast(xYZToLLHTimePointer, to: XYZToLLHTimeFunction.self)

    xYZToLLHTime(ds50UTC, metricPos[3], metricLLH[3])

}


//  typedef void (STDCALL *fnPtrLLHToXYZ)(double thetaG, double metricLLH[3], double metricXYZ[3]);
//______________________________

public func lLHToXYZ(_ thetaG: Double, _ metricLLH[3]: Double, _ metricXYZ[3]: Double) {

    guard let lLHToXYZPointer = dlsym(libHandle, "LLHToXYZ") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    typealias LLHToXYZFunction = fnPtrLLHToXYZ
    let lLHToXYZ = unsafeBitCast(lLHToXYZPointer, to: LLHToXYZFunction.self)

    lLHToXYZ(thetaG, metricLLH[3], metricXYZ[3])

}


//  typedef void (STDCALL *fnPtrLLHToXYZTime)(double ds50UTC, double metricLLH[3], double metricXYZ[3]);
//______________________________

public func lLHToXYZTime(_ ds50UTC: Double, _ metricLLH[3]: Double, _ metricXYZ[3]: Double) {

    guard let lLHToXYZTimePointer = dlsym(libHandle, "LLHToXYZTime") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    typealias LLHToXYZTimeFunction = fnPtrLLHToXYZTime
    let lLHToXYZTime = unsafeBitCast(lLHToXYZTimePointer, to: LLHToXYZTimeFunction.self)

    lLHToXYZTime(ds50UTC, metricLLH[3], metricXYZ[3])

}


//  typedef void (STDCALL *fnPtrEFGToECI)(double thetaG, double posEFG[3], double velEFG[3], double posECI[3], double velECI[3]);
//______________________________

public func eFGToECI(_ thetaG: Double, _ posEFG[3]: Double, _ velEFG[3]: Double, _ posECI[3]: Double, _ velECI[3]: Double) {

    guard let eFGToECIPointer = dlsym(libHandle, "EFGToECI") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    typealias EFGToECIFunction = fnPtrEFGToECI
    let eFGToECI = unsafeBitCast(eFGToECIPointer, to: EFGToECIFunction.self)

    eFGToECI(thetaG, posEFG[3], velEFG[3], posECI[3], velECI[3])

}


//  typedef void (STDCALL *fnPtrEFGToECITime)(double ds50UTC, double posEFG[3], double velEFG[3], double posECI[3], double velECI[3]);
//______________________________

public func eFGToECITime(_ ds50UTC: Double, _ posEFG[3]: Double, _ velEFG[3]: Double, _ posECI[3]: Double, _ velECI[3]: Double) {

    guard let eFGToECITimePointer = dlsym(libHandle, "EFGToECITime") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    typealias EFGToECITimeFunction = fnPtrEFGToECITime
    let eFGToECITime = unsafeBitCast(eFGToECITimePointer, to: EFGToECITimeFunction.self)

    eFGToECITime(ds50UTC, posEFG[3], velEFG[3], posECI[3], velECI[3])

}


//  typedef void (STDCALL *fnPtrECIToEFG)(double thetaG, double posECI[3], double velECI[3], double posEFG[3], double velEFG[3]);
//______________________________

public func eCIToEFG(_ thetaG: Double, _ posECI[3]: Double, _ velECI[3]: Double, _ posEFG[3]: Double, _ velEFG[3]: Double) {

    guard let eCIToEFGPointer = dlsym(libHandle, "ECIToEFG") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    typealias ECIToEFGFunction = fnPtrECIToEFG
    let eCIToEFG = unsafeBitCast(eCIToEFGPointer, to: ECIToEFGFunction.self)

    eCIToEFG(thetaG, posECI[3], velECI[3], posEFG[3], velEFG[3])

}


//  typedef void (STDCALL *fnPtrECIToEFGTime)(double ds50UTC, double posECI[3], double velECI[3], double posEFG[3], double velEFG[3]);
//______________________________

public func eCIToEFGTime(_ ds50UTC: Double, _ posECI[3]: Double, _ velECI[3]: Double, _ posEFG[3]: Double, _ velEFG[3]: Double) {

    guard let eCIToEFGTimePointer = dlsym(libHandle, "ECIToEFGTime") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    typealias ECIToEFGTimeFunction = fnPtrECIToEFGTime
    let eCIToEFGTime = unsafeBitCast(eCIToEFGTimePointer, to: ECIToEFGTimeFunction.self)

    eCIToEFGTime(ds50UTC, posECI[3], velECI[3], posEFG[3], velEFG[3])

}


//  typedef void (STDCALL *fnPtrECRToEFG)(double polarX, double polarY, double posECR[3], double velECR[3], double posEFG[3], double velEFG[3]);
//______________________________

public func eCRToEFG(_ polarX: Double, _ polarY: Double, _ posECR[3]: Double, _ velECR[3]: Double, _ posEFG[3]: Double, _ velEFG[3]: Double) {

    guard let eCRToEFGPointer = dlsym(libHandle, "ECRToEFG") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    typealias ECRToEFGFunction = fnPtrECRToEFG
    let eCRToEFG = unsafeBitCast(eCRToEFGPointer, to: ECRToEFGFunction.self)

    eCRToEFG(polarX, polarY, posECR[3], velECR[3], posEFG[3], velEFG[3])

}


//  typedef void (STDCALL *fnPtrECRToEFGTime)(double ds50UTC, double posECR[3], double velECR[3], double posEFG[3], double velEFG[3]);
//______________________________

public func eCRToEFGTime(_ ds50UTC: Double, _ posECR[3]: Double, _ velECR[3]: Double, _ posEFG[3]: Double, _ velEFG[3]: Double) {

    guard let eCRToEFGTimePointer = dlsym(libHandle, "ECRToEFGTime") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    typealias ECRToEFGTimeFunction = fnPtrECRToEFGTime
    let eCRToEFGTime = unsafeBitCast(eCRToEFGTimePointer, to: ECRToEFGTimeFunction.self)

    eCRToEFGTime(ds50UTC, posECR[3], velECR[3], posEFG[3], velEFG[3])

}


//  typedef void (STDCALL *fnPtrEFGToECR)(double polarX, double polarY, double posEFG[3], double velEFG[3], double posECR[3], double velECR[3]);
//______________________________

public func eFGToECR(_ polarX: Double, _ polarY: Double, _ posEFG[3]: Double, _ velEFG[3]: Double, _ posECR[3]: Double, _ velECR[3]: Double) {

    guard let eFGToECRPointer = dlsym(libHandle, "EFGToECR") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    typealias EFGToECRFunction = fnPtrEFGToECR
    let eFGToECR = unsafeBitCast(eFGToECRPointer, to: EFGToECRFunction.self)

    eFGToECR(polarX, polarY, posEFG[3], velEFG[3], posECR[3], velECR[3])

}


//  typedef void (STDCALL *fnPtrEFGToECRTime)(double ds50UTC, double posEFG[3], double velEFG[3], double posECR[3], double velECR[3]);
//______________________________

public func eFGToECRTime(_ ds50UTC: Double, _ posEFG[3]: Double, _ velEFG[3]: Double, _ posECR[3]: Double, _ velECR[3]: Double) {

    guard let eFGToECRTimePointer = dlsym(libHandle, "EFGToECRTime") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    typealias EFGToECRTimeFunction = fnPtrEFGToECRTime
    let eFGToECRTime = unsafeBitCast(eFGToECRTimePointer, to: EFGToECRTimeFunction.self)

    eFGToECRTime(ds50UTC, posEFG[3], velEFG[3], posECR[3], velECR[3])

}


//  typedef void (STDCALL *fnPtrEFGPosToLLH)(double posEFG[3], double metricLLH[3]);
//______________________________

public func eFGPosToLLH(_ posEFG[3]: Double, _ metricLLH[3]: Double) {

    guard let eFGPosToLLHPointer = dlsym(libHandle, "EFGPosToLLH") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    typealias EFGPosToLLHFunction = fnPtrEFGPosToLLH
    let eFGPosToLLH = unsafeBitCast(eFGPosToLLHPointer, to: EFGPosToLLHFunction.self)

    eFGPosToLLH(posEFG[3], metricLLH[3])

}


//  typedef void (STDCALL *fnPtrLLHToEFGPos)(double metricLLH[3], double posEFG[3]);
//______________________________

public func lLHToEFGPos(_ metricLLH[3]: Double, _ posEFG[3]: Double) {

    guard let lLHToEFGPosPointer = dlsym(libHandle, "LLHToEFGPos") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    typealias LLHToEFGPosFunction = fnPtrLLHToEFGPos
    let lLHToEFGPos = unsafeBitCast(lLHToEFGPosPointer, to: LLHToEFGPosFunction.self)

    lLHToEFGPos(metricLLH[3], posEFG[3])

}


//  typedef void (STDCALL *fnPtrRotJ2KToDate)(int spectr, int nutationTerms, double ds50TAI, double posJ2K[3], double velJ2K[3], double posDate[3], double velDate[3]);
//______________________________

public func rotJ2KToDate(_ spectr: Int, _ nutationTerms: Int, _ ds50TAI: Double, _ posJ2K[3]: Double, _ velJ2K[3]: Double, _ posDate[3]: Double, _ velDate[3]: Double) {

    guard let rotJ2KToDatePointer = dlsym(libHandle, "RotJ2KToDate") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    typealias RotJ2KToDateFunction = fnPtrRotJ2KToDate
    let rotJ2KToDate = unsafeBitCast(rotJ2KToDatePointer, to: RotJ2KToDateFunction.self)

    rotJ2KToDate(spectr, nutationTerms, ds50TAI, posJ2K[3], velJ2K[3], posDate[3], velDate[3])

}


//  typedef void (STDCALL *fnPtrRotDateToJ2K)(int spectr, int nutationTerms, double ds50TAI, double posDate[3], double velDate[3], double posJ2K[3], double velJ2K[3]);
//______________________________

public func rotDateToJ2K(_ spectr: Int, _ nutationTerms: Int, _ ds50TAI: Double, _ posDate[3]: Double, _ velDate[3]: Double, _ posJ2K[3]: Double, _ velJ2K[3]: Double) {

    guard let rotDateToJ2KPointer = dlsym(libHandle, "RotDateToJ2K") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    typealias RotDateToJ2KFunction = fnPtrRotDateToJ2K
    let rotDateToJ2K = unsafeBitCast(rotDateToJ2KPointer, to: RotDateToJ2KFunction.self)

    rotDateToJ2K(spectr, nutationTerms, ds50TAI, posDate[3], velDate[3], posJ2K[3], velJ2K[3])

}


//  typedef void (STDCALL *fnPtrCompSunMoonPos)(double ds50ET, double uvecSun[3], double* sunVecMag, double uvecMoon[3], double* moonVecMag);
//______________________________

public func compSunMoonPos(_ ds50ET: Double, _ uvecSun[3]: Double, _ sunVecMag: Double*, _ uvecMoon[3]: Double, _ moonVecMag: Double*) {

    guard let compSunMoonPosPointer = dlsym(libHandle, "CompSunMoonPos") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    typealias CompSunMoonPosFunction = fnPtrCompSunMoonPos
    let compSunMoonPos = unsafeBitCast(compSunMoonPosPointer, to: CompSunMoonPosFunction.self)

    compSunMoonPos(ds50ET, uvecSun[3], sunVecMag, uvecMoon[3], moonVecMag)

}


//  typedef void (STDCALL *fnPtrCompSunPos)(double ds50ET, double uvecSun[3], double* sunVecMag);
//______________________________

public func compSunPos(_ ds50ET: Double, _ uvecSun[3]: Double, _ sunVecMag: Double*) {

    guard let compSunPosPointer = dlsym(libHandle, "CompSunPos") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    typealias CompSunPosFunction = fnPtrCompSunPos
    let compSunPos = unsafeBitCast(compSunPosPointer, to: CompSunPosFunction.self)

    compSunPos(ds50ET, uvecSun[3], sunVecMag)

}


//  typedef void (STDCALL *fnPtrCompMoonPos)(double ds50ET, double uvecMoon[3], double* moonVecMag);
//______________________________

public func compMoonPos(_ ds50ET: Double, _ uvecMoon[3]: Double, _ moonVecMag: Double*) {

    guard let compMoonPosPointer = dlsym(libHandle, "CompMoonPos") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    typealias CompMoonPosFunction = fnPtrCompMoonPos
    let compMoonPos = unsafeBitCast(compMoonPosPointer, to: CompMoonPosFunction.self)

    compMoonPos(ds50ET, uvecMoon[3], moonVecMag)

}


//  typedef void (STDCALL *fnPtrAstroConvFrTo)(int xf_Conv, double frArr[128], double toArr[128]);
//______________________________

public func astroConvFrTo(_ xf_Conv: Int, _ frArr[128]: Double, _ toArr[128]: Double) {

    guard let astroConvFrToPointer = dlsym(libHandle, "AstroConvFrTo") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    typealias AstroConvFrToFunction = fnPtrAstroConvFrTo
    let astroConvFrTo = unsafeBitCast(astroConvFrToPointer, to: AstroConvFrToFunction.self)

    astroConvFrTo(xf_Conv, frArr[128], toArr[128])

}


//  typedef void (STDCALL *fnPtrRADecToLAD)(double RA, double dec, double L[3], double A_Tilde[3], double D_Tilde[3]);
//______________________________

public func rADecToLAD(_ RA: Double, _ dec: Double, _ L[3]: Double, _ A_Tilde[3]: Double, _ D_Tilde[3]: Double) {

    guard let rADecToLADPointer = dlsym(libHandle, "RADecToLAD") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    typealias RADecToLADFunction = fnPtrRADecToLAD
    let rADecToLAD = unsafeBitCast(rADecToLADPointer, to: RADecToLADFunction.self)

    rADecToLAD(RA, dec, L[3], A_Tilde[3], D_Tilde[3])

}


//  typedef void (STDCALL *fnPtrAzElToLAD)(double az, double el, double Lh[3], double Ah[3], double Dh[3]);
//______________________________

public func azElToLAD(_ az: Double, _ el: Double, _ Lh[3]: Double, _ Ah[3]: Double, _ Dh[3]: Double) {

    guard let azElToLADPointer = dlsym(libHandle, "AzElToLAD") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    typealias AzElToLADFunction = fnPtrAzElToLAD
    let azElToLAD = unsafeBitCast(azElToLADPointer, to: AzElToLADFunction.self)

    azElToLAD(az, el, Lh[3], Ah[3], Dh[3])

}


//  typedef void (STDCALL *fnPtrECIToTopoComps)(double theta, double lat, double senPos[3], double satPos[3], double satVel[3], double xa_topo[10]);
//______________________________

public func eCIToTopoComps(_ theta: Double, _ lat: Double, _ senPos[3]: Double, _ satPos[3]: Double, _ satVel[3]: Double, _ xa_topo[10]: Double) {

    guard let eCIToTopoCompsPointer = dlsym(libHandle, "ECIToTopoComps") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    typealias ECIToTopoCompsFunction = fnPtrECIToTopoComps
    let eCIToTopoComps = unsafeBitCast(eCIToTopoCompsPointer, to: ECIToTopoCompsFunction.self)

    eCIToTopoComps(theta, lat, senPos[3], satPos[3], satVel[3], xa_topo[10])

}


//  typedef void (STDCALL *fnPtrRaDecToAzEl)(double thetaG, double lat, double lon, double RA, double dec, double* az, double* el);
//______________________________

public func raDecToAzEl(_ thetaG: Double, _ lat: Double, _ lon: Double, _ RA: Double, _ dec: Double, _ az: Double*, _ el: Double*) {

    guard let raDecToAzElPointer = dlsym(libHandle, "RaDecToAzEl") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    typealias RaDecToAzElFunction = fnPtrRaDecToAzEl
    let raDecToAzEl = unsafeBitCast(raDecToAzElPointer, to: RaDecToAzElFunction.self)

    raDecToAzEl(thetaG, lat, lon, RA, dec, az, el)

}


//  typedef void (STDCALL *fnPtrRaDecToAzElTime)(double ds50UTC, double lat, double lon, double RA, double dec, double* az, double* el);
//______________________________

public func raDecToAzElTime(_ ds50UTC: Double, _ lat: Double, _ lon: Double, _ RA: Double, _ dec: Double, _ az: Double*, _ el: Double*) {

    guard let raDecToAzElTimePointer = dlsym(libHandle, "RaDecToAzElTime") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    typealias RaDecToAzElTimeFunction = fnPtrRaDecToAzElTime
    let raDecToAzElTime = unsafeBitCast(raDecToAzElTimePointer, to: RaDecToAzElTimeFunction.self)

    raDecToAzElTime(ds50UTC, lat, lon, RA, dec, az, el)

}


//  typedef void (STDCALL *fnPtrAzElToRaDec)(double thetaG, double lat, double lon, double az, double el, double* RA, double* dec);
//______________________________

public func azElToRaDec(_ thetaG: Double, _ lat: Double, _ lon: Double, _ az: Double, _ el: Double, _ RA: Double*, _ dec: Double*) {

    guard let azElToRaDecPointer = dlsym(libHandle, "AzElToRaDec") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    typealias AzElToRaDecFunction = fnPtrAzElToRaDec
    let azElToRaDec = unsafeBitCast(azElToRaDecPointer, to: AzElToRaDecFunction.self)

    azElToRaDec(thetaG, lat, lon, az, el, RA, dec)

}


//  typedef void (STDCALL *fnPtrAzElToRaDecTime)(double ds50UTC, double lat, double lon, double az, double el, double* RA, double* dec);
//______________________________

public func azElToRaDecTime(_ ds50UTC: Double, _ lat: Double, _ lon: Double, _ az: Double, _ el: Double, _ RA: Double*, _ dec: Double*) {

    guard let azElToRaDecTimePointer = dlsym(libHandle, "AzElToRaDecTime") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    typealias AzElToRaDecTimeFunction = fnPtrAzElToRaDecTime
    let azElToRaDecTime = unsafeBitCast(azElToRaDecTimePointer, to: AzElToRaDecTimeFunction.self)

    azElToRaDecTime(ds50UTC, lat, lon, az, el, RA, dec)

}


//  typedef void (STDCALL *fnPtrRAEToECI)(double theta, double astroLat, double xa_rae[6], double senPos[3], double satPos[3], double satVel[3]);
//______________________________

public func rAEToECI(_ theta: Double, _ astroLat: Double, _ xa_rae[6]: Double, _ senPos[3]: Double, _ satPos[3]: Double, _ satVel[3]: Double) {

    guard let rAEToECIPointer = dlsym(libHandle, "RAEToECI") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    typealias RAEToECIFunction = fnPtrRAEToECI
    let rAEToECI = unsafeBitCast(rAEToECIPointer, to: RAEToECIFunction.self)

    rAEToECI(theta, astroLat, xa_rae[6], senPos[3], satPos[3], satVel[3])

}


//  typedef void (STDCALL *fnPtrGetInitialDrag)(double semiMajorAxis, double eccen, double* nDot, double* bstar);
//______________________________

public func getInitialDrag(_ semiMajorAxis: Double, _ eccen: Double, _ nDot: Double*, _ bstar: Double*) {

    guard let getInitialDragPointer = dlsym(libHandle, "GetInitialDrag") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    typealias GetInitialDragFunction = fnPtrGetInitialDrag
    let getInitialDrag = unsafeBitCast(getInitialDragPointer, to: GetInitialDragFunction.self)

    getInitialDrag(semiMajorAxis, eccen, nDot, bstar)

}


//  typedef void (STDCALL *fnPtrCovMtxPTWToUVW)(double pos[3], double vel[3], double ptwCovMtx[6][6], double uvwCovMtx[6][6]);
//______________________________

public func covMtxPTWToUVW(_ pos[3]: Double, _ vel[3]: Double, _ ptwCovMtx[6][6]: Double, _ uvwCovMtx[6][6]: Double) {

    guard let covMtxPTWToUVWPointer = dlsym(libHandle, "CovMtxPTWToUVW") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    typealias CovMtxPTWToUVWFunction = fnPtrCovMtxPTWToUVW
    let covMtxPTWToUVW = unsafeBitCast(covMtxPTWToUVWPointer, to: CovMtxPTWToUVWFunction.self)

    covMtxPTWToUVW(pos[3], vel[3], ptwCovMtx[6][6], uvwCovMtx[6][6])

}


//  typedef void (STDCALL *fnPtrCovMtxUVWToPTW)(double pos[3], double vel[3], double uvwCovMtx[6][6], double ptwCovMtx[6][6]);
//______________________________

public func covMtxUVWToPTW(_ pos[3]: Double, _ vel[3]: Double, _ uvwCovMtx[6][6]: Double, _ ptwCovMtx[6][6]: Double) {

    guard let covMtxUVWToPTWPointer = dlsym(libHandle, "CovMtxUVWToPTW") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    typealias CovMtxUVWToPTWFunction = fnPtrCovMtxUVWToPTW
    let covMtxUVWToPTW = unsafeBitCast(covMtxUVWToPTWPointer, to: CovMtxUVWToPTWFunction.self)

    covMtxUVWToPTW(pos[3], vel[3], uvwCovMtx[6][6], ptwCovMtx[6][6])

}


//  typedef void (STDCALL *fnPtrEarthObstructionAngles)(double earthLimb, double satECI[3], double senECI[3], double* earthSenLimb, double* earthSenSat, double* satEarthSen);
//______________________________

public func earthObstructionAngles(_ earthLimb: Double, _ satECI[3]: Double, _ senECI[3]: Double, _ earthSenLimb: Double*, _ earthSenSat: Double*, _ satEarthSen: Double*) {

    guard let earthObstructionAnglesPointer = dlsym(libHandle, "EarthObstructionAngles") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    typealias EarthObstructionAnglesFunction = fnPtrEarthObstructionAngles
    let earthObstructionAngles = unsafeBitCast(earthObstructionAnglesPointer, to: EarthObstructionAnglesFunction.self)

    earthObstructionAngles(earthLimb, satECI[3], senECI[3], earthSenLimb, earthSenSat, satEarthSen)

}


//  typedef int (STDCALL *fnPtrIsPointSunlit)(double ds50ET, double ptEci[3]);
//______________________________

public func isPointSunlit(_ ds50ET: Double, _ ptEci[3]: Double) -> Int32 {

    guard let isPointSunlitPointer = dlsym(libHandle, "IsPointSunlit") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    typealias IsPointSunlitFunction = fnPtrIsPointSunlit
    let isPointSunlit = unsafeBitCast(isPointSunlitPointer, to: IsPointSunlitFunction.self)

    return isPointSunlit(ds50ET, ptEci[3])

}


//  typedef void (STDCALL *fnPtrRotRADecl)(int nutationTerms, int dir, double ds50UTCIn, double RAIn, double declIn, double ds50UTCOut, double* RAOut, double* declOut);
//______________________________

public func rotRADecl(_ nutationTerms: Int, _ dir: Int, _ ds50UTCIn: Double, _ RAIn: Double, _ declIn: Double, _ ds50UTCOut: Double, _ RAOut: Double*, _ declOut: Double*) {

    guard let rotRADeclPointer = dlsym(libHandle, "RotRADecl") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    typealias RotRADeclFunction = fnPtrRotRADecl
    let rotRADecl = unsafeBitCast(rotRADeclPointer, to: RotRADeclFunction.self)

    rotRADecl(nutationTerms, dir, ds50UTCIn, RAIn, declIn, ds50UTCOut, RAOut, declOut)

}


//  typedef int (STDCALL *fnPtrRotRADec_DateToEqnx)(int nutationTerms, int yrOfEqnx, double ds50UTCIn, double RAIn, double declIn, double* RAOut, double* declOut);
//______________________________

public func rotRADec_DateToEqnx(_ nutationTerms: Int, _ yrOfEqnx: Int, _ ds50UTCIn: Double, _ RAIn: Double, _ declIn: Double, _ RAOut: Double*, _ declOut: Double*) -> Int32 {

    guard let rotRADec_DateToEqnxPointer = dlsym(libHandle, "RotRADec_DateToEqnx") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    typealias RotRADec_DateToEqnxFunction = fnPtrRotRADec_DateToEqnx
    let rotRADec_DateToEqnx = unsafeBitCast(rotRADec_DateToEqnxPointer, to: RotRADec_DateToEqnxFunction.self)

    return rotRADec_DateToEqnx(nutationTerms, yrOfEqnx, ds50UTCIn, RAIn, declIn, RAOut, declOut)

}


//  typedef int (STDCALL *fnPtrRotRADec_EqnxToDate)(int nutationTerms, int yrOfEqnx, double ds50UTCIn, double RAIn, double declIn, double* RAOut, double* declOut);
//______________________________

public func rotRADec_EqnxToDate(_ nutationTerms: Int, _ yrOfEqnx: Int, _ ds50UTCIn: Double, _ RAIn: Double, _ declIn: Double, _ RAOut: Double*, _ declOut: Double*) -> Int32 {

    guard let rotRADec_EqnxToDatePointer = dlsym(libHandle, "RotRADec_EqnxToDate") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    typealias RotRADec_EqnxToDateFunction = fnPtrRotRADec_EqnxToDate
    let rotRADec_EqnxToDate = unsafeBitCast(rotRADec_EqnxToDatePointer, to: RotRADec_EqnxToDateFunction.self)

    return rotRADec_EqnxToDate(nutationTerms, yrOfEqnx, ds50UTCIn, RAIn, declIn, RAOut, declOut)

}


//  typedef void (STDCALL *fnPtrCovMtxEqnxToUVW)(double pos[3], double vel[3], double covMtxEqnx[6][6], double covMtxUVW[6][6]);
//______________________________

public func covMtxEqnxToUVW(_ pos[3]: Double, _ vel[3]: Double, _ covMtxEqnx[6][6]: Double, _ covMtxUVW[6][6]: Double) {

    guard let covMtxEqnxToUVWPointer = dlsym(libHandle, "CovMtxEqnxToUVW") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    typealias CovMtxEqnxToUVWFunction = fnPtrCovMtxEqnxToUVW
    let covMtxEqnxToUVW = unsafeBitCast(covMtxEqnxToUVWPointer, to: CovMtxEqnxToUVWFunction.self)

    covMtxEqnxToUVW(pos[3], vel[3], covMtxEqnx[6][6], covMtxUVW[6][6])

}


//  typedef void (STDCALL *fnPtrCovMtxUVWToEqnx)(double pos[3], double vel[3], double covMtxUVW[6][6], double covMtxEqnx[6][6]);
//______________________________

public func covMtxUVWToEqnx(_ pos[3]: Double, _ vel[3]: Double, _ covMtxUVW[6][6]: Double, _ covMtxEqnx[6][6]: Double) {

    guard let covMtxUVWToEqnxPointer = dlsym(libHandle, "CovMtxUVWToEqnx") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    typealias CovMtxUVWToEqnxFunction = fnPtrCovMtxUVWToEqnx
    let covMtxUVWToEqnx = unsafeBitCast(covMtxUVWToEqnxPointer, to: CovMtxUVWToEqnxFunction.self)

    covMtxUVWToEqnx(pos[3], vel[3], covMtxUVW[6][6], covMtxEqnx[6][6])

}


//  typedef void (STDCALL *fnPtrCovMtxECIToUVW)(double pos[3], double vel[3], double covMtxECI[6][6], double covMtxUVW[6][6]);
//______________________________

public func covMtxECIToUVW(_ pos[3]: Double, _ vel[3]: Double, _ covMtxECI[6][6]: Double, _ covMtxUVW[6][6]: Double) {

    guard let covMtxECIToUVWPointer = dlsym(libHandle, "CovMtxECIToUVW") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    typealias CovMtxECIToUVWFunction = fnPtrCovMtxECIToUVW
    let covMtxECIToUVW = unsafeBitCast(covMtxECIToUVWPointer, to: CovMtxECIToUVWFunction.self)

    covMtxECIToUVW(pos[3], vel[3], covMtxECI[6][6], covMtxUVW[6][6])

}


//  typedef void (STDCALL *fnPtrCovMtxUVWToECI)(double pos[3], double vel[3], double covMtxUVW[6][6], double covMtxECI[6][6]);
//______________________________

public func covMtxUVWToECI(_ pos[3]: Double, _ vel[3]: Double, _ covMtxUVW[6][6]: Double, _ covMtxECI[6][6]: Double) {

    guard let covMtxUVWToECIPointer = dlsym(libHandle, "CovMtxUVWToECI") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    typealias CovMtxUVWToECIFunction = fnPtrCovMtxUVWToECI
    let covMtxUVWToECI = unsafeBitCast(covMtxUVWToECIPointer, to: CovMtxUVWToECIFunction.self)

    covMtxUVWToECI(pos[3], vel[3], covMtxUVW[6][6], covMtxECI[6][6])

}
