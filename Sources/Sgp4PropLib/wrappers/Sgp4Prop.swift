// This wrapper file was generated automatically by the GenDllWrappers program.
import Foundation
import AstroStds_c

#if os(Linux)
fileprivate let libHandle = loadDll("libsgp4prop.so")
#elseif os(Windows)
fileprivate let libHandle = loadDll("Sgp4Prop.dll")
#else
fileprivate let libHandle = loadDll("libsgp4prop.dylib")
#endif

public func Sgp4Init(_ apAddr: Int64) -> Int32 {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "Sgp4Init"), to: fnPtrSgp4Init.self)

    return function(apAddr)
}

public func Sgp4GetInfo(_ infoStr: UnsafeMutablePointer<CChar>) {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "Sgp4GetInfo"), to: fnPtrSgp4GetInfo.self)

    function(infoStr)
}

public func Sgp4InitSat(_ satKey: Int64) -> Int32 {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "Sgp4InitSat"), to: fnPtrSgp4InitSat.self)

    return function(satKey)
}

public func Sgp4RemoveSat(_ satKey: Int64) -> Int32 {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "Sgp4RemoveSat"), to: fnPtrSgp4RemoveSat.self)

    return function(satKey)
}

public func Sgp4RemoveAllSats() -> Int32 {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "Sgp4RemoveAllSats"), to: fnPtrSgp4RemoveAllSats.self)

    return function()
}

public func Sgp4GetCount() -> Int32 {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "Sgp4GetCount"), to: fnPtrSgp4GetCount.self)

    return function()
}

public func Sgp4PropMse(_ satKey: Int64, _ mse: Double, _ ds50UTC: UnsafeMutablePointer<Double>, _ pos: UnsafeMutablePointer<Double>, _ vel: UnsafeMutablePointer<Double>, _ llh: UnsafeMutablePointer<Double>) -> Int32 {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "Sgp4PropMse"), to: fnPtrSgp4PropMse.self)

    return function(satKey, mse, ds50UTC, pos, vel, llh)
}

public func Sgp4PropDs50UTC(_ satKey: Int64, _ ds50UTC: Double, _ mse: UnsafeMutablePointer<Double>, _ pos: UnsafeMutablePointer<Double>, _ vel: UnsafeMutablePointer<Double>, _ llh: UnsafeMutablePointer<Double>) -> Int32 {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "Sgp4PropDs50UTC"), to: fnPtrSgp4PropDs50UTC.self)

    return function(satKey, ds50UTC, mse, pos, vel, llh)
}

public func Sgp4PropDs50UtcPosVel(_ satKey: Int64, _ ds50UTC: Double, _ pos: UnsafeMutablePointer<Double>, _ vel: UnsafeMutablePointer<Double>) -> Int32 {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "Sgp4PropDs50UtcPosVel"), to: fnPtrSgp4PropDs50UtcPosVel.self)

    return function(satKey, ds50UTC, pos, vel)
}

public func Sgp4PropDs50UtcLLH(_ satKey: Int64, _ ds50UTC: Double, _ llh: UnsafeMutablePointer<Double>) -> Int32 {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "Sgp4PropDs50UtcLLH"), to: fnPtrSgp4PropDs50UtcLLH.self)

    return function(satKey, ds50UTC, llh)
}

public func Sgp4PropDs50UtcPos(_ satKey: Int64, _ ds50UTC: Double, _ pos: UnsafeMutablePointer<Double>) -> Int32 {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "Sgp4PropDs50UtcPos"), to: fnPtrSgp4PropDs50UtcPos.self)

    return function(satKey, ds50UTC, pos)
}

public func Sgp4GetPropOut(_ satKey: Int64, _ xf_Sgp4Out: Int32, _ destArr: UnsafeMutablePointer<Double>) -> Int32 {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "Sgp4GetPropOut"), to: fnPtrSgp4GetPropOut.self)

    return function(satKey, xf_Sgp4Out, destArr)
}

public func Sgp4PropAll(_ satKey: Int64, _ timeType: Int32, _ timeIn: Double, _ xa_Sgp4Out: UnsafeMutablePointer<Double>) -> Int32 {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "Sgp4PropAll"), to: fnPtrSgp4PropAll.self)

    return function(satKey, timeType, timeIn, xa_Sgp4Out)
}

public func Sgp4PosVelToKep(_ yr: Int32, _ day: Double, _ pos: UnsafeMutablePointer<Double>, _ vel: UnsafeMutablePointer<Double>, _ posNew: UnsafeMutablePointer<Double>, _ velNew: UnsafeMutablePointer<Double>, _ sgp4MeanKep: UnsafeMutablePointer<Double>) -> Int32 {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "Sgp4PosVelToKep"), to: fnPtrSgp4PosVelToKep.self)

    return function(yr, day, pos, vel, posNew, velNew, sgp4MeanKep)
}

public func Sgp4PosVelToTleArr(_ pos: UnsafeMutablePointer<Double>, _ vel: UnsafeMutablePointer<Double>, _ xa_tle: UnsafeMutablePointer<Double>) -> Int32 {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "Sgp4PosVelToTleArr"), to: fnPtrSgp4PosVelToTleArr.self)

    return function(pos, vel, xa_tle)
}

public func Sgp4ReepochTLE(_ satKey: Int64, _ reepochDs50UTC: Double, _ line1Out: UnsafeMutablePointer<CChar>, _ line2Out: UnsafeMutablePointer<CChar>) -> Int32 {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "Sgp4ReepochTLE"), to: fnPtrSgp4ReepochTLE.self)

    return function(satKey, reepochDs50UTC, line1Out, line2Out)
}

public func Sgp4ReepochCsv(_ satKey: Int64, _ reepochDs50UTC: Double, _ csvLine: UnsafeMutablePointer<CChar>) -> Int32 {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "Sgp4ReepochCsv"), to: fnPtrSgp4ReepochCsv.self)

    return function(satKey, reepochDs50UTC, csvLine)
}

public func Sgp4SetLicFilePath(_ licFilePath: UnsafeMutablePointer<CChar>) {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "Sgp4SetLicFilePath"), to: fnPtrSgp4SetLicFilePath.self)

    function(licFilePath)
}

public func Sgp4GetLicFilePath(_ licFilePath: UnsafeMutablePointer<CChar>) {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "Sgp4GetLicFilePath"), to: fnPtrSgp4GetLicFilePath.self)

    function(licFilePath)
}

public func Sgp4GenEphems(_ satKey: Int64, _ startTime: Double, _ endTime: Double, _ stepSize: Double, _ sgp4_ephem: Int32, _ arrSize: Int32, _ ephemArr: UnsafeMutablePointer<(Double, Double, Double, Double, Double, Double, Double)>, _ genEphemPts: UnsafeMutablePointer<Int32>) -> Int32 {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "Sgp4GenEphems"), to: fnPtrSgp4GenEphems.self)

    return function(satKey, startTime, endTime, stepSize, sgp4_ephem, arrSize, ephemArr, genEphemPts)
}

public func Sgp4GenEphems_OS(_ xa_tle: UnsafeMutablePointer<Double>, _ startTime: Double, _ endTime: Double, _ stepSize: Double, _ sgp4_ephem: Int32, _ arrSize: Int32, _ ephemArr: UnsafeMutablePointer<(Double, Double, Double, Double, Double, Double, Double)>, _ genEphemPts: UnsafeMutablePointer<Int32>) -> Int32 {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "Sgp4GenEphems_OS"), to: fnPtrSgp4GenEphems_OS.self)

    return function(xa_tle, startTime, endTime, stepSize, sgp4_ephem, arrSize, ephemArr, genEphemPts)
}

public func Sgp4PropAllSats(_ satKeys: UnsafeMutablePointer<Int64>, _ numOfSats: Int32, _ ds50UTC: Double, _ ephemArr: UnsafeMutablePointer<(Double, Double, Double, Double, Double, Double)>) -> Int32 {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "Sgp4PropAllSats"), to: fnPtrSgp4PropAllSats.self)

    return function(satKeys, numOfSats, ds50UTC, ephemArr)
}
// ========================= End of auto generated code ==========================
