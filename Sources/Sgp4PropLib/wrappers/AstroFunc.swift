// This wrapper file was generated automatically by the GenDllWrappers program.

#if os(Linux)
fileprivate let libHandle = loadDll("libastrofunc.so")
#elseif os(Windows)
fileprivate let libHandle = loadDll("AstroFunc.dll")
#else
fileprivate let libHandle = loadDll("libastrofunc.dylib")
#endif

public func AstroFuncInit( _ apAddr: Int64 ) -> Int32 {

    typealias functionSignature = @convention(c) ( Int64 ) -> Int32

    let function = unsafeBitCast(getFunctionPointer(libHandle, "AstroFuncInit"), to: functionSignature.self)

    return function(apAddr)
}

public func AstroFuncGetInfo( _ infoStr: UnsafeMutablePointer<CChar> ) {

    typealias functionSignature = @convention(c) ( UnsafeMutablePointer<CChar> ) -> Void

    let function = unsafeBitCast(getFunctionPointer(libHandle, "AstroFuncGetInfo"), to: functionSignature.self)

    function(infoStr)
}

public func KepToEqnx( _ metricKep: UnsafeMutablePointer<Double>, _ metricEqnx: UnsafeMutablePointer<Double> ) {

    typealias functionSignature = @convention(c) ( UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeBitCast(getFunctionPointer(libHandle, "KepToEqnx"), to: functionSignature.self)

    function(metricKep, metricEqnx)
}

public func KepToPosVel( _ metricKep: UnsafeMutablePointer<Double>,
                         _ pos: UnsafeMutablePointer<Double>,
                         _ vel: UnsafeMutablePointer<Double> ) {

    typealias functionSignature = @convention(c) ( UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeBitCast(getFunctionPointer(libHandle, "KepToPosVel"), to: functionSignature.self)

    function(metricKep, pos, vel)
}

public func KepToUVW( _ metricKep: UnsafeMutablePointer<Double>,
                      _ uBar: UnsafeMutablePointer<Double>,
                      _ vBar: UnsafeMutablePointer<Double>,
                      _ wBar: UnsafeMutablePointer<Double> ) {

    typealias functionSignature = @convention(c) ( UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeBitCast(getFunctionPointer(libHandle, "KepToUVW"), to: functionSignature.self)

    function(metricKep, uBar, vBar, wBar)
}

public func ClassToEqnx( _ metricClass: UnsafeMutablePointer<Double>, _ metricEqnx: UnsafeMutablePointer<Double> ) {

    typealias functionSignature = @convention(c) ( UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeBitCast(getFunctionPointer(libHandle, "ClassToEqnx"), to: functionSignature.self)

    function(metricClass, metricEqnx)
}

public func EqnxToClass( _ metricEqnx: UnsafeMutablePointer<Double>, _ metricClass: UnsafeMutablePointer<Double> ) {

    typealias functionSignature = @convention(c) ( UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeBitCast(getFunctionPointer(libHandle, "EqnxToClass"), to: functionSignature.self)

    function(metricEqnx, metricClass)
}

public func EqnxToKep( _ metricEqnx: UnsafeMutablePointer<Double>, _ metricKep: UnsafeMutablePointer<Double> ) {

    typealias functionSignature = @convention(c) ( UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeBitCast(getFunctionPointer(libHandle, "EqnxToKep"), to: functionSignature.self)

    function(metricEqnx, metricKep)
}

public func EqnxToPosVel( _ metricEqnx: UnsafeMutablePointer<Double>,
                          _ pos: UnsafeMutablePointer<Double>,
                          _ vel: UnsafeMutablePointer<Double> ) {

    typealias functionSignature = @convention(c) ( UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeBitCast(getFunctionPointer(libHandle, "EqnxToPosVel"), to: functionSignature.self)

    function(metricEqnx, pos, vel)
}

public func PosVelToEqnx( _ pos: UnsafeMutablePointer<Double>,
                          _ vel: UnsafeMutablePointer<Double>,
                          _ metricEqnx: UnsafeMutablePointer<Double> ) {

    typealias functionSignature = @convention(c) ( UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeBitCast(getFunctionPointer(libHandle, "PosVelToEqnx"), to: functionSignature.self)

    function(pos, vel, metricEqnx)
}

public func PosVelMuToEqnx( _ pos: UnsafeMutablePointer<Double>,
                            _ vel: UnsafeMutablePointer<Double>,
                            _ mu: Double,
                            _ metricEqnx: UnsafeMutablePointer<Double> ) {

    typealias functionSignature = @convention(c) ( UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   Double,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeBitCast(getFunctionPointer(libHandle, "PosVelMuToEqnx"), to: functionSignature.self)

    function(pos, vel, mu, metricEqnx)
}

public func PosVelToKep( _ pos: UnsafeMutablePointer<Double>,
                         _ vel: UnsafeMutablePointer<Double>,
                         _ metricKep: UnsafeMutablePointer<Double> ) {

    typealias functionSignature = @convention(c) ( UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeBitCast(getFunctionPointer(libHandle, "PosVelToKep"), to: functionSignature.self)

    function(pos, vel, metricKep)
}

public func PosVelMuToKep( _ pos: UnsafeMutablePointer<Double>,
                           _ vel: UnsafeMutablePointer<Double>,
                           _ mu: Double,
                           _ metricKep: UnsafeMutablePointer<Double> ) {

    typealias functionSignature = @convention(c) ( UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   Double,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeBitCast(getFunctionPointer(libHandle, "PosVelMuToKep"), to: functionSignature.self)

    function(pos, vel, mu, metricKep)
}

public func PosVelToUUVW( _ pos: UnsafeMutablePointer<Double>,
                          _ vel: UnsafeMutablePointer<Double>,
                          _ uvec: UnsafeMutablePointer<Double>,
                          _ vVec: UnsafeMutablePointer<Double>,
                          _ wVec: UnsafeMutablePointer<Double> ) {

    typealias functionSignature = @convention(c) ( UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeBitCast(getFunctionPointer(libHandle, "PosVelToUUVW"), to: functionSignature.self)

    function(pos, vel, uvec, vVec, wVec)
}

public func PosVelToPTW( _ pos: UnsafeMutablePointer<Double>,
                         _ vel: UnsafeMutablePointer<Double>,
                         _ uvec: UnsafeMutablePointer<Double>,
                         _ vVec: UnsafeMutablePointer<Double>,
                         _ wVec: UnsafeMutablePointer<Double> ) {

    typealias functionSignature = @convention(c) ( UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeBitCast(getFunctionPointer(libHandle, "PosVelToPTW"), to: functionSignature.self)

    function(pos, vel, uvec, vVec, wVec)
}

public func SolveKepEqtn( _ metricKep: UnsafeMutablePointer<Double> ) -> Double {

    typealias functionSignature = @convention(c) ( UnsafeMutablePointer<Double> ) -> Double

    let function = unsafeBitCast(getFunctionPointer(libHandle, "SolveKepEqtn"), to: functionSignature.self)

    return function(metricKep)
}

public func CompTrueAnomaly( _ metricKep: UnsafeMutablePointer<Double> ) -> Double {

    typealias functionSignature = @convention(c) ( UnsafeMutablePointer<Double> ) -> Double

    let function = unsafeBitCast(getFunctionPointer(libHandle, "CompTrueAnomaly"), to: functionSignature.self)

    return function(metricKep)
}

public func NToA( _ n: Double ) -> Double {

    typealias functionSignature = @convention(c) ( Double ) -> Double

    let function = unsafeBitCast(getFunctionPointer(libHandle, "NToA"), to: functionSignature.self)

    return function(n)
}

public func AToN( _ a: Double ) -> Double {

    typealias functionSignature = @convention(c) ( Double ) -> Double

    let function = unsafeBitCast(getFunctionPointer(libHandle, "AToN"), to: functionSignature.self)

    return function(a)
}

public func KozaiToBrouwer( _ eccen: Double,
                            _ incli: Double,
                            _ nKozai: Double ) -> Double {

    typealias functionSignature = @convention(c) ( Double,
                                                   Double,
                                                   Double ) -> Double

    let function = unsafeBitCast(getFunctionPointer(libHandle, "KozaiToBrouwer"), to: functionSignature.self)

    return function(eccen, incli, nKozai)
}

public func BrouwerToKozai( _ eccen: Double,
                            _ incli: Double,
                            _ nBrouwer: Double ) -> Double {

    typealias functionSignature = @convention(c) ( Double,
                                                   Double,
                                                   Double ) -> Double

    let function = unsafeBitCast(getFunctionPointer(libHandle, "BrouwerToKozai"), to: functionSignature.self)

    return function(eccen, incli, nBrouwer)
}

public func KepOscToMean( _ metricOscKep: UnsafeMutablePointer<Double>, _ metricMeanKep: UnsafeMutablePointer<Double> ) {

    typealias functionSignature = @convention(c) ( UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeBitCast(getFunctionPointer(libHandle, "KepOscToMean"), to: functionSignature.self)

    function(metricOscKep, metricMeanKep)
}

public func XYZToLLH( _ thetaG: Double,
                      _ metricPos: UnsafeMutablePointer<Double>,
                      _ metricLLH: UnsafeMutablePointer<Double> ) {

    typealias functionSignature = @convention(c) ( Double,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeBitCast(getFunctionPointer(libHandle, "XYZToLLH"), to: functionSignature.self)

    function(thetaG, metricPos, metricLLH)
}

public func XYZToLLHTime( _ ds50UTC: Double,
                          _ metricPos: UnsafeMutablePointer<Double>,
                          _ metricLLH: UnsafeMutablePointer<Double> ) {

    typealias functionSignature = @convention(c) ( Double,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeBitCast(getFunctionPointer(libHandle, "XYZToLLHTime"), to: functionSignature.self)

    function(ds50UTC, metricPos, metricLLH)
}

public func LLHToXYZ( _ thetaG: Double,
                      _ metricLLH: UnsafeMutablePointer<Double>,
                      _ metricXYZ: UnsafeMutablePointer<Double> ) {

    typealias functionSignature = @convention(c) ( Double,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeBitCast(getFunctionPointer(libHandle, "LLHToXYZ"), to: functionSignature.self)

    function(thetaG, metricLLH, metricXYZ)
}

public func LLHToXYZTime( _ ds50UTC: Double,
                          _ metricLLH: UnsafeMutablePointer<Double>,
                          _ metricXYZ: UnsafeMutablePointer<Double> ) {

    typealias functionSignature = @convention(c) ( Double,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeBitCast(getFunctionPointer(libHandle, "LLHToXYZTime"), to: functionSignature.self)

    function(ds50UTC, metricLLH, metricXYZ)
}

public func EFGToECI( _ thetaG: Double,
                      _ posEFG: UnsafeMutablePointer<Double>,
                      _ velEFG: UnsafeMutablePointer<Double>,
                      _ posECI: UnsafeMutablePointer<Double>,
                      _ velECI: UnsafeMutablePointer<Double> ) {

    typealias functionSignature = @convention(c) ( Double,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeBitCast(getFunctionPointer(libHandle, "EFGToECI"), to: functionSignature.self)

    function(thetaG, posEFG, velEFG, posECI, velECI)
}

public func EFGToECITime( _ ds50UTC: Double,
                          _ posEFG: UnsafeMutablePointer<Double>,
                          _ velEFG: UnsafeMutablePointer<Double>,
                          _ posECI: UnsafeMutablePointer<Double>,
                          _ velECI: UnsafeMutablePointer<Double> ) {

    typealias functionSignature = @convention(c) ( Double,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeBitCast(getFunctionPointer(libHandle, "EFGToECITime"), to: functionSignature.self)

    function(ds50UTC, posEFG, velEFG, posECI, velECI)
}

public func ECIToEFG( _ thetaG: Double,
                      _ posECI: UnsafeMutablePointer<Double>,
                      _ velECI: UnsafeMutablePointer<Double>,
                      _ posEFG: UnsafeMutablePointer<Double>,
                      _ velEFG: UnsafeMutablePointer<Double> ) {

    typealias functionSignature = @convention(c) ( Double,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeBitCast(getFunctionPointer(libHandle, "ECIToEFG"), to: functionSignature.self)

    function(thetaG, posECI, velECI, posEFG, velEFG)
}

public func ECIToEFGTime( _ ds50UTC: Double,
                          _ posECI: UnsafeMutablePointer<Double>,
                          _ velECI: UnsafeMutablePointer<Double>,
                          _ posEFG: UnsafeMutablePointer<Double>,
                          _ velEFG: UnsafeMutablePointer<Double> ) {

    typealias functionSignature = @convention(c) ( Double,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeBitCast(getFunctionPointer(libHandle, "ECIToEFGTime"), to: functionSignature.self)

    function(ds50UTC, posECI, velECI, posEFG, velEFG)
}

public func ECRToEFG( _ polarX: Double,
                      _ polarY: Double,
                      _ posECR: UnsafeMutablePointer<Double>,
                      _ velECR: UnsafeMutablePointer<Double>,
                      _ posEFG: UnsafeMutablePointer<Double>,
                      _ velEFG: UnsafeMutablePointer<Double> ) {

    typealias functionSignature = @convention(c) ( Double,
                                                   Double,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeBitCast(getFunctionPointer(libHandle, "ECRToEFG"), to: functionSignature.self)

    function(polarX, polarY, posECR, velECR, posEFG, velEFG)
}

public func ECRToEFGTime( _ ds50UTC: Double,
                          _ posECR: UnsafeMutablePointer<Double>,
                          _ velECR: UnsafeMutablePointer<Double>,
                          _ posEFG: UnsafeMutablePointer<Double>,
                          _ velEFG: UnsafeMutablePointer<Double> ) {

    typealias functionSignature = @convention(c) ( Double,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeBitCast(getFunctionPointer(libHandle, "ECRToEFGTime"), to: functionSignature.self)

    function(ds50UTC, posECR, velECR, posEFG, velEFG)
}

public func EFGToECR( _ polarX: Double,
                      _ polarY: Double,
                      _ posEFG: UnsafeMutablePointer<Double>,
                      _ velEFG: UnsafeMutablePointer<Double>,
                      _ posECR: UnsafeMutablePointer<Double>,
                      _ velECR: UnsafeMutablePointer<Double> ) {

    typealias functionSignature = @convention(c) ( Double,
                                                   Double,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeBitCast(getFunctionPointer(libHandle, "EFGToECR"), to: functionSignature.self)

    function(polarX, polarY, posEFG, velEFG, posECR, velECR)
}

public func EFGToECRTime( _ ds50UTC: Double,
                          _ posEFG: UnsafeMutablePointer<Double>,
                          _ velEFG: UnsafeMutablePointer<Double>,
                          _ posECR: UnsafeMutablePointer<Double>,
                          _ velECR: UnsafeMutablePointer<Double> ) {

    typealias functionSignature = @convention(c) ( Double,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeBitCast(getFunctionPointer(libHandle, "EFGToECRTime"), to: functionSignature.self)

    function(ds50UTC, posEFG, velEFG, posECR, velECR)
}

public func EFGPosToLLH( _ posEFG: UnsafeMutablePointer<Double>, _ metricLLH: UnsafeMutablePointer<Double> ) {

    typealias functionSignature = @convention(c) ( UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeBitCast(getFunctionPointer(libHandle, "EFGPosToLLH"), to: functionSignature.self)

    function(posEFG, metricLLH)
}

public func LLHToEFGPos( _ metricLLH: UnsafeMutablePointer<Double>, _ posEFG: UnsafeMutablePointer<Double> ) {

    typealias functionSignature = @convention(c) ( UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeBitCast(getFunctionPointer(libHandle, "LLHToEFGPos"), to: functionSignature.self)

    function(metricLLH, posEFG)
}

public func RotJ2KToDate( _ spectr: Int32,
                          _ nutationTerms: Int32,
                          _ ds50TAI: Double,
                          _ posJ2K: UnsafeMutablePointer<Double>,
                          _ velJ2K: UnsafeMutablePointer<Double>,
                          _ posDate: UnsafeMutablePointer<Double>,
                          _ velDate: UnsafeMutablePointer<Double> ) {

    typealias functionSignature = @convention(c) ( Int32,
                                                   Int32,
                                                   Double,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeBitCast(getFunctionPointer(libHandle, "RotJ2KToDate"), to: functionSignature.self)

    function(spectr, nutationTerms, ds50TAI, posJ2K, velJ2K, posDate, velDate)
}

public func RotDateToJ2K( _ spectr: Int32,
                          _ nutationTerms: Int32,
                          _ ds50TAI: Double,
                          _ posDate: UnsafeMutablePointer<Double>,
                          _ velDate: UnsafeMutablePointer<Double>,
                          _ posJ2K: UnsafeMutablePointer<Double>,
                          _ velJ2K: UnsafeMutablePointer<Double> ) {

    typealias functionSignature = @convention(c) ( Int32,
                                                   Int32,
                                                   Double,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeBitCast(getFunctionPointer(libHandle, "RotDateToJ2K"), to: functionSignature.self)

    function(spectr, nutationTerms, ds50TAI, posDate, velDate, posJ2K, velJ2K)
}

public func CompSunMoonPos( _ ds50ET: Double,
                            _ uvecSun: UnsafeMutablePointer<Double>,
                            _ sunVecMag: UnsafeMutablePointer<Double>,
                            _ uvecMoon: UnsafeMutablePointer<Double>,
                            _ moonVecMag: UnsafeMutablePointer<Double> ) {

    typealias functionSignature = @convention(c) ( Double,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeBitCast(getFunctionPointer(libHandle, "CompSunMoonPos"), to: functionSignature.self)

    function(ds50ET, uvecSun, sunVecMag, uvecMoon, moonVecMag)
}

public func CompSunPos( _ ds50ET: Double,
                        _ uvecSun: UnsafeMutablePointer<Double>,
                        _ sunVecMag: UnsafeMutablePointer<Double> ) {

    typealias functionSignature = @convention(c) ( Double,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeBitCast(getFunctionPointer(libHandle, "CompSunPos"), to: functionSignature.self)

    function(ds50ET, uvecSun, sunVecMag)
}

public func CompMoonPos( _ ds50ET: Double,
                         _ uvecMoon: UnsafeMutablePointer<Double>,
                         _ moonVecMag: UnsafeMutablePointer<Double> ) {

    typealias functionSignature = @convention(c) ( Double,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeBitCast(getFunctionPointer(libHandle, "CompMoonPos"), to: functionSignature.self)

    function(ds50ET, uvecMoon, moonVecMag)
}

public func AstroConvFrTo( _ xf_Conv: Int32,
                           _ frArr: UnsafeMutablePointer<Double>,
                           _ toArr: UnsafeMutablePointer<Double> ) {

    typealias functionSignature = @convention(c) ( Int32,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeBitCast(getFunctionPointer(libHandle, "AstroConvFrTo"), to: functionSignature.self)

    function(xf_Conv, frArr, toArr)
}

public func RADecToLAD( _ RA: Double,
                        _ dec: Double,
                        _ L: UnsafeMutablePointer<Double>,
                        _ A_Tilde: UnsafeMutablePointer<Double>,
                        _ D_Tilde: UnsafeMutablePointer<Double> ) {

    typealias functionSignature = @convention(c) ( Double,
                                                   Double,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeBitCast(getFunctionPointer(libHandle, "RADecToLAD"), to: functionSignature.self)

    function(RA, dec, L, A_Tilde, D_Tilde)
}

public func AzElToLAD( _ az: Double,
                       _ el: Double,
                       _ Lh: UnsafeMutablePointer<Double>,
                       _ Ah: UnsafeMutablePointer<Double>,
                       _ Dh: UnsafeMutablePointer<Double> ) {

    typealias functionSignature = @convention(c) ( Double,
                                                   Double,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeBitCast(getFunctionPointer(libHandle, "AzElToLAD"), to: functionSignature.self)

    function(az, el, Lh, Ah, Dh)
}

public func ECIToTopoComps( _ theta: Double,
                            _ lat: Double,
                            _ senPos: UnsafeMutablePointer<Double>,
                            _ satPos: UnsafeMutablePointer<Double>,
                            _ satVel: UnsafeMutablePointer<Double>,
                            _ xa_topo: UnsafeMutablePointer<Double> ) {

    typealias functionSignature = @convention(c) ( Double,
                                                   Double,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeBitCast(getFunctionPointer(libHandle, "ECIToTopoComps"), to: functionSignature.self)

    function(theta, lat, senPos, satPos, satVel, xa_topo)
}

public func RaDecToAzEl( _ thetaG: Double,
                         _ lat: Double,
                         _ lon: Double,
                         _ RA: Double,
                         _ dec: Double,
                         _ az: UnsafeMutablePointer<Double>,
                         _ el: UnsafeMutablePointer<Double> ) {

    typealias functionSignature = @convention(c) ( Double,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeBitCast(getFunctionPointer(libHandle, "RaDecToAzEl"), to: functionSignature.self)

    function(thetaG, lat, lon, RA, dec, az, el)
}

public func RaDecToAzElTime( _ ds50UTC: Double,
                             _ lat: Double,
                             _ lon: Double,
                             _ RA: Double,
                             _ dec: Double,
                             _ az: UnsafeMutablePointer<Double>,
                             _ el: UnsafeMutablePointer<Double> ) {

    typealias functionSignature = @convention(c) ( Double,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeBitCast(getFunctionPointer(libHandle, "RaDecToAzElTime"), to: functionSignature.self)

    function(ds50UTC, lat, lon, RA, dec, az, el)
}

public func AzElToRaDec( _ thetaG: Double,
                         _ lat: Double,
                         _ lon: Double,
                         _ az: Double,
                         _ el: Double,
                         _ RA: UnsafeMutablePointer<Double>,
                         _ dec: UnsafeMutablePointer<Double> ) {

    typealias functionSignature = @convention(c) ( Double,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeBitCast(getFunctionPointer(libHandle, "AzElToRaDec"), to: functionSignature.self)

    function(thetaG, lat, lon, az, el, RA, dec)
}

public func AzElToRaDecTime( _ ds50UTC: Double,
                             _ lat: Double,
                             _ lon: Double,
                             _ az: Double,
                             _ el: Double,
                             _ RA: UnsafeMutablePointer<Double>,
                             _ dec: UnsafeMutablePointer<Double> ) {

    typealias functionSignature = @convention(c) ( Double,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeBitCast(getFunctionPointer(libHandle, "AzElToRaDecTime"), to: functionSignature.self)

    function(ds50UTC, lat, lon, az, el, RA, dec)
}

public func RAEToECI( _ theta: Double,
                      _ astroLat: Double,
                      _ xa_rae: UnsafeMutablePointer<Double>,
                      _ senPos: UnsafeMutablePointer<Double>,
                      _ satPos: UnsafeMutablePointer<Double>,
                      _ satVel: UnsafeMutablePointer<Double> ) {

    typealias functionSignature = @convention(c) ( Double,
                                                   Double,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeBitCast(getFunctionPointer(libHandle, "RAEToECI"), to: functionSignature.self)

    function(theta, astroLat, xa_rae, senPos, satPos, satVel)
}

public func GetInitialDrag( _ semiMajorAxis: Double,
                            _ eccen: Double,
                            _ nDot: UnsafeMutablePointer<Double>,
                            _ bstar: UnsafeMutablePointer<Double> ) {

    typealias functionSignature = @convention(c) ( Double,
                                                   Double,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeBitCast(getFunctionPointer(libHandle, "GetInitialDrag"), to: functionSignature.self)

    function(semiMajorAxis, eccen, nDot, bstar)
}

public func CovMtxPTWToUVW( _ pos: UnsafeMutablePointer<Double>,
                            _ vel: UnsafeMutablePointer<Double>,
                            _ ptwCovMtx: UnsafeMutablePointer<(Double, Double, Double, Double, Double, Double)>,
                            _ uvwCovMtx: UnsafeMutablePointer<(Double, Double, Double, Double, Double, Double)> ) {

    let _ptwCovMtx = UnsafeMutableRawPointer(ptwCovMtx).bindMemory(to: Double.self, capacity: 36)
    let _uvwCovMtx = UnsafeMutableRawPointer(uvwCovMtx).bindMemory(to: Double.self, capacity: 36)

    typealias functionSignature = @convention(c) ( UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeBitCast(getFunctionPointer(libHandle, "CovMtxPTWToUVW"), to: functionSignature.self)

    function(pos, vel, _ptwCovMtx, _uvwCovMtx)
}

public func CovMtxUVWToPTW( _ pos: UnsafeMutablePointer<Double>,
                            _ vel: UnsafeMutablePointer<Double>,
                            _ uvwCovMtx: UnsafeMutablePointer<(Double, Double, Double, Double, Double, Double)>,
                            _ ptwCovMtx: UnsafeMutablePointer<(Double, Double, Double, Double, Double, Double)> ) {

    let _uvwCovMtx = UnsafeMutableRawPointer(uvwCovMtx).bindMemory(to: Double.self, capacity: 36)
    let _ptwCovMtx = UnsafeMutableRawPointer(ptwCovMtx).bindMemory(to: Double.self, capacity: 36)

    typealias functionSignature = @convention(c) ( UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeBitCast(getFunctionPointer(libHandle, "CovMtxUVWToPTW"), to: functionSignature.self)

    function(pos, vel, _uvwCovMtx, _ptwCovMtx)
}

public func EarthObstructionAngles( _ earthLimb: Double,
                                    _ satECI: UnsafeMutablePointer<Double>,
                                    _ senECI: UnsafeMutablePointer<Double>,
                                    _ earthSenLimb: UnsafeMutablePointer<Double>,
                                    _ earthSenSat: UnsafeMutablePointer<Double>,
                                    _ satEarthSen: UnsafeMutablePointer<Double> ) {

    typealias functionSignature = @convention(c) ( Double,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeBitCast(getFunctionPointer(libHandle, "EarthObstructionAngles"), to: functionSignature.self)

    function(earthLimb, satECI, senECI, earthSenLimb, earthSenSat, satEarthSen)
}

public func IsPointSunlit( _ ds50ET: Double, _ ptEci: UnsafeMutablePointer<Double> ) -> Int32 {

    typealias functionSignature = @convention(c) ( Double,
                                                   UnsafeMutablePointer<Double> ) -> Int32

    let function = unsafeBitCast(getFunctionPointer(libHandle, "IsPointSunlit"), to: functionSignature.self)

    return function(ds50ET, ptEci)
}

public func RotRADecl( _ nutationTerms: Int32,
                       _ dir: Int32,
                       _ ds50UTCIn: Double,
                       _ RAIn: Double,
                       _ declIn: Double,
                       _ ds50UTCOut: Double,
                       _ RAOut: UnsafeMutablePointer<Double>,
                       _ declOut: UnsafeMutablePointer<Double> ) {

    typealias functionSignature = @convention(c) ( Int32,
                                                   Int32,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeBitCast(getFunctionPointer(libHandle, "RotRADecl"), to: functionSignature.self)

    function(nutationTerms, dir, ds50UTCIn, RAIn, declIn, ds50UTCOut, RAOut, declOut)
}

public func RotRADec_DateToEqnx( _ nutationTerms: Int32,
                                 _ yrOfEqnx: Int32,
                                 _ ds50UTCIn: Double,
                                 _ RAIn: Double,
                                 _ declIn: Double,
                                 _ RAOut: UnsafeMutablePointer<Double>,
                                 _ declOut: UnsafeMutablePointer<Double> ) -> Int32 {

    typealias functionSignature = @convention(c) ( Int32,
                                                   Int32,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Int32

    let function = unsafeBitCast(getFunctionPointer(libHandle, "RotRADec_DateToEqnx"), to: functionSignature.self)

    return function(nutationTerms, yrOfEqnx, ds50UTCIn, RAIn, declIn, RAOut, declOut)
}

public func RotRADec_EqnxToDate( _ nutationTerms: Int32,
                                 _ yrOfEqnx: Int32,
                                 _ ds50UTCIn: Double,
                                 _ RAIn: Double,
                                 _ declIn: Double,
                                 _ RAOut: UnsafeMutablePointer<Double>,
                                 _ declOut: UnsafeMutablePointer<Double> ) -> Int32 {

    typealias functionSignature = @convention(c) ( Int32,
                                                   Int32,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Int32

    let function = unsafeBitCast(getFunctionPointer(libHandle, "RotRADec_EqnxToDate"), to: functionSignature.self)

    return function(nutationTerms, yrOfEqnx, ds50UTCIn, RAIn, declIn, RAOut, declOut)
}

public func CovMtxEqnxToUVW( _ pos: UnsafeMutablePointer<Double>,
                             _ vel: UnsafeMutablePointer<Double>,
                             _ covMtxEqnx: UnsafeMutablePointer<(Double, Double, Double, Double, Double, Double)>,
                             _ covMtxUVW: UnsafeMutablePointer<(Double, Double, Double, Double, Double, Double)> ) {

    let _covMtxEqnx = UnsafeMutableRawPointer(covMtxEqnx).bindMemory(to: Double.self, capacity: 36)
    let _covMtxUVW = UnsafeMutableRawPointer(covMtxUVW).bindMemory(to: Double.self, capacity: 36)

    typealias functionSignature = @convention(c) ( UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeBitCast(getFunctionPointer(libHandle, "CovMtxEqnxToUVW"), to: functionSignature.self)

    function(pos, vel, _covMtxEqnx, _covMtxUVW)
}

public func CovMtxUVWToEqnx( _ pos: UnsafeMutablePointer<Double>,
                             _ vel: UnsafeMutablePointer<Double>,
                             _ covMtxUVW: UnsafeMutablePointer<(Double, Double, Double, Double, Double, Double)>,
                             _ covMtxEqnx: UnsafeMutablePointer<(Double, Double, Double, Double, Double, Double)> ) {

    let _covMtxUVW = UnsafeMutableRawPointer(covMtxUVW).bindMemory(to: Double.self, capacity: 36)
    let _covMtxEqnx = UnsafeMutableRawPointer(covMtxEqnx).bindMemory(to: Double.self, capacity: 36)

    typealias functionSignature = @convention(c) ( UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeBitCast(getFunctionPointer(libHandle, "CovMtxUVWToEqnx"), to: functionSignature.self)

    function(pos, vel, _covMtxUVW, _covMtxEqnx)
}

public func CovMtxECIToUVW( _ pos: UnsafeMutablePointer<Double>,
                            _ vel: UnsafeMutablePointer<Double>,
                            _ covMtxECI: UnsafeMutablePointer<(Double, Double, Double, Double, Double, Double)>,
                            _ covMtxUVW: UnsafeMutablePointer<(Double, Double, Double, Double, Double, Double)> ) {

    let _covMtxECI = UnsafeMutableRawPointer(covMtxECI).bindMemory(to: Double.self, capacity: 36)
    let _covMtxUVW = UnsafeMutableRawPointer(covMtxUVW).bindMemory(to: Double.self, capacity: 36)

    typealias functionSignature = @convention(c) ( UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeBitCast(getFunctionPointer(libHandle, "CovMtxECIToUVW"), to: functionSignature.self)

    function(pos, vel, _covMtxECI, _covMtxUVW)
}

public func CovMtxUVWToECI( _ pos: UnsafeMutablePointer<Double>,
                            _ vel: UnsafeMutablePointer<Double>,
                            _ covMtxUVW: UnsafeMutablePointer<(Double, Double, Double, Double, Double, Double)>,
                            _ covMtxECI: UnsafeMutablePointer<(Double, Double, Double, Double, Double, Double)> ) {

    let _covMtxUVW = UnsafeMutableRawPointer(covMtxUVW).bindMemory(to: Double.self, capacity: 36)
    let _covMtxECI = UnsafeMutableRawPointer(covMtxECI).bindMemory(to: Double.self, capacity: 36)

    typealias functionSignature = @convention(c) ( UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeBitCast(getFunctionPointer(libHandle, "CovMtxUVWToECI"), to: functionSignature.self)

    function(pos, vel, _covMtxUVW, _covMtxECI)
}

public func Mtx6x6ToLTA21( _ symMtx6x6: UnsafeMutablePointer<(Double, Double, Double, Double, Double, Double)>, _ lta21: UnsafeMutablePointer<Double> ) {

    let _symMtx6x6 = UnsafeMutableRawPointer(symMtx6x6).bindMemory(to: Double.self, capacity: 36)

    typealias functionSignature = @convention(c) ( UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeBitCast(getFunctionPointer(libHandle, "Mtx6x6ToLTA21"), to: functionSignature.self)

    function(_symMtx6x6, lta21)
}

public func LTA21ToMtx6x6( _ lta21: UnsafeMutablePointer<Double>, _ symMtx6x6: UnsafeMutablePointer<(Double, Double, Double, Double, Double, Double)> ) {

    let _symMtx6x6 = UnsafeMutableRawPointer(symMtx6x6).bindMemory(to: Double.self, capacity: 36)

    typealias functionSignature = @convention(c) ( UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeBitCast(getFunctionPointer(libHandle, "LTA21ToMtx6x6"), to: functionSignature.self)

    function(lta21, _symMtx6x6)
}
// ========================= End of auto generated code ==========================
