// This wrapper file was generated automatically by the GenDllWrappers program.

#if os(Linux)
fileprivate let libHandle = loadDll("libsgp4prop.so")
#elseif os(Windows)
fileprivate let libHandle = loadDll("Sgp4Prop.dll")
#else
fileprivate let libHandle = loadDll("libsgp4prop.dylib")
#endif

public func Sgp4Init( _ apAddr: Int64 ) -> Int32 {

    typealias functionSignature = @convention(c) ( Int64 ) -> Int32

    let function = unsafeBitCast(getFunctionPointer(libHandle, "Sgp4Init"), to: functionSignature.self)

    return function(apAddr)
}

public func Sgp4GetInfo( _ infoStr: UnsafeMutablePointer<CChar> ) {

    typealias functionSignature = @convention(c) ( UnsafeMutablePointer<CChar> ) -> Void

    let function = unsafeBitCast(getFunctionPointer(libHandle, "Sgp4GetInfo"), to: functionSignature.self)

    function(infoStr)
}

public func Sgp4InitSat( _ satKey: Int64 ) -> Int32 {

    typealias functionSignature = @convention(c) ( Int64 ) -> Int32

    let function = unsafeBitCast(getFunctionPointer(libHandle, "Sgp4InitSat"), to: functionSignature.self)

    return function(satKey)
}

public func Sgp4RemoveSat( _ satKey: Int64 ) -> Int32 {

    typealias functionSignature = @convention(c) ( Int64 ) -> Int32

    let function = unsafeBitCast(getFunctionPointer(libHandle, "Sgp4RemoveSat"), to: functionSignature.self)

    return function(satKey)
}

public func Sgp4RemoveAllSats(  ) -> Int32 {

    typealias functionSignature = @convention(c) (  ) -> Int32

    let function = unsafeBitCast(getFunctionPointer(libHandle, "Sgp4RemoveAllSats"), to: functionSignature.self)

    return function()
}

public func Sgp4GetCount(  ) -> Int32 {

    typealias functionSignature = @convention(c) (  ) -> Int32

    let function = unsafeBitCast(getFunctionPointer(libHandle, "Sgp4GetCount"), to: functionSignature.self)

    return function()
}

public func Sgp4PropMse( _ satKey: Int64,
                         _ mse: Double,
                         _ ds50UTC: UnsafeMutablePointer<Double>,
                         _ pos: UnsafeMutablePointer<Double>,
                         _ vel: UnsafeMutablePointer<Double>,
                         _ llh: UnsafeMutablePointer<Double> ) -> Int32 {

    typealias functionSignature = @convention(c) ( Int64,
                                                   Double,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Int32

    let function = unsafeBitCast(getFunctionPointer(libHandle, "Sgp4PropMse"), to: functionSignature.self)

    return function(satKey, mse, ds50UTC, pos, vel, llh)
}

public func Sgp4PropDs50UTC( _ satKey: Int64,
                             _ ds50UTC: Double,
                             _ mse: UnsafeMutablePointer<Double>,
                             _ pos: UnsafeMutablePointer<Double>,
                             _ vel: UnsafeMutablePointer<Double>,
                             _ llh: UnsafeMutablePointer<Double> ) -> Int32 {

    typealias functionSignature = @convention(c) ( Int64,
                                                   Double,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Int32

    let function = unsafeBitCast(getFunctionPointer(libHandle, "Sgp4PropDs50UTC"), to: functionSignature.self)

    return function(satKey, ds50UTC, mse, pos, vel, llh)
}

public func Sgp4PropDs50UtcPosVel( _ satKey: Int64,
                                   _ ds50UTC: Double,
                                   _ pos: UnsafeMutablePointer<Double>,
                                   _ vel: UnsafeMutablePointer<Double> ) -> Int32 {

    typealias functionSignature = @convention(c) ( Int64,
                                                   Double,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Int32

    let function = unsafeBitCast(getFunctionPointer(libHandle, "Sgp4PropDs50UtcPosVel"), to: functionSignature.self)

    return function(satKey, ds50UTC, pos, vel)
}

public func Sgp4PropDs50UtcLLH( _ satKey: Int64,
                                _ ds50UTC: Double,
                                _ llh: UnsafeMutablePointer<Double> ) -> Int32 {

    typealias functionSignature = @convention(c) ( Int64,
                                                   Double,
                                                   UnsafeMutablePointer<Double> ) -> Int32

    let function = unsafeBitCast(getFunctionPointer(libHandle, "Sgp4PropDs50UtcLLH"), to: functionSignature.self)

    return function(satKey, ds50UTC, llh)
}

public func Sgp4PropDs50UtcPos( _ satKey: Int64,
                                _ ds50UTC: Double,
                                _ pos: UnsafeMutablePointer<Double> ) -> Int32 {

    typealias functionSignature = @convention(c) ( Int64,
                                                   Double,
                                                   UnsafeMutablePointer<Double> ) -> Int32

    let function = unsafeBitCast(getFunctionPointer(libHandle, "Sgp4PropDs50UtcPos"), to: functionSignature.self)

    return function(satKey, ds50UTC, pos)
}

public func Sgp4GetPropOut( _ satKey: Int64,
                            _ xf_Sgp4Out: Int32,
                            _ destArr: UnsafeMutablePointer<Double> ) -> Int32 {

    typealias functionSignature = @convention(c) ( Int64,
                                                   Int32,
                                                   UnsafeMutablePointer<Double> ) -> Int32

    let function = unsafeBitCast(getFunctionPointer(libHandle, "Sgp4GetPropOut"), to: functionSignature.self)

    return function(satKey, xf_Sgp4Out, destArr)
}

public func Sgp4PropAll( _ satKey: Int64,
                         _ timeType: Int32,
                         _ timeIn: Double,
                         _ xa_Sgp4Out: UnsafeMutablePointer<Double> ) -> Int32 {

    typealias functionSignature = @convention(c) ( Int64,
                                                   Int32,
                                                   Double,
                                                   UnsafeMutablePointer<Double> ) -> Int32

    let function = unsafeBitCast(getFunctionPointer(libHandle, "Sgp4PropAll"), to: functionSignature.self)

    return function(satKey, timeType, timeIn, xa_Sgp4Out)
}

public func Sgp4PosVelToKep( _ yr: Int32,
                             _ day: Double,
                             _ pos: UnsafeMutablePointer<Double>,
                             _ vel: UnsafeMutablePointer<Double>,
                             _ posNew: UnsafeMutablePointer<Double>,
                             _ velNew: UnsafeMutablePointer<Double>,
                             _ sgp4MeanKep: UnsafeMutablePointer<Double> ) -> Int32 {

    typealias functionSignature = @convention(c) ( Int32,
                                                   Double,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Int32

    let function = unsafeBitCast(getFunctionPointer(libHandle, "Sgp4PosVelToKep"), to: functionSignature.self)

    return function(yr, day, pos, vel, posNew, velNew, sgp4MeanKep)
}

public func Sgp4PosVelToTleArr( _ pos: UnsafeMutablePointer<Double>,
                                _ vel: UnsafeMutablePointer<Double>,
                                _ xa_tle: UnsafeMutablePointer<Double> ) -> Int32 {

    typealias functionSignature = @convention(c) ( UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Int32

    let function = unsafeBitCast(getFunctionPointer(libHandle, "Sgp4PosVelToTleArr"), to: functionSignature.self)

    return function(pos, vel, xa_tle)
}

public func Sgp4ReepochTLE( _ satKey: Int64,
                            _ reepochDs50UTC: Double,
                            _ line1Out: UnsafeMutablePointer<CChar>,
                            _ line2Out: UnsafeMutablePointer<CChar> ) -> Int32 {

    typealias functionSignature = @convention(c) ( Int64,
                                                   Double,
                                                   UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<CChar> ) -> Int32

    let function = unsafeBitCast(getFunctionPointer(libHandle, "Sgp4ReepochTLE"), to: functionSignature.self)

    return function(satKey, reepochDs50UTC, line1Out, line2Out)
}

public func Sgp4ReepochCsv( _ satKey: Int64,
                            _ reepochDs50UTC: Double,
                            _ csvLine: UnsafeMutablePointer<CChar> ) -> Int32 {

    typealias functionSignature = @convention(c) ( Int64,
                                                   Double,
                                                   UnsafeMutablePointer<CChar> ) -> Int32

    let function = unsafeBitCast(getFunctionPointer(libHandle, "Sgp4ReepochCsv"), to: functionSignature.self)

    return function(satKey, reepochDs50UTC, csvLine)
}

public func Sgp4SetLicFilePath( _ licFilePath: UnsafeMutablePointer<CChar> ) {

    typealias functionSignature = @convention(c) ( UnsafeMutablePointer<CChar> ) -> Void

    let function = unsafeBitCast(getFunctionPointer(libHandle, "Sgp4SetLicFilePath"), to: functionSignature.self)

    function(licFilePath)
}

public func Sgp4GetLicFilePath( _ licFilePath: UnsafeMutablePointer<CChar> ) {

    typealias functionSignature = @convention(c) ( UnsafeMutablePointer<CChar> ) -> Void

    let function = unsafeBitCast(getFunctionPointer(libHandle, "Sgp4GetLicFilePath"), to: functionSignature.self)

    function(licFilePath)
}

public func Sgp4GenEphems( _ satKey: Int64,
                           _ startTime: Double,
                           _ endTime: Double,
                           _ stepSize: Double,
                           _ sgp4_ephem: Int32,
                           _ arrSize: Int32,
                           _ ephemArr: UnsafeMutablePointer<(Double, Double, Double, Double, Double, Double, Double)>,
                           _ genEphemPts: UnsafeMutablePointer<Int32> ) -> Int32 {

    let _ephemArr = UnsafeMutableRawPointer(ephemArr).bindMemory(to: Double.self, capacity: 0)

    typealias functionSignature = @convention(c) ( Int64,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   Int32,
                                                   Int32,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Int32> ) -> Int32

    let function = unsafeBitCast(getFunctionPointer(libHandle, "Sgp4GenEphems"), to: functionSignature.self)

    return function(satKey, startTime, endTime, stepSize, sgp4_ephem, arrSize, _ephemArr, genEphemPts)
}

public func Sgp4GenEphems_OS( _ xa_tle: UnsafeMutablePointer<Double>,
                              _ startTime: Double,
                              _ endTime: Double,
                              _ stepSize: Double,
                              _ sgp4_ephem: Int32,
                              _ arrSize: Int32,
                              _ ephemArr: UnsafeMutablePointer<(Double, Double, Double, Double, Double, Double, Double)>,
                              _ genEphemPts: UnsafeMutablePointer<Int32> ) -> Int32 {

    let _ephemArr = UnsafeMutableRawPointer(ephemArr).bindMemory(to: Double.self, capacity: 0)

    typealias functionSignature = @convention(c) ( UnsafeMutablePointer<Double>,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   Int32,
                                                   Int32,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Int32> ) -> Int32

    let function = unsafeBitCast(getFunctionPointer(libHandle, "Sgp4GenEphems_OS"), to: functionSignature.self)

    return function(xa_tle, startTime, endTime, stepSize, sgp4_ephem, arrSize, _ephemArr, genEphemPts)
}

public func Sgp4PropAllSats( _ satKeys: UnsafeMutablePointer<Int64>,
                             _ numOfSats: Int32,
                             _ ds50UTC: Double,
                             _ ephemArr: UnsafeMutablePointer<(Double, Double, Double, Double, Double, Double)> ) -> Int32 {

    let _ephemArr = UnsafeMutableRawPointer(ephemArr).bindMemory(to: Double.self, capacity: 0)

    typealias functionSignature = @convention(c) ( UnsafeMutablePointer<Int64>,
                                                   Int32,
                                                   Double,
                                                   UnsafeMutablePointer<Double> ) -> Int32

    let function = unsafeBitCast(getFunctionPointer(libHandle, "Sgp4PropAllSats"), to: functionSignature.self)

    return function(satKeys, numOfSats, ds50UTC, _ephemArr)
}
// ========================= End of auto generated code ==========================
