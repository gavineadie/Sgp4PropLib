// This wrapper file was generated automatically by the GenDllWrappers program.
import Foundation

#if os(Linux)
fileprivate let libHandle = loadDll("libastrofunc.so")
#elseif os(Windows)
fileprivate let libHandle = loadDll("AstroFunc.dll")
#else
fileprivate let libHandle = loadDll("libastrofunc.dylib")
#endif

// Notes: This function has been deprecated since v9.0. 
// Initializes AstroFunc DLL for use in the program.
// If this function returns an error, it is recommended that you stop the program immediately.
// 
// An error will occur if you forget to load and initialize all the prerequisite DLLs, as listed in the DLL Prerequisites section of the accompanying documentation, before using this DLL.
public func AstroFuncInit( _ apAddr: Int64 ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64 ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "AstroFuncInit"), to: FunctionSignature.self)

    return function(apAddr)
}

// Retrieves information about the current version of AstroFunc.dll. The information is placed in the string parameter you pass in.
// The returned string provides information about the version number, build date, and platform.
public func AstroFuncGetInfo( _ infoStr: UnsafeMutablePointer<CChar> ) {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "AstroFuncGetInfo"), to: FunctionSignature.self)

    function(infoStr)
}

// Converts a set of Keplerian elements to a set of equinoctial elements. 
public func KepToEqnx( _ xa_kep: UnsafeMutablePointer<Double>, _ xa_eqnx: UnsafeMutablePointer<Double> ) {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "KepToEqnx"), to: FunctionSignature.self)

    function(xa_kep, xa_eqnx)
}

// Converts a set of osculating Keplerian elements to osculating position and velocity vectors.
public func KepToPosVel( _ xa_kep: UnsafeMutablePointer<Double>,
                         _ pos: UnsafeMutablePointer<Double>,
                         _ vel: UnsafeMutablePointer<Double> ) {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "KepToPosVel"), to: FunctionSignature.self)

    function(xa_kep, pos, vel)
}

// Converts a set of Keplerian elements to Ubar, Vbar, and Wbar vectors.
public func KepToUVW( _ xa_kep: UnsafeMutablePointer<Double>,
                      _ uBar: UnsafeMutablePointer<Double>,
                      _ vBar: UnsafeMutablePointer<Double>,
                      _ wBar: UnsafeMutablePointer<Double> ) {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "KepToUVW"), to: FunctionSignature.self)

    function(xa_kep, uBar, vBar, wBar)
}

// Converts a set of classical elements to a set of equinoctial elements. 
public func ClassToEqnx( _ xa_cls: UnsafeMutablePointer<Double>, _ xa_eqnx: UnsafeMutablePointer<Double> ) {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "ClassToEqnx"), to: FunctionSignature.self)

    function(xa_cls, xa_eqnx)
}

// Converts a set of equinoctial elements to a set of classical elements.
public func EqnxToClass( _ xa_eqnx: UnsafeMutablePointer<Double>, _ xa_cls: UnsafeMutablePointer<Double> ) {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "EqnxToClass"), to: FunctionSignature.self)

    function(xa_eqnx, xa_cls)
}

// Converts a set of equinoctial elements to a set of Keplerian elements. 
public func EqnxToKep( _ xa_eqnx: UnsafeMutablePointer<Double>, _ xa_kep: UnsafeMutablePointer<Double> ) {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "EqnxToKep"), to: FunctionSignature.self)

    function(xa_eqnx, xa_kep)
}

// Converts a set of equinoctial elements to position and velocity vectors.
public func EqnxToPosVel( _ xa_eqnx: UnsafeMutablePointer<Double>,
                          _ pos: UnsafeMutablePointer<Double>,
                          _ vel: UnsafeMutablePointer<Double> ) {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "EqnxToPosVel"), to: FunctionSignature.self)

    function(xa_eqnx, pos, vel)
}

// Converts position and velocity vectors to a set of equinoctial elements.
public func PosVelToEqnx( _ pos: UnsafeMutablePointer<Double>,
                          _ vel: UnsafeMutablePointer<Double>,
                          _ xa_eqnx: UnsafeMutablePointer<Double> ) {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "PosVelToEqnx"), to: FunctionSignature.self)

    function(pos, vel, xa_eqnx)
}

// Converts position and velocity vectors to a set of equinoctial elements with the given mu value. 
// This function is used when working with the SP propagator to get a more accurate set of equinoctial elements.
public func PosVelMuToEqnx( _ pos: UnsafeMutablePointer<Double>,
                            _ vel: UnsafeMutablePointer<Double>,
                            _ mu: Double,
                            _ xa_eqnx: UnsafeMutablePointer<Double> ) {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   Double,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "PosVelMuToEqnx"), to: FunctionSignature.self)

    function(pos, vel, mu, xa_eqnx)
}

// Converts osculating position and velocity vectors to a set of osculating Keplerian elements.
public func PosVelToKep( _ pos: UnsafeMutablePointer<Double>,
                         _ vel: UnsafeMutablePointer<Double>,
                         _ xa_kep: UnsafeMutablePointer<Double> ) {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "PosVelToKep"), to: FunctionSignature.self)

    function(pos, vel, xa_kep)
}

// Converts osculating position and velocity vectors to a set of osculating Keplerian elements with the given value of mu.
// This function is used when working with the SP propagator to get a more accurate set of Keplerian elements.
public func PosVelMuToKep( _ pos: UnsafeMutablePointer<Double>,
                           _ vel: UnsafeMutablePointer<Double>,
                           _ mu: Double,
                           _ xa_kep: UnsafeMutablePointer<Double> ) {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   Double,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "PosVelMuToKep"), to: FunctionSignature.self)

    function(pos, vel, mu, xa_kep)
}

// Converts position and velocity vectors to U, V, W vectors. See the remarks section for details.
// The resulting vectors have the following meanings.
// U vector: along radial direction
// V vector: W x U
// W vector: pos x vel
public func PosVelToUUVW( _ pos: UnsafeMutablePointer<Double>,
                          _ vel: UnsafeMutablePointer<Double>,
                          _ uvec: UnsafeMutablePointer<Double>,
                          _ vVec: UnsafeMutablePointer<Double>,
                          _ wVec: UnsafeMutablePointer<Double> ) {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "PosVelToUUVW"), to: FunctionSignature.self)

    function(pos, vel, uvec, vVec, wVec)
}

// Converts position and velocity vectors to U, V, W vectors. See the remarks section for details.
// The resulting vectors have the following meanings.
// U vector: V x W
// V vector: along velocity direction
// W vector: pos x vel
public func PosVelToPTW( _ pos: UnsafeMutablePointer<Double>,
                         _ vel: UnsafeMutablePointer<Double>,
                         _ uvec: UnsafeMutablePointer<Double>,
                         _ vVec: UnsafeMutablePointer<Double>,
                         _ wVec: UnsafeMutablePointer<Double> ) {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "PosVelToPTW"), to: FunctionSignature.self)

    function(pos, vel, uvec, vVec, wVec)
}

// Solves Kepler's equation (M = E - e sin(E)) for the eccentric anomaly, E, by iteration.
public func SolveKepEqtn( _ xa_kep: UnsafeMutablePointer<Double> ) -> Double {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<Double> ) -> Double

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "SolveKepEqtn"), to: FunctionSignature.self)

    return function(xa_kep)
}

// Computes true anomaly from a set of Keplerian elements.
public func CompTrueAnomaly( _ xa_kep: UnsafeMutablePointer<Double> ) -> Double {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<Double> ) -> Double

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "CompTrueAnomaly"), to: FunctionSignature.self)

    return function(xa_kep)
}

// Converts mean motion N to semi-major axis A.
public func NToA( _ n: Double ) -> Double {

    typealias FunctionSignature = @convention(c) ( Double ) -> Double

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "NToA"), to: FunctionSignature.self)

    return function(n)
}

// Converts semi-major axis A to mean motion N.
public func AToN( _ a: Double ) -> Double {

    typealias FunctionSignature = @convention(c) ( Double ) -> Double

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "AToN"), to: FunctionSignature.self)

    return function(a)
}

// Converts Kozai mean motion to Brouwer mean motion.
// SGP TLE's use Kozai mean motion while SGP4/SGP4-XP TLE's use Brouwer mean motion.
public func KozaiToBrouwer( _ eccen: Double,
                            _ incli: Double,
                            _ nKozai: Double ) -> Double {

    typealias FunctionSignature = @convention(c) ( Double,
                                                   Double,
                                                   Double ) -> Double

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "KozaiToBrouwer"), to: FunctionSignature.self)

    return function(eccen, incli, nKozai)
}

// Converts Brouwer mean motion to Kozai mean motion.
// SGP TLE's use Kozai mean motion while SGP4/SGP4-XP TLE's use Brouwer mean motion.
public func BrouwerToKozai( _ eccen: Double,
                            _ incli: Double,
                            _ nBrouwer: Double ) -> Double {

    typealias FunctionSignature = @convention(c) ( Double,
                                                   Double,
                                                   Double ) -> Double

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "BrouwerToKozai"), to: FunctionSignature.self)

    return function(eccen, incli, nBrouwer)
}

// Converts a set of osculating Keplerian elements to a set of mean Keplerian elements using method 9 algorithm.
public func KepOscToMean( _ xa_OscKep: UnsafeMutablePointer<Double>, _ xa_MeanKep: UnsafeMutablePointer<Double> ) {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "KepOscToMean"), to: FunctionSignature.self)

    function(xa_OscKep, xa_MeanKep)
}

// Converts an ECI position vector XYZ to geodetic latitude, longitude, and height.
public func XYZToLLH( _ thetaG: Double,
                      _ metricPos: UnsafeMutablePointer<Double>,
                      _ metricLLH: UnsafeMutablePointer<Double> ) {

    typealias FunctionSignature = @convention(c) ( Double,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "XYZToLLH"), to: FunctionSignature.self)

    function(thetaG, metricPos, metricLLH)
}

// Converts an ECI position vector XYZ to geodetic latitude, longitude, and height at the specified time.
public func XYZToLLHTime( _ ds50UTC: Double,
                          _ metricPos: UnsafeMutablePointer<Double>,
                          _ metricLLH: UnsafeMutablePointer<Double> ) {

    typealias FunctionSignature = @convention(c) ( Double,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "XYZToLLHTime"), to: FunctionSignature.self)

    function(ds50UTC, metricPos, metricLLH)
}

// Converts geodetic latitude, longitude, and height to an ECI position vector XYZ.
public func LLHToXYZ( _ thetaG: Double,
                      _ metricLLH: UnsafeMutablePointer<Double>,
                      _ metricXYZ: UnsafeMutablePointer<Double> ) {

    typealias FunctionSignature = @convention(c) ( Double,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "LLHToXYZ"), to: FunctionSignature.self)

    function(thetaG, metricLLH, metricXYZ)
}

// Converts geodetic latitude, longitude, and height to an ECI position vector XYZ at the specified time.
public func LLHToXYZTime( _ ds50UTC: Double,
                          _ metricLLH: UnsafeMutablePointer<Double>,
                          _ metricXYZ: UnsafeMutablePointer<Double> ) {

    typealias FunctionSignature = @convention(c) ( Double,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "LLHToXYZTime"), to: FunctionSignature.self)

    function(ds50UTC, metricLLH, metricXYZ)
}

// Converts EFG position and velocity vectors to ECI position and velocity vectors.
public func EFGToECI( _ thetaG: Double,
                      _ posEFG: UnsafeMutablePointer<Double>,
                      _ velEFG: UnsafeMutablePointer<Double>,
                      _ posECI: UnsafeMutablePointer<Double>,
                      _ velECI: UnsafeMutablePointer<Double> ) {

    typealias FunctionSignature = @convention(c) ( Double,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "EFGToECI"), to: FunctionSignature.self)

    function(thetaG, posEFG, velEFG, posECI, velECI)
}

// Converts EFG position and velocity vectors to ECI position and velocity vectors at the specified time.
public func EFGToECITime( _ ds50UTC: Double,
                          _ posEFG: UnsafeMutablePointer<Double>,
                          _ velEFG: UnsafeMutablePointer<Double>,
                          _ posECI: UnsafeMutablePointer<Double>,
                          _ velECI: UnsafeMutablePointer<Double> ) {

    typealias FunctionSignature = @convention(c) ( Double,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "EFGToECITime"), to: FunctionSignature.self)

    function(ds50UTC, posEFG, velEFG, posECI, velECI)
}

// Converts ECI position and velocity vectors to EFG position and velocity vectors.
public func ECIToEFG( _ thetaG: Double,
                      _ posECI: UnsafeMutablePointer<Double>,
                      _ velECI: UnsafeMutablePointer<Double>,
                      _ posEFG: UnsafeMutablePointer<Double>,
                      _ velEFG: UnsafeMutablePointer<Double> ) {

    typealias FunctionSignature = @convention(c) ( Double,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "ECIToEFG"), to: FunctionSignature.self)

    function(thetaG, posECI, velECI, posEFG, velEFG)
}

// Converts ECI position and velocity vectors to EFG position and velocity vectors at the specified time.
public func ECIToEFGTime( _ ds50UTC: Double,
                          _ posECI: UnsafeMutablePointer<Double>,
                          _ velECI: UnsafeMutablePointer<Double>,
                          _ posEFG: UnsafeMutablePointer<Double>,
                          _ velEFG: UnsafeMutablePointer<Double> ) {

    typealias FunctionSignature = @convention(c) ( Double,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "ECIToEFGTime"), to: FunctionSignature.self)

    function(ds50UTC, posECI, velECI, posEFG, velEFG)
}

// Converts ECR position and velocity vectors to EFG position and velocity vectors.
public func ECRToEFG( _ polarX: Double,
                      _ polarY: Double,
                      _ posECR: UnsafeMutablePointer<Double>,
                      _ velECR: UnsafeMutablePointer<Double>,
                      _ posEFG: UnsafeMutablePointer<Double>,
                      _ velEFG: UnsafeMutablePointer<Double> ) {

    typealias FunctionSignature = @convention(c) ( Double,
                                                   Double,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "ECRToEFG"), to: FunctionSignature.self)

    function(polarX, polarY, posECR, velECR, posEFG, velEFG)
}

// Converts ECR position and velocity vectors to EFG position and velocity vectors at the specified time.
public func ECRToEFGTime( _ ds50UTC: Double,
                          _ posECR: UnsafeMutablePointer<Double>,
                          _ velECR: UnsafeMutablePointer<Double>,
                          _ posEFG: UnsafeMutablePointer<Double>,
                          _ velEFG: UnsafeMutablePointer<Double> ) {

    typealias FunctionSignature = @convention(c) ( Double,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "ECRToEFGTime"), to: FunctionSignature.self)

    function(ds50UTC, posECR, velECR, posEFG, velEFG)
}

// Converts EFG position and velocity vectors to ECR position and velocity vectors.
public func EFGToECR( _ polarX: Double,
                      _ polarY: Double,
                      _ posEFG: UnsafeMutablePointer<Double>,
                      _ velEFG: UnsafeMutablePointer<Double>,
                      _ posECR: UnsafeMutablePointer<Double>,
                      _ velECR: UnsafeMutablePointer<Double> ) {

    typealias FunctionSignature = @convention(c) ( Double,
                                                   Double,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "EFGToECR"), to: FunctionSignature.self)

    function(polarX, polarY, posEFG, velEFG, posECR, velECR)
}

// Converts EFG position and velocity vectors to ECR position and velocity vectors at the specified time.
public func EFGToECRTime( _ ds50UTC: Double,
                          _ posEFG: UnsafeMutablePointer<Double>,
                          _ velEFG: UnsafeMutablePointer<Double>,
                          _ posECR: UnsafeMutablePointer<Double>,
                          _ velECR: UnsafeMutablePointer<Double> ) {

    typealias FunctionSignature = @convention(c) ( Double,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "EFGToECRTime"), to: FunctionSignature.self)

    function(ds50UTC, posEFG, velEFG, posECR, velECR)
}

// Converts an EFG position vector to geodetic latitude, longitude, and height.
public func EFGPosToLLH( _ posEFG: UnsafeMutablePointer<Double>, _ metricLLH: UnsafeMutablePointer<Double> ) {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "EFGPosToLLH"), to: FunctionSignature.self)

    function(posEFG, metricLLH)
}

// Converts geodetic latitude, longitude, and height to an EFG position vector.
public func LLHToEFGPos( _ metricLLH: UnsafeMutablePointer<Double>, _ posEFG: UnsafeMutablePointer<Double> ) {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "LLHToEFGPos"), to: FunctionSignature.self)

    function(metricLLH, posEFG)
}

// Rotates position and velocity vectors from J2000 to coordinates of the specified date, expressed in ds50TAI.
public func RotJ2KToDate( _ spectr: Int32,
                          _ nutationTerms: Int32,
                          _ ds50TAI: Double,
                          _ posJ2K: UnsafeMutablePointer<Double>,
                          _ velJ2K: UnsafeMutablePointer<Double>,
                          _ posDate: UnsafeMutablePointer<Double>,
                          _ velDate: UnsafeMutablePointer<Double> ) {

    typealias FunctionSignature = @convention(c) ( Int32,
                                                   Int32,
                                                   Double,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "RotJ2KToDate"), to: FunctionSignature.self)

    function(spectr, nutationTerms, ds50TAI, posJ2K, velJ2K, posDate, velDate)
}

// Rotates position and velocity vectors from coordinates of date to J2000.
public func RotDateToJ2K( _ spectr: Int32,
                          _ nutationTerms: Int32,
                          _ ds50TAI: Double,
                          _ posDate: UnsafeMutablePointer<Double>,
                          _ velDate: UnsafeMutablePointer<Double>,
                          _ posJ2K: UnsafeMutablePointer<Double>,
                          _ velJ2K: UnsafeMutablePointer<Double> ) {

    typealias FunctionSignature = @convention(c) ( Int32,
                                                   Int32,
                                                   Double,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "RotDateToJ2K"), to: FunctionSignature.self)

    function(spectr, nutationTerms, ds50TAI, posDate, velDate, posJ2K, velJ2K)
}

// Computes the Sun and Moon position at the specified time.
public func CompSunMoonPos( _ ds50ET: Double,
                            _ uvecSun: UnsafeMutablePointer<Double>,
                            _ sunVecMag: UnsafeMutablePointer<Double>,
                            _ uvecMoon: UnsafeMutablePointer<Double>,
                            _ moonVecMag: UnsafeMutablePointer<Double> ) {

    typealias FunctionSignature = @convention(c) ( Double,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "CompSunMoonPos"), to: FunctionSignature.self)

    function(ds50ET, uvecSun, sunVecMag, uvecMoon, moonVecMag)
}

// Computes the Sun position at the specified time.
public func CompSunPos( _ ds50ET: Double,
                        _ uvecSun: UnsafeMutablePointer<Double>,
                        _ sunVecMag: UnsafeMutablePointer<Double> ) {

    typealias FunctionSignature = @convention(c) ( Double,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "CompSunPos"), to: FunctionSignature.self)

    function(ds50ET, uvecSun, sunVecMag)
}

// Computes the Moon position at the specified time.
public func CompMoonPos( _ ds50ET: Double,
                         _ uvecMoon: UnsafeMutablePointer<Double>,
                         _ moonVecMag: UnsafeMutablePointer<Double> ) {

    typealias FunctionSignature = @convention(c) ( Double,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "CompMoonPos"), to: FunctionSignature.self)

    function(ds50ET, uvecMoon, moonVecMag)
}

// This function is intended for future use.  No information is currently available.
public func AstroConvFrTo( _ xf_Conv: Int32,
                           _ frArr: UnsafeMutablePointer<Double>,
                           _ toArr: UnsafeMutablePointer<Double> ) {

    typealias FunctionSignature = @convention(c) ( Int32,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "AstroConvFrTo"), to: FunctionSignature.self)

    function(xf_Conv, frArr, toArr)
}

// Converts right ascension and declination to vector triad LAD in topocentric equatorial coordinate system.
public func RADecToLAD( _ ra: Double,
                        _ dec: Double,
                        _ l: UnsafeMutablePointer<Double>,
                        _ a_tilde: UnsafeMutablePointer<Double>,
                        _ d_tilde: UnsafeMutablePointer<Double> ) {

    typealias FunctionSignature = @convention(c) ( Double,
                                                   Double,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "RADecToLAD"), to: FunctionSignature.self)

    function(ra, dec, l, a_tilde, d_tilde)
}

// Converts azimuth and elevation to vector triad LAD in topocentric horizontal coordinate system.
public func AzElToLAD( _ az: Double,
                       _ el: Double,
                       _ lh: UnsafeMutablePointer<Double>,
                       _ ah: UnsafeMutablePointer<Double>,
                       _ dh: UnsafeMutablePointer<Double> ) {

    typealias FunctionSignature = @convention(c) ( Double,
                                                   Double,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "AzElToLAD"), to: FunctionSignature.self)

    function(az, el, lh, ah, dh)
}

// Converts satellite ECI position/velocity vectors and sensor location to topocentric components.
// The xa_topo array has the following structure:
// [0]: Resulting right ascension (RA) (deg)
// [1]: Declination (deg)
// [2]: Azimuth (deg)
// [3]: Elevation (deg)
// [4]: Range (km)
// [5]: RAdot (first derivative of right ascension) (deg/s)
// [6]: DecDot (first derivative of declination) (deg/s)
// [7]: AzDot (first derivative of azimuth) (deg/s)
// [8]: ElDot (first derivative of elevation) (deg/s)
// [9]: RangeDot (first derivative of range) (km/s)   
public func ECIToTopoComps( _ theta: Double,
                            _ lat: Double,
                            _ senPos: UnsafeMutablePointer<Double>,
                            _ satPos: UnsafeMutablePointer<Double>,
                            _ satVel: UnsafeMutablePointer<Double>,
                            _ xa_topo: UnsafeMutablePointer<Double> ) {

    typealias FunctionSignature = @convention(c) ( Double,
                                                   Double,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "ECIToTopoComps"), to: FunctionSignature.self)

    function(theta, lat, senPos, satPos, satVel, xa_topo)
}

// Converts right ascension and declination in the topocentric reference frame to Azimuth/Elevation in the local horizon reference frame.
public func RaDecToAzEl( _ thetaG: Double,
                         _ lat: Double,
                         _ lon: Double,
                         _ ra: Double,
                         _ dec: Double,
                         _ az: UnsafeMutablePointer<Double>,
                         _ el: UnsafeMutablePointer<Double> ) {

    typealias FunctionSignature = @convention(c) ( Double,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "RaDecToAzEl"), to: FunctionSignature.self)

    function(thetaG, lat, lon, ra, dec, az, el)
}

// Converts right ascension and declination in the topocentric reference frame to Azimuth/Elevation in the local horizon reference frame.
public func RaDecToAzElTime( _ ds50UTC: Double,
                             _ lat: Double,
                             _ lon: Double,
                             _ ra: Double,
                             _ dec: Double,
                             _ az: UnsafeMutablePointer<Double>,
                             _ el: UnsafeMutablePointer<Double> ) {

    typealias FunctionSignature = @convention(c) ( Double,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "RaDecToAzElTime"), to: FunctionSignature.self)

    function(ds50UTC, lat, lon, ra, dec, az, el)
}

// Converts Azimuth/Elevation in the local horizon reference frame to Right ascension/Declination in the topocentric reference frame
public func AzElToRaDec( _ thetaG: Double,
                         _ lat: Double,
                         _ lon: Double,
                         _ az: Double,
                         _ el: Double,
                         _ ra: UnsafeMutablePointer<Double>,
                         _ dec: UnsafeMutablePointer<Double> ) {

    typealias FunctionSignature = @convention(c) ( Double,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "AzElToRaDec"), to: FunctionSignature.self)

    function(thetaG, lat, lon, az, el, ra, dec)
}

// Converts Azimuth/Elevation in the local horizon reference frame to Right ascension/Declination in the topocentric reference frame
public func AzElToRaDecTime( _ ds50UTC: Double,
                             _ lat: Double,
                             _ lon: Double,
                             _ az: Double,
                             _ el: Double,
                             _ ra: UnsafeMutablePointer<Double>,
                             _ dec: UnsafeMutablePointer<Double> ) {

    typealias FunctionSignature = @convention(c) ( Double,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "AzElToRaDecTime"), to: FunctionSignature.self)

    function(ds50UTC, lat, lon, az, el, ra, dec)
}

// Converts full state RAE (range, az, el, and their rates) to full state ECI (position and velocity)
// The xa_rae array has the following structure:
// [0]: Range (km)
// [1]: Azimuth (deg)
// [2]: Elevation (deg)
// [3]: Range Dot (km/s)
// [4]: Azimuth Dot (deg/s)
// [5]: Elevation Dot (deg/s)
public func RAEToECI( _ theta: Double,
                      _ astroLat: Double,
                      _ xa_rae: UnsafeMutablePointer<Double>,
                      _ senPos: UnsafeMutablePointer<Double>,
                      _ satPos: UnsafeMutablePointer<Double>,
                      _ satVel: UnsafeMutablePointer<Double> ) {

    typealias FunctionSignature = @convention(c) ( Double,
                                                   Double,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "RAEToECI"), to: FunctionSignature.self)

    function(theta, astroLat, xa_rae, senPos, satPos, satVel)
}

// Computes initial values for the SGP drag term nDot and the SGP4 drag term BSTAR based upon eccentricity and semi-major axis.
public func GetInitialDrag( _ semiMajorAxis: Double,
                            _ eccen: Double,
                            _ nDot: UnsafeMutablePointer<Double>,
                            _ bstar: UnsafeMutablePointer<Double> ) {

    typealias FunctionSignature = @convention(c) ( Double,
                                                   Double,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "GetInitialDrag"), to: FunctionSignature.self)

    function(semiMajorAxis, eccen, nDot, bstar)
}

// Converts covariance matrix PTW to UVW.
// PTW = P: TxW, T: along velocity direction, W: pos x vel.
// UVW = U: radial direction, V: in plane, perpendicular to U, W: pos x vel.
public func CovMtxPTWToUVW( _ pos: UnsafeMutablePointer<Double>,
                            _ vel: UnsafeMutablePointer<Double>,
                            _ ptwCovMtx: UnsafeMutablePointer<(Double, Double, Double, Double, Double, Double)>,
                            _ uvwCovMtx: UnsafeMutablePointer<(Double, Double, Double, Double, Double, Double)> ) {

    let _ptwCovMtx = UnsafeMutableRawPointer(ptwCovMtx).bindMemory(to: Double.self, capacity: 36)
    let _uvwCovMtx = UnsafeMutableRawPointer(uvwCovMtx).bindMemory(to: Double.self, capacity: 36)

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "CovMtxPTWToUVW"), to: FunctionSignature.self)

    function(pos, vel, _ptwCovMtx, _uvwCovMtx)
}

// Converts covariance matrix UVW to PTW.
// PTW = P: TxW, T: along velocity direction, W: pos x vel.
// UVW = U: radial direction, V: in plane, perpendicular to U, W: pos x vel.
public func CovMtxUVWToPTW( _ pos: UnsafeMutablePointer<Double>,
                            _ vel: UnsafeMutablePointer<Double>,
                            _ uvwCovMtx: UnsafeMutablePointer<(Double, Double, Double, Double, Double, Double)>,
                            _ ptwCovMtx: UnsafeMutablePointer<(Double, Double, Double, Double, Double, Double)> ) {

    let _uvwCovMtx = UnsafeMutableRawPointer(uvwCovMtx).bindMemory(to: Double.self, capacity: 36)
    let _ptwCovMtx = UnsafeMutableRawPointer(ptwCovMtx).bindMemory(to: Double.self, capacity: 36)

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "CovMtxUVWToPTW"), to: FunctionSignature.self)

    function(pos, vel, _uvwCovMtx, _ptwCovMtx)
}

// Computes Earth/Sensor/Earth Limb and Earth/Sensor/Satellite angles.
public func EarthObstructionAngles( _ earthLimb: Double,
                                    _ satECI: UnsafeMutablePointer<Double>,
                                    _ senECI: UnsafeMutablePointer<Double>,
                                    _ earthSenLimb: UnsafeMutablePointer<Double>,
                                    _ earthSenSat: UnsafeMutablePointer<Double>,
                                    _ satEarthSen: UnsafeMutablePointer<Double> ) {

    typealias FunctionSignature = @convention(c) ( Double,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "EarthObstructionAngles"), to: FunctionSignature.self)

    function(earthLimb, satECI, senECI, earthSenLimb, earthSenSat, satEarthSen)
}

// Determines if a point in space is sunlit at the input time ds50ET
public func IsPointSunlit( _ ds50ET: Double, _ ptEci: UnsafeMutablePointer<Double> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Double,
                                                   UnsafeMutablePointer<Double> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "IsPointSunlit"), to: FunctionSignature.self)

    return function(ds50ET, ptEci)
}

// Rotates Right Ascension and Declination to specified epoch
public func RotRADecl( _ nutationTerms: Int32,
                       _ dir: Int32,
                       _ ds50UTCIn: Double,
                       _ raIn: Double,
                       _ declIn: Double,
                       _ ds50UTCOut: Double,
                       _ raOut: UnsafeMutablePointer<Double>,
                       _ declOut: UnsafeMutablePointer<Double> ) {

    typealias FunctionSignature = @convention(c) ( Int32,
                                                   Int32,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "RotRADecl"), to: FunctionSignature.self)

    function(nutationTerms, dir, ds50UTCIn, raIn, declIn, ds50UTCOut, raOut, declOut)
}

// Rotates Right Ascension and Declination from TEME of Date to MEME of the specified year of equinox
public func RotRADec_DateToEqnx( _ nutationTerms: Int32,
                                 _ yrOfEqnx: Int32,
                                 _ ds50UTCIn: Double,
                                 _ raIn: Double,
                                 _ declIn: Double,
                                 _ raOut: UnsafeMutablePointer<Double>,
                                 _ declOut: UnsafeMutablePointer<Double> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int32,
                                                   Int32,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "RotRADec_DateToEqnx"), to: FunctionSignature.self)

    return function(nutationTerms, yrOfEqnx, ds50UTCIn, raIn, declIn, raOut, declOut)
}

// Rotates Right Ascension and Declination from MEME of the specified year of equinox to TEME of Date
public func RotRADec_EqnxToDate( _ nutationTerms: Int32,
                                 _ yrOfEqnx: Int32,
                                 _ ds50UTCIn: Double,
                                 _ raIn: Double,
                                 _ declIn: Double,
                                 _ raOut: UnsafeMutablePointer<Double>,
                                 _ declOut: UnsafeMutablePointer<Double> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int32,
                                                   Int32,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "RotRADec_EqnxToDate"), to: FunctionSignature.self)

    return function(nutationTerms, yrOfEqnx, ds50UTCIn, raIn, declIn, raOut, declOut)
}

// Rotates the Equinoctial covariance to UVW
// Note: This method uses the global Earth constants so make sure that you select the right Earth model by calling the EnvConst/EnvSetGeoIdx method
// The n terms must be normalized by n
// The input position, velocity and covariance must all have the same reference equator and equinox.
public func CovMtxEqnxToUVW( _ pos: UnsafeMutablePointer<Double>,
                             _ vel: UnsafeMutablePointer<Double>,
                             _ covMtxEqnx: UnsafeMutablePointer<(Double, Double, Double, Double, Double, Double)>,
                             _ covMtxUVW: UnsafeMutablePointer<(Double, Double, Double, Double, Double, Double)> ) {

    let _covMtxEqnx = UnsafeMutableRawPointer(covMtxEqnx).bindMemory(to: Double.self, capacity: 36)
    let _covMtxUVW = UnsafeMutableRawPointer(covMtxUVW).bindMemory(to: Double.self, capacity: 36)

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "CovMtxEqnxToUVW"), to: FunctionSignature.self)

    function(pos, vel, _covMtxEqnx, _covMtxUVW)
}

// Rotates the UVW covariance to Equinoctial
// Note: This method uses the global Earth constants so make sure that you select the right Earth model by calling the EnvConst/EnvSetGeoIdx method
// The n terms are normalized by n
// The input position, velocity reference equator and equinox determine the output covariance reference frame.
public func CovMtxUVWToEqnx( _ pos: UnsafeMutablePointer<Double>,
                             _ vel: UnsafeMutablePointer<Double>,
                             _ covMtxUVW: UnsafeMutablePointer<(Double, Double, Double, Double, Double, Double)>,
                             _ covMtxEqnx: UnsafeMutablePointer<(Double, Double, Double, Double, Double, Double)> ) {

    let _covMtxUVW = UnsafeMutableRawPointer(covMtxUVW).bindMemory(to: Double.self, capacity: 36)
    let _covMtxEqnx = UnsafeMutableRawPointer(covMtxEqnx).bindMemory(to: Double.self, capacity: 36)

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "CovMtxUVWToEqnx"), to: FunctionSignature.self)

    function(pos, vel, _covMtxUVW, _covMtxEqnx)
}

// Rotates the ECI covariance to UVW
// Note: This method uses the global Earth constants so make sure that you select the proper Earth model by calling the EnvConst/EnvSetGeoIdx method
public func CovMtxECIToUVW( _ pos: UnsafeMutablePointer<Double>,
                            _ vel: UnsafeMutablePointer<Double>,
                            _ covMtxECI: UnsafeMutablePointer<(Double, Double, Double, Double, Double, Double)>,
                            _ covMtxUVW: UnsafeMutablePointer<(Double, Double, Double, Double, Double, Double)> ) {

    let _covMtxECI = UnsafeMutableRawPointer(covMtxECI).bindMemory(to: Double.self, capacity: 36)
    let _covMtxUVW = UnsafeMutableRawPointer(covMtxUVW).bindMemory(to: Double.self, capacity: 36)

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "CovMtxECIToUVW"), to: FunctionSignature.self)

    function(pos, vel, _covMtxECI, _covMtxUVW)
}

// Rotates the UVW covariance to ECI
// Note: This method uses the global Earth constants so make sure that you select the proper Earth model by calling the EnvConst/EnvSetGeoIdx method
public func CovMtxUVWToECI( _ pos: UnsafeMutablePointer<Double>,
                            _ vel: UnsafeMutablePointer<Double>,
                            _ covMtxUVW: UnsafeMutablePointer<(Double, Double, Double, Double, Double, Double)>,
                            _ covMtxECI: UnsafeMutablePointer<(Double, Double, Double, Double, Double, Double)> ) {

    let _covMtxUVW = UnsafeMutableRawPointer(covMtxUVW).bindMemory(to: Double.self, capacity: 36)
    let _covMtxECI = UnsafeMutableRawPointer(covMtxECI).bindMemory(to: Double.self, capacity: 36)

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "CovMtxUVWToECI"), to: FunctionSignature.self)

    function(pos, vel, _covMtxUVW, _covMtxECI)
}

// Converts covariance matrix ECI to EFG.
// EFG = Earth Fixed Greenwich
// ECI = Earth Centered Inertial - need to determine TEME or J2K
public func CovMtxECIToEFG( _ thetaG: Double,
                            _ covECI: UnsafeMutablePointer<(Double, Double, Double, Double, Double, Double)>,
                            _ covEFG: UnsafeMutablePointer<(Double, Double, Double, Double, Double, Double)> ) {

    let _covECI = UnsafeMutableRawPointer(covECI).bindMemory(to: Double.self, capacity: 36)
    let _covEFG = UnsafeMutableRawPointer(covEFG).bindMemory(to: Double.self, capacity: 36)

    typealias FunctionSignature = @convention(c) ( Double,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "CovMtxECIToEFG"), to: FunctionSignature.self)

    function(thetaG, _covECI, _covEFG)
}

// Converts covariance matrix EFG to ECI.
// EFG = Earth Fixed Greenwich
// ECI = Earth Centered Inertial - need to determine TEME or J2K
public func CovMtxEFGToECI( _ thetaG: Double,
                            _ covEFG: UnsafeMutablePointer<(Double, Double, Double, Double, Double, Double)>,
                            _ covECI: UnsafeMutablePointer<(Double, Double, Double, Double, Double, Double)> ) {

    let _covEFG = UnsafeMutableRawPointer(covEFG).bindMemory(to: Double.self, capacity: 36)
    let _covECI = UnsafeMutableRawPointer(covECI).bindMemory(to: Double.self, capacity: 36)

    typealias FunctionSignature = @convention(c) ( Double,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "CovMtxEFGToECI"), to: FunctionSignature.self)

    function(thetaG, _covEFG, _covECI)
}

// Converts 6x6 symmetric Matrix/2D array to 1D array of 21 elements (lower triangular of a 6x6 symmetric matrix)
public func Mtx6x6ToLTA21( _ symMtx6x6: UnsafeMutablePointer<(Double, Double, Double, Double, Double, Double)>, _ lta21: UnsafeMutablePointer<Double> ) {

    let _symMtx6x6 = UnsafeMutableRawPointer(symMtx6x6).bindMemory(to: Double.self, capacity: 36)

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "Mtx6x6ToLTA21"), to: FunctionSignature.self)

    function(_symMtx6x6, lta21)
}

// Converts 1D array of 21 elements (lower triangular of a 6x6 symmetric matrix) to a 6x6 symmetric matrix
public func LTA21ToMtx6x6( _ lta21: UnsafeMutablePointer<Double>, _ symMtx6x6: UnsafeMutablePointer<(Double, Double, Double, Double, Double, Double)> ) {

    let _symMtx6x6 = UnsafeMutableRawPointer(symMtx6x6).bindMemory(to: Double.self, capacity: 36)

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "LTA21ToMtx6x6"), to: FunctionSignature.self)

    function(lta21, _symMtx6x6)
}

// Converts 9x9 symmetric Matrix/2D array to 1D array of 45 elements (lower triangular of a 9x9 symmetric matrix)
public func Mtx9x9ToLTA45( _ symMtx9x9: UnsafeMutablePointer<(Double, Double, Double, Double, Double, Double, Double, Double, Double)>, _ lta45: UnsafeMutablePointer<Double> ) {

    let _symMtx9x9 = UnsafeMutableRawPointer(symMtx9x9).bindMemory(to: Double.self, capacity: 81)

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "Mtx9x9ToLTA45"), to: FunctionSignature.self)

    function(_symMtx9x9, lta45)
}

// Converts 1D array of 45 elements (lower triangular of a 9x9 symmetric matrix) to a 9x9 symmetric matrix
public func LTA45ToMtx9x9( _ lta45: UnsafeMutablePointer<Double>, _ symMtx9x9: UnsafeMutablePointer<(Double, Double, Double, Double, Double, Double, Double, Double, Double)> ) {

    let _symMtx9x9 = UnsafeMutableRawPointer(symMtx9x9).bindMemory(to: Double.self, capacity: 81)

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "LTA45ToMtx9x9"), to: FunctionSignature.self)

    function(lta45, _symMtx9x9)
}

// Propagate xyzDate covariance forward to the propagation time
public func PropCovFrState( _ rms: Double,
                            _ consider: Double,
                            _ stateArray: UnsafeMutablePointer<Double>,
                            _ cov: UnsafeMutablePointer<(Double, Double, Double, Double, Double, Double, Double, Double, Double)>,
                            _ propCov: UnsafeMutablePointer<(Double, Double, Double, Double, Double, Double)> ) {

    let _cov = UnsafeMutableRawPointer(cov).bindMemory(to: Double.self, capacity: 81)
    let _propCov = UnsafeMutableRawPointer(propCov).bindMemory(to: Double.self, capacity: 36)

    typealias FunctionSignature = @convention(c) ( Double,
                                                   Double,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "PropCovFrState"), to: FunctionSignature.self)

    function(rms, consider, stateArray, _cov, _propCov)
}

// Rotates the ECI covariance to UVW
// Note: This method uses the global Earth constants so make sure that you select the proper Earth model by calling the EnvConst/EnvSetGeoIdx method
public func CovMtxECIToEqnx( _ pos: UnsafeMutablePointer<Double>,
                             _ vel: UnsafeMutablePointer<Double>,
                             _ covMtxECI: UnsafeMutablePointer<(Double, Double, Double, Double, Double, Double, Double, Double, Double)>,
                             _ covMtxEqnx: UnsafeMutablePointer<(Double, Double, Double, Double, Double, Double, Double, Double, Double)> ) {

    let _covMtxECI = UnsafeMutableRawPointer(covMtxECI).bindMemory(to: Double.self, capacity: 81)
    let _covMtxEqnx = UnsafeMutableRawPointer(covMtxEqnx).bindMemory(to: Double.self, capacity: 81)

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "CovMtxECIToEqnx"), to: FunctionSignature.self)

    function(pos, vel, _covMtxECI, _covMtxEqnx)
}

// Rotates the UVW covariance to ECI
// Note: This method uses the global Earth constants so make sure that you select the proper Earth model by calling the EnvConst/EnvSetGeoIdx method
public func CovMtxEqnxToECI9x9( _ pos: UnsafeMutablePointer<Double>,
                                _ vel: UnsafeMutablePointer<Double>,
                                _ covEqnx: UnsafeMutablePointer<(Double, Double, Double, Double, Double, Double, Double, Double, Double)>,
                                _ covMtxECI: UnsafeMutablePointer<(Double, Double, Double, Double, Double, Double, Double, Double, Double)> ) {

    let _covEqnx = UnsafeMutableRawPointer(covEqnx).bindMemory(to: Double.self, capacity: 81)
    let _covMtxECI = UnsafeMutableRawPointer(covMtxECI).bindMemory(to: Double.self, capacity: 81)

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "CovMtxEqnxToECI9x9"), to: FunctionSignature.self)

    function(pos, vel, _covEqnx, _covMtxECI)
}

// Rotates the UVW covariance to ECI
// Note: This method uses the global Earth constants so make sure that you select the proper Earth model by calling the EnvConst/EnvSetGeoIdx method
public func CovMtxEqnxToUVW9x9( _ pos: UnsafeMutablePointer<Double>,
                                _ vel: UnsafeMutablePointer<Double>,
                                _ covEqnx: UnsafeMutablePointer<(Double, Double, Double, Double, Double, Double, Double, Double, Double)>,
                                _ covMtxUVW: UnsafeMutablePointer<(Double, Double, Double, Double, Double, Double, Double, Double, Double)> ) {

    let _covEqnx = UnsafeMutableRawPointer(covEqnx).bindMemory(to: Double.self, capacity: 81)
    let _covMtxUVW = UnsafeMutableRawPointer(covMtxUVW).bindMemory(to: Double.self, capacity: 81)

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "CovMtxEqnxToUVW9x9"), to: FunctionSignature.self)

    function(pos, vel, _covEqnx, _covMtxUVW)
}

// Update (propagate) covariance to a future time with a supplied covariance, state transition matrix
// consider parameter and RMS. Consider parameter is applied to the drag term only.
// Full covariance matrix is multiplied by RMS squared.  State transition matrix can be obtained from 
// SpProp.SpGetStateMtx or supplying your own. State matrix, input and output covariance must be in 
// matching coordinate systems.
public func CovMtxUpdate( _ rmsIn: Double,
                          _ consider: Double,
                          _ cov: UnsafeMutablePointer<(Double, Double, Double, Double, Double, Double, Double, Double, Double)>,
                          _ stateArray: UnsafeMutablePointer<Double>,
                          _ propCov: UnsafeMutablePointer<(Double, Double, Double, Double, Double, Double)> ) {

    let _cov = UnsafeMutableRawPointer(cov).bindMemory(to: Double.self, capacity: 81)
    let _propCov = UnsafeMutableRawPointer(propCov).bindMemory(to: Double.self, capacity: 36)

    typealias FunctionSignature = @convention(c) ( Double,
                                                   Double,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "CovMtxUpdate"), to: FunctionSignature.self)

    function(rmsIn, consider, _cov, stateArray, _propCov)
}

// Annual Aberration calculated using equations from Astronomical Algorithms, Jean Meeus, 2nd Edition with Corrections as of June 15, 2005
public func AberrationAnnual( _ ra: Double,
                              _ decl: Double,
                              _ dS50UTC: Double,
                              _ raDelta: UnsafeMutablePointer<Double>,
                              _ decDelta: UnsafeMutablePointer<Double> ) {

    typealias FunctionSignature = @convention(c) ( Double,
                                                   Double,
                                                   Double,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "AberrationAnnual"), to: FunctionSignature.self)

    function(ra, decl, dS50UTC, raDelta, decDelta)
}

// Diurnal Aberration is due to the rotation of the Earth about it's axis. This is only valid for ground based sensors.
// Diurnal Aberration calculated using equations from Explanatory Supplement to the Astronomical Almanac 3rd Edition, 2013
public func AberrationDiurnal( _ ra: Double,
                               _ decl: Double,
                               _ dS50UTC: Double,
                               _ senPos: UnsafeMutablePointer<Double>,
                               _ raDelta: UnsafeMutablePointer<Double>,
                               _ decDelta: UnsafeMutablePointer<Double> ) {

    typealias FunctionSignature = @convention(c) ( Double,
                                                   Double,
                                                   Double,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "AberrationDiurnal"), to: FunctionSignature.self)

    function(ra, decl, dS50UTC, senPos, raDelta, decDelta)
}

// Sets JPL parameters
// Notes: Set JPL parameters will be used by SP, SPG4-XP, and anything that requires access to JPL data
public func JplSetParameters( _ jplFile: UnsafeMutablePointer<CChar>,
                              _ ds50Start: Double,
                              _ ds50Stop: Double ) {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar>,
                                                   Double,
                                                   Double ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "JplSetParameters"), to: FunctionSignature.self)

    function(jplFile, ds50Start, ds50Stop)
}

// Gets JPL parameters
public func JplGetParameters( _ jplFile: UnsafeMutablePointer<CChar>,
                              _ ds50Start: UnsafeMutablePointer<Double>,
                              _ ds50Stop: UnsafeMutablePointer<Double> ) {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "JplGetParameters"), to: FunctionSignature.self)

    function(jplFile, ds50Start, ds50Stop)
}

// Resets JPL parameters & removes JPL ephemeris data
public func JplReset(  ) {

    typealias FunctionSignature = @convention(c) (  ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "JplReset"), to: FunctionSignature.self)

    function()
}

// Computes various Sun and Moon vectors base on loaded JPL data at the specified time.
// Note: if JPL data isn't loaded or available, all output parameters are set to zero
public func JplCompSunMoonVec( _ ds50UTC: Double,
                               _ uvecSun: UnsafeMutablePointer<Double>,
                               _ sunVecMag: UnsafeMutablePointer<Double>,
                               _ uvecMoon: UnsafeMutablePointer<Double>,
                               _ moonVecMag: UnsafeMutablePointer<Double> ) {

    typealias FunctionSignature = @convention(c) ( Double,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "JplCompSunMoonVec"), to: FunctionSignature.self)

    function(ds50UTC, uvecSun, sunVecMag, uvecMoon, moonVecMag)
}

// Computes Sun and Moon position vectors base on loaded JPL data at the specified time.
// Note: if JPL data isn't loaded or available, all output parameters are set to zero
public func JplCompSunMoonPos( _ ds50UTC: Double,
                               _ sunVec: UnsafeMutablePointer<Double>,
                               _ moonVec: UnsafeMutablePointer<Double> ) {

    typealias FunctionSignature = @convention(c) ( Double,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "JplCompSunMoonPos"), to: FunctionSignature.self)

    function(ds50UTC, sunVec, moonVec)
}

// Removes the JPL ephemeris from memory
public func RemoveJpl(  ) {

    typealias FunctionSignature = @convention(c) (  ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "RemoveJpl"), to: FunctionSignature.self)

    function()
}

// Rotates position and velocity vectors from TEME of Epoch to TEME of Date
public func TemeEpochToDate( _ nutationTerms: Int32,
                             _ epochDs50TAI: Double,
                             _ dateDs50TAI: Double,
                             _ posEpoch: UnsafeMutablePointer<Double>,
                             _ velEpoch: UnsafeMutablePointer<Double>,
                             _ posDate: UnsafeMutablePointer<Double>,
                             _ velDate: UnsafeMutablePointer<Double> ) {

    typealias FunctionSignature = @convention(c) ( Int32,
                                                   Double,
                                                   Double,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "TemeEpochToDate"), to: FunctionSignature.self)

    function(nutationTerms, epochDs50TAI, dateDs50TAI, posEpoch, velEpoch, posDate, velDate)
}

// Converts ECR position and velocity vectors to ECI (TEME of Date) position and velocity vectors.
public func ECRToECITime( _ ds50UTC: Double,
                          _ posECR: UnsafeMutablePointer<Double>,
                          _ velECR: UnsafeMutablePointer<Double>,
                          _ posECI: UnsafeMutablePointer<Double>,
                          _ velECI: UnsafeMutablePointer<Double> ) {

    typealias FunctionSignature = @convention(c) ( Double,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "ECRToECITime"), to: FunctionSignature.self)

    function(ds50UTC, posECR, velECR, posECI, velECI)
}

// Converts ECI (TEME of Date) position and velocity vectors to ECR position and velocity vectors.
public func ECIToECRTime( _ ds50UTC: Double,
                          _ posECI: UnsafeMutablePointer<Double>,
                          _ velECI: UnsafeMutablePointer<Double>,
                          _ posECR: UnsafeMutablePointer<Double>,
                          _ velECR: UnsafeMutablePointer<Double> ) {

    typealias FunctionSignature = @convention(c) ( Double,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "ECIToECRTime"), to: FunctionSignature.self)

    function(ds50UTC, posECI, velECI, posECR, velECR)
}

// Converts ECR position and velocity vectors to J2K (MEME of J2000) position and velocity vectors.
public func ECRToJ2KTime( _ spectr: Int32,
                          _ nutationTerms: Int32,
                          _ ds50UTC: Double,
                          _ posECR: UnsafeMutablePointer<Double>,
                          _ velECR: UnsafeMutablePointer<Double>,
                          _ posJ2K: UnsafeMutablePointer<Double>,
                          _ velJ2K: UnsafeMutablePointer<Double> ) {

    typealias FunctionSignature = @convention(c) ( Int32,
                                                   Int32,
                                                   Double,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "ECRToJ2KTime"), to: FunctionSignature.self)

    function(spectr, nutationTerms, ds50UTC, posECR, velECR, posJ2K, velJ2K)
}

// Converts J2K (MEME of J2000) position and velocity vectors to ECR position and velocity vectors.
public func J2KToECRTime( _ spectr: Int32,
                          _ nutationTerms: Int32,
                          _ ds50UTC: Double,
                          _ posJ2K: UnsafeMutablePointer<Double>,
                          _ velJ2K: UnsafeMutablePointer<Double>,
                          _ posECR: UnsafeMutablePointer<Double>,
                          _ velECR: UnsafeMutablePointer<Double> ) {

    typealias FunctionSignature = @convention(c) ( Int32,
                                                   Int32,
                                                   Double,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "J2KToECRTime"), to: FunctionSignature.self)

    function(spectr, nutationTerms, ds50UTC, posJ2K, velJ2K, posECR, velECR)
}

// Index of Keplerian elements
//semi-major axis (km)
public let XA_KEP_A     =   0
//eccentricity (unitless)
public let XA_KEP_E     =   1
//inclination (deg)
public let XA_KEP_INCLI =   2
//mean anomaly (deg)
public let XA_KEP_MA    =   3
//right ascension of the asending node (deg)
public let XA_KEP_NODE  =   4
//argument of perigee (deg)
public let XA_KEP_OMEGA =   5
public let XA_KEP_SIZE  =   6

// Index of classical elements
//N mean motion (revs/day)
public let XA_CLS_N     =   0
//eccentricity (unitless)
public let XA_CLS_E     =   1
//inclination (deg)
public let XA_CLS_INCLI =   2
//mean anomaly (deg)
public let XA_CLS_MA    =   3
//right ascension of the asending node (deg)
public let XA_CLS_NODE  =   4
//argument of perigee (deg)
public let XA_CLS_OMEGA =   5
public let XA_CLS_SIZE  =   6

// Index of equinoctial elements
//Af (unitless)
public let XA_EQNX_AF   =   0
//Ag (unitless)
public let XA_EQNX_AG   =   1
//chi (unitless)
public let XA_EQNX_CHI  =   2
//psi (unitless)
public let XA_EQNX_PSI  =   3
//L mean longitude (deg)
public let XA_EQNX_L    =   4
//N mean motion (revs/day)
public let XA_EQNX_N    =   5
public let XA_EQNX_SIZE =   6

// Indexes of AstroConvFrTo
//SGP4 (A, E, Incli, BStar) to SGP (nDot, n2Dot)
public let XF_CONV_SGP42SGP = 101


// Indexes for topocentric components
//Right ascension (deg)
public let XA_TOPO_RA    = 0
//Declination (deg)
public let XA_TOPO_DEC   = 1
//Azimuth (deg)
public let XA_TOPO_AZ    = 2
//Elevation (deg)
public let XA_TOPO_EL    = 3
//Range (km)
public let XA_TOPO_RANGE = 4
//Right ascension dot (deg/s)
public let XA_TOPO_RADOT = 5
//Declincation dot (deg/s)
public let XA_TOPO_DECDOT = 6
//Azimuth dot (deg/s)
public let XA_TOPO_AZDOT = 7
//Elevation dot (deg/s)
public let XA_TOPO_ELDOT = 8
//Range dot (km/s)
public let XA_TOPO_RANGEDOT = 9
public let XA_TOPO_SIZE  = 10


// Indexes for RAE components
//Range (km)
public let XA_RAE_RANGE   = 0
//Azimuth (deg)
public let XA_RAE_AZ      = 1
//Elevation (deg)
public let XA_RAE_EL      = 2
//Range dot (km/s)
public let XA_RAE_RANGEDOT = 3
//Azimuth dot (deg/s)
public let XA_RAE_AZDOT   = 4
//Elevation dot (deg/s)
public let XA_RAE_ELDOT   = 5
public let XA_RAE_SIZE    = 6


// Year of Equinox indicator
//Date of observation
public let YROFEQNX_OBTIME = 0
//0 Jan of Date
public let YROFEQNX_CURR   = 1
//J2000
public let YROFEQNX_2000   = 2
//B1950
public let YROFEQNX_1950   = 3

// ========================= End of auto generated code ==========================
